from flask import Flask, request, jsonify
from web3 import Web3
import blockchain.transactions as tx
import blockchain.peers as peers

app = Flask(__name__)
w3 = Web3(Web3.HTTPProvider('http://besu-node1:8545'))

@app.route('/send', methods=['POST'])
def create_transaction():
    data = request.get_json()
    # Send transaction
    # tx_hash = tx.send(w3, data['to'], data['amount'])
    
    # Assume KYC/AML checks are done
    # Implement transaction logic here
    
    return jsonify({'status': 'Transaction submitted'})

@app.route('/peers', methods=['GET'])
def get_peers():
    peers.add_nodes()
    return jsonify({'status': 'Nodes peers function called'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)