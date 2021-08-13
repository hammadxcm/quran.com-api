# frozen_string_literal: true

# == Schema Information
#
# Table name: audio_segments
#
#  id                  :bigint           not null, primary key
#  duration            :integer
#  end_timestamp       :integer
#  percentile          :float
#  segments            :jsonb
#  start_timestamp     :integer
#  verse_key           :string
#  verse_number        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  audio_file_id       :bigint
#  chapter_id          :bigint
#  surah_recitation_id :bigint
#  verse_id            :bigint
#
# Indexes
#
#  index_audio_segments_on_audio_file_id        (audio_file_id)
#  index_audio_segments_on_chapter_id           (chapter_id)
#  index_audio_segments_on_surah_recitation_id  (surah_recitation_id)
#  index_audio_segments_on_verse_id             (verse_id)
#  index_on_audio_segments_chapter              (surah_recitation_id,chapter_id,verse_id,verse_number)
#  index_on_audio_segments_timing               (audio_file_id,start_timestamp,end_timestamp)
#
class Audio::Segment < ApplicationRecord
  belongs_to :verse
  belongs_to :chapter
  belongs_to :audio_recitation, class_name: 'Audio::Recitation'
  belongs_to :audio_file, class_name: 'Audio::ChapterAudioFile'
end