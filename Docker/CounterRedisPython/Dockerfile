FROM python:3
WORKDIR /app
ENV FLASK_APP=counter.py
ENV FLASK_DEBUG=1
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY counter.py ./
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0"]
