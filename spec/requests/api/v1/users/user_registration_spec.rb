require 'rails_helper'
describe "User registration" do
  it "Creates a new user", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    expect(response).to be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('user')
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:attributes][:email]).to eq(body[:email])
    expect(user[:data][:attributes]).to have_key(:api_key)
  end

  it "Sends back an error message if password doesn't match password confirmation", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'bananastand'
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful

    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Password confirmation doesn't match Password")
  end

  it "Sends back an error message if email has been taken", :vcr do
    User.create(email: 'michael@bluthco.org', password: 'password', password_confirmation: 'password' )

    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Email has already been taken")
  end

  it "Sends back an error message if email is empty", :vcr do
    body = {
      email: '',
      password: 'banana',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Email can't be blank")
  end

  it "Sends back an error message if password is empty", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: '',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Password can't be blank")
  end

  it "Sends back an error message if password confirmation is empty", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: ''
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Password confirmation doesn't match Password")
  end

  it "Can send back multiple error messages", :vcr do
    body = {
      email: '',
      password: 'banana',
      password_confirmation: ''
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][:code]).to eq(401)
    expect(user[:errors][:title]).to eq('Unauthorized')
    expect(user[:errors][:detail]).to eq("Email can't be blank, Password confirmation doesn't match Password")
  end
end
