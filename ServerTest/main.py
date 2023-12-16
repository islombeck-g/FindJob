from flask import Flask, jsonify, request
import pymysql
# import json
from werkzeug.security import check_password_hash, generate_password_hash
from config import host_const, user_const, password_const, name_const

app = Flask(__name__)

# Подключение к базе данных MySQL
db = pymysql.connect(host=host_const, user=user_const, password=password_const, database=name_const)
cursor = db.cursor()

# Эндпоинт для регистрации нового пользователя
@app.route('/registration', methods=['POST'])
def register():
    try:

        data = request.get_json()

        # Получение данных из запроса
        first_name = data.get('firstName')
        second_name = data.get('secondName')
        patronymic_name = data.get('patronymicName')
        gender = data.get('gender')
        city = data.get('city')
        university = data.get('university')
        phone_number = data.get('phoneNumber')
        image = data.get('image')
        email = data.get('email')
        password = data.get('password')
        birth_date = data.get('birthDate')
        about_me = data.get('aboutMe')
        institute = data.get('institute')
        direction = data.get('direction')
        login = data.get('login')
        # Хеширование пароля

        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        # Вставка нового пользователя в базу данных
        cursor.execute(
            'INSERT INTO users (firstName, secondName, patronymicName, gender, city, university, phoneNumber, '
            'image, email, password, birthDate, aboutMe, institute, direction, login) VALUES (%s, %s, %s, %s, %s, %s, %s, '
            '%s, %s, %s, %s, %s, %s, %s, %s)',
            (first_name, second_name, patronymic_name, gender, city, university, phone_number, image, email,
             hashed_password, birth_date, about_me, institute, direction, login)
        )

        db.commit()

        return jsonify({'message': 'Registration successful'})

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({'error': f'Server error: {str(e)}'}), 500
# Эндпоинт для авторизации пользователя
@app.route('/login', methods=['POST'])
def login():
    try:
        data = request.get_json()

        userLogin = data.get('userLogin')
        password = data.get('password')

        # Retrieve hashed password from the database based on the username
        cursor.execute('SELECT password FROM users WHERE login = %s', (userLogin,))
        result = cursor.fetchone()

        # Retrieve hashed password from the database based on the username
        cursor.execute(
            'SELECT password, firstName, secondName, patronymicName, gender, city, university, phoneNumber, image, email, birthDate, aboutMe, institute, direction, login FROM users WHERE login = %s',
            (userLogin,))
        result = cursor.fetchone()

        if result is None:
            return jsonify({'error': 'User not found'}), 401

        stored_password = result[0]
        if not check_password_hash(stored_password, password):
            return jsonify({'error': 'Invalid password'}), 401

        # Extract user data from the result
        user_data = {
            'firstName': result[1],
            'secondName': result[2],
            'patronymicName': result[3],
            'gender': result[4],
            'city': result[5],
            'university': result[6],
            'phoneNumber': result[7],
            'image': result[8],
            'email': result[9],
            'birthDate': result[10],
            'aboutMe': result[11],
            'institute': result[12],
            'direction': result[13],
            'login': result[14]
        }
        return jsonify({'message': 'Login successful', 'userData': user_data})

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({'error': f'Server error: {str(e)}'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4568)