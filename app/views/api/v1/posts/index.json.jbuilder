json.array!(@posts) do |post|
  json.extract! post, :title, :body, :user_id
  json.extract! post.user, :name
  #json.foo 'bar'
  #json.current_time Time.now

  #json.foo 'ver'
  #json.set! :posts do
  #	json.extract! post, :title, :name, :body
  #	json.foo 'bar'
  #	json.current_time Time.now
  #end
end