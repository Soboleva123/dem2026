import mysql.connector
from mysql.connector import Error

class DBConnection:
    def __init__(self):
        self.connection = None
        self.cursor = None
        self.connect()

    def connect(self):
        try:
            self.connection = mysql.connector.connect(
                host='localhost',
                user='root',
                password='aeevi1108NV',
                port=3307,
                database='dem2026_1'
            )
            if self.connection.is_connected():
                self.cursor = self.connection.cursor(dictionary=True)
                print('Установлено соединение с БД')
        except Error as e:
            print(f'Ошибка подключения к БД: {e}')
            self.connection = None
            self.cursor = None

    def authorization(self, login, password):
        self.cursor.execute('select * from users where login = %s and password = %s', (login, password,))
        return self.cursor.fetchone()

    def get_products(self):
        self.cursor.execute('''
        select products.article as article,
               products.name as name,
               products.unit as unit,
               products.price as price,
               products.supplierID as supplierID,
               products.producerID as producerID,
               supplier.name as supplierName,
               producer.name as producerName,
               products.productCategory as productCategory, 
               products.discount as discount,
               products.count as count,
               products.description as description,
               products.photoName as photoName
        from products
        join supplier on products.supplierID = supplier.id
        join producer on products.producerID = producer.id
        ''')
        return self.cursor.fetchall()

    def get_suppliers(self):
        self.cursor.execute('select * from supplier')
        return self.cursor.fetchall()

    def get_producers(self):
        self.cursor.execute('select * from producer')
        return self.cursor.fetchall()

    def edit_product(self, name, unit, price, supplierID, producerID, productCategory, discount, count, description, photoName, article):
        self.cursor.execute('''
        update products
        set
            name = %s,
            unit = %s,
            price = %s,
            supplierID = %s,
            producerID = %s,
            productCategory = %s,
            discount = %s,
            count = %s,
            description = %s,
            photoName = %s
        where article = %s
        ''', (name,unit, price, supplierID, producerID, productCategory, discount, count, description, photoName, article,))
        self.connection.commit()

    def add_product(self, article, name, unit, price, supplierID, producerID, productCategory, discount, count, description, photoName):
        self.cursor.execute('''
        INSERT INTO products (
            article,
            name,
            unit,
            price,
            supplierID,
            producerID,
            productCategory,
            discount,
            count,
            description,
            photoName
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ''', (article, name, unit, price, supplierID, producerID, productCategory, discount, count, description, photoName,))
        self.connection.commit()

    def delete_product(self, article):
        self.cursor.execute('''
        DELETE FROM products WHERE article = %s
        ''', (article,))
        self.connection.commit()

    def get_producerID_by_name(self, name):
        self.cursor.execute('select * from producer where name = %s', (name,))
        return self.cursor.fetchone()

    def get_supplierID_by_name(self, name):
        self.cursor.execute('select * from supplier where name = %s', (name,))
        return self.cursor.fetchone()

    def add_supplier(self, name):
        self.cursor.execute('insert into supplier (name) value (%s)', (name,))
        self.connection.commit()

    def check_article(self, article):
        self.cursor.execute('select * from products where article = %s', (article,))
        return self.cursor.fetchone()

    def chech_product_in_order(self, article):
        self.cursor.execute('''
        select order_products.productsID as productsID,
               order_products.orderID as orderID,
               orders.statusOrder as statusOrder
        from order_products
        join orders on order_products.orderID = orders.id
        where productsID = %s
        ''', (article,))
        return self.cursor.fetchall()