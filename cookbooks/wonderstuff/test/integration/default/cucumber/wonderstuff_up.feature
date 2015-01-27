Feature: Potential customer can read about services
 
  In order to generate more leads for my business
  As a business owner
  I want web users to be able to read about my services
 
 
  Scenario: User visits home page
    Given the url of Wonderstuff's home page
    When a web user browses to the URL
    Then the connection should be successful
    Then the page status should be OK
    Then the user should see "Wonderstuff Design is a boutique graphics design agency."
