require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子(.csvなど)を除いたファイルを入力してください"
  @file_name = gets.chomp
  
  p "メモの内容を入力してください"
  p "完了したら「Ctrl + D」をおします"
  
  @memo = STDIN.read.chomp
  
  CSV.open("#{@file_name}.csv","w") do |csv|
    csv << ["#{@memo}"]
  end

elsif memo_type == 2
  puts "拡張子(.csvなど)を除いたファイル名を入力してください"
  @file_name = gets.chomp
  puts CSV.read("#{@file_name}.csv")
  @memo = STDIN.read.chomp
  CSV.open("#{@file_name}.csv","a") do |csv|
    csv << ["#{@memo}"]
  end
  
else
  puts "1、2以外の数字が入力されました。やり直してください。"
end