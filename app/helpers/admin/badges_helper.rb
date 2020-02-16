module Admin::BadgesHelper
  def rules
    BadgeService::RULES.map { |rule | [t("badges.rules.#{rule}"), rule] }
  end
end
