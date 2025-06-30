import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'home_screen.dart';  // Import your homepage

class FormulationPage extends StatefulWidget {
  @override
  _FormulationPageState createState() => _FormulationPageState();
}

class _FormulationPageState extends State<FormulationPage> {
  // Dropdown values for classes and formulations
  String? _selectedClass;
  String? _selectedFormulation;
  String? _selectedUnit;
  double? _quantity;

  // Flag to check if Calculate button is pressed
  bool isCalculated = false;

  // Formulation data
  final Map<String, List<Map<String, String>>> _formulations = {

    'Asava and Arista': [
    // Abhayarista
    {'formulation': 'Abhayarista', 'ingredient': 'Abhaya (Haritaki)', 'quantity': '4800 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Mrdvika (Draksa)', 'quantity': '2400 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Vidanga', 'quantity': '480 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Madhuka Kusuma', 'quantity': '480 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Guda', 'quantity': '4800 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Svadamstra (Goksura)', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Trivrta (Trivrt)', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Dhanya (Dhanyaka)', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Dhataki', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Indravaruni', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Cavya', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Madhurika (Misreya)', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Sunthi', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Danti', 'quantity': '96 g'},
    {'formulation': 'Abhayarista', 'ingredient': 'Mocarasa (Salmali)', 'quantity': '96 g'},

    //Amrtarista
  
    {'formulation': 'Amrtarista', 'ingredient': 'Amrta(Guduci)', 'quantity': '4800 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Bilva', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Syonaka', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Gambhari', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Patala', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Agnimantha', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Salaparni', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Prsniparni', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Brhati', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Kantakari', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Goksura', 'quantity': '480 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Guda Praksepa Dravyas', 'quantity': '14400 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Ajaji(Sveta jiraka)','quantity': '768 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Raktapuspaka(Parpata)', 'quantity': '96 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Saptacchada(Saptaparna)', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Sunthi', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Marica', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Pippali', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Nagakesara', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Abda (Musta)', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Katvi(Katuka)', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Prativisa(Ativisha)', 'quantity': '48 g'},
    {'formulation': 'Amrtarista', 'ingredient': 'Vatsabija(IndraYava)', 'quantity': '48 g'},

    //Aravindasva
    
    {"formulation": "Aravindasava", "ingredient": "Aravinda (Kamala)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Uśīra", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Kāśmarī (Gambhārī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Nīlotpala (Utpala)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Mañjiṣṭhā", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Elā (Sūkṣmailā)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Balā", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Māmsī (Jaṭāmāmsī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Ambuda (Mustā)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Śārivā (Śveta Sārivā)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Śivā (Harītakī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Bibhīta (Bibhītaka)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Vacā", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Dhātrī (Āmalakī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Śaṭhī (Śaṭī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Śyāmā (Trivṛt)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Nīlinī (Nīlī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Paṭola", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Parpaṭa", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Pārtha (Arjuna)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Madhūka", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Madhuka (Yaṣṭī)", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Murā", "quantity": "48 g"},
    {"formulation": "Aravindasava", "ingredient": "Drākṣā", "quantity": "960 g"},
    {"formulation": "Aravindasava", "ingredient": "Dhātakī", "quantity": "768 g"},
    {"formulation": "Aravindasava", "ingredient": "Śarkarā", "quantity": "4800 g"},
    {"formulation": "Aravindasava", "ingredient": "Mākṣika (Madhu)", "quantity": "2400 g"},
    
    //Asokarista
    {"formulation": "Asokarista", "ingredient": "Aśoka", "quantity": "4800 g"},
    {"formulation": "Asokarista", "ingredient": "Guḍa", "quantity": "9600 g"},
    {"formulation": "Asokarista", "ingredient": "Dhātakī", "quantity": "768 g"},
    {"formulation": "Asokarista", "ingredient": "Ajājī (Śveta Jīraka)", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Mustaka (Mustā)", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Śuṇṭhī", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Dārvī (Dāruharidrā)", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Utpala", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Harītakī", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Bibhītaka", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Āmalakī", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Āmrāsthi (Āmra)", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Jīraka (Śveta Jīraka)", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Vāsā", "quantity": "48 g"},
    {"formulation": "Asokarista", "ingredient": "Candana (Śveta Candana)", "quantity": "48 g"},

    //Asvagandhadyarista
    {"formulation": "Asvagandhadyarista", "ingredient": "Aśvagandhā", "quantity": "2400 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Musalī", "quantity": "960 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Mañjiṣṭā", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Harītakī", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Haridrā", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Dāruharidrā", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Madhuka (Yaṣṭi)", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Rāsnā", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Vidārī", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Pārtha (Arjuna)", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Mustaka (Mustā)", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Trivṛt (Rt.)]", "quantity": "480 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Anantā (Śvetaśārivā)", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Śyāmā (Kṛṣṇaśārivā)", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Śveta Candana", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Rakta Candana", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Vacā", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Citraka", "quantity": "384 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Mākṣika (Madhu)", "quantity": "14400 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Dhātakī", "quantity": "768 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Śuṇṭhī", "quantity": "96 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Marica", "quantity": "96 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Pippalī", "quantity": "96 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Tvak", "quantity": "192 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Elā (Sūkṣmailā)", "quantity": "192 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Patra (Tejapatra)", "quantity": "192 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Priyaṅgu", "quantity": "192 g"},
    {"formulation": "Asvagandhadyarista", "ingredient": "Nāga (Nāgakeśara)", "quantity": "96 g"},


  ],

    'Avaleha and Paka': [ 
      //"Asvagandhadi Lehya"
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Sarkara', 'quantity': '1356 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Asvagandha', 'quantity': '192 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Sariva(Sveta Sariva)', 'quantity': '192 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Jiraka(Sveta Jiraka)', 'quantity': '192 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Madhusnuhi', 'quantity': '192 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Draksa', 'quantity': '192 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Ghrta', 'quantity': '226 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Honey', 'quantity': '452 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Ela(Suksmaila)', 'quantity': '24 g'},
    {'formulation': 'Asvagandhadi Lehya', 'ingredient': 'Water', 'quantity': '452 g'},
  ],

    'Guggulu': [
      // Kancanara Guggulu
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Kancanara-tvak', 'quantity': '480 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Haritaki', 'quantity': '96 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Bibhitaka', 'quantity': '96 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Amalaki', 'quantity': '96 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Sunthi', 'quantity': '48 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Marica', 'quantity': '48 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Pippali', 'quantity': '48 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Varuna', 'quantity': '48 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Ela (Suksmaila)', 'quantity': '12 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Tvak', 'quantity': '12 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Patra (Tejapatra)', 'quantity': '12 g'},
      {'formulation': 'Kancanara Guggulu', 'ingredient': 'Guggulu(Sudda)', 'quantity': '996 g'},
      

      // Triphala Guggulu
      {'formulation': 'Triphala Guggulu', 'ingredient': 'Haritaki', 'quantity': '48 g'},
      {'formulation': 'Triphala Guggulu', 'ingredient': 'Bibhitaka', 'quantity': '48 g'},
      {'formulation': 'Triphala Guggulu', 'ingredient': 'Amalaki', 'quantity': '48 g'},
      {'formulation': 'Triphala Guggulu', 'ingredient': 'Krsna(pippali)', 'quantity': '48 g'},
      {'formulation': 'Triphala Guggulu', 'ingredient': 'Guggulu(Sudda)', 'quantity': '240 g'},

      //Trayodasanga Guggulu
      
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Abha(Babbula)', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Asvagandha', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Havusa', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Guduci', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Satavari', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Goksura', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Vrddhadaruka(Vrddhadaru)', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Rasna', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Satahva', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Sati', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Yamani(Yanani)', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Nagara(sunthi)', 'quantity': '1 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Kausika(Guggulu)-sudda', 'quantity': '12 gm'},
      {'formulation': 'Trayodasanga Guggulu', 'ingredient': 'Sarpi', 'quantity': '1 gm'},

      //Laksa Guggulu
      
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Laksa', 'quantity': '1 gm'},
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Asthisamhrt', 'quantity': '1 gm'},
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Kakubha', 'quantity': '1 gm'},
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Asvagandha', 'quantity': '1 gm'},
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Nagabala', 'quantity': '1 gm'},
      {'formulation': 'Laksa Guggulu', 'ingredient': 'Pura(Guggulu)-suddha', 'quantity': '5 gm'},



      
    ],

    'Ghrta': [
      // Amrta Ghrta
      {'formulation': 'Amrta Ghrta', 'ingredient': 'Amrta(Guduci)', 'quantity': '1536 g'},
      {'formulation': 'Amrta Ghrta', 'ingredient': 'Mahausadha(Sunthi)', 'quantity': '128 g'},
      {'formulation': 'Amrta Ghrta', 'ingredient': 'Ghrta(Goghrta)', 'quantity': '768 g'},
      
    ],

    'Curna': [
      // Ajamodadi Curna
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Ajamoda', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Vidanga', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Saindhava lavana', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Devadaru', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Citraka', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Pippali mula', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Satapuspa(Satahva)', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Pippali', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Marica', 'quantity': '12 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Pathya(Haritaki)', 'quantity': '60 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Vrddhadaruka', 'quantity': '120 g'},
      {'formulation': 'Ajamodadi Curna', 'ingredient': 'Nagara(Sunthi)', 'quantity': '120 g'},
      
    ],

    'Dravaka': [
      //SankhaDravaka
      {"formulation": "Sankhadravaka", "ingredient": "Arka bhasma (Arka)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Snuhī bhasma (Snuhī)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Ciñcā bhasma (Ciñcā)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Tila bhasma (Tila)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Āragvadha bhasma (Āragvadha)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Citraka bhasma (Citraka)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Apāmārga bhasma (Apāmārga)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Yava kāra (Yava)", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Svarjikāra", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Taṅkaṇa", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Samudraphena", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Godantī", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Kāsīsa", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Soraka", "quantity": "48 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Saindhava Lavaṇa", "quantity": "96 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Sāmudra Lavaṇa", "quantity": "96 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Viḍa Lavaṇa", "quantity": "96 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Sauvareala Lavaṇa", "quantity": "96 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Audbhida Lavaṇa", "quantity": "96 g"},
      {"formulation": "Sankhadravaka", "ingredient": "Śaṅkha cūrṇa (Śaṅkha)", "quantity": "48 g"},

    ],

    'Lavana Ksara': [
      //Arkalavana
      {"formulation": "Arkalavana", "ingredient": "Arka patra (Arka)", "quantity": "1 g"},
      {"formulation": "Arkalavana", "ingredient": "Lavaṇa (Saiṇdhava Lavaṇa)", "quantity": "1 g"},
      
      //Apamarga Ksara
      {"formulation": "Apamargaksara", "ingredient": "Apāmārga bhasma (Apāmārga) (Pl.)", "quantity": "1 g"},
      {"formulation": "Apamargaksara", "ingredient": "Water", "quantity": "6 g"},

      //AbhayaLavana
      {"formulation": "Abhayalavana", "ingredient": "Pālibhadra", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Palāśa", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Arka", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Snuhī", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Apāmārga", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Citraka", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Varuṇa", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Agnimantha", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Vasuka (Vasu)", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Śavadamstrā (Gokṣura)", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Bṛhatī", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Kaṭhakārī", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Pēṭika (Cirabilva)", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Aṣphoṭā", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Kutāja", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Koṣaṭaki", "quantity": "468 g"},
      {"formulation": "Abhayalavana", "ingredient": "Punarnavā (Rakta Punarnavā)", "quantity": "768 g"},
      {"formulation": "Abhayalavana", "ingredient": "Lavaṇa (Saiṇdhava Lavaṇa)", "quantity": "768 g"},
      {"formulation": "Abhayalavana", "ingredient": "Harītakī", "quantity": "384 g"},
      {"formulation": "Abhayalavana", "ingredient": "Gomūtra", "quantity": "3.072 l"},
      {"formulation": "Abhayalavana", "ingredient": "Ajājī (āveta jīraka)", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Śuṣhṭhī", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Marīca", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Pippalī", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Hiṅgu", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Yamānī (Yavānī)", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Pauṣkara (Puskara)", "quantity": "24 g"},
      {"formulation": "Abhayalavana", "ingredient": "Śaṭhī (Śaṭī)", "quantity": "24 g"},
      
      //Avittoladibhasma
    {"formulation": "Avittoladibhasma", "ingredient": "Avittola(Karanja)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Katalati (Apamarga)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Danti", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Tapana (Arka)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Citra (Eranda)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Vayalculli (Kokilikasa)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Sampaka (Aragvadha)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Kalliver (Snuhi)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Panaviral (Tila)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Snuhyagra (Snuhi)", "quantity": "1 g"},
    {"formulation": "Avittoladibhasma", "ingredient": "Rambha (Kadali)", "quantity": "1 g"},

    //Kadaliksara
    {"formulation": "Kadaliksara", "ingredient": "Kadali (Bhasma)", "quantity": "1 g"},



    ],

    'Parpati':[
      //Pancamrtaparpati
    {"formulation": "Pancamrtaparpati", "ingredient": "Gandhaka-Śuddha", "quantity": "96 g"},
    {"formulation": "Pancamrtaparpati", "ingredient": "Rasa (Pārada) - Śuddha", "quantity": "48 g"},
    {"formulation": "Pancamrtaparpati", "ingredient": "Lauha-bhasma", "quantity": "24 g"},
    {"formulation": "Pancamrtaparpati", "ingredient": "Abhraka-bhasma", "quantity": "12 g"},
    {"formulation": "Pancamrtaparpati", "ingredient": "Tāmra-bhasma", "quantity": "6 g"},

    //Bolaparpati
    {"formulation": "Bolaparpati", "ingredient": "Śīta (Pārada) - Śuddha", "quantity": "1 g"},
    {"formulation": "Bolaparpati", "ingredient": "Gandhaka-Śuddha", "quantity": "1 g"},
    {"formulation": "Bolaparpati", "ingredient": "Bola", "quantity": "2 g"},

    //Rasaparpati
    {"formulation": "Rasaparpati", "ingredient": "Śīta (Pārada) - Śuddha", "quantity": "1 g"},
    {"formulation": "Rasaparpati", "ingredient": "Gandhaka - Śuddha", "quantity": "1 g"},

    //Lauhaparpati
    {"formulation": "Lauhaparpati", "ingredient": "Rasa (Pārada) Śuddha", "quantity": "1 g"},
    {"formulation": "Lauhaparpati", "ingredient": "Gandhaka - Śuddha", "quantity": "2 g"},
    {"formulation": "Lauhaparpati", "ingredient": "Tikṣṇa loha (Lauha) - bhasma", "quantity": "1 g"},

    //Svarnaparpati
    {"formulation": "Svarnaparpati", "ingredient": "Rasottama (Pārada) - Śuddha", "quantity": "48 g"},
    {"formulation": "Svarnaparpati", "ingredient": "Hema (Svarṇa) - Śuddha", "quantity": "12 g"},
    {"formulation": "Svarnaparpati", "ingredient": "Sugañdhaka (Gañdhaka) - Śuddha", "quantity": "48 g"},

    ],

    'Kupipakva Rasayana': [
      //Kantavallabha Rasa
    {"formulation": "Kantavallabharasa", "ingredient": "Kānta (lauha) - bhasma", "quantity": "16 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Ayoraja (Lauha) - bhasma", "quantity": "14 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Kiñcita (Maṇḍra) - bhasma", "quantity": "12 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Tañkaṇa - Śuddha", "quantity": "10 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Manaṣīlā - Śuddha", "quantity": "8 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Śilājatu - Śuddha", "quantity": "6 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Sēta (Pārada) - Śuddha", "quantity": "66 g"},
    {"formulation": "Kantavallabharasa", "ingredient": "Gandhaka - Śuddha", "quantity": "66 g"},

    //Mallasindura
    {"formulation": "Mallasindura", "ingredient": "Rasa (Pārada) - Śuddha", "quantity": "108 g"},
    {"formulation": "Mallasindura", "ingredient": "Rasavidhu (Pārada) - rasa karpūra", "quantity": "108 g"},
    {"formulation": "Mallasindura", "ingredient": "Balī (Gandhaka) - Śuddha", "quantity": "66 g"},
    {"formulation": "Mallasindura", "ingredient": "Malla - Śuddha", "quantity": "54 g"},

    //Rasapuspa
    {"formulation": "Rasapuspa", "ingredient": "Śuddha rasa (Pārada)", "quantity": "60 g"},
    {"formulation": "Rasapuspa", "ingredient": "Kāsīśaka (Kāsīsa) - Śuddha", "quantity": "60 g"},
    {"formulation": "Rasapuspa", "ingredient": "Saindhava Lavaṇa", "quantity": "60 g"},

    //Vatagnikumararasa
    {"formulation": "Vatagnikumararasa", "ingredient": "Pārada - Śuddha", "quantity": "2 g"},
    {"formulation": "Vatagnikumararasa", "ingredient": "Gandhaka - Śuddha", "quantity": "2 g"},
    {"formulation": "Vatagnikumararasa", "ingredient": "Talaka cūrṇa (haritākī) - Śuddha", "quantity": "1 g"},

    //Samirapannaga Rasa
    {"formulation": "Samirapannagarasa", "ingredient": "Pārada - Śuddha", "quantity": "1 g"},
    {"formulation": "Samirapannagarasa", "ingredient": "Gandhaka - Śuddha", "quantity": "1 g"},
    {"formulation": "Samirapannagarasa", "ingredient": "Malla - Śuddha", "quantity": "1 g"},
    {"formulation": "Samirapannagarasa", "ingredient": "Haratāla - Śuddha", "quantity": "1 g"},
    {"formulation": "Samirapannagarasa", "ingredient": "Manaṣilā - Śuddha", "quantity": "1 g"},


    ],

    'Sattva':[
    {"formulation": "Guducisattva", "ingredient": "Guḍuci", "quantity": "1 g"},
    ],

    'Lepa':[

      //Kaccuradi curna
    {"formulation": "Kaccuradicurna", "ingredient": "Kaccrra (Karcrra)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Dhātrī (Āmalakī)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Maṅjiṣṭhā", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Yaṣṭī", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Dāru (Devadāru)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Śveta Candana", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Raktacandana", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kannāra", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kanmada", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Vedhi", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Rohiṇī (Kaṭukā)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kṛṣṇa Jīraka", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Rāsnā", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Tintriṇī sirā", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Śveta Sārivā", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kunkuma", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Sarja", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Indu (Karpūra)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Vārivāha (Mustā)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kaṇṭivenna (Kaṇakuṣṭha)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Balā Śiphā (Balā)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Lāja (Śāli)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kauntī (Renukā)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Jala (Hrivera)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Uṣīra", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Āmaya (Kuṣṭha)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Sanninyāka (Kumāri)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Karuppu (Ahiphēna)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Kāvi (Gairika)", "quantity": "1 g"},
    {"formulation": "Kaccuradicurna", "ingredient": "Jātīphala", "quantity": "1 g"},

    //Kalaka Curna(lepa)
    {"formulation": "Kalakacurna", "ingredient": "Gṛhadhūma", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Tārkṣya (Dāruharidrā) (St.Ext.)", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Pāṭhā ", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Śunthi", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Marica", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Pippalī", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Ksara(Yava)", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Agni (Citraka)", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Aya cūrṇa (lauha)", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Harītakī ", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Bibhītakī", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Āmalakī", "quantity": "1 g"},
    {"formulation": "Kalakacurna", "ingredient": "Tejohvī (tejovatī)", "quantity": "1 g"},
    ],

    'Lauha':[
      //Chandanadilauha
    {"formulation": "Chandanadilauha", "ingredient": "Raktacandana (Ht.Wd.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Hrīvēra (Rt.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Pāṭhā (Rt./Pl.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Uśīra (Rt.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Kaṇā (Pippalī) (Fr.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Śivā (Harītakī) (P.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Nāgara (Śuṇṭhī) (Rz.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Utpala (Fl.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Dhātrī (Āmalakī) (P.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Mustā (Rz.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Citraka (Rt.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "1 g"},
    {"formulation": "Chandanadilauha", "ingredient": "Lauha bhasma", "quantity": "12 g"},

    //Pippalyadi Lauha
    {"formulation": "Pippalyadilauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Āmalakī (P.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Drākṣā (Dr.Fr.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Kolāsthi (Kola) (Enm.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Madhu", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Śarkarā", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Puṣkara (Rt.)", "quantity": "1 g"},
    {"formulation": "Pippalyadilauha", "ingredient": "Lauha bhasma", "quantity": "8 g"},

    //Putapakva Visama Jvarantaka Lauha
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Hiṅgula Sambhava Sūta (Pārada) Śuddha", "quantity": "4 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Gandhaka - Śuddha", "quantity": "4 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Hema (Svarṇa) Bhasma", "quantity": "1 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Lauha Bhasma", "quantity": "8 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Tāmra Bhasma", "quantity": "8 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Abhraka Bhasma", "quantity": "8 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Vaṅga Bhasma", "quantity": "2 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Pravāla Bhasma", "quantity": "2 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Muktā Bhasma", "quantity": "1 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Śaṅkha Bhasma", "quantity": "1 g"},
    {"formulation": "Putapakva Visama Jvarantaka Lauha", "ingredient": "Śukti Bhasma", "quantity": "1 g"},

    //Pradarantaka Lauha
    {"formulation": "Pradarantaka Lauha", "ingredient": "Lauha Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Tāmra Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Haritāla Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Vaṅga Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Abhra (Abhraka) Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Varāṭikā (Kapardikā) Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Suṇṭhī (Rz.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Marica (Fr.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Harītakī (P.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Bibhītaka (P.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Āmalakī (P.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Citrā (Eraṇḍa) (Rt.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Saindhava Lavaṇa", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Sāmudra Lavaṇa", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Viḍa Lavaṇa", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Sauvarcala Lavaṇa", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Audbhida Lavaṇa", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Cavikā (Cavya) (St.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Śaṅkha Bhasma", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Vacā (Rz.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Havuṣa (Hapuṣa) (Fr.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Pākala (Kuṣṭha) (Rt.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Śaṭhī (Rz.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Pāṭhā (Rt./Pl.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Devadāru (Ht. Wd.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Elā (Sūkṣmailā) (Sd.)", "quantity": "1 g"},
    {"formulation": "Pradarantaka Lauha", "ingredient": "Vṛddhadāraka (Vṛddhadāruka) (St.)", "quantity": "1 g"},

    //Yakrdarilauha
    {"formulation": "YakrdariLauha", "ingredient": "Lauha (Cūrṇa - Bhasma)", "quantity": "24 g"},
    {"formulation": "YakrdariLauha", "ingredient": "Abhraka Bhasma", "quantity": "24 g"},
    {"formulation": "YakrdariLauha", "ingredient": "Tāmra Bhasma", "quantity": "12 g"},
    {"formulation": "YakrdariLauha", "ingredient": "Limpākāṅghri (Nimbū) (Rt. Bk.)", "quantity": "48 g"},
    {"formulation": "YakrdariLauha", "ingredient": "Mṛgājina Bhasma", "quantity": "48 g"},

    //Rohitaka Lauha
    {"formulation": "RohitakaLauha", "ingredient": "Rohītaka (St. Bk.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Suṇṭhī (Rz.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Marica (Fr.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Harītakī (P.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Bibhītaka (P.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Āmalakī (P.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Mustā (Rz.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Citraka (Rt.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "1 g"},
    {"formulation": "RohitakaLauha", "ingredient": "Ayaḥ (Lauha) Bhasma", "quantity": "10 g"},

    //Vidanga lauha
    {"formulation": "VidangaLauha", "ingredient": "Rasa (Pārada) - Śuddha", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Gandhaka - Śuddha", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Marica (Fr.)", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Jātīphala (Sd.)", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Lavaṅgaka (Lavaṅga) (Fl. Bd.)", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Śuṇṭhī (Rz.)", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Taṅka (Taṅkaṇa) - Śuddha", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Kaṇā (Pippalī) (Fr.)", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Tāla (Haritāla) - Śuddha", "quantity": "1 Part"},
    {"formulation": "VidangaLauha", "ingredient": "Lauha Bhasma", "quantity": "9 Parts"},
    {"formulation": "VidangaLauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "18 Parts"},

    //Vidangadi Lauha
    {"formulation": "VidangadiLauha", "ingredient": "Viḍaṅga (Fr.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Mustā (Rz.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Harītakī (P.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Bibhītaka (P.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Āmalakī (P.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Devadāru (Ht.Wd.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Pippalī Mūla (Rt.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Cavya (St.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Citraka (Rt.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Śuṇṭhī (Rz.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Marica (Fr.)", "quantity": "1 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Āyaścūrṇa (Lauha) Bhasma", "quantity": "12 g"},
    {"formulation": "VidangadiLauha", "ingredient": "Gomūtra", "quantity": "192 g"},

    //Saptamrta Lauha
    {"formulation": "SaptamṛtaLauha", "ingredient": "Madhuka (Yaṣṭī) (Rt.)", "quantity": "1 g"},
    {"formulation": "SaptamṛtaLauha", "ingredient": "Harītakī (P.)", "quantity": "0.33 g"},
    {"formulation": "SaptamṛtaLauha", "ingredient": "Bibhītaka (P.)", "quantity": "0.33 g"},
    {"formulation": "SaptamṛtaLauha", "ingredient": "Āmalakī (P.)", "quantity": "0.33 g"},
    {"formulation": "SaptamṛtaLauha", "ingredient": "Ayoraja (Lauha) Bhasma", "quantity": "1 g"},

    //Saravajvarahara Lauha
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Citraka (Rt.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Harītakī (P.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Bibhītaka (P.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Āmalakī (P.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Suṣhṭhī (Rz.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Marica (Fr.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Pippalī (Fr.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Vidāga (Fr.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Mustaka (Mustī) (Rz.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Śreyasī (gaja pippalī) (Fr.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Pippalīmāla (Pippalī) (Rt.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Uṣṭra (Rt.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Devadāru (Ht. Wd.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Kirātatikta (Kirātatikta) (Pl.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Bāla (Hrīvera) (Rt.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Kaṭukā (Rt./Rz.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Kaṭhakārīka (Kaṭhakārī) (Pl.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Śobhāñjana (Śigru) (Sd.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Madhuka (Yaṣṭī) (Rt.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Vatsaka (Kuṭaja) (Sd.)", "quantity": "1 g"},
    {"formulation": "Saravajvarahara Lauha", "ingredient": "Lauha Bhasma", "quantity": "20 g"},

    


    ],


  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulation Input"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for formulation class
            DropdownButton<String>(
              value: _selectedClass,
              hint: Text("Select Formulation Class"),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClass = newValue;
                  _selectedFormulation = null;
                  isCalculated = false; // Reset results when class changes
                });
              },
              items:['Asava and Arista','Avaleha and Paka','Guggulu','Ghrta','Curna','Dravaka','Lavana Ksara','Parpati','Kupipakva Rasayana','Sattva','Lepa','Lauha'].map<DropdownMenuItem<String>>((String className) {
                return DropdownMenuItem<String>(
                  value: className,
                  child: Text(className),
                );
              }).toList(),
            ),

            // Dropdown for formulation selection
            if (_selectedClass != null)
              DropdownButton<String>(
                value: _selectedFormulation,
                hint: Text("Select Formulation"),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFormulation = newValue;
                    isCalculated = false; // Reset results when formulation changes
                  });
                },
                items: _formulations[_selectedClass!]!
                    .map((formulation) => formulation['formulation']!)
                    .toSet()
                    .map<DropdownMenuItem<String>>((String formulation) {
                  return DropdownMenuItem<String>(
                    value: formulation,
                    child: Text(formulation),
                  );
                }).toList(),
              ),

            // Quantity input field
            TextField(
              onChanged: (value) {
                setState(() {
                  _quantity = double.tryParse(value);
                });
              },
              decoration: InputDecoration(
                labelText: "Enter Quantity",
                hintText: "Quantity in grams",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            // Unit selection dropdown
            DropdownButton<String>(
              value: _selectedUnit,
              hint: Text("Select Unit"),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedUnit = newValue;
                });
              },
              items: ['grams', 'kilograms'].map<DropdownMenuItem<String>>((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),

            // Calculate button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCalculated = true; // Flag to display results
                });
              },
              child: Text('Calculate'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),

            // Result section
            if (isCalculated && _selectedClass != null && _selectedFormulation != null && _quantity != null)
              Expanded(
                child: ListView(
                  children: _formulations[_selectedClass!]!
                      .where((formulation) =>
                          formulation['formulation'] == _selectedFormulation)
                      .map<Widget>((formulation) {
                    double ingredientQuantity = _calculateIngredientQuantity(
                      formulation['quantity']!,
                    );

                    return ListTile(
                      title: Text(formulation['ingredient']!),
                      subtitle: Text('${ingredientQuantity.toStringAsFixed(2)} $_selectedUnit'),
                    );
                  }).toList(),
                ),
              ),

            // Download result button
            if (isCalculated)
              ElevatedButton(
                onPressed: _downloadResults,
                child: Text('Download Results as TXT'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),

            // Back to homepage button
            if (isCalculated)
              ElevatedButton(
                onPressed: () {
                  // Navigate back to homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()), // Make sure HomeScreen is imported
                  );
                },
                child: Text('Back to Homepage'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  double _calculateIngredientQuantity(String quantity) {
  // Parse the ingredient quantity (in grams) from the input
  double quantityValue = double.parse(quantity.split(' ')[0]);

  // If the user provided a quantity in kilograms, convert it to grams
  double quantityInGrams = _selectedUnit == 'kilograms' ? _quantity! * 1000 : _quantity!;

  if (_quantity != null) {
    // Calculate the total sum of all ingredient quantities in grams
    double totalIngredientQuantity = _formulations[_selectedClass!]!
        .where((formulation) => formulation['formulation'] == _selectedFormulation)
        .map((formulation) => double.parse(formulation['quantity']!.split(' ')[0]))
        .reduce((sum, current) => sum + current);

    // Calculate the proportional quantity based on the user-input quantity (in grams)
    double result = quantityValue * (quantityInGrams / totalIngredientQuantity);

    // Convert the result to kilograms if the selected unit is kilograms
    if (_selectedUnit == 'kilograms') {
      result /= 1000.0; // Convert grams to kilograms
    }

    return result; // The result will be in the selected unit (kg or grams)
  }

  return 0.0;
}




  // Method to download results as a TXT file
  Future<void> _downloadResults() async {
    // Request runtime permissions for storage and media access
    var status = await Permission.storage.request();
    var manageStorageStatus = await Permission.manageExternalStorage.request();
    var mediaStatus = await Permission.mediaLibrary.request();

    if (status.isGranted || manageStorageStatus.isGranted || mediaStatus.isGranted) {
      try {
        // Specify the Downloads directory
        final directory = Directory('/storage/emulated/0/Download');

        if (!await directory.exists()) {
          await directory.create(recursive: true); // Create the directory if it doesn't exist
        }

        // Define the file path
        final textFilePath = '${directory.path}/formulation_results.txt';

        // Prepare the results text
        String resultsText = 'Formulation Results\n\n';
        resultsText += 'Class: $_selectedClass\n';
        resultsText += 'Formulation: $_selectedFormulation\n';
        resultsText += 'Total Quantity Entered: $_quantity $_selectedUnit\n\n';

        // Process and list the formulations
        _formulations[_selectedClass!]!
            .where((formulation) => formulation['formulation'] == _selectedFormulation)
            .forEach((formulation) {
          double ingredientQuantity = _calculateIngredientQuantity(
            formulation['quantity']!,
          );
          resultsText += '${formulation['ingredient']} - ${ingredientQuantity.toStringAsFixed(2)} $_selectedUnit\n';
        });

        // Write the results to the file
        final file = File(textFilePath);
        await file.writeAsString(resultsText);


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Results saved at $textFilePath')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving file: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage or media permission denied.')),
      );
    }
  }
}

