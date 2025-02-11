import os
import json
from langchain import hub
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import WebBaseLoader
from langchain_community.vectorstores import Chroma
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from flask import Flask, request, jsonify
import bs4
from langchain.schema import Document
from langchain.prompts import ChatPromptTemplate


app = Flask(__name__)  # تعديل هنا

os.environ['LANGCHAIN_TRACING_V2'] = 'true'
os.environ['LANGCHAIN_ENDPOINT'] = 'https://api.smith.langchain.com'
os.environ['LANGCHAIN_API_KEY'] = "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"
os.environ['OPENAI_API_KEY'] = "sk-nplH4fcYbMAOGvqKdZGBuhCCup8UH-rRJDCmzJ1HGTT3BlbkFJMyHdP8JgKQuAl29_-FN6BRa0YP0LoLCqKWq59yfs4A"
os.environ['USER_AGENT'] = 'mobile'

json_files = ["project.json","legalc.json", "memo.json"]
documents = []

for file in json_files:
    with open(file, "r", encoding="utf-8") as f:
        data = json.load(f)
        documents.append(Document(page_content=json.dumps(data, ensure_ascii=False)))  
for doc in documents:
    print(doc.page_content) 


loader = WebBaseLoader(
    web_paths=("https://familylawyerjeddah.com/blog/%D9%82%D8%A7%D9%86%D9%88%D9%86-%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D9%82-%D9%81%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9/","https://laws.boe.gov.sa/BoeLaws/Laws/LawDetails/4d72d829-947b-45d5-b9b5-ae5800d6bac2/1",),  # Replace with the actual URL
    bs_kwargs=dict(
        parse_only=bs4.SoupStrainer(
            class_=("entry-content","system_terms_textbox",)  
        )
    ),
        requests_kwargs={'timeout': 30}  

)

arabic_docs = loader.load()

print(f"Loaded documents: {len(arabic_docs)}")

try:
    arabic_docs = loader.load()
    print(f"Loaded documents: {len(arabic_docs)}")
    for doc in arabic_docs:
        print("Document Content:", doc.page_content[:500])  
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)
    arabic_splits = text_splitter.split_documents(arabic_docs)

    print(f"Split documents: {len(arabic_splits)}")

    if arabic_splits:
        embeddings = OpenAIEmbeddings()
        arabic_vectorstore = Chroma.from_documents(documents=arabic_splits, embedding=embeddings)
        retriever = arabic_vectorstore.as_retriever(search_kwargs={"k": 1})
        print("Vector store created successfully.")
    else:
        print("No documents to create a vector store.")
except Exception as e:
    print(f"Error while loading or processing documents: {e}")

all_documents = arabic_docs + documents
text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)  
arabic_splits = text_splitter.split_documents(all_documents)
arabic_vectorstore = Chroma.from_documents(documents=arabic_splits, embedding=OpenAIEmbeddings())
retriever = arabic_vectorstore.as_retriever(search_kwargs={"k": 1})
template = """إجابة على السؤال بناءً على السياق التالي:
{context}

السؤال: {question}
"""
prompt = ChatPromptTemplate.from_template(template)
llm = ChatOpenAI(model_name="gpt-3.5-turbo", temperature=0)

def create_rag_chain():
    return (
        {"context": retriever, "question": RunnablePassthrough()}  
        | prompt  
        | llm 
        | StrOutputParser()  
    )


@app.route('/')
def home():
    return "Welcome to the Flask API. Please send your questions to /ask."


@app.route('/ask', methods=['POST'])
def ask():
    data = request.get_json()
    question = data.get('question', '')

    if not question:
        return jsonify({"error": "No question provided"}), 400

    try:
        rag_chain = create_rag_chain()
        response = rag_chain.invoke(question)
        return jsonify({"answer": response}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__': 
    app.run(debug=True)
