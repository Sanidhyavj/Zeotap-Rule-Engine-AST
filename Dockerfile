# Use an official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Python requirements file
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Node.js for the frontend
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    npm install -g serve

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (adjust if necessary)
EXPOSE 5000

# Command to run the server
CMD ["python", "server/server.py"]

# Optionally: add a stage to run tests
# RUN python -m unittest discover unit_tests
