#!/bin/bash

clear

# Data

rpc_host_A="http://172.20.0.3:8545"

# Public keys

public_A="0xfe3b557e8fb62b89f4916b721be55ceb828dbd73"

# Enodes

enode_A="enode://4730f6cc03c889ba161a7172f2839d7c7df52e47eb6ba8464680c13fe6a3cab392a51a7703091ee4effc956d6c537b7d45067cbf349bed5ce7474b8547151260@172.20.0.3:30303"

enode_B="enode://9299664c95fd8817917d39a655a38657859eee99e84db0157cbbfb169c0bb1a0c0f30ee2358f5fd9a0526b0657079dcc55527ed653b93d8c38d6fbc98c9724fc@172.20.0.4:30303"



# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ #



# Add peers with permissioning files

curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["'$enode_B'"]], "id":1}' $rpc_host_A

# Send a tx

tx_data="0xf9037b80808275308080b9032e6080604052348015600e575f5ffd5b506102f28061001c5f395ff3fe608060405234801561000f575f5ffd5b506004361061004a575f3560e01c806371e9e5381461004e5780639d95f1cc1461007e578063b2b99ec91461009a578063e88a0dc3146100b6575b5f5ffd5b6100686004803603810190610063919061025e565b6100e6565b60405161007591906102a3565b60405180910390f35b6100986004803603810190610093919061025e565b610137565b005b6100b460048036038101906100af919061025e565b61018e565b005b6100d060048036038101906100cb919061025e565b6101e4565b6040516100dd91906102a3565b60405180910390f35b5f5f5f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f9054906101000a900460ff169050919050565b60015f5f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f6101000a81548160ff02191690831515021790555050565b5f5f5f8373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020015f205f6101000a81548160ff02191690831515021790555050565b5f602052805f5260405f205f915054906101000a900460ff1681565b5f5ffd5b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f61022d82610204565b9050919050565b61023d81610223565b8114610247575f5ffd5b50565b5f8135905061025881610234565b92915050565b5f6020828403121561027357610272610200565b5b5f6102808482850161024a565b91505092915050565b5f8115159050919050565b61029d81610289565b82525050565b5f6020820190506102b65f830184610294565b9291505056fea26469706673582212201f0cbe9ce53123c3d6f0fbd48e2dbed21a48fdfe0314b297ca592c52a801c76664736f6c634300081c003300000000000000000000000000000000000000000000"

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendRawTransaction","params":["'$tx_data'"],"id":1}' $rpc_host_A

# To get gas min

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","params":[],"id":53}' $rpc_host_A

# To get nonce

curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getTransactionCount","params":["'$public_A'", "latest"],"id":1}' $rpc_host_A