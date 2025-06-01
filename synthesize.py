import os
import boto3

def synthesize_speech():
    try:
        if not os.path.exists("speech.txt"):
            raise FileNotFoundError("speech.txt not found in current directory.")

        with open("speech.txt", "r") as file:
            text = file.read()

        print("✅ speech.txt loaded.")

        polly = boto3.client("polly",
                             region_name="us-east-2",
                             aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
                             aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"))

        response = polly.synthesize_speech(
            Text=text,
            OutputFormat="mp3",
            VoiceId="Joanna"
        )

        with open("output.mp3", "wb") as out:
            out.write(response["AudioStream"].read())

        print("✅ output.mp3 created successfully.")

    except Exception as e:
        print(f"❌ Error in synthesize_speech(): {e}")
        raise

if __name__ == "__main__":
    synthesize_speech()

