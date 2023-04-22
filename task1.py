import re

def fix_special_numbers(string):
    # Регулярное выражение для поиска особых номеров
    pattern = r"\b(\d{2,4}\\\d{2,5})\b"
    
    # Функция замены найденного особенного номера на хороший номер
    def replace_number(match):
        special_number = match.group(1)
        # Разделяем особенный номер на две части по символу '\'
        parts = special_number.split('\\')
        # Дополняем каждую часть нулями слева
        good_number = parts[0].zfill(4) + '\\' + parts[1].zfill(5)
        return good_number
    
    # Заменяем каждый найденный особенный номер на хороший номер
    result = re.sub(pattern, replace_number, string)
    
    return result


string = "Адрес 5467\\456. Номер 405\\549. valid number 0320\\00777"
result = fix_special_numbers(string)
print(result)

