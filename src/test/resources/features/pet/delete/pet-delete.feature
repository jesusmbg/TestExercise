Feature: DELETE PETS

  Background:
    * url BASE_URL

  Scenario: Deletes a Pet
    Given path global.pet
    * def json = read('classpath:features/pet/post/pet.json')
    And request json
    And method post
    And status 200
    * def petId = response.id
    And path global.pet + "/" + petId
    When method delete
    Then status 200

    Given path global.pet + "/" + petId
    When method get
    Then status 404

