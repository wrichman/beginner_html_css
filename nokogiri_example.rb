require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://toronto.en.craigslist.ca/bia/"))
bikes = page.css('blockquote#toc_rows p.row span.pl a')

File.open('bikes.html', 'w') do |f|
  
  f.write("<html>\n")
  f.write("<head>\n")
  f.write("<title>Intro to HTML/CSS</title>\n")
  f.write("<link rel='stylesheet' type='text/css' href='positioning_style.css'>\n")
  f.write("</head>\n")
  f.write("<body>\n")

  bikes.each do |bike|
    f.write("<br>")
    f.write("<div>" + bike.text() + "</div>\n")
  end

  f.write("</body>\n")
  f.write("</html>\n")
end