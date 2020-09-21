class ErrorSerializer
  def initialize(model)
    @model = model
  end

  def bad_request
    {
      errors: [
        status: 400,
        title: "Bad Request",
        detail: @model.errors.full_messages.join
      ]
    }
  end
end
