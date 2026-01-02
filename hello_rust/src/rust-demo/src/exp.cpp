#include <vector>
#include <iostream>

int main() {
    std::vector<int> data = {1, 2, 3, 4, 5};

    // Прямой обход
    for(auto it = data.begin(); it != data.end(); ++it) {
        std::cout << *it << " "; // Можно изменять элементы
    }
    std::cout << std::endl;

    // Константный прямой обход
    for(auto it = data.cbegin(); it != data.cend(); ++it) {
        // *it = 10; // Ошибка компиляции - нельзя изменять
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // Обратный обход
    for(auto it = data.rbegin(); it != data.rend(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    return 0;
}
