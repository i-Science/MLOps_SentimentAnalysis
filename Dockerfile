FROM alpine:3.16

RUN apk add --no-cache python3 py3-pip && pip3 install --no-cache-dir uvicorn fastapi pyjwt pandas tqdm pydantic BeautifulSoup4 asyncio typing fastapi.security && pip3 install --no-cache-dir requests && pip3 install --no-cache-dir passlib && pip3 install --no-cache-dir data && pip3 install --no-cache-dir nltk && pip3 install --no-cache-dir python-multipart

COPY requirements.txt .
COPY src/api_sentiment_analysis.py .
COPY . .

EXPOSE 8001

CMD uvicorn api_sentiment_analysis:api --host 0.0.0.0 --port 8001