class Repo
  attr_reader :name, :private

  def initialize(data)
    @name = data[:name]
    @private = data[:private]
  end
end
