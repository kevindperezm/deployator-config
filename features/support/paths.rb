module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the login page/
      root_path
    end
  end
end

World(NavigationHelpers)
