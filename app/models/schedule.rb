class Schedule < ApplicationRecord
  validates :title, :start_time, :finish_time, presence:true
  validate :date_before_start

    def date_before_start
      if finish_time.present? && finish_time < Date.today
        errors.add(:finish_time, "は今日以降の日付で選択してください")
      elsif finish_time.present? && finish_time < start_time
        errors.add(:finish_time, "は開始日以降の日付で選択してください")
      end
    end

end
