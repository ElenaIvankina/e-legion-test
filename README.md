# e-legion-test

## Тестовое задание e-legion

Положение пользователя определяется с помощью CLLocationManager, по умолчанию проставлены координаты Москвы, на симуляторе можно включить симуляцию геолокации тоже с г. Москва, через реальное устройство можно получить настояющую геопозицию.

Изначально дефолтный пользователь, от которого считается расстояние у других - пользователь приложения (Я) - информация закреплена в header, при нажатии на пользователя из списка, (Я) помещается в список пользователей, пользователь становятся выбранным пользователем и помещается в header.
Смениться он может в 2 случаях: 
1. при повторном нажатии на пользователя в header - возвращается дефолтный пользователь (Я) 
2. при нажатии на другого пользователя из списка - они меняются местами

Каждые 3 секунды положение людей меняется со случайным смещением, расположение пользователей в таблице отсортировано по возрастанию расстояния от выбранного пользователя.

<img width="167" alt="Снимок экрана 2023-03-14 в 16 50 05" src="https://user-images.githubusercontent.com/21302465/225022404-b2a043e2-4e5c-4553-97c2-3b9cc591e08f.png">



