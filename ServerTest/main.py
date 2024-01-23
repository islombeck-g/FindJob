from flask import Flask, jsonify, request
import pymysql
# from pydantic import json
import json
from werkzeug.security import check_password_hash, generate_password_hash
from config import host_const, user_const, password_const, name_const

app = Flask(__name__)

# Подключение к базе данных MySQL
db = pymysql.connect(host=host_const, user=user_const, password=password_const, database=name_const)
cursor = db.cursor()



# Функция для добавления дефолтных значений в таблицу Jobs
def insert_default_jobs():
    try:
        # Дефолтные значения
        default_jobs = [
            {
                'activity': 'Default Activity 1',
                'nameOfCompany': 'Default Company 1',
                'position': 'Default Position 1',
                'jobType': 'Full Time',
                'experience': ['Skill1', 'Skill2'],
                'location': 'Default Location 1',
                'money': '1000 USD',
                'description': 'Default Description 1',
                'minExperience': 1,
            },
            {
                'activity': 'Default Activity 2',
                'nameOfCompany': 'Default Company 2',
                'position': 'Default Position 2',
                'jobType': 'Part Time',
                'experience': ['Skill3', 'Skill4'],
                'location': 'Default Location 2',
                'money': '800 USD',
                'description': 'Default Description 2',
                'minExperience': 2,
            },
            # Добавьте другие дефолтные значения, если необходимо
        ]

        # Формируем SQL запрос для вставки данных
        insert_query = "INSERT INTO jobs (activity, nameOfCompany, position, jobType, experience, location, money, description, minExperience) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"

        # Выполняем вставку для каждого дефолтного значения
        for job_data in default_jobs:
            values = (
                job_data['activity'],
                job_data['nameOfCompany'],
                job_data['position'],
                job_data['jobType'],
                json.dumps(job_data['experience']),  # Преобразуем список в JSON
                job_data['location'],
                job_data['money'],
                job_data['description'],
                job_data['minExperience'],
            )
            cursor.execute(insert_query, values)

        # Фиксируем изменения
        db.commit()

        print('Default jobs added successfully')

    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f'Error adding default jobs: {str(e)}')

    finally:
        # Закрываем соединение с базой данных
        db.close()










# Эндпоинт для обновления параметров пользователя
@app.route('/update_user', methods=['POST'])
def updateUser_func():
    try:
        data = request.get_json()

        # Получение данных из запроса
        login = data.get('login')
        new_data = {
            'firstName': data.get('firstName'),
            'secondName': data.get('secondName'),
            'patronymicName': data.get('patronymicName'),
            'gender': data.get('gender'),
            'city': data.get('city'),
            'university': data.get('university'),
            'phoneNumber': data.get('phoneNumber'),
            'image': data.get('image'),
            'email': data.get('email'),
            'birthDate': data.get('birthDate'),
            'aboutMe': data.get('aboutMe'),
            'institute': data.get('institute'),
            'direction': data.get('direction'),
        }

        # Формируем SQL запрос для обновления данных пользователя
        update_query = "UPDATE users SET "
        update_values = []
        for key, value in new_data.items():
            if value is not None:
                update_query += f"{key}=%s, "
                update_values.append(value)

        update_query = update_query.rstrip(', ')
        update_query += " WHERE login=%s"
        update_values.append(login)

        # Выполняем обновление данных в базе данных
        cursor.execute(update_query, update_values)
        db.commit()

        return jsonify({'message': 'User data updated successfully'})

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({'error': f'Server error: {str(e)}'}), 500

# Эндпоинт для регистрации нового пользователя
@app.route('/registration', methods=['POST'])
def register_func():
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
def login_func():
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
    insert_default_jobs()
    app.run(host='0.0.0.0', port=4568)