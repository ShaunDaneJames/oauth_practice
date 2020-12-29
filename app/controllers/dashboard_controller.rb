class DashboardController < ApplicationController

  def show
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{current_user.token}"
      }
    )
    response = conn.get('/user/repos')
    # make Repo record and associate to user, user must be created with
    # repos = nil

    # How this is set up the response will fetch the data regardless, so does
    # it really need to be stored in the DB? Use a PORO?
    @user_repos = JSON.parse(response.body, symbolize_names: true)
  end
end
