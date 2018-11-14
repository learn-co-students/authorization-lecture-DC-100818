# Authentication:
## Conditional Rendering:
How can I show special things to a logged in user?
```ruby
  # users/show.erb
  <% if session[:user_id] == @user.id
    <h3>Hey this is you!</h3>
  <% end
```

How can we make this check to see if the user is the current_user easier?
```ruby
  # ApplicationController
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
    # !<user instance> -> false (negate that to get true)
    # !nil -> true (negate that to get false)
  end
```

#### Putting it to use:
  **gotcha:** How do we get a helper_method (hint) into our view? (question: are these methods already available in other controllers? How?)
```ruby
  class ApplicationController < ActionController::Base
    helper_method :logged_in?
    ...
```
```ruby
  # layouts/application.html.erb
  ...
  <% if logged_in?
    <%= link_to "Log out", logout_path, method: 'post'
    # by convention, links make "GET" requests,
    # buttons make "POST" requests
  <% else
    <%= link_to "Log in", login_path
  <% end

  <%= yield
  ...
```

## Permissions:
How do I keep users from going to routes I don't want them to?
```ruby
  # ApplicationController
  def authorized
    redirect_to login_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      # Design Decision: Where do we want to send them?
      # Do we want to show them an error?
      # flash[:notice] = "I can't let you do that, Dave"
      redirect_to current_user
    end
  end
```
```ruby
  # UsersController
  def edit
    authorized_for_user(@user)
  end
```
 How can I use Conditional Rendering to allow special behavior?
 ```ruby
  # users/show.erb
   <% if current_user == @user
     <%= link_to "Edit Profile", edit_user_path(@user)
   <% end
 ```

## Bonus: Handling Bad Routes:
Now that we are controlling where a user can go and what happens
when they get there, what if they do something weird or made up?
```ruby
  # ApplicationController
  def redirect_bad_route
    redirect_to museums_path
  end
```
```ruby
  # routes.rb
  get "*path", to: 'application#redirect_bad_route'
```

## Finished ApplicationController:
```ruby
class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
    # !<user instance> -> false (negate that to get true)
    # !nil -> true (negate that to get false)
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to current_user
    end
  end

  def redirect_bad_route
    redirect_to museums_path
  end
end
```
