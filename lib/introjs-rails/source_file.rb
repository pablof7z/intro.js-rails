require "thor"
require "json"
require "httpclient"

class SourceFile < Thor
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  def fetch
    filtered_tags = fetch_tags
    tag = select("Which tag do you want to fetch?", filtered_tags)
    self.destination_root = "app/assets"
    remote = "https://github.com/usablica/intro.js"
    get "#{remote}/raw/#{tag}/minified/intro.min.js", "javascripts/introjs.js"
    get "#{remote}/raw/#{tag}/minified/introjs.min.css", "stylesheets/introjs.css"
  end

  private

  def fetch_tags
    http = HTTPClient.new
    response = JSON.parse(http.get("https://api.github.com/repos/usablica/intro.js/tags").body)
    response.map{|tag| tag["name"]}.sort
  end
  
  def select msg, elements
    elements.each_with_index do |element, index|
      say(block_given? ? yield(element, index + 1) : ("#{index + 1}. #{element.to_s}"))
    end
    result = ask(msg).to_i
    elements[result - 1]
  end
end
