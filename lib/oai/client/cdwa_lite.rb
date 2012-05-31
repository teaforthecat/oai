require 'uri'

class CdwaLite
  attr_accessor :element
  attr_accessor :title, :creator, :date, :materials, :description,
                :subject, :classification, :image, :related, :url

  def initialize(element)
    @element = element
    create_from_paths
  end

  def xpath(path)
    REXML::XPath.match(self.element, path)
  end

  def create_from_paths
    @title = xpath('cdwalite:cdwalite/cdwalite:titleWrap/cdwalite:titleSet/cdwalite:title[@cdwalite:pref="preferred"]/text()')
    @creator = xpath('cdwalite:cdwalite/cdwalite:displayCreator/text()')
    @date = xpath('cdwalite:cdwalite/cdwalite:indexingDatesWrap/cdwalite:indexingDatesSet/cdwalite:earliestDate/text()')
    @materials = xpath('cdwalite:cdwalite/cdwalite:displayMaterialsTech/text()')
    @description = xpath('cdwalite:cdwalite/cdwalite:descriptiveNoteWrap/cdwalite:descriptiveNoteSet/cdwalite:descriptiveNote/text()')
    @subject = xpath('cdwalite:cdwalite/cdwalite:indexingSubjectWrap/cdwalite:indexingSubjectSet/cdwalite:subjectTerm[@cdwalite:termsource="WAC"]/text()')
    @classification = xpath('cdwalite:cdwalite/cdwalite:classificationWrap/cdwalite:classification[@cdwalite:termsource="WAC"]/text()')
    @image = xpath('cdwalite:cdwalite/cdwalite:resourceWrap/cdwalite:resourceSet/cdwalite:resourceType[contains(text(), "Digital Image")]/../cdwalite:linkResource/text()')
    @related = xpath('cdwalite:cdwalite/cdwalite:resourceWrap/cdwalite:resourceSet/cdwalite:resourceType[contains(text(), "text")]/../cdwalite:resourceID/text()')
    @url = xpath('cdwalite:cdwalite/cdwalite:recordWrap/cdwalite:recordInfoWrap/cdwalite:recordInfoLink/text()')
    @url = URI.escape(@url)
    @image = URI.escape(@image)
    self
  end

  def as_hash
    hash = {}
    attrs = instance_variables
    attrs.delete(:@element)
    attrs.each do |var|
      key = var.to_s.gsub("@", "")
      hash = hash.merge({key => cast(send(key))})
    end
    hash
  end

  # gets rid of REXML::Text objects
  def cast value
    if value.kind_of?(Array)
      value.collect{|item| item.to_s }
    else
      value.to_s
    end
  end
end
