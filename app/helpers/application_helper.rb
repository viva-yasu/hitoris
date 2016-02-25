module ApplicationHelper
  def title_cut(a)
    if a.size > 12
      return a[0..11] + '...'
    end
    a
  end
end
