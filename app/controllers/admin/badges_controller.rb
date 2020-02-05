class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[show edit update]
  before_action :find_badges, only: :index 

  def new
    @badge = Badge.new
  end

  def edit; end

  def show; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :image_name, :description, :status, :rule, :value, :first_attempt)
  end
end
