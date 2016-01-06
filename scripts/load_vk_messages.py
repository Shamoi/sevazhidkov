import os
import json
import vk_api

login, password = os.environ['VK_LOGIN'], os.environ['VK_PASSWORD']
vk = vk_api.VkApi(login, password)
vk.authorization()
vk_tools = vk_api.VkTools(vk)

all_messages = vk_tools.get_all('messages.get', 200, {'out': 1})
with open('data/word-count/loaded_vk_messages.json', 'w') as file:
    file.write(json.dumps(all_messages))
