#define MAX_BUF  256

unsigned char getBit(unsigned char, int);
unsigned char setBit(unsigned char, int);
unsigned char clearBit(unsigned char, int);
unsigned char counterProcess(unsigned char, unsigned char);
unsigned char sourceByteProcess(unsigned char, unsigned char);
void encrypt(unsigned char, unsigned char, unsigned char*);
void decrypt(unsigned char, unsigned char, int[]);


// int main()
// {
//   char str[8];
//   int  choice;
//   unsigned char key = 178; 
//   unsigned char counter = 40; //'('


//   printf("\nYou may:\n");
//   printf("  (1) Encrypt a message \n");
//   printf("  (2) Decrypt a message \n");
//   printf("\n  what is your selection: ");
//   fgets(str, sizeof(str), stdin);
//   sscanf(str, "%d", &choice);

//   switch (choice) {

//     case 1:
//         encrypt(key, counter);
//       break;

//     case 2:
//         decrypt(key, counter);

//       break;

//     default:
//         printf("Thank you for Trying the Program.");

//       break;
//   }

//   return 0;
// }

unsigned char setBit(unsigned char c, int n) //set the bit to 1 at position n
{
    unsigned char temp;
    temp = c | (1 << n);
    return temp;
}

unsigned char clearBit(unsigned char c, int n) //clear the bit to 0 at position n
{
    unsigned char temp;
    temp = c & (~(1 << n));
    return temp;
}

unsigned char getBit(unsigned char c, int n) //return the bit at position n
{
    return (c & 1 << n) >> n;
}

//Modifies the counter with the key
unsigned char counterProcess(unsigned char key, unsigned char counter){
    unsigned char temp_counter = counter;
    int position1, position2;
    for (int i = 7; i >= 0; --i) {
        position1 = i;
        // if the key bit at the current bit position is 1, then position 2 is set to one bit position to the left of the current bit position.
        if (getBit(key, position1) == 1){
            position2 = (position1 < 7) ? position1+1 : position1 - 7;
        }
        // if the key bit at the current bit position is 0, then position 2 is set to two bit positions to the left of the current bit position
        else if (getBit(key, position1) == 0){
            position2 = (position1 < 6) ? position1 +2 : position1 - 6;
        }
        //xor the two temp counter bits found at positions 1 and 2, set the temp counter bit at the current bit position to the result of the xor operation
        temp_counter = (getBit(temp_counter, position1) ^ getBit(temp_counter, position2)) == 1 ?
                setBit(temp_counter, i): clearBit(temp_counter, i);
    }
    return temp_counter;
}

//Modifies the source byte with the updated counter
unsigned char sourceByteProcess(unsigned char source, unsigned char counter){
    unsigned char temp = source;
    int result = counter % 9;
    if (result < 3){
        for (int i = 0; i < 8; ++i) {
            //at every other bit position, compute the xor of the source bit and the counter bit, and set the temp value bit to the result of the xor operation
            if (i % 2  == 0){
                temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                        setBit(temp, i) : clearBit(temp, i);
            }
        }
    }

    if (result >= 3 && result <= 5){
        for (int i = 1; i < 8; ++i) {
            //at every other bit position, compute the xor of the source bit and the counter bit, and set the temp value bit to the result of the xor operation

            if ((i + 1) % 2 == 0){
                temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                        setBit(temp, i) : clearBit(temp, i);
            }
        }
    }
    if (result > 5){
        for (int i = 0; i < 8; ++i) {
            //at every bit position, compute the xor of the source bit and the counter bit, and set the temp value bit to the result of the xor operation
            temp = ((getBit(counter, i) ^ (getBit(temp, i))) == 1) ?
                    setBit(temp, i) : clearBit(temp, i);
        }
    }
    return temp;
}

//encrypt users input
void encrypt(unsigned char key, unsigned char counter, unsigned char* message){
    // printf("\nYou may enter the message to be encrypted:\n");
    // unsigned char message[MAX_BUF];
    // fgets(message, MAX_BUF, stdin); //getting user input and store in an unsigned char array.

    
    // printf("\nHere's your message after encryption: \n\n");

    for (int i = 0; message[i] != '\0'; ++i) {
        counter = counterProcess(key, counter);
        counter++;
        key++;
        message[i] = sourceByteProcess(message[i], counter);
        // printf("%d ", message[i]);
    }
}

//decrypt the ciphertext from user
void decrypt(unsigned char key, unsigned char counter, int ciphertext[]){
    // printf("\nYou may enter the message to be decrypted:\n");
    // int ciphertext[MAX_BUF];
    // char c;
    // int n = 0;
    // while ((c = getchar()) != '\n'){
    //     //scan the numerical value seperated by " " and store them in the int array, until the next line.
    //     ungetc(c, stdin);
    //     scanf("%d", &ciphertext[n++]);
    // }

    // printf("\nHere's your message after decryption: \n\n");


    for (int i = 0; ciphertext[i] != -1 && i < MAX_BUF; ++i) {
        //decipher text until -1 is seen
        counter = counterProcess(key, counter);
        counter++;
        key++;
        ciphertext[i] = sourceByteProcess(ciphertext[i], counter);
        // printf("%c", ciphertext[i]);
    }
}








