require 'grape-swagger'

class API < Grape::API
  prefix 'api'

  # global exception handler, used for error notifications
  rescue_from :all do |e|
    status = e.respond_to?(:status) ? e.status : 500
    if Rails.env.test? || Rails.env.development? || Rails.env.sandbox?
      json_error = {
        error: {
          code: status,
          error: "#{e.class} error",
          message: e.message,
          backtrace: e.backtrace
        }
      }
    else
      json_error = {
        error: {
          code: status,
          error: "#{e.class} error",
          message: e.message
        }
      }
    end

    Rack::Response.new(json_error.to_json, status, { 'Content-type' => 'application/json' }).finish
  end

  format :json
  mount IloanApi::V1::Base

  add_swagger_documentation api_version: 'v1',
                            specific_api_documentation: { desc: 'API swagger-compatible endpoint documentation.' },
                            hide_documentation_path: true,
                            hide_format: true,
                            markdown: GrapeSwagger::Markdown::RedcarpetAdapter.new
end
