require 'nokogiri'
require 'open-uri'

# wrap in html, head, body tags

def header
  "<html>\n"
    "<head>\n"
      "<title>Intro to HTML/CSS</title>\n"
      "<link rel='stylesheet' type='text/css' href='positioning_style.css'>\n"
    "</head>\n"
    "<body>\n"
end

def footer
    "</body>\n"
  "</html>\n"
end

header

File.open('bikes.html', 'w') do |f|
  page = Nokogiri::HTML(open("http://toronto.en.craigslist.ca/bia/"))
  bikes = page.css('blockquote#toc_rows p.row span.pl a')
  f.write(header)
  bikes.each do |bike|
    f.write("<br>")
    f.write("<div>" + bike.text() + "</div>\n")
  end
  f.write(footer)
end

footer