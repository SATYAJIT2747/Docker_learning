FROM python:3.12-slim
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requiremnts.txt
# Make port 5000 available to the world outside this container I.E "This application listens on port 5000."
EXPOSE 5000
# Define environment variable
ENV FLASK_APP=app.py
# Run app.py when the container launches 0.0.0.0 Makes the server publicly available, not just accessible from localhost Listen on every network interface
CMD ["flask", "run", "--host=0.0.0.0"]