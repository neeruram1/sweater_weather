class ErrorSerializer
  def initialize(model, status)
    @model = model
    @status = status
  end

  def errors
    json = {}
    error_hash = @model.errors.to_hash(true).map do |_, values|
      values.map do |details|
        { status: @status, title: 'Unauthorized', detail: details }
      end
    end.flatten
    json[:errors] = error_hash
    json
  end

  def invalid_credentials
    json = {}
    json[:errors] = { status: @status, title: 'Unauthorized', detail: 'Invalid credentials' }
    json
  end
end
