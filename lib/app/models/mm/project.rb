module Mm
  class Project < OrmLookAlike
    def self.create!(name:, type_code:, ccn:)
      response = MovinmotionApi.write_project(name: name, type_code: type_code, idcc_number: ccn.idcc_number)
      return unless response.success?

      new_project_id = response.data.dig('content', 'projectId')
    end
  end
end

  # PROJECT: {
  #   TYPE: {
  #     CAPTATION : 1,
  #     CLIP : 2,
  #     CONCERT : 3,
  #     COURT_METRAGE : 4,
  #     DOCUMENTAIRE : 5,
  #     EMISSION_TV : 6,
  #     EMISSION_RADIO : 7,
  #     FESTIVAL : 8,
  #     FILM_INSTITUTIONNEL : 9,
  #     HABILLAGE_TV : 10,
  #     LONG_METRAGE : 11,
  #     NEWS : 12,
  #     PERFORMANCE_ARTISTIQUE : 13,
  #     PROGRAMME_SPORTIF : 14,
  #     PUBLICITE : 15,
  #     REPORTAGE : 16,
  #     REPRESENTATION_THEATRALE : 17,
  #     SERIE : 18,
  #     SPECTACLE_CIRQUE : 19,
  #     SPECTACLE_DANSE : 20,
  #     SPECTACLE_MULTIDISCIPLINAIRE : 21,
  #     AUTRE : 22,
  #     ENREGISTREMENT_SONORE : 23,
  #     MIXAGE_AUDIO : 24,
  #     CEREMONIE : 25,
  #     PLATEAU : 26,
  #     OFFICE_RELIGIEUX : 27,
  #     REPORTAGE_PLATEAU : 28,
  #     REPORTAGE_MAGAZINE : 29,
  #     JEUX_VIDEO : 30,
  #     SPECTACLE_PYROTECHNIQUE : 31,
  #     SOIREE_EVENEMENTIELLE : 32,
  #     CONVENTION : 33,
  #     SEMINAIRE : 34,
  #     PHONOGRAMME : 35,
  #     VIDEOGRAMME : 36,
  #     SPECTACLE_VIVANT_PROMOTIONNEL : 37,
  #     SPECTACLE_CABARET : 38,
  #     EVENEMENT : 39,
  #     ACCUEIL_DE_SPECTACLE : 40,
  #     SPECTACLE_HUMOUR : 41,
  #     COMEDIE_MUSICALE : 42,
  #     FICTION_UNITAIRE : 43,
  #     SPECTACLE : 44,
  #     REPETITION : 45,
  #     PETITE_SALLE_OU_PREMIERE_PARTIE : 46
  #   }
