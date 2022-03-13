- Find if current_user exists, if not find current user:
'@current_user ||= User.find(session[:user_id]) if session(:user_id)'
- Find by 
'user = User.find_by(email:params[:session][:email].downcase)'
- Conver to boolean
'!! current_user'
- restrictions
' <% if logged_in? && current_user == article.user %>'