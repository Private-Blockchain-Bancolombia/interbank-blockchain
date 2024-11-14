@echo off

:: Generate a 64-byte key (128 characters hex)
:: Usage: to create a enode_id for a new node if needed, change to 32 to gen a 32-byte private key
cls && openssl rand -hex 64