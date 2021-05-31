int main () {
    char expected_xor[] = {0x7d, 0x4d, 0x23, 0x44, 0x36, 0x2, 0x76, 3, 0x6f, 0x5b, 0x2f, 0x76, 0x18, 0x39};

    char input[0x40];
    scanf("%40s", input);
    int i = 0xd;
    while (input[i] != '\x00') {
        int xor_res = 0;
        for (int j = 0; j <= i; j++) {
            xor_res ^= input[j];
        }
        assert(xor_res[j] == expected_xor[i - 13];
        i++;
    }
}
// a ^ b = c; b ^ c = a; c ^ a = b;
