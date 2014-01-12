class HomeController < ApplicationController

  require  'faker'

  def index

    array = Faker::Lorem.sentence(100).split(" ")

    p array.to_s

    p "empieza..."
    i=1
    a=Time.now
    @total= 500000

    @total.times do |t|
      #puts i.to_s
      $redis.set(i.to_s, array.shuffle().join(" "))
      i= i + 1
    end

    @b = Time.now - a
    #al azar dame 5
    @cadena1= []
    10.times do |f|
      @cadena1 << $redis.get(rand(1..@total).to_s)
    end


  end
end
