import requests
import json

def test_create_transaction():
    url = 'http://localhost:5000/send'
    data = {
        'from': '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4',
        'to': '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4',
        'value': 100
    }
    headers = {'Content-Type': 'application/json'}
    response = requests.post(url, data=json.dumps(data), headers=headers)
    assert response.status_code == 200
    assert response.json() == {'status': 'Transaction submitted'}
    print(f'Test passed: {response.json()}')
    
test_create_transaction()
