import time
import json

ENGLISH_LETTERS = 'qwertyuiopasdfghjklzxcvbnm'
RUSSIAN_LETTERS = 'йцукенгшщзхъфывапролджэёячсмитьбюю'
LETTERS = ENGLISH_LETTERS + RUSSIAN_LETTERS

with open('data/word-count/loaded_vk_messages.json') as file:
    messages = json.loads(file.read())['items']

symbols_stat = {}
for message in messages:
    if 'body' in message:
        for sym in message['body']:
            symbols_stat[sym] = symbols_stat.get(sym, 0) + 1
with open('data/word-count/vk_messages_symbols.json', 'w') as file:
    file.write(json.dumps({'stat': symbols_stat, 'updated': time.time()}))

words_stat = {}
for message in messages:
    if 'body' in message:
        for part in message['body'].split():
            word = ''
            for sym in part:
                if sym.lower() in LETTERS:
                    word += sym.lower()
            if word:
                words_stat[word] = words_stat.get(word, 0) + 1
with open('data/word-count/vk_messages_words.json', 'w') as file:
    file.write(json.dumps({'stat': words_stat, 'updated': time.time()}))
