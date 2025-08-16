require 'swagger_helper'

RSpec.describe 'api/v1/school_classes', type: :request do

  path '/api/v1/schools/{school_id}/classes/{class_id}/students' do
    # You'll want to customize the parameter types...
    parameter name: 'school_id', in: :path, type: :string, description: 'school_id'
    parameter name: 'class_id', in: :path, type: :string, description: 'class_id'

    get('students school_class') do
      response(200, 'successful') do
        let(:school_id) { '123' }
        let(:class_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
