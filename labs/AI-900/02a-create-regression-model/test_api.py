import urllib.request
import json

# Request data goes here
# The example below assumes JSON formatting which may be updated
# depending on the format your endpoint expects.
# More information can be found here:
# https://docs.microsoft.com/azure/machine-learning/how-to-deploy-advanced-entry-script
data = {
 "Inputs": {
             "WebServiceInput0":
             [
                 {
                     "symboling": 3,
                     "normalized-losses": 1.0,
                     "make": "alfa-romero",
                     "fuel-type": "gas",
                     "aspiration": "std",
                     "num-of-doors": "two",
                     "body-style": "convertible",
                     "drive-wheels": "rwd",
                     "engine-location": "front",
                     "wheel-base": 88.6,
                     "length": 168.8,
                     "width": 64.1,
                     "height": 48.8,
                     "curb-weight": 3548,
                     "engine-type": "dohc",
                     "num-of-cylinders": "four",
                     "engine-size": 130,
                     "fuel-system": "mpfi",
                     "bore": 3.47,
                     "stroke": 2.68,
                     "compression-ratio": 9,
                     "horsepower": 311,
                     "peak-rpm": 5000,
                     "city-mpg": 21,
                     "highway-mpg": 27
                 }
             ]
         },
 "GlobalParameters": {}
 }

body = str.encode(json.dumps(data))

url = 'http://000.000.000.000:80/api/v1/service/dredict-auto-price/score'
# Replace this with the primary/secondary key, AMLToken, or Microsoft Entra ID token for the endpoint
api_key = 'my_super_secret_api_key'
if not api_key:
    raise Exception("A key should be provided to invoke the endpoint")


headers = {'Content-Type':'application/json', 'Accept': 'application/json', 'Authorization':('Bearer '+ api_key)}

req = urllib.request.Request(url, body, headers)

try:
    response = urllib.request.urlopen(req)

    result = response.read()
    print(result)
except urllib.error.HTTPError as error:
    print("The request failed with status code: " + str(error.code))

    # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
    print(error.info())
    print(error.read().decode("utf8", 'ignore'))
