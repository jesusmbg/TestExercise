Feature: GET PETS

  Background:
    * url BASE_URL

  Scenario: Get available pets
    Given path global.pet + "/findByStatus"
    And param status = "available"
    When method get
    Then status 200
    * def expected = read('classpath:features/pet/get/pet.json')
    And match response == '#[_ > 0]'
    And match each response[*] == expected
    And match each response[*].category == {"id": "#number", "name": "#string"}
    And match each response[*].photoUrls[*] == "#string"
    And match each response[*].tags[*] == {"id": "#number", "name": "#string"}