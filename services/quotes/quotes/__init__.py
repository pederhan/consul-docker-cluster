__version__ = "0.1.0"

import platform
import random

import httpx
from fastapi import FastAPI
from fastapi.responses import PlainTextResponse

app = FastAPI()

QUOTES = (
    "I'll be back.",
    "I'm going to make him an offer he can't refuse.",
    "May the Force be with you.",
)


@app.get("/")
async def get_quote():
    return {"quote": random.choice(QUOTES), "node": platform.node()}


@app.get("/discover")
async def discover():
    """Talks to the currency service and finds out which node we contacted."""
    resp = httpx.get("http://currency.service.consul/hostname")
    other_node = resp.text
    return {"node": platform.node(), "other_node": other_node}


@app.get("/hostname", response_class=PlainTextResponse)
async def hostname():
    return platform.node()


@app.get("/health")
async def health():
    return {"status": "ok"}
