class Calendar
  require 'date'
  require 'colorize'
  def initialize(start_day, end_day)
    @start_day =start_day
    @end_day   =end_day
    @num_days = @end_day.strftime('%-j').to_i - @start_day.strftime('%-j').to_i
    @cal
    @week
  end
  attr_accessor :start_day, :end_day, :num_days, :cal, :week

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  #makes the calendar entrys
  def createCalendar
    num_days = @num_days
    cal = []
    # add blank day for each day before days (except sunday)
    (0..@start_day.wday-1).each{cal << ["noDay", ""]}
    day = start_day

    (1..num_days+1).each{|i|
      cal << ["day", day, true]
      day= day + 1.days
    }
    # puts cal
    @cal = cal
  end

  def bookDays(bookedDays)
    puts "#{bookedDays[0].class}".green

    # bookedDays= bookedDays[0] if

    if bookedDays
      dates = @cal
      dates.each{|d|
        bookedDays.each{|b|
          if d[1] == b
             d[2] = false
          end
        }
      }
    end
    @cal = dates

  end

#for indivdual offer days
  def offerDay(offerDay)
    puts "#{offerDay.class}".green

    if offerDay
      dates = @cal
      dates.each{|d|
        if d[1] == offerDay
          d[2] = 2
        end
      }
    end
    @cal = dates

  end

  def displayCalendar
    divs = ""
    (@cal).each{|i|
      if i[2] == true
        divs +=   "<div class='" + "day'" +  "> <p> #{i[1].strftime('%-d')} </p></div>"
      elsif i[2] == false
        divs +=   "<div class='" + "bookedDay'" +  "> <p> #{i[1].strftime('%-d')} </p></div>"
      elsif i[2] == 2
        divs +=   "<div class='" + "yellow'" +  "> <p> #{i[1].strftime('%-d')} </p></div>"
      else
        divs +=   "<div class='" + "#{i[0]}'" +  "> </div>"
      end
      }
    divs
  end

  def displayWeek
    dates = @cal
    #count the number of days of week
    first = (@cal.count - @num_days)-1
    first = dates[first][1].to_datetime
    last = dates.last[1].to_datetime

    dates = dates[((@cal.count - @num_days)-1)..dates.length]
    #denominator
    fridays = 0
    saturdays = 0
    sunToThus = 0
    (first..last).to_a.select { |d| fridays +=1 if [5].include?(d.wday) }
     (first..last).to_a.select { |d| saturdays +=1 if [6].include?(d.wday) }
     (first..last).to_a.select { |d| sunToThus +=1 if [0,1,2,3,4].include?(d.wday) }
    total = fridays + saturdays + sunToThus

    #numerator
    bookedFridays   = 0
    bookedSaturdays = 0
    bookedSunToThus = 0
    dates.each{|d|
      if [0,1,2,3,4].include?(d[1].wday) && d[2] == false
        bookedSunToThus += 1
      elsif d[1].wday == 6 && d[2] == false
        bookedSaturdays += 1
      elsif d[1].wday == 5 && d[2] == false
        bookedFridays += 1
      end
    }
    # puts
    # puts "bookedFridays    | #{bookedFridays}"     + " fridays | #{fridays}"
    # puts "bookedSaturdays  | #{bookedSaturdays}" + " saturdays | #{saturdays}"
    # puts "bookedSunToThus  | #{bookedSunToThus}" + " sunToThus | #{sunToThus}"
    # puts " "*20 +"TOTAL  | #{total}"
    week = [(bookedSunToThus.to_f/sunToThus).round(2), (bookedFridays.to_f/fridays).round(2), (bookedSaturdays.to_f/saturdays).round(2)]
    text = ["sun to thu", "fri", "sat"]

    output = ""
    (0...3).each do |i|
      if week[i] < 0.35
        output += "<div class='" + "day'" +  ">  </div>"
        # print "#{text[i]} ".green
      elsif week[i] < 1
          output += "<div class='" + "yellow'" +  ">  </div>"
        # print "#{text[i]} ".yellow
      elsif week[i] == 1
          output += "<div class='" + "bookedDay'" +  ">  </div>"
        # print "#{text[i]} ".red
      else
          output += "<div class='" + "noDay'" +  "> </div>"
        # print "#{text[i]} ".blue
      end
    end
    #
    # puts "*"*12
    # puts week
    # print output

    @week = output
  end

end
