import sys
from typing import List

mappings={
    "NO":["NO1","NO2","NO3"],
    "FI":["FI1","FI2"],
    "DK":["DK1","DK2"],
    "SW":["SW1","SW2"],
}
def extract(country:str) -> List:
    return mappings[country]


if __name__=="__main__":
    print(extract(sys.argv[1]))