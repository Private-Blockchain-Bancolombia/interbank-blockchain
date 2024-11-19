const Web3 = require('web3');
const web3 = new Web3('http://172.20.0.3:8545');

const addresses = [
  "0xfe3b557e8fb62b89f4916b721be55ceb828dbd73",
  "0x627306090abaB3A6e1400e9345bC60c78a8BEf57",
  "0xf17f52151EbEF6C7334FAD080c5704D77216b732"
];

addresses.forEach(async (address) => {
  const balance = await web3.eth.getBalance(address);
  console.log(`Balance of ${address}: ${web3.utils.fromWei(balance, 'ether')} ETH`);
});