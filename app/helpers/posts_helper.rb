module PostsHelper
  require "uri"
  require "rack/utils"

  # URL -> YouTube動画IDに変換（youtu.be と youtube.com の両対応）
  def youtube_id_from(url)
    return if url.blank?
    uri = URI.parse(url) rescue nil
    return unless uri&.host

    if uri.host.include?("youtu.be")
      uri.path.delete_prefix("/")
    elsif uri.host.include?("youtube.com")
      Rack::Utils.parse_query(uri.query)["v"]
    end
  end

  # サムネURLを作る。:max が無い動画は onerror で :hq に自動フォールバックさせる想定
  def youtube_thumb_url(url, size: :hq)
    id = youtube_id_from(url)
    return unless id
    file = case size
           when :max then "maxresdefault.jpg"  # 1280x720（無いこともある）
           when :mq  then "mqdefault.jpg"      # 320x180
           else           "hqdefault.jpg"      # 480x360（無難）
           end
    "https://img.youtube.com/vi/#{id}/#{file}"
  end
end