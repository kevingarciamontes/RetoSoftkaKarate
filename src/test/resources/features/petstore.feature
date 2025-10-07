Feature: pet store API

  Background:
    # Definir la URL base de la API
    #* url 'https://petstore.swagger.io/v2/'
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear un usuario
    # Given path '/pet/addPet'
    Given path '/pet'
    And request  {"id":0,"category":{"id":0,"name":"string"},"name":"doggie","photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}
    When method post
    Then status 200
    * def usuarioId = response.id

  # Scenario: Buscar el usuario creado
    Given path '/pet', usuarioId
    When method get
    Then status 200
    And match response.name == 'doggie'


#  Scenario: Actualizar el nombre y correo del usuario
    Given path '/pet'
    And request {"id":#(usuarioId),"category":{"id":0,"name":"string"},"name":"puppy","photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}
    When method put
    Then status 200
    And match response.name == 'puppy'



# Esperar hasta que la actualización sea visible
    * def maxAttempts = 5
    * def delay = 1000
    * retry until response.name == 'puppy'

  #Scenario: Buscar el usuario actualizado
    Given path '/pet', usuarioId
    When method get
    Then status 200
    And match response.name == 'puppy'


  #Scenario: Eliminar el usuario
    Given path '/pet', usuarioId
    When method delete
    Then status 200
    * print response
    * def usuarioIdStr = usuarioId + ''
    And match response == { code: 200, type: "unknown", message: "#(usuarioIdStr)" }


