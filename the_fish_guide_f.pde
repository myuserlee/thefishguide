import processing.sound.*;
import processing.video.*;

int stage = 0;

// 물고기 도감 목록
PImage altum_angelfish; // 알텀 엔젤피쉬
PImage amphiprion_ocellaris; // 흰동가리
PImage garden_eel; // 가든일 
PImage gasteropelecus_strenicla; // 실버 헤체트
PImage leopoldi_stingray; // 레오파디 가오
PImage razor_fish; // 레이저 피쉬 
PImage toxotes_chatareus; // 물총 고기 
PImage zebra_fish; // 제브리 다니오

// 버튼
PImage greenbutton;
PImage orangebutton;
PImage purplebutton;
PImage bluebutton;
PImage blankbutton;

// 로고와 배경화면
PImage logo;
PImage underwater;

// 폰트
PFont Bold;
PFont Light;

// 효과음
SoundFile click;
SoundFile eating;

// 물고기 설명 선택 상태
String show = "nothing";

// 물고기 무빙 
int altum_angelfishX = 500;
int amphiprion_ocellarisX = 100;
int gasteropelecus_streniclaX = 200;
int leopoldi_stingrayX = 550;
int zebra_fishX = 800;
int toxotes_chatareusX = 850;
int razor_fishY = 700;
int razor_fish_m = 0;

// 물고기 설명글
String explain = "d";
String korname = "d";
String engname = "d";

// 동영상
Movie mov1;
Movie mov2;
Movie mov3;

// 액자
PImage frame1;
PImage frame2;
PImage frame3;

// 마우스 위치
float xPos = 500;
float yPos = 500;

// 먹이
PImage feed;
Boolean havingfeed = false;
float feedX = 500;
float feedY = 500;
Boolean down = false;
int downY = 0;

// 도움말
Boolean helping = false;

void setup() {
  size (1000, 1000);
  imageMode (CENTER);
  textAlign (CENTER);
  rectMode (CENTER);
  
  // 물고기 변수명
  altum_angelfish = loadImage("altum_angelfish.png");
  amphiprion_ocellaris = loadImage("amphiprion_ocellaris.png");
  garden_eel = loadImage("garden_eel.png");
  gasteropelecus_strenicla = loadImage("gasteropelecus_strenicla.png");
  leopoldi_stingray = loadImage("leopoldi_stingray.png");
  razor_fish = loadImage("razor_fish.png");
  toxotes_chatareus = loadImage("toxotes_chatareus.png");
  zebra_fish = loadImage("zebra_fish.png");
  feed = loadImage("feed.png");
  
  // 버튼 변수명
  greenbutton = loadImage("greenbutton.png");
  orangebutton = loadImage("orangebutton.png");
  purplebutton = loadImage("purplebutton.png");
  bluebutton = loadImage("bluebutton.png");
  blankbutton = loadImage("blankbutton.png");
  
  // 로고와 배경화면 
  logo = loadImage("logo.png");
  underwater = loadImage("underwater.jpg");
  
  // 폰트
  Bold = createFont ("Bold.otf", 30);
  Light = createFont ("Light.otf", 30);
  
  // 효과음
  click = new SoundFile(this, "click.mp3");
  eating = new SoundFile(this, "beep2.wav");
  
  // 동영상
  mov1 = new Movie(this, "mov1.mov");
  mov2 = new Movie(this, "mov2.mov");
  mov3 = new Movie(this, "mov3.mov");
  
  mov1.loop();
  mov2.loop();
  mov3.loop();
  
  // 액자
  frame1 = loadImage("frame1.png");
  frame2 = loadImage("frame2.png");
  frame3 = loadImage("frame3.png");
  
}

void draw() {
  image (underwater, width/2, height/2, width, height); // 배경화면
  
  if (stage == 0) home();
  if (stage == 1) dictionary();
  if (stage == 2) aquarium();
  if (stage == 3) feeding();
  
  button(); // 상단 버튼
}

void mouseClicked() {
  click.play();
  
  if (mouseY > 60-35 && mouseY < 60+35) {
    if (mouseX > 200 - 35 && mouseX < 200 + 35) stage = 0;
    if (mouseX > 400 - 35 && mouseX < 400 + 35) stage = 1;
    if (mouseX > 600 - 35 && mouseX < 600 + 35) stage = 2;
    if (mouseX > 800 - 35 && mouseX < 800 + 35) stage = 3;
  }
  
  if (stage == 0) {
    if (helping == false && mouseX > width/2 - 35 && mouseX < width/2 + 35 && mouseY > 700 - 50 && mouseY < 700 + 50) helping = true;
    else if (helping == true && mouseX > width/2 - 65 && mouseX < width/2 + 65 && mouseY > 750 - 30 && mouseY < 750 + 30) helping = false;
  }
  
  if (stage == 1) {
    if (show == "nothing") {
      if (mouseX > 140 - 60 && mouseX < 140 + 20 && mouseY > 890 - 75 && mouseY < 890 + 75) {
        println("garden_eel");
        show = "garden_eel";
      } else if (mouseX > 265 - 40 && mouseX < 265 + 40 && mouseY > razor_fishY+20 - 125 && mouseY < razor_fishY+20 + 125) {
        println("razor_fish");
        show = "razor_fish";
      } else if (mouseX > toxotes_chatareusX - 100 && mouseX < toxotes_chatareusX + 100 && mouseY > 700 - 45 && mouseY < 700 + 45) {
        println("toxotes_chatareus");
        show = "toxotes_chatareus";
      } else if (mouseX > zebra_fishX - 90 && mouseX < zebra_fishX + 90 && mouseY > 230 - 35 && mouseY < 230 + 35) {
        println("zebra_fish");
        show = "zebra_fish";
      } else if (mouseX > leopoldi_stingrayX+80 - 140 && mouseX < leopoldi_stingrayX+80 + 140 && mouseY > 830 - 75 && mouseY < 830 + 75) {
        println("leopoldi_stingray");
        show = "leopoldi_stingray";
      } else if (mouseX > gasteropelecus_streniclaX - 85 && mouseX < gasteropelecus_streniclaX + 85 && mouseY > 570 - 40 && mouseY < 570 + 40) {
        println("gasteropelecus_strenicla");
        show = "gasteropelecus_strenicla";
      } else if (mouseX > amphiprion_ocellarisX - 75 && mouseX < amphiprion_ocellarisX + 75 && mouseY > 490 - 40 && mouseY < 490 + 40) {
        println("amphiprion_ocellaris");
        show = "amphiprion_ocellaris";
      } else if (mouseX > altum_angelfishX - 100 && mouseX < altum_angelfishX + 100 && mouseY > 350 - 200 && mouseY < 350 + 200) {
        println("altum_angelfish");
        show = "altum_angelfish";
      }
    } else {
      if (mouseX > width/2 - 65 && mouseX < width/2 + 65 && mouseY > 750 - 30 && mouseY < 750 + 30) {
        show = "nothing";
      }
    }
  }
  
  if (stage == 2) {
    if (mouseX > 790 - 135 && mouseX < 790 + 135 && mouseY > 790 - 135 && mouseY < 790 + 135) {
      if (mov1.isPlaying() == false) mov1.play();
      else mov1.pause();
    } else if (mouseX > 270 - 200 && mouseX < 270 + 200 && mouseY > 550 - 240 && mouseY < 550 + 240) {
      if (mov2.isPlaying() == false) mov2.play();
      else mov2.pause();
    } else if (mouseX > 700 - 120 && mouseX < 700 + 120 && mouseY > 340 - 160 && mouseY < 340 + 160) {
      if (mov3.isPlaying() == false) mov3.play();
      else mov3.pause();
    }
  }
  
  if (stage == 3) {
    if (havingfeed == false) {
      if (mouseX > 850 - 100 && mouseX < 850 + 100 && mouseY > 200 - 100 && mouseY < 200 + 100) havingfeed = true;
    } else { 
      if (mouseX > xPos - 15 && mouseX < xPos + 15 && mouseY > yPos - 15 && mouseY < yPos + 15) {
        eating.play();
        havingfeed = false; 
      } else {
        down = true;
      }
    }
  }
}

void button() {
  tint (255);
  
  if (mouseX > 200 - 35 && mouseX < 200 + 35 && mouseY > 60-35 && mouseY < 60+35) {
    tint(200);
    image (greenbutton, 200, 60, 120, 60);
  } else {
    tint(255);
    image (greenbutton, 200, 60, 140, 70); 
  }
  
  if (mouseX > 400 - 35 && mouseX < 400 + 35 && mouseY > 60-35 && mouseY < 60+35) {
    tint(200);
    image (orangebutton, 400, 60, 120, 60);
  } else {
    tint(255);
    image (orangebutton, 400, 60, 140, 70);
  }
  
  if (mouseX > 600 - 35 && mouseX < 600 + 35 && mouseY > 60-35 && mouseY < 60+35) {
    tint(200);
    image (purplebutton, 600, 60, 120, 60);
  } else {
    tint(255);
    image (purplebutton, 600, 60, 140, 70);
  }
  
  if (mouseX > 800 - 35 && mouseX < 800 + 35 && mouseY > 60-35 && mouseY < 60+35) {
    tint(200);
    image (bluebutton, 800, 60, 120, 60);
  } else {
    tint(255);
    image (bluebutton, 800, 60, 140, 70);
  }
  
    tint (255);
}

void movieEvent (Movie m) {
  m.read();
}

void home() {
  pushMatrix();
  translate (width/2, height/2);
  image (logo, (mouseX - 500) * 0.02, (mouseY - 500) * 0.02, 1000, 500);
  popMatrix();
  
  textSize(15);
  fill (255);
  textFont(Bold);
  text ("help", width/2, 700);
  
  if (helping == true) {
    fill (242, 236, 228);
    rect (width/2, height/2, 700, 600, 20);
    image (blankbutton, width/2, 750, 140, 70);
    
    fill (50);
    textFont(Light);
    textSize (15);
    
    image (greenbutton, 250, 300, 120, 60);
    text ("HOME : 마우스를 움직이면 로고가 함께 움직이는 것을 볼 수 있으며, 도움말을 확인할 수 있습니다.", 570, 310, 400, 50);
    
    image (orangebutton, 250, 420, 120, 60);
    text ("DICTIONARY : 물 속을 헤엄치고 있는 물고기 중, 궁금한 물고기를 마우스로 클릭하면 정보를 알려줍니다.", 570, 430, 400, 50);
    
    image (purplebutton, 250, 540, 120, 60);
    text ("GALLARY : 물고기 동영상을 감상할 수 있고, 영상을 클릭하면 재생이 중지됩니다.", 570, 550, 400, 50);
    
    image (bluebutton, 250, 660, 120, 60);
    text ("FEEDING : 먹이통을 클릭하여 먹이를 마우스에 쥐면 물고기가 따라오고, 마우스를 다시 클릭하여 먹이를 놓으면 물고기가 더이상 따라오지 않습니다.", 570, 670, 400, 70);
  }
}


void dictionary() {
  // rect (altum_angelfishX, 350, 200, 400);
  image (altum_angelfish, altum_angelfishX, 350, 400, 400);
  if (altum_angelfishX < -100) altum_angelfishX = 1100;
  else altum_angelfishX = altum_angelfishX - 2;
  
  // rect (amphiprion_ocellarisX, 490, 150, 80);
  image (amphiprion_ocellaris, amphiprion_ocellarisX, 500, 200, 200);
  if (amphiprion_ocellarisX < -100) amphiprion_ocellarisX = 1100;
  else amphiprion_ocellarisX = amphiprion_ocellarisX - 3;
  
  // rect (gasteropelecus_streniclaX, 570, 170, 80);
  image (gasteropelecus_strenicla, gasteropelecus_streniclaX, 580, 200, 200);
  if (gasteropelecus_streniclaX > 1100) gasteropelecus_streniclaX = -100;
  else gasteropelecus_streniclaX = gasteropelecus_streniclaX + 2;
  
  // rect (leopoldi_stingrayX+80, 830, 280, 150);
  image (leopoldi_stingray, leopoldi_stingrayX, 820, 500, 500);
  if (leopoldi_stingrayX > 1250) leopoldi_stingrayX = -250;
  else leopoldi_stingrayX = leopoldi_stingrayX + 4;
  
  // rect (zebra_fishX, 230, 180, 70);
  image (zebra_fish, zebra_fishX, 250, 200, 200);
  if (zebra_fishX > 1100) zebra_fishX = -100;
  else zebra_fishX = zebra_fishX + 3;
  
  // rect (toxotes_chatareusX, 700, 200, 90);
  image (toxotes_chatareus, toxotes_chatareusX, 690, 230, 230);
  if (toxotes_chatareusX < -100) toxotes_chatareusX = 1100;
  else toxotes_chatareusX = toxotes_chatareusX - 1;
  
  // rect (265, razor_fishY+20, 80, 250);
  image (razor_fish, 300, razor_fishY + 50, 300, 300);
  image (razor_fish, 260, razor_fishY, 300, 300);
  razor_fish_m = razor_fish_m + 1;
  if (razor_fish_m % 29 < 10) razor_fishY = razor_fishY + 2;
  else if (razor_fish_m % 29 > 15 && razor_fish_m % 29 < 26) razor_fishY = razor_fishY - 2;
    
  // rect (140, 890, 120, 150);
  image (garden_eel, 150, 890, 200, 200);
  
  if (show != "nothing") {
    fill (242, 236, 228);
    rect (width/2, height/2, 700, 600, 20);
    image (blankbutton, width/2, 750, 140, 70);

    if (show == "altum_angelfish") {
      image (altum_angelfish, width/2, 330, 250, 250);
      korname = "알텀엔젤피쉬";
      explain = "수초 주변이나 돌 주변의 물 흐름이 약한 곳에 조용히 무리 지어 지내는 것을 좋아한다. 수류가 느리고 나뭇잎, 죽은 나무, 나무 열매와 같은 많은 유기물들이 부식되고 있는 환경에서 살아가 극단적으로 경도와 pH가 낮은 곳에 서식한다.";
    }
    
    if (show == "amphiprion_ocellaris") {
      image (amphiprion_ocellaris, width/2, 330, 220, 220);
      korname = "흰동가리";
      explain = "말미잘 주위에서 생활하며, 위협을 받을 때나 밤에는 말미잘의 촉수 사이에 숨고, 말미잘의 먹이를 유인해 가져다준다. 말미잘의 독에 면역력이 있어 말미잘을 은신처로 이용하며 먹이를 구하는 공생관계이다. ";
    }
    
    if (show == "gasteropelecus_strenicla") {
      image (gasteropelecus_strenicla, width/2, 330, 220, 220);
      korname = "실버헤체트";
      explain = "아랫배의 모습이 손도끼 모양을 닮아 실버헤체트라고 불린다. 납작한 몸에 가슴 지느러미가 위쪽으로 길게 발달되어 있고 가슴 근육도 잘 발달되어 있어 엄청난 점프력을 발휘한다. 주로 수면 부근에서 유영하여 바닥에 떨어진 먹이는 잘 먹지 못한다.";
    }
    
    if (show == "leopoldi_stingray") {
      image (leopoldi_stingray, width/2, 330, 300, 300);
      korname = "레오폴디 가오리";
      explain = "완전한 담수지역에 서식하는 가오리로, 검은 바탕에 다이아몬드처럼 흰 무늬가 있으며 알이 아닌 새끼를 낳는다. 갓 태어난 새끼도 독가시를 가지고 있다.";
    }
    
    if (show == "zebra_fish") {
      image (zebra_fish, width/2, 330, 220, 220);
      korname = "제브라다니오";
      explain = "은회색 빛의 몸에 가로줄 무늬가 얼룩말을 닮아 제브라다니오라는 이름을 가졌다. 빠른 유속의 개울부터 연못까지 다양한 환경에서 서식한다. 인간의 유전자와 많은 부분이 상당히 일치한다고 하여 실험 동물로도 많이 쓰인다.";
    }
    
    if (show == "toxotes_chatareus") {
      image (toxotes_chatareus, width/2, 330, 210, 210);
      korname = "물총고기";
      explain = "빨대로 물을 뿜어내듯 먹잇감을 향해 물을 쏘아 물 밖의 나뭇가지나 잎에 있는 곤충을 떨어뜨려 잡아먹는다. 가까운 거리의 곤충은 점프를 해서 잡아먹기도 한다.";
    }
    
    if (show == "razor_fish") {
      image (razor_fish, width/2+20, 330, 250, 250);
      korname = "레이저피쉬";
      explain = "생김새가 면도칼과 비슷해 레이저피쉬라는 이름을 가졌다. 가로로 헤엄치는 보통의 물고기들과 달리 아래로 향해 마치 물구나무를 선 것과 같은 모습으로 무리지어 유영한다.";
    }
    
    if (show == "garden_eel") {
      image (garden_eel, width/2 + 20, 330, 250, 250);
      korname = "가든일";
      explain = "정원에 있는 갈대나 풀잎이 바람에 흔들리는 모양을 닮았다고 하여 가든일이라고 부른다. 모래에 꼬리를 넣은 상태로 머리를 밖으로 길게 뺴고 살아가며 위험을 느끼면 구멍 속으로 들어가 숨는다.";
    }
    
    engname = show;
    
    fill (0);
    textFont(Bold);
    text (korname, width/2, 480);
    textFont(Light);
    textSize (15);
    text (engname, width/2, 500);
    textSize (18);
    fill (50);
    text (explain, width/2, 620, 350, 180);
    
    textFont(Bold);
    fill(0);engname = show;
  }
}

void aquarium() {
  
  image (mov1, 790, 790, 270, 270);
  image (mov2, 270, 550, 405, 486);
  image (mov3, 700, 340, 240, 338);
  
  image (frame1, 790, 790, 320, 320);
  image (frame2, 700, 340, 300, 430);
  image (frame3, 270, 550, 500, 600);
}

void feeding() {
  image (feed, 850, 200, 200, 200);
  
  if (havingfeed == true) {
    if (down == false) {
      fill (199, 157, 129);
      feedX = mouseX;
      feedY = mouseY;
      circle (feedX, feedY, 20);
      xPos = xPos + (mouseX - xPos) * 0.06;
      yPos = yPos + (mouseY - yPos) * 0.06;
      } else {
      circle (feedX, feedY, 20);
      if (feedY > 900) {
        down = false;
        havingfeed = false;
      } else {
        feedY = feedY + 10;
      }
    }
  } 

  image (gasteropelecus_strenicla, xPos-90, yPos+50, 200, 200);
}
