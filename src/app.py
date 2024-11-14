from flask import Flask, request, jsonify
from web3 import Web3
import blockchain.transactions as tx
import blockchain.peers as peers
import requests

app = Flask(__name__)
w3 = Web3(Web3.HTTPProvider('http://172.20.0.2:8545'))

@app.route('/send', methods=['POST'])
def send():
    data = request.get_json()
    # Send transaction
    # tx_hash = tx.send(w3, data['to'], data['amount'])
    
    # Assume KYC/AML checks are done
    # Implement transaction logic here
    
    return jsonify({'status': 'Transaction submitted'})

@app.route('/add-peer', methods=['POST'])
def app_peer():
    data = request.get_json()
    # Give permission to the address
    result = peers.add_peer(w3, data['enode'])
    
    try:
        result.raise_for_status()  # Raise an error for bad status codes
        return jsonify(result.json()), result.status_code
    except requests.exceptions.HTTPError as err:
        return jsonify({"error": err.response.text}), err.response.status_code

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)