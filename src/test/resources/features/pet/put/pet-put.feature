Feature: POST PETS

  Background:
    * url BASE_URL

  Scenario: Update an existing Pet
    Given path global.pet
    * def json = read('classpath:features/pet/post/pet.json')
    And request json
    And method post
    And status 200
    * def petId = response.id
    * copy json_put = json
    * set json_put.id = petId
    * set json_put.status = "sold"
    And path global.pet
    And request json_put
    When method put
    Then status 200

    Given path global.pet + "/" + petId
    When method get
    Then status 200
    And match response.status == "sold"
