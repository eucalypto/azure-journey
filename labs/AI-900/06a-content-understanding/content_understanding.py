import os
from azure.ai.contentunderstanding import ContentUnderstandingClient
from azure.core.credentials import AzureKeyCredential
from dotenv import load_dotenv

load_dotenv()

endpoint = os.getenv("AZURE_AI_SERVICES_ENDPOINT")
key = os.getenv("AZURE_API_KEY")

client = ContentUnderstandingClient(endpoint=endpoint, credential=AzureKeyCredential(key))


analyzer_id = "prebuilt-invoice"
inputs = [
    {"url": "https://github.com/Azure-Samples/azure-ai-content-understanding-python/raw/refs/heads/main/data/invoice.pdf"}
]


print("Analyzing document, please wait ...")
poller = client.begin_analyze(analyzer_id=analyzer_id, inputs=inputs) 
result = poller.result()  # waits for completion


# The result typically includes extracted "fields" and "markdown" per input content item.
for content in result.contents:
    print(content.markdown)
    print(content.fields)