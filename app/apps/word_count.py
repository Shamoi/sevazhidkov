import json


def get_words(cache):
    result = cache.get('vk_words_stat')
    if not result:
        with open('data/word-count/vk_messages_words.json') as file:
            result = json.loads(file.read())
        # Sort all by value and save only first 50 words
        result['stat'] = sorted(result['stat'].items(),
                                key=lambda x: x[1], reverse=True)
        result['stat'] = result['stat'][:50]
        cache.add('vk_words_stat', result, 3600)
    return result

def get_symbols(cache):
    result = cache.get('vk_symbols_stat')
    if not result:
        with open('data/word-count/vk_messages_symbols.json') as file:
            result = json.loads(file.read())
        # Sort all by value and save only first 50 symbols
        result['stat'] = sorted(result['stat'].items(),
                                key=lambda x: x[1], reverse=True)
        result['stat'] = result['stat'][:50]
        cache.add('vk_symbols_stat', result, 3600)
    return result
