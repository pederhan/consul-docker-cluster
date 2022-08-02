__version__ = "0.1.0"

from fastapi import FastAPI
import platform


app = FastAPI()


@app.get("/rate/{base}")
async def get_rate(base: str, target: str):
    return {
        "source": base,
        "target": target,
        "rate": 0.752492,
        "hostname": platform.node(),
    }


@app.get("/health")
async def health():
    return {"status": "ok"}
