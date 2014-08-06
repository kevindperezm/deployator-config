module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the login page/
      new_user_session_path
    end
  end
end

World(NavigationHelpers)
