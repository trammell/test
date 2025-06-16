#!/usr/bin/env python3

# url = f"{self.url}manage/query/run?{self.get_events_id}&event_name=friday"
# url = f"{self.url}/manage/query/run?{self.get_events_id}&event_name="

from urllib.parse import urljoin, urlencode

API_URL = 'https://abc.test.dundermifflin.net'
API_GET_EVENTS = 'id=4df7e4e9-6120-420d-a37d-5dae82d8a8e5&cmd=service&output=json&h=54d7e76e-ddcf-4caf-ae7f-f34088c6a834'

API_PATH = '/manage/query/run'

full_url = urljoin(API_URL, API_PATH) + '?' + API_GET_EVENTS + '&' + urlencode(dict(event_name="first look friday"))
print(full_url)


path = urljoin(API_URL, "/manage/query/run")
query = API_GET_EVENTS + '&' + urlencode({"event_name": "first look friday"})

print(f"{path}?{query}")


