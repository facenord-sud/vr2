require 'nokogiri'
require 'rest-client'

namespace :db do
  desc 'Fetch the results from judoinside'
  task fetch: :environment do
    #extractMedalsData
    extractResults
  end
end

def getMedals

end

def extractMedalsData
  puts 'extracting medals infos'
  html_doc = Nokogiri::HTML(RestClient.get('http://www.judoinside.com/judoka/view/39690/judo-career/').to_s)
  results = html_doc.css('.resultsdata').css('tr').drop(4)
  results.each do |a|
    medals = a.text[/\d{3}\z/]
    title = a.text[0..-medals.length-2]
    unless medals == '000'
      carreer = Carreer.find_by(name: title)
      if carreer.nil?
        Carreer.create!(
            name: title,
            gold: medals[0],
            silver: medals[1],
            bronze: medals[2]
        )
      else
        carreer.medals = medals
        carreer.save
      end
    end
  end
end

def extractResults
  puts 'extracting results infos'
  html_doc = Nokogiri::HTML(RestClient.get('http://www.judoinside.com/judoka/view/39690/judo-results/').to_s)
  html_doc.css('.resultsdata').css('tr').each do |a|
    a_result = a.css('td').text
    next if a_result == '' or a_result.nil?
    date = a_result[0..8]
    date = Date.new
    point = a_result[20]
    category = a_result[-3..-1]
    text = a_result[21..-6].split(' ')
    temp = text.delete_at(-1)
    comp = temp[/[A-Z]{2}.*/]
    name = text.join(' ')+' '+temp[0..-comp.length-1]

    puts "#{date}, #{point}, #{name}, #{comp}, #{category}"
    result = Result.find_by(date: date)
    if result.nil?
      Result.create!(
          date: date,
          point: point,
          name: name,
          comp: comp,
          category: category
      )
    else
      result.date = date
      result.point = point
      result.name = name
      result.comp = comp
      result.category = category
      result.save
    end
  end
end