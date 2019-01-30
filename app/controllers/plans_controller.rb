class PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      redirect_to plans_path
    end
  end

  def bestplan

    @zinutes = params[:best][:zinutes]
    @pokalbiai = params[:best][:pokalbiai]
    @internetas = params[:best][:internetas]
    @kaina = params[:best][:kaina]

    @plans = Plan.all

    @paskaiciuoti_planai = []

    @plans.each do |x|
      s = Planas.new
      s.data = Math.sqrt(((@zinutes.to_f - x.zinutes.to_f) * (@zinutes.to_f - x.zinutes.to_f)) + ((@pokalbiai.to_f - x.pokalbiai.to_f) * (@pokalbiai.to_f - x.pokalbiai.to_f)) + ((@internetas.to_f - x.internetas.to_f) * (@internetas.to_f - x.internetas.to_f)) + ((@kaina.to_f - x.kaina.to_f) * (@kaina.to_f - x.kaina.to_f))).to_f
      s.id = x.id
      @paskaiciuoti_planai.push(s)
    end

    @paskaiciuoti_planai = @paskaiciuoti_planai.sort_by {|obj| obj.data}

    @planai = []


    @paskaiciuoti_planai.each do |y|
      @plans.each do |x|
        if y.id == x.id
          @planai.push(x)
        end
      end
    end
  end

  private
  def plan_params
    params.require(:plan).permit(:pavadinimas, :tinklas, :zinutes, :pokalbiai, :internetas, :kaina)
  end

end


class Planas
  attr_accessor :data, :id
end