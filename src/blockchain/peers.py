import requests
from web3 import Web3

def add_peer(w3: Web3, enode: str):
    payload = {
        "jsonrpc": "2.0",
        "method": "perm_addNodesToAllowlist", 
        "params": [enode],
        "id": 1
    }
    
    response = requests.post(w3.provider.endpoint_uri, json=payload)
    return response