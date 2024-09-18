create database db_usu;
use db_usu;
CREATE TABLE tbl_professores (
  usu_codigo int(11) NOT NULL AUTO_INCREMENT,
  usu_nome varchar(50) DEFAULT NULL,
  usu_cpf int(11),
  usu_email varchar(50) DEFAULT NULL,
  usu_telefone varchar(40) DEFAULT NULL,
  PRIMARY KEY (usu_codigo)
);
INSERT INTO tbl_professores (usu_nome, usu_cpf, usu_email, usu_telefone) VALUES ('admin', '12345678901', 'admin@example.com', '123456789');
import tkinter as tk
from tkinter import messagebox
import mysql.connector


def validate_login():
    username = username_entry.get()
    password = password_entry.get()

    try:
      
        connection = mysql.connector.connect(
            host='localhost',
            user='seu_usuario',     
            password='sua_senha',   
            database='db_usu'
        )
        
        cursor = connection.cursor()
        
        
        query = "SELECT * FROM tbl_professores WHERE usu_nome = %s AND usu_cpf = %s"
        cursor.execute(query, (username, password))
        
        result = cursor.fetchone()

        if result:
            messagebox.showinfo("Login bem-sucedido", f"Bem-vindo, {result[1]}!")  # result[1] é o nome do usuário
        else:
            messagebox.showerror("Falha no Login", "Usuário ou senha inválidos")
    
    except mysql.connector.Error as err:
        messagebox.showerror("Erro", f"Erro ao conectar ao banco de dados: {err}")
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


root = tk.Tk()
root.title("Formulário de Login")
root.geometry("300x200")


username_label = tk.Label(root, text="Usuário:")
username_label.pack(pady=5)

username_entry = tk.Entry(root)
username_entry.pack(pady=5)

password_label = tk.Label(root, text="CPF:")
password_label.pack(pady=5)

password_entry = tk.Entry(root)  
password_entry.pack(pady=5)


login_button = tk.Button(root, text="Entrar", command=validate_login)
login_button.pack(pady=20)


root.mainloop()