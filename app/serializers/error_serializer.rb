class ErrorSerializer
  def initialize(model, status)
    @model = model
    @status = status
  end

  def errors
    if no_details?
      { errors: errors_no_detail }
    else
      { errors: errors_with_detail }
    end
  end

  def no_details?
    @model.nil? || @model.errors.empty?
  end

  def errors_with_detail
    @model.errors.to_hash(true).map do |_, values|
      values.map do |details|
        {
          status: @status,
          title: 'Unauthorized',
          detail: details
        }
      end
    end.flatten
  end

  def errors_no_detail
    {
      status: @status,
      title: 'Unauthorized',
      detail: 'Invalid credentials'
    }
  end
end
