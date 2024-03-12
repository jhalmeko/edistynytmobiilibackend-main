import os

from fastapi import FastAPI

import models
from controllers import auth, category, rental_item, feature


app = FastAPI()

app.include_router(auth.router)
app.include_router(category.router)
app.include_router(rental_item.router)
app.include_router(feature.router)

if os.getenv('DEV') == '1':
    models.metadata.create_all(bind=models.engine)