FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the Flask application code into the container at /app
COPY app.py /app

# Copy the HTML file into the container at /app
COPY index.html /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app

# Install Flask and other necessary packages
RUN pip install -r requirements.txt

# Install additional packages: VIM, Netstat, Nginx, Wget
RUN apt-get update && apt-get install -y vim net-tools nginx wget

# Expose the Flask app port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
