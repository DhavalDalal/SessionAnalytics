
CREATE DATABASE sessionAnalytics;
  
USE sessionAnalytics;

CREATE TABLE sessions 
  (id INT(11), 
    delegateId INT(11), 
    isSpeaker CHAR(1), 
    rating INT(11), 
    createdOn TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);