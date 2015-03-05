class RepositoryList

  def self.create_from_profile_id( username, id )
    results = HTTParty.get(
        "https://api.github.com/users/#{username}/repos?sort=updated",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )

    repositories = results.map {|r| Repository.create(name: r["name"],
      url: r["url"],
      forks_count: r["forks_count"],
      stargazers_count: r["stargazers_count"],
      updated_at: r["updated_at"],
      language: r["language"],
      profile_id: id)}

  end

end
