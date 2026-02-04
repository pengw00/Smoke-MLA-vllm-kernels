import requests

url = "http://localhost:8000/v1/chat/completions"
data = {
    "model": "deepseek-ai/DeepSeek-V2-Lite-Chat",
    "messages": [
        {"role": "user", "content": "你好，请介绍一下你自己。"}
    ],
    "temperature": 0.7
}

print("正在发送请求...")
response = requests.post(url, json=data)
print(f"状态码: {response.status_code}")
print(f"模型回复: {response.json()['choices'][0]['message']['content']}")
