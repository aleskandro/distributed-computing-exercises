FROM python:3
WORKDIR /app
COPY counter.py ./
COPY fix_nginx.py ./
COPY requirements.txt ./
ENV FLASK_APP=counter.py
ENV FLASK_DEBUG=1
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0"]
