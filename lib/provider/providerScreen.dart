
import 'package:flutter/material.dart';
import 'package:smr/model/merit_list.dart';
import 'package:smr/model/recommed_model.dart';


class GernalCalculation with ChangeNotifier {

  String bisepurl = 'https://www.bisep.edu.pk/';
  String edwardsCollegeurl = 'https://edwardes.edu.pk/Home';
  String govtCollegeurl = 'https://gcp.kp.gov.pk/';
  String hadafCollegeurl = 'https://hadaf.edu.pk/';
  String islamiaCollegeurl = 'https://www.icp.edu.pk/';
  String peshawardegreeCollegeboysurl = 'http://www.pmdc.edu.pk/';
  String peshawardegreeCollegegirlsurl = 'http://www.pmdc.edu.pk/';
  String icmsCollegeurl = 'https://icms.edu.pk/';
  String leedsCollegeurl = 'http://leeds.edu.pk/';
  String globleCollegeurl = 'http://college.globalgroup.edu.pk/';
  String brillientCollegeurl = 'https://topschools.pk/university/brilliant-college-of-science-dalazak-road-campus-peshawar/16417';
  String quidazamCollegeurl = 'https://www.ilmkidunya.com/colleges/quaid-e-azam-degree-college-peshawar-fee-structure.aspx';
  String fazaiaclgurl = 'https://fazaia.edu.pk/fazaiadegreecollegepeshawar/home';
  String cdc = "https://www.capital.edu.pk/";
  String NWI = "https://www.nwihs.edu.pk/";
  String MC = "https://www.themuslim.edu.pk/";
  String GFC = "https://www.facebook.com/Govt-Frontier-College-For-Women-Peshawar-645781155791863/";
//String GCP = "https://gandhara.edu.pk/GCP/index.html";
  String PES = "https://pimspsh.edu.pk/";
  String NES = "https://www.niceeducationsystem.edu.pk/";
  String GIM = "https://www.kmu.edu.pk/ghazali-institute-medical-sciences-peshawar";
  String PCM = "https://pcms.edu.pk/";
  String PIM = "https://www.pimmspesh.edu.pk/";
  String HIM = "https://www.hims.edu.pk/";
  String PEFC = "https://pefcollege.edu.pk/";
  String RIMS = "https://rims.edu.pk/";
  String BPG = "https://brains.edu.pk/";
  String FHM = "https://fhmc.edu.pk/";
  String BCSP = "https://bcsp.edu.pk/";
  String RNC = "https://rnc.prime.edu.pk/";
  String ICHS = "https://ichs.edu.pk/";

  List<MeritListModel> meritlist= [];
  List<RecommendModel> collageListTop900= [RecommendModel('https://www.icp.edu.pk/','islamiaclg.jpg','Islamia College Peshawar' ),RecommendModel('https://fazaia.edu.pk/fazaiadegreecollegepeshawar/home','fazaiaclg.jpg','Govt frontier collage for women peshawar'),RecommendModel('https://edwardes.edu.pk/Home','edward college.png','Edwardes College Peshawar'),RecommendModel('https://rims.edu.pk/','pmdcGirl.jpg','Peshawar Model Collage'),
    RecommendModel('https://www.facebook.com/acwpeshawar/','GFC.jpg','Gov,Superior Science Collage Peshawar'),RecommendModel('https://www.hims.edu.pk/','hadaf.png','Hadaf Collage Peshawar'),RecommendModel('https://www.nwihs.edu.pk/','GIM.jpg','Gov,Girls Degree Collage'),RecommendModel('https://pimspsh.edu.pk/','pmdcGirl.jpg','Peshawar Model Degree Collage'),RecommendModel('https://www.aimmspsh.edu.pk/','FHM.png','Jinnah Collage'),RecommendModel('https://www.islamiadegreecollege.com/','cdc.jpg','Collage of Home Economics'),];
  List<RecommendModel> collageListTop800= [RecommendModel('https://edwardes.edu.pk/Home','edward college.png','Edwardes College Peshawar'),RecommendModel('https://rims.edu.pk/','pmdcGirl.jpg','Peshawar Model Collage'),
    RecommendModel('https://www.facebook.com/acwpeshawar/','GFC.jpg','Gov,Superior Science Collage Peshawar'),RecommendModel('https://www.hims.edu.pk/','hadaf.png','Hadaf Collage Peshawar'),RecommendModel('https://www.nwihs.edu.pk/','GIM.jpg','Gov,Girls Degree Collage'),RecommendModel('https://pimspsh.edu.pk/','pmdcGirl.jpg','Peshawar Model Degree Collage'),RecommendModel('https://www.aimmspsh.edu.pk/','FHM.png','Jinnah Collage'),RecommendModel('https://www.islamiadegreecollege.com/','cdc.jpg','Collage of Home Economics'),];
  List<RecommendModel> collageListTop700= [RecommendModel('https://icms.edu.pk/','icms.jpg','ICMS collage peshawar' ),RecommendModel('https://fazaia.edu.pk/fazaiadegreecollegepeshawar/home','fazaiaclg.jpg','fazaia degree college peshawar')];



  List<RecommendModel>? recommendCollege(int obtainMarks) {
    if (obtainMarks >= 900 && obtainMarks < 1100) {
      notifyListeners();
      return collageListTop900;
    }
    if (obtainMarks >= 800  && obtainMarks < 899) {
      notifyListeners();
      return collageListTop800;
    }
    if (obtainMarks >= 700  && obtainMarks < 799 ) {
      notifyListeners();
      return collageListTop700;
    } else {
      notifyListeners();
      return null;
    }
  }
    void setMeritList(MeritListModel meritListModel){
      meritlist.add(meritListModel);
    }

  }


