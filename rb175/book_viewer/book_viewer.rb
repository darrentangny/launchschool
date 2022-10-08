require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  # Added for cases when a "semantically incorrect" path is used but is
  # otherwise a legitimate route
  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

# First attempt, best practices created #each_chapter and #chapters_matching
# iterative logic was in search.erb file:
# <% if params[:query].nil? == false %>
#   <h2 class="content-subhead">Results for '<%= params[:query] %>'</h2>
#   <ul>
#     <% @all_text.each_with_index do |chapter, index| %>
#       <% if chapter.match?(params[:query]) %>
#         <li><a href="data/chp#{index + 1}.txt"><%= @contents[index] %></li>
#       <% end %>
#     <% end %>
#   </ul>
#   <% if @all_text.none? { |chapter| chapter.match?(params[:query]) } %>
#     <p>Sorry, no matches were found.</p>
#   <% end %>
# <% end %>

# get "/search" do
#   @all_text = (1..@contents.size).map do |chap_num|
#     File.read("data/chp#{chap_num}.txt")
#   end
#   erb :search
# end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

# Note here: ("\n\n") portion of join apparently redundant--might affect 
# readability, not that it comes up.
# Alternate form: "<p>#{paragraph}</p>"
# Utilized in get "/chapters/:number" do
helpers do
  def in_paragraphs(str)
    str.split("\n\n").map.with_index do |paragraph, idx|
      "<p id=\"paragraph_#{idx + 1}\">" + paragraph + "</p>"
    end.join("\n\n")
  end

  def highlight_match(text, term)
    # str1.split("#{str2}").join("<strong>#{str2}</strong>")
    text.gsub(term, "<strong>#{term}</strong>")
  end
end

# special route where path not found
not_found do
  # below works, but not what was used, for whatever reason
  # redirect sends 3XX code--possible reason for preference
  # erb :home
  redirect "/"
end

def each_chapter
  @contents.each_with_index do |name, index|
    number = (index + 1).to_s
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results if !query || query.empty?

  each_chapter do |number, name, contents|
    if contents.include?(query)
      matching_paragraphs = []
      contents.split("\n\n").each_with_index do |paragraph, idx|
        if paragraph.include?(query)
          matching_paragraphs << { (idx + 1 ) => paragraph }
        end
      end
      results << { number: number, name: name, paragraphs: matching_paragraphs }
    end
  end
  results
end
