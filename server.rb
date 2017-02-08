require "sinatra"
require "pry"
require "csv"

ARTICLE = 'articles.csv'

set :bind, '0.0.0.0'

def add_article
  article = [params[:title], params[:url], params[:description]]
  # binding.pry
  CSV.open(ARTICLE, 'a') do |file|
    file << article
  end
end

# def view_articles
#   CSV.foreach(ARTICLE) do |row|
#
#
# end

get "/" do
  "<h1>The News Homepage</h1>"
end

get "/articles/new_article" do
  # binding.pry
  erb :'articles/new_article'
end

post '/new_article' do
  # binding.pry
  add_article
  redirect "/articles"
end

get "/articles" do
  @articles = []
  CSV.foreach(ARTICLE) do |row|
    @articles << row
  end
  erb :'articles/index'
end
