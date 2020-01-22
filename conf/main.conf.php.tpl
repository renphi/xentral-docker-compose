<?php
    
//database connection
class Config {
    
  function __construct() 
  {
    include("user.inc.php");
    
    // define defaults
    $this->WFconf['defaultpage'] = 'adresse';
    $this->WFconf['defaultpageaction'] = 'list';
    $this->WFconf['defaulttheme'] = 'new';
    //$this->WFconf['defaulttheme'] = 'default_redesign';
    $this->WFconf['defaultgroup'] = 'web';
    
    // allow that cols where dynamically added so structure
    $this->WFconf['autoDBupgrade']=true;
    
    // time how long a user can be connected in seconds genau 8 stunden
    $this->WFconf['logintimeout'] = 3600 * 4;
  }
}
?>
