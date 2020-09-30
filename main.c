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


int main()
{
  char str[8];
  int  choice;
  unsigned char key = 178;
  unsigned char counter = 40;
  //71 73 227 33 2 32 150 11 175 158 79 77 162 101 197 247 116 219 37 18 76 0 254 120 210 32 146 13 58 32 73 226 195 226 102 109 115 129 170 192 19 50 30 162 124 46 33 73 76 187 245 46 62 122 138 36 80 109 176 91 113 224 109 222 219 11 175 49 97 43 61 4 53 113 99 69 77 231 43 123 121 125 143 79 224 40 105 79 84 117 248 55 197 62 42 159 225 204 14 162 213 24 164 -1


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
        decrypt(key, counter);

      break;

    default:
        printf("Thank you for Trying the Program.");

      break;
  }

  return 0;
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

//Modifies the counter
unsigned char counterProcess(unsigned char key, unsigned char counter){
    unsigned char temp_counter = counter;
    int position1, position2;
    for (int i = 7; i >= 0; --i) {
        position1 = i;
        if (getBit(key, position1) == 1){
            position2 = (position1 < 7) ? position1+1 : position1 - 7;
        }
        else if (getBit(key, position1) == 0){
            position2 = (position1 < 6) ? position1 +2 : position1 - 6;
        }

        temp_counter = ((getBit(temp_counter, position1) ^ getBit(temp_counter, position2)) == 1) ?
                setBit(temp_counter, i): clearBit(temp_counter, i);
    }
    return temp_counter;
}

//Modifies the source byte using updated counter
unsigned char sourceByteProcess(unsigned char source, unsigned char counter){
    unsigned char temp = source;
    int result = counter % 9;
    if (result < 3){
        for (int i = 0; i < 8; ++i) {
            if (i % 2  == 0){
                temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                        setBit(temp, i) : clearBit(temp, i);
            }
        }
    }
    if (result >= 3 && result <= 5){
        for (int i = 1; i < 8; ++i) {
            if ((i + 1) % 2 == 0){
                temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                        setBit(temp, i) : clearBit(temp, i);
            }
        }
    }
    if (result > 5){
        for (int i = 0; i < 8; ++i) {
            temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                    setBit(temp, i) : clearBit(temp, i);
        }
    }
    return temp;
}

void encrypt(unsigned char key, unsigned char counter){
    printf("\nYou may enter the message to be encrypted:\n");
    unsigned char message[MAX_BUF];
    fgets(message, MAX_BUF, stdin);
    for (int i = 0; message[i] != '\0'; ++i) {
        counter = counterProcess(key, counter);
        counter++;
        key++;
        message[i] = sourceByteProcess(message[i], counter);
        printf("%d ", message[i]);
    }
}

void decrypt(unsigned char key, unsigned char counter){
    printf("\nYou may enter the message to be decrypted:\n");
    int input[MAX_BUF];
    unsigned char ciphertext[MAX_BUF];
    char c;
    int n = 0;
    while ((c = getchar()) != '\n'){
        ungetc(c, stdin);
        scanf("%d", &input[n++]);
    }


    for (int i = 0; input[i] != -1 && i < MAX_BUF; ++i) {
        ciphertext[i] = (unsigned char) input[i];
        counter = counterProcess(key, counter);
        counter++;
        key++;
        ciphertext[i] = sourceByteProcess(ciphertext[i], counter);
        printf("%c", ciphertext[i]);
    }
}








