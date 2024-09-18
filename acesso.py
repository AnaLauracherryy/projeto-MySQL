import tkinter as tk
from tkinter import messagebox


def validate_login():
    username = username_entry.get()
    password = password_entry.get()


    if username == "admin" and password == "senha123":
        messagebox.showinfo("Login bem-sucedido", "Bem-vindo, Admin!")
    else:
        messagebox.showerror("Falha no Login", "Usuário ou senha inválidos")


root = tk.Tk()
root.title("Formulário de Login")
root.geometry("300x200")

username_usuário = tk.Label(root, text="Usuário:")
username_usuário.pack(pady=5)

username_entry = tk.Entry(root)
username_entry.pack(pady=5)

password_entry = tk.Entry(root, show="*")