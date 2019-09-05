require "pg"

class Database
  # Iniciar a conexão com o banco de dados
  def initialize
    conn = { host: "192.168.99.100", dbname: "nflix", user: "postgres", password: "qaninja" }
    @connection = PG.connect(conn)
  end

  def find_user(email)
    query = "SELECT id, full_name, password, email, created_at, updated_at" \
    " FROM public.users WHERE email = #{email}"
    @connection.exec(query).first # traz somente a primeira posição do array de retorno
  end

  def delete_user(email)
    @connection.exec("DELETE from public.users where email = '#{email}';")
  end

  def clean_db
    @connection.exec("DELETE from public.users where id > 1;")
  end
end
