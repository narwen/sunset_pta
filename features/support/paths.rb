module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /the homepage/
        '/'
      when /the board members list page/
        board_members_path

      when /the login page/
        '/login'

      when /the new position page/
        '/positions/new'

      when /the positions page/
        '/positions'

      when /my profile page/
        user_path(current_user)

      when /the profile page for "([^\"]*)"/
        user_path(User.find_by_email($1))

      when /the profile page for volunteer with first name "([^\"]*)"/
        user_path(User.find_by_first_name($1))

      when /the new user page/
        new_user_path

      when /the users page/
        users_path

      when /the new user assignment page for "([^\"]*)"/
        new_user_assignment_path(User.find_by_email($1))

      when /the new committee page/
        new_committee_path

      when /the volunteers page/
        users_path

      when /the committees page/
        committees_path
        # Add more mappings here.
        # Here is a more fancy example:
        #
        #   when /^(.*)'s profile page$/i
        #     user_profile_path(User.find_by_login($1))

      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
