class Profile < ActiveRecord::Base

  def initialize(username)
    @content = HTTParty.get(
        "https://api.github.com/users/#{username}",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
  end

  def self.create_from_username( username )
    response = HTTParty.get(
      "https://api.github.com/users/#{username}",
      :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                   "User-Agent" => "anyone"
                  }
      )

    @content = response

    if response["login"]
      Profile.create(username: response["login"],
        avatar_url: response["avator_url"],
        location: response["location"],
        company_name: response["company"],
        number_of_followers: response["followers"],
        number_following: response["following"],
        repository_list: RepositoryList.new( username )
        )

    else
      return nil
    end
  end

  def username
    @content["login"]
  end

  def avatar_url
    @content["avatar_url"]
  end

  def location
    @content["location"]
  end

  def company_name
    @content["company"]
  end

  def number_of_followers
    @content["followers"]
  end

  def number_following
    @content["following"]
  end

end
