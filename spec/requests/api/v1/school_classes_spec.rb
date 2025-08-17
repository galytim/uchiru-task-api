require 'swagger_helper'

RSpec.describe 'api/v1/school_classes', type: :request do
  path '/schools/{school_id}/classes/{class_id}/students' do
    parameter name: :school_id, in: :path, type: :integer
    parameter name: :class_id, in: :path, type: :integer

    get('Список студентов') do
      tags 'students', 'classes'
      produces 'application/json'

      response(200, 'Список студентов') do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: { '$ref' => '#/components/schemas/Student' }
                 }
               }

        let(:school) { School.create!(name: 'Test School') }
        let(:school_class) { school.school_classes.create!(number: 1, letter: 'A') }
        let(:school_id) { school.id }
        let(:class_id) { school_class.id }
        let!(:student) { school_class.students.create!(first_name: 'John', last_name: 'Doe', surname: 'Smith', school:) }

        run_test!
      end
    end
  end
end
