class Calendar
  require 'date'
  require 'colorize'
  def initialize()

  end
  attr_accessor

  def self.all
    ObjectSpace.each_object(self).to_a
  end


  def calendar(start_day, end_day)
    days = end_day.strftime('%-j').to_i - start_day.strftime('%-j').to_i
    # daysOfWeek = ['m','t','w','t','f','s','s']
    cal = []
    # add blank day for each day before days (except monday)
    (0..start_day.wday-1).each{cal << ["noDay", ""]}
    day = start_day

    (1..days+1).each{|i|
      cal << ["day", "#{day.strftime('%d')}", true]
      day= day + 1.days
    }
    # puts cal
    cal
  end

end
