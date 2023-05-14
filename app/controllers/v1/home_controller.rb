# frozen_string_literal: true

module V1
  class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only: [:dashboard]

    def healthz
      render json: { status: 'Up and Running!' }
    end

    def dashboard
    end
  end
end
