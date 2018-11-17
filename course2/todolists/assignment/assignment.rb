require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
    User.create(params)
  end

  def create_todolist(params)
    params[:list_name] = params.delete :name
    params[:list_due_date] = Date.today.to_s
    params.delete :due_date
    TodoList.create(params)
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.order(:updated_at).offset(offset).limit(limit)
  end

  def find_alllists(offset, limit)
    TodoList.order(list_due_date: :desc).offset(offset).limit(limit)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.where(username: username) 
  end 

  def find_todolist_byname(name)
    TodoList.where(list_name: name)
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find(id)
  end

  def get_todolist_byid(id)
    TodoList.find(id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      User.update(id,password_digest: password_digest)
  end

  def update_listname(id, name)
      # accept an id and name input parameters
      # use the TodoList Model class to update the `list_name` for the TodoList associated with id primary key 
      # (no return is required)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
  end 

  def delete_todolist(id)
      # accept an id input parameter
      # use the TodoList Model class to remove the TodoList associated with the `id` primary key.
      # (no return is required)
  end
end
