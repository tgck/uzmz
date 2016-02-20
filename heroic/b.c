#include <stdio.h>
#include <time.h>

/* 
 * コンソールでアニメーション表示 (CRのプリント)
   http://www.mm2d.net/main/legacy/c/c-04.html
 */

void hoge();

int main(){
  int i;
  int times=200;
  setbuf(stderr,NULL);
  for(i=0;i<times;i++){
  /* 適当な処理 */
    hoge();
  /* 進行状況の表示 */
    fprintf(stderr,"%3.1d / 200\r",i+1);
  }
  fprintf(stderr,"\nfinish!!\n");
}

/* 適当な処理をする関数、
いい表現方法が思い浮かばなかったんですんません */
void hoge(){
  clock_t t;
  /* 時間待ち開始 */
  t = clock() + CLOCKS_PER_SEC/20;
  while(t>clock());
  /* 時間待ち終了 */
}
