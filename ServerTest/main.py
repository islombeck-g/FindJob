from flask import Flask, jsonify, request
import pymysql
# import json
from werkzeug.security import check_password_hash, generate_password_hash
from config import host_const, user_const, password_const, name_const

app = Flask(__name__)

# Подключение к базе данных MySQL
db = pymysql.connect(host=host_const, user=user_const, password=password_const, database=name_const)
cursor = db.cursor()

# Эндпоинт для регистрации пользователя
@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    username = data.get('username')
    password = data.get('password')

    if not username or not password:
        return jsonify({'error': 'Missing username or password'}), 400

    hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
    print(hashed_password)

    cursor.execute('INSERT INTO users (username, password) VALUES (%s, %s)', (username, hashed_password))
    db.commit()

    return jsonify({'message': 'User registered successfully'})
# Эндпоинт для авторизации пользователя
@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    username = data.get('username')
    password = data.get('password')

    # Retrieve hashed password from the database based on the username
    cursor.execute('SELECT password FROM users WHERE username = %s', (username,))
    result = cursor.fetchone()

    if result is None:
        return jsonify({'error': 'User not found'}), 401

    stored_password = result[0]
    if not check_password_hash(stored_password, password):
        return jsonify({'error': 'Invalid password'}), 401
    return jsonify({'message': 'Login successful'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4568)
