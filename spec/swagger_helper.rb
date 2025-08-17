require 'rails_helper'

RSpec.configure do |config|
  config.openapi_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.3',
      info: { title: 'API V1', version: 'v1' },
      paths: {},
      servers: [ { url: 'http://localhost:3000/api/v1' } ],
      components: {
        securitySchemes: {
          bearerAuth: {
            type: :http,
            scheme: :bearer,
            description: 'Ожидается токен, выдаваемый при регистрации студента',
            bearerFormat: 'SHA256'
          }
        },
        parameters: {
          school_id: {
            name: 'school_id',
            in: :path,
            required: true,
            schema: {
              type: :integer,
              format: :int32
            }
          },
          class_id: {
            name: 'class_id',
            in: :path,
            required: true,
            description: 'id класса',
            schema: {
              type: :integer,
              format: :int32
            }
          }
        },
        schemas: {
          Student: {
            type: :object,
            required: %w[id first_name last_name surname class_id school_id],
            properties: {
              id: { type: :integer, format: :int64, example: 10, readOnly: true },
              first_name: { type: :string, example: 'Вячеслав' },
              last_name: { type: :string, example: 'Абдурахмангаджиевич' },
              surname: { type: :string, example: 'Мухобойников-Сыркин' },
              class_id: { type: :integer, format: :int32 },
              school_id: { type: :integer, format: :int32 }
            }
          },
          Class: {
            type: :object,
            required: %w[id number letter students_count],
            properties: {
              id: { type: :integer, format: :int32, example: 10, readOnly: true },
              number: { type: :integer, format: :int32, example: 1, description: 'Цифра класса' },
              letter: { type: :string, example: 'Б', description: 'Буква класса' },
              students_count: { type: :integer, format: :int32, example: 32, readOnly: true, description: 'Количество учеников в классе' }
            }
          }
        }
      }
    }
  }
  config.openapi_format = :yaml
end
