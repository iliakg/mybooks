module ApplicationHelper

  def vim(characters_count)
    (characters_count.to_f / Book::VIM).round(2)
  end
end
