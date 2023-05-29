#ifndef _INITREADER_H_
#define _INITREADER_H_

#include <string>
#include <map>
#include <vector>
#include <xqilla/xqilla-simple.hpp>


/**
 *  This library parses xml-style init files
 **/



class InitReader
{
 private:
  XQilla xqilla;
  XQQuery *querynr;
  XQQuery *querydate;
  DynamicContext *context;
  XercesConfiguration xc;
 public:
  InitReader(std::string filename,std::string date,int runnr); // Read XML-file named filename 
  ~InitReader();
  
  struct config_strings {
    std::string method;
    std::string parameter;
  };
  typedef std::vector<config_strings> config_string_vector;
  
  config_string_vector getConfig(std::string name); // Return config strings for 

};



#endif 
