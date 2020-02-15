module Admin::BadgesHelper
  def rules
    Badge::RULES.map { |rule | [t("badges.rules#{rule}"), rule] }
  end
end
