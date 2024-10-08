# AI-Assisted Music Production App

This project is an AI-powered music production app where users can generate song lyrics by providing a description. The app leverages OpenAI’s language model to generate lyrics based on the provided description. The frontend is built using Flutter, and the backend is implemented using Flask.

## Features

- **Language Input**: Specify the language of the song lyrics.
- **Genre Input**: Specify the genre of the song.
- **Lyrics Generation**: Based on a prompt describing the song, the app generates lyrics using OpenAI's GPT model.
- **Simple UI**: The Flutter frontend allows users to input descriptions and get generated lyrics.

## Technologies Used

- **Frontend**: Flutter (Dart)
- **Backend**: Flask (Python)
- **AI Model**: OpenAI GPT (via OpenAI API)
- **Deployment**: The backend can be deployed on Vercel or any other cloud provider.

## Setup Instructions

### 1. Backend Setup (Flask)

#### Prerequisites
- Python 3.x
- Install the dependencies listed in `requirements.txt`.

#### Steps

1. Navigate to the `backend/` directory.
2. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your OpenAI API key by replacing the `openai.api_key` in `app.py` with your actual API key.
4. Run the Flask app:
   ```bash
   python app.py
   ```
   The backend will run on `http://localhost:5000`.

### 2. Frontend Setup (Flutter)

#### Prerequisites
- Flutter SDK

#### Steps

1. Navigate to the `frontend/` directory.
2. Install the necessary Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Run the Flutter app:
   ```bash
   flutter run
   ```
   This will launch the Flutter UI on your emulator or connected device.

### 3. Connect Backend with Frontend

Make sure that the backend is running on `http://localhost:5000` and the Flutter app is pointing to the same backend URL in the `generateLyrics()` function in `main.dart`.

### 4. Deployment

You can deploy the backend on a cloud platform such as Vercel, and deploy the frontend using Firebase Hosting or any other hosting service of your choice.

## Final Project Structure

Here’s how the project structure should look:

```bash
music_production_app/
│
├── backend/
│   ├── music_production_backend.ipynb   # Jupyter Notebook (if necessary)
│   ├── app.py                           # Flask API code
│   ├── requirements.txt                 # Backend dependencies
│
├── frontend/
│   ├── lib/
│   │   └── main.dart                    # Flutter UI code
│   ├── pubspec.yaml                     # Flutter dependencies
│
├── README.md                            # Project-wide README
```

## Example Use Case

1. Enter the **Language** and **Genre** in the text fields.
2. Provide a description of the song you would like to produce (e.g., "A happy song about friendship").
3. Click the **Create/Update Lyrics** button.
4. The app will display the generated song lyrics below the button.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
