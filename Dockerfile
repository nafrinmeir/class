FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y <your_dependencies_here>

# Copy your application files
COPY . /app

# Set the working directory
WORKDIR /app

# Define any commands you want to run when the container starts
CMD ["<your_command_here>"]
