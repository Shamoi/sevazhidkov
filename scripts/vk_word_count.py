import time
import json

with open('data/word-count/loaded_vk_messages.json') as file:
    messages = json.loads(file.read())['items']

symbols_stat = {}
for message in messages:
    if 'body' in message:
        for sym in message['body']:
            symbols_stat[sym] = symbols_stat.get(sym, 0) + 1
with open('data/word-count/vk_messages_symbols.json', 'w') as file:
    file.write(json.dumps({'stat': symbols_stat, 'updated': time.time()}))
