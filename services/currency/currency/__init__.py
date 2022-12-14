__version__ = "0.1.0"

import platform

import httpx
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()


@app.get("/rate/{base}")
async def get_rate(base: str, target: str):
    return {
        "source": base.upper(),
        "target": target.upper(),
        "rate": 0.752492,
        "node": platform.node(),
    }


@app.get("/discover")
async def discover():
    resp = httpx.get("http://quotes.service.consul/hostname")
    other_node = resp.text
    return {"node": platform.node(), "other_node": other_node}


@app.get("/hostname", response_class=PlainTextResponse)
async def hostname():
    return platform.node()


@app.get("/health")
async def health():
    return {"status": "ok"}
