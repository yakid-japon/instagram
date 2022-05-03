class PostMailer < ApplicationMailer
    def post_created
        @user = params[:user]
        @greeting = "Salut M/Mme"
    
        mail(
          from: "instagram@admin.com",
          to: @user.email,
          subject: "Nouvelle photo postée"
        ) 
    end
end
