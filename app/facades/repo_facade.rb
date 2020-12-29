class RepoFacade

  def self.get_repos(current_user)
    repos = RepoService.find_repos(current_user)

    repos.each do |repo|
      Repo.new(repo)
    end
  end
end
