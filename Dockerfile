FROM python:3.8-slim-buster

# Create a working directory.
RUN mkdir wd
WORKDIR wd

# Install Python dependencies.
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy the rest of the codebase into the image
COPY . ./
EXPOSE 8080

# Finally, run gunicorn.
CMD [ "gunicorn", "--workers=2", "--threads=1", "-b 0.0.0.0:8080", "app:app.run_server()"]
