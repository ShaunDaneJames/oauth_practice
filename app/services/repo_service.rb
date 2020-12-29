class RepoService

  def self.conn(current_user)
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{current_user.token}"
      }
    )
  end

  def self.find_repos(current_user)
    response = conn(current_user).get('/user/repos')
    # make Repo record and associate to user, user must be created with
    # repos = nil

    # How this is set up the response will fetch the data regardless, so does
    # it really need to be stored in the DB? Use a PORO?
    JSON.parse(response.body, symbolize_names: true)
  end
end
