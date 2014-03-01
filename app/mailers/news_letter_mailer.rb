class NewsLetterMailer < ActionMailer::Base
  default from: 'news-letter@valentin-rota.ch'

  def send_new_post (post, email)
    @post = post
    image = post.test_image.asset.portrait.current_path
    attachments.inline['image.jpg'] = File.read(image) unless image.blank?
    mail to: email, subject: 'Valentin Rota a publié un nouvel sur valentin-rota.ch'
  end
end
