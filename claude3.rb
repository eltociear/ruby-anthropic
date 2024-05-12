require "anthropic"

client = Anthropic::Client.new(access_token: "{YOUR_ANTHROPIC_API_KEY_HERE}")

# ターミナルからの入力を受け取る
puts "Please enter a message:"
user_message = gets.chomp

response = client.messages(
  parameters: {
    model: "claude-3-haiku-20240307", # もしくは claude-3-opus-20240229 もしくは claude-3-sonnet-20240229
    system: "Respond only in Japanese.", # オプション
    messages: [
      {"role": "user", "content": user_message},
    ],
    max_tokens: 1000
  }
)

# responseの中身からtextを取り出す
message_text = response["content"].first["text"]
puts message_text
