class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[show edit update]
  before_action :find_badges, only: :index 

  def edit; end

  def show; end

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
    params.require(:badge).permit(:status)
  end
end
