import os
from fastapi import FastAPI
import uvicorn
from prometheus_client import Summary, generate_latest, CONTENT_TYPE_LATEST
from fastapi.responses import Response

app = FastAPI()

REQUEST_TIME = Summary(
    "request_processing_seconds",
    "Time spent processing request"
)

@app.get("/")
@REQUEST_TIME.time()
def root():
    return {"message": "Hello world!"}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    port = int(os.getenv("PORT", 8080))
    uvicorn.run(app, host="0.0.0.0", port=port)