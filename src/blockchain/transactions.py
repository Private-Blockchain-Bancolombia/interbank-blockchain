from web3 import Web3

def send(w3: Web3, to: str, amount: int):
    # Create transaction
    tx = {
        'to': to,
        'value': amount,
        'gas': 2000000,
        'gasPrice': w3.toWei('1', 'gwei'),
        'nonce': w3.eth.getTransactionCount(w3.eth.coinbase),
    }
    # Sign transaction
    signed_tx = w3.eth.account.signTransaction(tx, w3.eth.coinbase)
    # Send transaction
    tx_hash = w3.eth.sendRawTransaction(signed_tx.rawTransaction)
    # Wait for transaction to be mined
    w3.eth.waitForTransactionReceipt(tx_hash)
    return tx_hash
