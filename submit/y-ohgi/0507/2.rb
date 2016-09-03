# coding: utf-8
# 2. 0年〜2014年までの閏年を全て表示させよ
# 　※別クラス内にメソッドを作成しコールする事

# 閏年条件
# •4の倍数であれば閏年
# •ただし、100の倍数でもある場合、
# •400の倍数でもあるならば閏年

def judgeLeapyears(years)
  years.each do |year|
    if year % 400 === 0
      p year
    elsif year % 100 === 0
      next
    elsif year % 4 === 0
      p year
    end
  end
end

range = 0..2014

judgeLeapyears(range)

