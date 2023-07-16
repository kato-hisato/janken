#クラス
class Janken
  
  def initialize(my_hand,enemy_hand)
    @my_hand = my_hand
    @enemy_hand = enemy_hand
    @rank = 0
  end
  
  #ジャンケンの判断
  def janken_judge()
    if @my_hand + 1 == @enemy_hand || @my_hand - 2 == @enemy_hand
      puts "ジャンケン勝ち"
      @rank += 1
    else
      puts "ジャンケン負け"
      @rank -= 1
    end
  end
  
  #あっち向いてホイ判断
  def attimuite(my_dir,enemy_dir)
    if @rank > 0#ジャン勝ちのあっち向いて
      if my_dir == enemy_dir
        @rank += 1
      end
    else#ジャン負けのあっち向いて
      if my_dir == enemy_dir
        @rank -= 1
      end
    end
    
    if @rank == 2#決着
      return "true"
    elsif @rank == -2
      return "false"
    end
  end
end


janken_loop = "true"
vic_flag = ""#勝敗フラグ
aiko_flag = ""#あいこフラグ
hands = ["グー","チョキ","パー"]
directions = ["上","右","左","下"]

puts "ジャンケン..."

while janken_loop

  #ジャンケン
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  
  #自分の選択肢を代入
  get_my_hand = gets.to_i
  
  #3を押したら終了
  if get_my_hand == 3
    puts "ジャンケンを終了します"
    break
  end
  
  #範囲外の数字
  if get_my_hand >= 4
    puts "-----------"
    puts "0~3で入力してください"
    puts "ジャンケン..."
    next
  end

  #相手の選択ランダム０〜２
  get_enemy_hand = rand(0..2)
  
  if aiko_flag == "true"
    puts "ショ！"
    aiko_flag = ""
  else
    puts "ポイ！"
  end
  puts "-----------"
  puts "自分：#{hands[get_my_hand]}"
  puts "相手：#{hands[get_enemy_hand]}"
  puts "-----------"
  
  #あいこ
  if get_my_hand == get_enemy_hand
    puts "あいこで..."
    aiko_flag = "true"
    next
  end
  
  judge = Janken.new(get_my_hand,get_enemy_hand)
  judge.janken_judge()
  
  #あっち向いてホイ
  #0~3入力
  while janken_loop
    puts "あっち向いて..."
    puts "0(上)1(右)2(左)3(下)"
    get_my_atti = gets.to_i
    if get_my_atti >= 0 && get_my_atti <= 3 
      break
    end
    puts "-----------"
    puts "0~3で入力してください"
  end
  
  get_enemy_atti = rand(0..3)
  
  puts "ホイ！"
  puts "-----------"
  puts "自分：#{directions[get_my_atti]}"
  puts "相手：#{directions[get_enemy_atti]}"
  puts "-----------"
  
  vic_flag = judge.attimuite(get_my_atti,get_enemy_atti)
  
  #勝敗判断
  if vic_flag == "false"
    puts "あなたは負けました"
    break
  elsif vic_flag == "true"
    puts "あなたの勝ち！！！"
    break
  end
  
  puts "ジャンケン..."
  
end