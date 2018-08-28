import ModioWrapper;

class Ex02_BrowseMods
{
  static function main()
  {
    var finished = false;

    var wait = function()
    {
      while (finished == false)
      {
        ModioWrapper.process();
        Sys.sleep(.017);
      }
    }

    var finish = function()
    {
      finished = true;
    }

    ModioWrapper.init(ModioWrapper.MODIO_ENVIRONMENT_TEST, 7, "e91c01b8882f4affeddd56c96111977b");

    // Before requesting mods, let's define the query filters
    // Other sorting types available are: MODIO_SORT_BY_ID, MODIO_SORT_BY_DATE_LIVE and MODIO_SORT_BY_DATE_UPDATED
    var sorting_type = ModioWrapper.MODIO_SORT_BY_RATING;
    var mods_per_page = 4;
    var page = 0;
    ModioWrapper.getAllMods(ModioWrapper.MODIO_SORT_BY_RATING, mods_per_page, page * mods_per_page, function(mods:Array<Dynamic>, response_code:Int)
    {
      trace("Response code: " + response_code);
      if(response_code == 200)
      {
        for (i in 0...mods_per_page)
        {
          trace("Id: " + mods[i].id);
          trace("Name: " + mods[i].name);
          trace("Description: " + mods[i].description_plaintext + "\n");
        }
        finish();
      }
    });
    
    wait();
  }
}