require 'rails/generators'

module Conductor
  class ScaffoldsController < ApplicationController
    def new
    end
  
    def create
      # TODO: Change to use the proper ScaffoldGenerator instead of this CLI hack job
      Rails::Generators.invoke("scaffold", generator_arguments, :behavior => :invoke, :destination_root => Rails.root)
      redirect_to(new_conductor_scaffold_url)
    end
  
  
    private
      def generator_arguments
        array = Array.new
        array << params[:scaffold][:name]
        array << "--skip-timestamps" if params[:scaffold][:skip_timestamps] == "1"
        array << "--skip-migration" if params[:scaffold][:skip_migration] == "1"
        array << params[:scaffold][:fields].select { |f| f[:name].blank? }.collect { |f| "#{f[:name]}:#{f[:type]}" }
      end
  end
end