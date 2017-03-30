module DoctorsHelper

  #Displays profile image (global avatar)
  def gravatar_for(doctor, size:80)
    gravatar_id = Digest::MD5::hexdigest(doctor.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: doctor.fname, class: "gravatar")
  end

end
