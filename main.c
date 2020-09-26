#include <stdio.h>
#include <string.h>

#define MAX_BUF  256

unsigned char getBit(unsigned char, int);
unsigned char setBit(unsigned char, int);
unsigned char clearBit(unsigned char, int);
unsigned char counterProcess(unsigned char, unsigned char);
unsigned char sourceByteProcess(unsigned char, unsigned char);
void encrypt(unsigned char, unsigned char);
void decrypt(unsigned char, unsigned char);
void printBits(unsigned char);


int main()
{
  char str[8];
  int  choice;
  unsigned char key = 178;
  unsigned char counter = '(';

  printf("\nYou may:\n");
  printf("  (1) Encrypt a message \n");
  printf("  (2) Decrypt a message \n");
  printf("\n  what is your selection: ");
  fgets(str, sizeof(str), stdin);
  sscanf(str, "%d", &choice);

  switch (choice) {

    case 1:
        encrypt(key, counter);
      break;

    case 2:

      break;

    default:

      break;
  }

  return 0;
}

void printBits(unsigned char c){
    for (int i = 7; i >=0 ; --i) {
        printf("%d", getBit(c, i));
        if (i % 4 == 0){
            printf(" ");
        }
    }

}

unsigned char setBit(unsigned char c, int n)
{
    unsigned char temp;
    temp = c | (1 << n);
    return temp;
}

unsigned char clearBit(unsigned char c, int n)
{
    unsigned char temp;
    temp = c & (~(1 << n));
    return temp;
}

unsigned char getBit(unsigned char c, int n)
{
    return (c & 1 << n) >> n;
}

unsigned char counterProcess(unsigned char key, unsigned char counter){
    unsigned char temp_counter = counter;
    int position1, position2, xor;
    for (int i = 7; i >= 0; --i) {
        position1 = i;
        if (getBit(key, position1) == 1){
            position2 = (position1 < 7) ? position1+1 : position1 - 7;
        }
        else if (getBit(key, position1) == 0){
            position2 = (position1 < 6) ? position1 +2 : position1 - 6;
        }

        xor =  getBit(temp_counter, position1) ^ getBit(temp_counter, position2);
        temp_counter = setBit(temp_counter, xor);
    }
    return temp_counter;
}

unsigned char sourceByteProcess(unsigned char source, unsigned char counter){
    unsigned char temp = source;
    int result = counter % 9;
    if (result < 3){
        for (int i = 0; i < 8; ++i) {
            if (i % 2  == 0){
                temp = (getBit(counter, i) ^ (getBit(temp, i) == 1)) ? setBit(temp, i) : clearBit(temp, i);
            }
        }
    }
    if (result >= 3 && result <= 5){
        for (int i = 1; i < 8; ++i) {
            if (i + 1 % 2 == 0){
                temp = (getBit(counter, i) ^ (getBit(temp, i) == 1)) ? setBit(temp, i) : clearBit(temp, i);
            }
        }
    }
    if (result > 5){
        for (int i = 0; i < 8; ++i) {
            temp = (getBit(counter, i) ^ (getBit(temp, i) == 1)) ? setBit(temp, i) : clearBit(temp, i);
        }
    }
    return temp;
}

void encrypt(unsigned char key, unsigned char counter){
    printf("\nYou may enter the message to be encrypted:\n");
    char message[MAX_BUF];
    fgets(message, sizeof(message), stdin);
    for (int i = 0; i < sizeof(message); ++i) {
        counter = counterProcess(key, counter);
        counter++;
        key++;
        message[i] = sourceByteProcess(message[i], counter);
        printf("%c", message[i]);
        printf(" ");
    }
}

void decrypt(unsigned char key, unsigned char counter){

}








