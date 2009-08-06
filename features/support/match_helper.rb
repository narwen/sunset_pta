module MatchHelper
  def quoted_strings(string)
    string.scan(/"([^\"]*)"/).map(&:first)
  end
end

World(MatchHelper)
