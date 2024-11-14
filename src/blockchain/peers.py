import requests
from web3 import Web3

def add_peer(w3: Web3, enode: str):
    # curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["<EnodeNode1>","<EnodeNode2>","<EnodeNode3>","EnodeNode4"]], "id":1}' http://127.0.0.1:8545
    # curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://9299664c95fd8817917d39a655a38657859eee99e84db0157cbbfb169c0bb1a0c0f30ee2358f5fd9a0526b0657079dcc55527ed653b93d8c38d6fbc98c9724fc@172.20.0.3:30303"]], "id":1}' http://172.20.0.2:8545
    payload = {
        "jsonrpc": "2.0",
        "method": "perm_addNodesToAllowlist", 
        "params": [enode],
        "id": 1
    }
    
    response = requests.post(w3.provider.endpoint_uri, json=payload)
    return response