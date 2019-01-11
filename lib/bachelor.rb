require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestants|
    if contestants.value?("Winner")
      return contestants["name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant.value?(occupation)
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  ok = 0
  data.each do |season, contestants|
    ok += contestants.count {|contestant| contestant.value?(hometown)}
  end
  ok
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant.value?(hometown)
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages_total = 0 
  contestants_total = 0
  data[season].each do |contestants|
    ages_total += contestants["age"].to_i
  end
  contestants_total = data[season].length + 1
  ages_total%contestants_total
end



