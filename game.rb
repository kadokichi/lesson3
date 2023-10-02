puts "------------------------"
puts "じゃんけん..."

#じゃんけんの実装
def janken
  jankens = ["グー","チョキ","パー"]
  cpu_results = rand(3)
  @result = ""
  
  puts "0:グー 1:チョキ 2:パー 3:戦わない　〜番号を選択してください〜"
  
  choise = gets.to_i

  if choise == 3
    puts "ゲームを終了します"
    exit
  elsif choise >= 4
    puts "0〜3以外の数値が入力されました。ゲームを終了します"
    exit
  end

  puts "ホイ！"
  puts "------------------------"
  puts "あなた: #{jankens[choise]}"
  puts "相手: #{jankens[cpu_results]}" 
  
  if choise  == cpu_results
    puts "引き分けです。あいこで..."
    puts "------------------------"
    return true
  elsif choise == 0 && cpu_results == 1 || choise == 1 && cpu_results == 2 || choise == 2 && cpu_results == 0
    puts "あなたの勝利です!"
    puts "------------------------"
    @result = "win"
    return false
  else
    puts "あなたの負けです..." 
    puts "------------------------"
    @result = "lose"
    return false
  end
end 

#あっち向いてホイの実装
def acchimuite_hoi
  puts "あっち向いて〜"
  puts "0:上 1:下 2:右 3:左　〜番号を選択してください〜"
  
  look_that_way = ["上","下","右","左"]
  
  @cpu_results2 = rand(3)
  
  @choise2 = gets.to_i
  
  puts "ホイ！"
  puts "------------------------"
  
  puts "あなた: #{look_that_way[@choise2]}"
  puts "相手: #{look_that_way[@cpu_results2]}" 
  
  if @choise2 >= 4
    puts "0〜3以外の数値が入力されました。ゲームを終了します"
    exit
  elsif @choise2 == @cpu_results2 && @result == "win"
    puts "あなたの勝利です！"
    puts "------------------------"
    exit
  elsif @choise2 == @cpu_results2 && @result == "lose"
    puts "あなたの負けです..."
    puts "------------------------"
    exit
  else
    puts "勝敗がつきませんでした。じゃんけんに戻ります"
    puts "------------------------"
    puts "じゃんけん..."
  end
end

next_game = true

loop do
  while next_game 
    next_game = janken
  end
  
  acchimuite_hoi
  
  if @choise2 != @cpu_results2
    next_game = janken
  end
end