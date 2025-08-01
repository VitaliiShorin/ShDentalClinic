# Стоматологическая клиника – iOS-приложение

> Современное мобильное приложение для стоматологической практики

## О проекте

iOS-приложение для стоматологической клиники, разработанное с использованием SwiftUI и архитектуры MVVM. Проект представляет собой комплексную систему управления записями пациентов, отзывами и административными задачами.

> **Внимание:** прототип создан для демонстрации функциональности. Реальной клиники не существует, в связи с чем приложение не опубликовано в App Store. Модель данных, врачи и отзывы — примерные, предназначены только для иллюстрации.

<div align="center">

## Скриншоты приложения

<img src="https://github.com/user-attachments/assets/279095f8-bde7-44f4-9b55-f369f36bc391" width="200" />
<img src="https://github.com/user-attachments/assets/caf35d71-34f0-4fe3-ae21-359a5e4d3d09" width="200" />
<img src="https://github.com/user-attachments/assets/97f368d1-d6dd-4cea-b9a2-0dbb70b5e058" width="200" />
<img src="https://github.com/user-attachments/assets/e160b9ea-2359-42dc-baab-81240f8d760e" width="200" />
<img src="https://github.com/user-attachments/assets/6b33d6eb-cf56-480f-995d-58f9442b9063" width="200" />
<img src="https://github.com/user-attachments/assets/745fdb29-ee4d-4066-a056-566fb93209dc" width="200" />
<img src="https://github.com/user-attachments/assets/0eb46c94-8956-430e-b666-0e1e27b55d58" width="200" />
<img src="https://github.com/user-attachments/assets/0b913088-f29c-4ddf-bd09-13eb31ea0dd3" width="200" />
<img src="https://github.com/user-attachments/assets/656dfdce-a89f-426c-87a1-d99228a6f670" width="200" />
<img src="https://github.com/user-attachments/assets/876ddae1-9d61-4e0c-9d44-72cdfbe67ee5" width="200" />
<img src="https://github.com/user-attachments/assets/c9134d69-af50-412c-b5e1-8dc1c6a19cfc" width="200" />
<img src="https://github.com/user-attachments/assets/decde432-bbe9-47ec-b61d-b18ff201e340" width="200" />
<img src="https://github.com/user-attachments/assets/2de7d2b6-3612-48df-ad22-af270f30b518" width="200" />
<img src="https://github.com/user-attachments/assets/47e4e611-92f4-43a5-9d82-8e033aef3bdb" width="200" />
<img src="https://github.com/user-attachments/assets/9f6bdef1-53fe-4c00-a618-d15feb1d400c" width="200" />
<img src="https://github.com/user-attachments/assets/161472d1-611b-468a-90bf-1c37f6426077" width="200" />
<img src="https://github.com/user-attachments/assets/f017e064-0910-4da4-8ec7-abfc1afcee89" width="200" />
<img src="https://github.com/user-attachments/assets/a98c2704-7280-4217-9b1a-dfd7b451d748" width="200" />
</div>

## Ключевые особенности

### 🏥 Управление записями
- Онлайн-запись к специалистам по выбранной дате и времени  
- Проверка доступности времени приема врача  
- Уведомления и подтверждения записи  
- Возможность отмены записи пациентом  

### 👤 Система пользователей
- Регистрация и авторизация пациентов  
- Личный кабинет с управлением профилем  
- Отдельный административный кабинет для персонала клиники  

### ⭐ Система отзывов
- Возможность оставлять и читать отзывы о врачах  
- Рейтинговая система со звездами  
- Персонализированные отзывы с датой и именем пациента  

### 📱 Современный UI/UX
- Адаптивный дизайн для iOS  
- Плавные анимации и переходы  
- Интуитивная навигация  

## Технические характеристики

### Технологический стек
- Фреймворк: SwiftUI  
- Архитектура: MVVM  
- База данных: Realm  
- Минимальная версия iOS: 15  

### Архитектурные решения
- Использование @EnvironmentObject для управления состоянием  
- Реактивное программирование с помощью свойств @Published    
- Модульная структура кода с разделением на компоненты  
- Обработка ошибок и валидация данных  

## Функциональные модули

### 📋 Основные экраны
- Главная страница — презентация клиники и быстрый доступ к основным разделам  
- Запись на прием — выбор врача, даты и времени  
- Каталог врачей — информация о специалистах с возможностью просмотра отзывов и перехода к записи на прием    
- Прайс-лист — стоимость услуг по категориям лечения и профилактики  
- Отзывы — система оценок и комментариев  
- Контакты — адрес, карта, режим работы клиники    

### 🔐 Система аутентификации
- Регистрация новых пользователей  
- Авторизация по номеру телефона и паролю  
- Восстановление и смена пароля  
- Административный доступ  

### 📊 Административная панель
- Просмотр всех записей пациентов на прием к врачам    
- Просмотр заявок на обратный звонок  
- Возможность очистки списка заявок и записей  

## Безопасность и производительность
- Хеширование паролей пользователей  
- Валидация входных данных
- Оптимизированные запросы к базе данных Realm  
- Ленивая загрузка изображений и контента  
- Обработка состояний загрузки и ошибок  

## Статус проекта

Приложение представляет собой полнофункциональный прототип, разработанный для потенциального внедрения в стоматологических клиниках. Все основные функции реализованы и протестированы, интерфейс адаптирован под различные размеры экранов iOS-устройств.  
Приложение можно быстро адаптировать под любое направление деятельности с системой записи на прием, возможностью оставлять отзывы и административным мониторингом.

## Возможности расширения

- Интеграция с внешними календарными системами  
- Push-уведомления о предстоящих записях  
- Система лояльности и скидок    
- Валидация через SMS-уведомление    
- Интеграция с картами, навигация до клиники  

## Установка и запуск

1. Клонируйте репозиторий  
2. Откройте проект в Xcode. Убедитесь, что установлен RealmSwift  
3. Запустите на симуляторе или физическом устройстве с iOS 15+  

## Контакты разработчика

**Имя:** Шорин Виталий Сергеевич

- Telegram: [https://t.me/Vitalii_SHN](URL)
- Email: [9971425@mail.ru](URL)
- GitHub: [https://github.com/VitaliiShorin](URL)

## P.S.

Проект открыт для предложений по развитию. Если вы представитель клиники или ищете разработчика для запуска ваших digital-продуктов — буду рад сотрудничеству!
