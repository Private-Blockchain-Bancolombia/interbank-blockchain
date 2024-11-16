import requests
from web3 import Web3

def add_peer(w3: Web3, enode: str):
    # curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["<EnodeNode1>","<EnodeNode2>","<EnodeNode3>","EnodeNode4"]], "id":1}' http://127.0.0.1:8545
    payload = {
        "jsonrpc": "2.0",
        "method": "perm_addNodesToAllowlist", 
        "params": [enode],
        "id": 1
    }
    
    response = requests.post(w3.provider.endpoint_uri, json=payload)
    return response