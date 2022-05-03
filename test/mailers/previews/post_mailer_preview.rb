# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview
    def post_created
        PostMailer.with(user: User.first).post_created
    end
end
