Feature: PingPong
    Send Data and Receive

    Scenario: PingPong1
        Given Start ejdb
        When Send "Something"
        Then Receive "Something"
        Given Stop ejdb
    Scenario: PingPong2
        Given Start ejdb
        When Send "Another"
        Then Receive "Another"
        Given Stop ejdb
