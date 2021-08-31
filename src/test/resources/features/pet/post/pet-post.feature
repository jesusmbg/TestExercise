Feature: POST PETS

  Background:
    * url BASE_URL

  Scenario: Add a new pet to the store
    Given path global.pet
    * def json = read('classpath:features/pet/post/pet.json')
    And request json
    When method post
    Then status 200
    * def expected = read('classpath:features/pet/get/pet.json')
    And match response == expected

    Given def petId = response.id
    And path global.pet + "/" + petId
    When method get
    Then status 200
