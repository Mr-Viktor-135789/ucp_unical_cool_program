while ($true) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] Начинаю синхронизацию..." -ForegroundColor Cyan
    
    cd C:\Users\victo\Desktop\git_hub
    
    # Получаем текущую ветку
    $branch = git branch --show-current
    
    # Пытаемся получить изменения
    git pull origin $branch 2>$null
    
    # Добавляем все изменения
    git add .
    
    # Проверяем, есть ли изменения
    if (git status --porcelain) {
        git commit -m "Auto-sync: $timestamp"
        git push origin $branch
        Write-Host "[$timestamp] ✅ Изменения отправлены" -ForegroundColor Green
    } else {
        Write-Host "[$timestamp] ⏸️  Нет изменений" -ForegroundColor Yellow
        # Все равно пушим, если были изменения на сервере
        git push origin $branch 2>$null
    }
    
    # Ждем 30 минут (1800 секунд)
    Write-Host "⏳ Ожидание 30 минут до следующей синхронизации..." -ForegroundColor Magenta
    Start-Sleep -Seconds 1800
}
