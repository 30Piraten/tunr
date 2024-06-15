from flask import Flask

app = Flask(__name__)

port = 9000

@app.route("/")
def main():
    return f"<h1>Wilkommen!</h1> | running: 127.0.0.1/{port}"

if __name__ == "__main__":
    app.run(port=port)