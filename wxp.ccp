class Solution {
public:
    int findLongestChain(vector<vector<int>>& pairs) {
        // Шаг 1: Сортируем интервалы по правому концу
        sort(pairs.begin(), pairs.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[1] < b[1];
        });
        
        // Шаг 2: Жадный выбор интервалов
        int count = 0;                // Количество выбранных интервалов
        int current_end = INT_MIN;    // Конец последнего выбранного интервала
        
        for (const auto& p : pairs) {
            if (p[0] > current_end) {  // Если интервал начинается после конца предыдущего
                count++;               // Добавляем интервал в цепочку
                current_end = p[1];    // Обновляем конец цепочки
            }
        }
        
        return count;  // Длина самой длинной цепочки
    }
};