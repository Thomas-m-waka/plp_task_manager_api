from fastapi import FastAPI
from . import models
from .database import engine
from .routes import router

# Create tables
models.Base.metadata.create_all(bind=engine)

# FastAPI app
app = FastAPI(
    title="Task Manager API",
    description="A simple CRUD API using FastAPI and MySQL",
    version="1.0.0"
)

app.include_router(router)
