require 'csv'

# Parse the CSV file
csv_text = File.read('/home/manveer/rails/myBooks/db/books.csv')
csv = CSV.parse(csv_text, headers: true)

# Loop through each row in the CSV and create Book records
csv.each_with_index do |row, index|
  begin
    Book.create!(
      title: row['Title'],
      author: row['Author'],
      genre: row['Genre'],
      height: row['Height'].to_i,
      publisher: row['Publisher']
    )
  rescue ActiveRecord::RecordInvalid => e
    puts "Error on row #{index + 1}: #{e.message}"
    puts "Data causing the error: #{row}"
  end
end
