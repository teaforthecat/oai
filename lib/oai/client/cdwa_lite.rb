class CdwaLite
  include OAI::XPath
  attr_accessor :title, :creator, :date, :materials, :description, 
  :classification, :image, :related, :url

  def initialize(element)
    debugger
    @title = xpath(element,
                   'cdwalite:cdwalite/cdwalite:titleWrap/cdwalite:titleSet/cdwalite:title[@cdwalite:pref="preferred"]/text()')
    @creator = xpath(element, 
                     'cdwalite:cdwalite/cdwalite:displayCreator/text()')
    @date = xpath(element, 
                  'cdwalite:cdwalite/cdwalite:indexingDatesWrap/cdwalite:indexingDatesSet/cdwalite:earliestDate/text()')
    @materials = xpath(element, 
                       'cdwalite:cdwalite/cdwalite:displayMaterialsTech/text()')
    @description = xpath(element, 
                         'cdwalite:cdwalite/cdwalite:descriptiveNoteWrap/cdwalite:descriptiveNoteSet/cdwalite:descriptiveNote/text()')
    @subject = xpath(element, 
                     'cdwalite:cdwalite/cdwalite:indexingSubjectWrap/cdwalite:indexingSubjectSet/cdwalite:subjectTerm[@cdwalite:termsource="WAC"]/text()')
    @classification = xpath(element, 
                            'cdwalite:cdwalite/cdwalite:classificationWrap/cdwalite:classification[@cdwalite:termsource="WAC"]/text()')
    @image = xpath(element,
                   'cdwalite:cdwalite/cdwalite:resourceWrap/cdwalite:resourceSet/cdwalite:resourceType[contains(text(), "Digital Image")]/../cdwalite:linkResource/text()')
    @related = xpath(element, 
                     'cdwalite:cdwalite/cdwalite:resourceWrap/cdwalite:resourceSet/cdwalite:resourceType[contains(text(), "text")]/../cdwalite:resourceID/text()')
    @url = xpath(element, 
                 'cdwalite:cdwalite/cdwalite:recordWrap/cdwalite:recordInfoWrap/cdwalite:recordInfoLink/text()')
  end

  def deleted?
    return false
  end

end
