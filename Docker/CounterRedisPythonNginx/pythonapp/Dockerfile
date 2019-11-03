FROM python:3
WORKDIR /app
ENV FLASK_APP=counter.py
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0"]
