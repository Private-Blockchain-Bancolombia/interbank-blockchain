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
    return response.text

def _add_enodes_url_to_node(enodes, first_rpc_port, node_id):
    # Use container name instead of localhost
    host = f"besu-node{node_id+1}"
    url = f"http://{host}:{first_rpc_port}"
    
    enodes_str = [url for url in enodes]
    payload = {
        "jsonrpc": "2.0",
        "method": "perm_addNodesToAllowlist",
        "params": [enodes_str],
        "id": 1
    }
    
    print(f"\n\nAdding enode URLs for node {node_id+1}:\n")
    print(f"POST {url} with payload {payload}")
    
    # Send HTTP request and print response
    response = requests.post(url, json=payload)
    print("\nResponse:")
    print(response.text)
    
def _add_node_peer(node_id, enodes, first_rpc_port):
    enode = enodes[node_id]
    print(f"\n\nAdding node {node_id+1} as peer to all nodes with higher ID:")
    for i in range(node_id+1, len(enodes)):
        host = f"besu-node{i+1}"
        url = f"http://{host}:{first_rpc_port}"
        payload = {
            "jsonrpc": "2.0",
            "method": "admin_addPeer",
            "params": [enode],
            "id": 1
        }
        print(f"\n - Adding node {node_id+1} as peer to node {i+1}:")
        print(f"POST {url} with payload {payload}")
        
        # Send HTTP request and print response
        response = requests.post(url, json=payload)
        print("   Result:")
        print(response.text)
        
def _check_peers(enodes, first_rpc_port):
    for i in range(len(enodes)):
        host = f"besu-node{i+1}"
        url = f"http://{host}:{first_rpc_port}"
        payload = {
            "jsonrpc": "2.0",
            "method": "net_peerCount",
            "params": [],
            "id": 1
        }
        print(f"\n\nChecking peer nodes for node {i+1}:")
        print(f"POST {url} with payload {payload}")
        
        # Send HTTP request and print response
        response = requests.post(url, json=payload)
        print("Result:")
        print(response.text)

def add_node(enodes, first_rpc_port, node_id):
    _add_enodes_url_to_node(enodes, first_rpc_port, node_id)
    _add_node_peer(node_id, enodes, first_rpc_port)

def add_nodes():
    first_rpc_port = 8545
    
    # Update enode URLs to use container names instead of localhost
    enodes = [
        "enode://4730f6cc03c889ba161a7172f2839d7c7df52e47eb6ba8464680c13fe6a3cab392a51a7703091ee4effc956d6c537b7d45067cbf349bed5ce7474b8547151260@besu-node1:30303",
        "enode://9299664c95fd8817917d39a655a38657859eee99e84db0157cbbfb169c0bb1a0c0f30ee2358f5fd9a0526b0657079dcc55527ed653b93d8c38d6fbc98c9724fc@besu-node2:30304",
        "enode://3a65927ab0a7c0b579edce46cba71e88bbbcbe01ad50d0d81b3635989c7c13d3ad6537c8fba2a450fccea37128625e1aca58e1d521dbc8e643c0db149544b6a1@besu-node3:30305",
        "enode://daed69ebaf381f599d0a075ac090020b786a89246792e4a51fb4558ff67d228e728a42c88df23b378516013524bfacec5fd0660c88d73f0064877694cc2de26f@besu-node4:30306"
    ]
    
    for enode_i in range(len(enodes)):
        add_node(enodes, first_rpc_port, enode_i)
        
    # Check peers for all nodes
    _check_peers(enodes, first_rpc_port)
        
if __name__ == "__main__":
    add_nodes()