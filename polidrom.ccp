class Solution {
public:
    int countSubstrings(string s) {
        int count = 0;
        
        for (auto mid = s.begin(); mid != s.end(); ++mid) {
            // Нечетные палиндромы
            auto left = mid, right = mid;
            while (left >= s.begin() && right < s.end() && *left == *right) {
                ++count;
                --left;
                ++right;
            }
            
            // Четные палиндромы
            left = mid;
            right = mid + 1;
            while (left >= s.begin() && right < s.end() && *left == *right) {
                ++count;
                --left;
                ++right;
            }
        }
        
        return count;
    }
};