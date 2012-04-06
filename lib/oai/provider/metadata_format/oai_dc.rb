module OAI::Provider::Metadata
  # = OAI::Metadata::DublinCore
  # 
  # Simple implementation of the Dublin Core metadata format.
  class DublinCore < Format
    
    def initialize
      @prefix = 'oai_dc'
      @schema = 'http://www.openarchives.org/OAI/2.0/oai_dc.xsd'
      @namespace = 'http://www.openarchives.org/OAI/2.0/oai_dc/'
      @element_namespace = 'dc'
      @fields = [ :title, :creator, :subject, :description, :publisher,
                  :contributor, :date, :type, :format, :identifier,
                  :source, :language, :relation, :coverage, :rights]
    end

    def header_specification
      {
        'xmlns:oai_dc' => "http://www.openarchives.org/OAI/2.0/oai_dc/",
        'xmlns:dc' => "http://purl.org/dc/elements/1.1/",
        'xmlns:xsi' => "http://www.w3.org/2001/XMLSchema-instance",
        'xsi:schemaLocation' => 
          %{http://www.openarchives.org/OAI/2.0/oai_dc/ 
            http://www.openarchives.org/OAI/2.0/oai_dc.xsd}            
      }
    end

  end

 class CdwaLite < Format
   def initialize
     @prefix = 'cdwalite'
     @schema = 'http://www.getty.edu/CDWA/CDWALite/CDWALite-xsd-draft-009c2.xsd'
     @namespace = 'http://www.getty.edu/CDWA/CDWALite'
     @element_ns = 'cdwalite'
     @fields = [] # using to_cdwalite in model
   end

   def header_specification(xml)
     {
      'xmlns:cdwalite' => "http://www.getty.edu/CDWA/CDWALite",
      'xmlns:xsi' => "http://www.w3.org/2001/XMLSchema-instance",
      'xsi:schemaLocation' => 
        %{http://www.getty.edu/CDWA/CDWALite 
          http://www.getty.edu/CDWA/CDWALite/CDWALite-xsd-draft-009c2.xsd} 
     }
   end
 end
end
