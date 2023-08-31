Feature: Automatizar la página saucedemo
  
  Scenario: full script
  #Login
  * configure driver = {type: 'geckodriver', executable: 'C:\\browserdrivers\\geckodriver.exe'}
    Given driver 'https://www.saucedemo.com/'
    And driver.maximize()
    And input("//*[@id='user-name']","standard_user")
    And delay(2000)
    And input("//*[@id='password']","secret_sauce")
    When click("//*[@id='login-button']")
    
  #Add two products
    Then match driver.title == 'Swag Labs'
    And match driver.url == 'https://www.saucedemo.com/inventory.html'
    And delay(2000)
    When click("//*[@id='item_4_title_link']") 
    And delay(2000)
    When click("//*[@id='add-to-cart-sauce-labs-backpack']")
    And delay(1000)
    When click("//*[@id='back-to-products']") 
    And delay(2000)
    When click("//*[@id='item_3_title_link']")
    And delay(2000)
    When click("//*[@id='add-to-cart-test.allthethings()-t-shirt-(red)']")
    And delay(1000)
    When click("//*[@id='back-to-products']")
    And delay(2000)
    
    #View the cart
    When click("//*[@id='shopping_cart_container']")
    Given driver 'https://www.saucedemo.com/cart.html'
    And delay(2000)
    When click("//*[@id='checkout']")
    And delay(2000)
    
    #Complete the purchase form
    And input("//*[@id='first-name']","Zoyla")
    And delay(1000)
    And input("//*[@id='last-name']","Paucar")
    And delay(1000)
    And input("//*[@id='postal-code']","170809")
    And delay(1000)
    When click("//*[@id='postal-code']")
    And delay(2000)
    
    #Finalize the purchase until confirmation: “THANK YOU FOR YOUR ORDER”
    Given driver 'https://www.saucedemo.com/checkout-step-two.html'
    And delay(2000)
    When click("//*[@id='finish']")
    And delay(2000)
    
   #Certification message
   * print ('Parte del equipo de Control de Calidad, se Certifica para el pase a Producción.')
    And delay(2000)
     