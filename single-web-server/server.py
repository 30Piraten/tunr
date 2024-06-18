from flask import Flask  # type: ignore

app = Flask(__name__)

port = 9000


@app.route("/")
def main():
    return f"<h1>Willkommen!</h1> | running: VM_EXTERNAL_IP/{port}"


if __name__ == "__main__":
    app.run(port=port)
