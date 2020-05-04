class Api::V1::ZodiacMatchesController < ApplicationController
    def index 
        @zodiac_matches= ZodiacMatch.all 
        render json: @zodiac_matches
    end

    def show
        match= ZodiacMatch.find_by(match_id: params[:id])
        render json: match
    end

    def create
        zodiacMatch =ZodiacMatch.create(zodiacMatch_params)
        render json: zodiacMatch
    end

end
private
def zodiacMatch_params
    params.require(:zodiacMatch).permit(:zodiac_one, :zodiac_two, :pro, :con, :maximize, :match_id,:description,:comp_rating,:sex_rating,:communication_rating,:rate )
end
