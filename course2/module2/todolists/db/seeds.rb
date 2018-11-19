# Clear Database
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

# Create Users
fiorina = User.create(username: "Fiorina", password_digest: "password123")
trump = User.create(username: "Trump", password_digest: "password123")
carson = User.create(username: "Carson", password_digest: "password123")
clinton = User.create(username: "Clinton", password_digest: "password123")

# Create Profiles
Profile.create(
  gender: "female",
  birth_year: 1954,
  first_name: "Carly",
  last_name: "Fiorina",
  user: fiorina
)

Profile.create(
  gender: "male",
  birth_year: 1946,
  first_name: "Donald",
  last_name: "Trump",
  user: trump
)

Profile.create(
  gender: "male",
  birth_year: 1951,
  first_name: "Ben",
  last_name: "Carson",
  user: carson
)

Profile.create(
  gender: "female",
  birth_year: 1947,
  first_name: "Hillary",
  last_name: "Clinton",
  user: clinton
)

# Create TodoLists
User.all.each do |user|
  TodoList.create(list_name: "Todo List", list_due_date: 2019, user: user)
end

# Create TodoItem
TodoList.all.each do |list|
  (0..4).each do
    TodoItem.create(due_date: 2019, title: "Todom Item Title", description: "Todo Item Description", todo_list: list)
  end
end