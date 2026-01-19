#include <fcgi_stdio.h>

int main() {
    while (FCGI_Accept() >= 0) {
        printf("Content-type: text/html\r\n\r\n");
        printf("<html><head><title>Hello World</title></head>\n");
        printf("<body><h1>Hello, World!</h1></body></html>\n");
    }
    return 0;
}
