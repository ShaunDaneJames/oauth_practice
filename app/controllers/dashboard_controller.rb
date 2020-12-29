class DashboardController < ApplicationController

  def show
    repos = RepoFacade.get_repos(current_user)

    @repo_list = repos.map do |repo|
      Repo.new(repo)
    end
  end
end
