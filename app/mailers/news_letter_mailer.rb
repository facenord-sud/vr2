class NewsLetterMailer < ActionMailer::Base
  default from: 'news-letter@valentin-rota.ch'

  def send_new_post (post, email)
    @post = post
    attachments.inline['image.jpg'] = File.read(post.test_image.asset.portrait.current_path)
    mail to: email, subject: 'Valentin Rota a publié un nouvel sur valentin-rota.ch'
  end
end
