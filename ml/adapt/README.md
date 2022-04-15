
<https://mycroft-ai.gitbook.io/docs/mycroft-technologies/adapt/adapt-tutorial>



```sh
python3 -m venv .venv
source .venv/bin/activate
pip3 install -e git+https://github.com/mycroftai/adapt#egg=adapt-parser
```

output


```text
$ python3 single-intent-parser.py "what's the weather like in Tokyo"
{
    "intent_type": "WeatherIntent",
    "WeatherKeyword": "weather",
    "Location": "Tokyo",
    "target": null,
    "confidence": 0.375
}



```
