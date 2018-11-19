class TodoItem < ActiveRecord::Base
  default_scope { order :due_date }

  belongs_to :todo_list
end
