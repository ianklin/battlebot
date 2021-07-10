class Monster {
  //variables
  PImage image;
  String id;
  String type;
  float attack;
  float defense;
  float chealth; //current health
  float maxhealth;
  float speed;
  Moves move1, move2, move3, move4;
  Moves moveset[] = new Moves[4];
  
  //PImage[] sprites; //monster sprites
  //private Timer keyTimer = new Timer(40);
  final int h = 16;
  final int w = 16;
  int x = 400;
  int y = 400;
  final int scale = 2;
  Spritesheet animations;
  
  //constructor




    


  public Monster(String id, Monster enemy, int x, int y) {

    this.id = id;
    type = monsterDatabase.get(id).getString("type");
    attack = monsterDatabase.get(id).getFloat("attack");
    defense = monsterDatabase.get(id).getFloat("defense");
    maxhealth = monsterDatabase.get(id).getFloat("maxhealth");
    chealth = maxhealth;
    speed = monsterDatabase.get(id).getFloat("speed");
    image = spritesHm.get(monsterDatabase.get(id).getString("image"));
    animations = new Spritesheet(this.image, 120);
    animations.setxywh(x, y, w*scale, h*scale);
    int frameNum = image.width/16;
    int[] frameNums = new int[frameNum];
    for(int i = 0; i < frameNum; i++){
      frameNums[i] = i;
    }
    animations.createAnimation("default", frameNums);
    
    move1 = new Moves(monsterDatabase.get(id).getString("move1"));
    move2 = new Moves(monsterDatabase.get(id).getString("move2"));
    move3 = new Moves(monsterDatabase.get(id).getString("move3"));
    move4 = new Moves(monsterDatabase.get(id).getString("move4"));
    moveset[0] = move1;
    moveset[1] = move2;
    moveset[2] = move3;
    moveset[3] = move4;
    
    move1.target = enemy;
    move2.target = enemy;
    move3.target = enemy;
    move4.target = enemy;
    println(id + type + attack + defense + maxhealth + speed + monsterDatabase.get(id).getString("image"));
    this.x = x;
    this.y = y;
  }
  

  public void display(){
    
    color(0,0,200);
    fill(250, 229, 127);
    rect(x-60,y-100,170,60);
    fill(158,0,0);
    rect(x-55,y-75,150,25);
    fill(0,158,0);
    rect(x-55,y-75,(chealth/maxhealth)*150,25);
    fill(0,0,0);
    textAlign(LEFT, UP);
    text(id,x-54,y-80);
    textAlign(CENTER, CENTER);
    text(chealth + "/" + maxhealth, x+20, y-62);
    //pop();
    //if(animations.animationTimer.countDownUntil(animations.stoploop)){
    //  animations.changeDisplay(true);
    //}
    animations.play("default");
  }
  public void addHp(int hp){
    if (this.chealth + hp >= this.maxhealth) {
      this.chealth = this.maxhealth;
    }else{
      this.chealth += hp;
    }
  }
  
}
