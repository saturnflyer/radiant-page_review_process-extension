module PageReview
  def hidden?
    status == Status[:hidden]
  end
  def draft?
    status == (Status[:draft] || nil)
  end
  def reviewable?
    !published? && !hidden?
  end
  def savable_by_user?(user)
    user.admin? || user.publisher? || (user.writer? && draft?) || (user.reviewer? && reviewable?)
  end
end