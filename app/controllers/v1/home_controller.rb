# frozen_string_literal: true

module V1
  class HomeController < ApplicationController
    def healthz
      render json: { status: 'Up and Running!' }
    end
  end
end
