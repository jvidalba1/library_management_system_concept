class SearchBooks
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(value)
    return @initial_scope unless value.present?

    @value = value
    wheres.reduce(:or)
  end

  private

  def wheres
    @wheres ||= [
      @initial_scope.where("title ilike ?", trans_value),
      @initial_scope.where("author ilike ?", trans_value),
      @initial_scope.where("genre ilike ?", trans_value)
    ]
  end

  def trans_value
    "%#{@value}%"
  end
end
