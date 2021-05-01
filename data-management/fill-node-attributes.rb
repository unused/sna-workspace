
require './application'
require 'csv'

filename = ARGV.last

col = [['Id','Label','timeset','Category', 'ScreenName']]

CSV.open filename, 'rb' do |csv|
  csv.each do |row|
    next if row[0] == 'Id'

    user = User.find(row[0].to_i)
    categories = Array(user&._categories)
    col << [row[0], row[1], '', categories.join(';'), user.screen_name]
  rescue ArgumentError => e
    print '.'
    col << [row[0], row[1], '', '', '']
  end
end

File.write "#{filename}.done", col.map { |x| x.join ',' }.join("\n")

