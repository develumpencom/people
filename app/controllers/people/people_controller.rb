module People
  class PeopleController < ApplicationController
    before_action :set_person, only: %i[ show edit update destroy ]

    # GET /people
    def index
      @people = current_user.people.all
    end

    # GET /people/1
    def show
    end

    # GET /people/new
    def new
      @person = current_user.people.new
    end

    # GET /people/1/edit
    def edit
    end

    # POST /people
    def create
      @person = current_user.people.new(person_params)

      if @person.save
        redirect_to @person, notice: "Person was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /people/1
    def update
      if @person.update(person_params)
        redirect_to @person, notice: "Person was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /people/1
    def destroy
      @person.destroy!
      redirect_to people_path, notice: "Person was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        # puts "-" * 50
        # p params.expect(:id)
        # p current_user.people.pluck(:user_id)
        # p People::Person.all.pluck(:user_id)
        # puts "-" * 50
        @person = current_user.people.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def person_params
        params.expect(person: [ :name, :last_name ])
      end
  end
end
