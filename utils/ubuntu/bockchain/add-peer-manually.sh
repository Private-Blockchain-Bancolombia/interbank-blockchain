# Change enode url and ip address accordingly

# node-b
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://9299664c95fd8817917d39a655a38657859eee99e84db0157cbbfb169c0bb1a0c0f30ee2358f5fd9a0526b0657079dcc55527ed653b93d8c38d6fbc98c9724fc@172.20.0.4:30303"]], "id":1}' http://172.20.0.3:8545

# node-c
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://3a65927ab0a7c0b579edce46cba71e88bbbcbe01ad50d0d81b3635989c7c13d3ad6537c8fba2a450fccea37128625e1aca58e1d521dbc8e643c0db149544b6a1@172.20.0.5:30303"]], "id":1}' http://172.20.0.3:8545




