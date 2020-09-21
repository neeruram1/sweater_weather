class ErrorSerializer
  def initialize(model, status)
    @model = model
    @status = status
  end

  def errors
    json = {}
      error_hash = @model.errors.to_hash(true).map do |__, values|
        values.map do |details|
          { status: @status, title: "Bad Request", detail: details }
        end
      end.flatten
      json[:errors] = error_hash
    json
  end
end
