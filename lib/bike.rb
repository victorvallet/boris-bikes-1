class Bike

  attr_writer :broken

  def report_broken(is_the_bike_broken)
  	@broken = is_the_bike_broken
  end

  def broken?
  	@broken
  end


















  # ignore me
  def working?
    true
  end
end
