# Task Manager API

## Project Description
The **Task Manager API** is a simple CRUD (Create, Read, Update, Delete) API built with FastAPI and MySQL. This project allows users to manage tasks and users within a task management system. Users can create new tasks, update or delete them, and track task completion. The API also provides functionality to manage users who own the tasks.

### Features:
- User management (Create, Read, Update, Delete)
- Task management (Create, Read, Update, Delete)
- Task completion status tracking
- MySQL database connection for storing tasks and user information

## How to Run/Setup the Project

### Prerequisites:
1. **MySQL Database**
   - Make sure you have MySQL installed on your local machine.
   - Create a database named `taskdb` and set up the necessary tables (already included in the project).

### Steps:
1. **Clone the repository**:
   ```bash
  https://github.com/Thomas-m-waka/plp_task_manager_api.git
   cd plp_task_manager_api
# Create Virtual  environment 
python -m venv venv
source venv/bin/activate 

# Install  dependanies 
python3 install -r requirements.txt 

# Start server 
uvicorn app.main:app --reload
