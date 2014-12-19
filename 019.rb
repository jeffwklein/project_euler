# count sundays from 1901-2000
# sunday-saturday correlates to 0-6 in weekday variable
day = 1; month = 1; year = 1900; weekday = 1; count = 0;
while year < 2001
  if day == 1 && weekday == 0 && year > 1900
    count+=1
  end
  if month == 2
    if year%4 == 0
      if day == 29
        day = 1
        month+=1
      else
        day+=1
      end
    else
      if day == 28
        day = 1
        month+=1
      else
        day+=1
      end
    end
  elsif month == 9 || month == 4 || month == 6 || month == 11
    if day == 30
      day = 1
      month+=1
    else
      day+=1
    end
  elsif month == 12
    if day == 31
      day = 1
      month = 1
      year+=1
    else
      day+=1
    end
  else
    if day == 31
      day = 1
      month+=1
    else
      day+=1
    end
  end
  weekday+=1
  if weekday == 7
    weekday = 0
  end
end
puts count
