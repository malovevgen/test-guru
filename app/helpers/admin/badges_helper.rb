module Admin::BadgesHelper
  def rules
    Badge::RULES.map { |rule | [t("badges.rules#{rule}"), rule]}
  end

  def badge_rules
    [
      [t("helpers.select.rules.category"), :category],
      [t("helpers.select.rules.level"), :level],
      [t("helpers.select.rules.first_attempt"), :first_attempt]
    ]
  end
end
