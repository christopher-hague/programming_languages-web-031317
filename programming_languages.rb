languages = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
    }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }

  }
}

# - the first level will be programming languages (ruby, js)
# - second lvl contains the keys :type, which holds a string value, as
#   well as :style, which contains an array of symbols corresponding to
#   each languages style

# iterate over the first level of languages hash (:oo or :functional)
  # iterate over the second level of languages hash (:ruby, :js, :python)

  def reformat_languages(languages)
    new_hash = {}

    languages.each do |oo_or_functional, language_hash|
      language_hash.each do |language, attribute_hash|
        attribute_hash.each do |attribute, str_val|
          if new_hash[language].nil?
            new_hash[language] = {}
          end

          new_hash[language][:style] ||= []
          new_hash[language][:style] << oo_or_functional
          if new_hash[language][attribute].nil?
            new_hash[language][attribute] = str_val
          end
        end
      end
    end

    new_hash
  end


# new_hash[language] = {type:  lang_info, style: oo_or_functional}
