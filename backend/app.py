from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

# Replace with your OpenAI API key
openai.api_key = "your-openai-api-key"

@app.route('/generate_lyrics', methods=['POST'])
def generate_lyrics():
    data = request.get_json()

    # Extracting the description from the user input
    song_description = data.get('description', '')

    if not song_description:
        return jsonify({'error': 'Song description is required!'}), 400

    # Generate lyrics using OpenAI's GPT model
    try:
        response = openai.Completion.create(
            model="text-davinci-003",
            prompt=song_description,
            max_tokens=150
        )
        lyrics = response.choices[0].text.strip()
        return jsonify({'lyrics': lyrics}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
