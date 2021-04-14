class ChangeUsersAdminNillConstraint < ActiveRecord::Migration[6.0]
  def change#сделать интерфейс в админке и вернуть NillConstraint 
    change_column_null(:users, :admin, true)
  end
end
