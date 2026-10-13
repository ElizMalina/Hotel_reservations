<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text>ТЕХНИЧЕСКОЕ ЗАДАНИЕ — HotelBooking&#10;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ОбщееОписание">
        <xsl:text>1) ОПИСАНИЕ&#10;</xsl:text>
        <xsl:text>Наименование: </xsl:text>
        <xsl:value-of select="normalize-space(Наименование)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Предметная область: </xsl:text>
        <xsl:value-of select="normalize-space(ПредметнаяОбласть)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Цель: </xsl:text>
        <xsl:value-of select="normalize-space(Цель)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Назначение отзывов: </xsl:text>
        <xsl:value-of select="normalize-space(НазначениеОтзывов)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Оплата: </xsl:text>
        <xsl:value-of select="normalize-space(Оплата)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Медиа в отзывах: </xsl:text>
        <xsl:value-of select="normalize-space(МедиаВОтзывах)"/>
        <xsl:text>&#10;&#10;</xsl:text>

        <xsl:text>Техподдержка: </xsl:text>
        <xsl:value-of select="normalize-space(Техподдержка)"/>
        <xsl:text>&#10;&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="Данные">
        <xsl:text>2) ДАННЫЕ&#10;</xsl:text>
        <xsl:apply-templates select="Сущность"/>
    </xsl:template>

    <xsl:template match="Сущность">
        <xsl:text>&#10;Сущность: </xsl:text>
        <xsl:value-of select="Имя"/>
        <xsl:text> — </xsl:text>
        <xsl:value-of select="normalize-space(Описание)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="Атрибут">
            <xsl:text>   * </xsl:text>
            <xsl:value-of select="Имя"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="Тип"/>
            <xsl:text>) — </xsl:text>
            <xsl:value-of select="normalize-space(Ограничения)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:if test="ОбщиеОграничения">
            <xsl:text>   Общие ограничения: </xsl:text>
            <xsl:value-of select="normalize-space(ОбщиеОграничения)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ПользовательскиеРоли">
        <xsl:text>&#10;3) ПОЛЬЗОВАТЕЛЬСКИЕ РОЛИ&#10;</xsl:text>
        <xsl:for-each select="Роль">
            <xsl:text>&#10;Роль: </xsl:text>
            <xsl:value-of select="Наименование"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>   Ответственность: </xsl:text>
            <xsl:value-of select="normalize-space(Ответственность)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>   Количество пользователей: </xsl:text>
            <xsl:value-of select="normalize-space(КоличествоПользователей)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>   UI: </xsl:text>
            <xsl:value-of select="normalize-space(UI)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ТехнологияРазработки">
        <xsl:text>&#10;4) ТЕХНОЛОГИЯ РАЗРАБОТКИ&#10;</xsl:text>
        <xsl:text>Язык программирования: </xsl:text>
        <xsl:value-of select="normalize-space(ЯзыкПрограммирования)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>СУБД: </xsl:text>
        <xsl:value-of select="normalize-space(СУБД)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Библиотеки: </xsl:text>
        <xsl:value-of select="normalize-space(Библиотеки)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Архитектура: </xsl:text>
        <xsl:value-of select="normalize-space(Архитектура)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:if test="ДополнительныеБиблиотеки">
            <xsl:text>Дополнительные библиотеки: </xsl:text>
            <xsl:value-of select="normalize-space(ДополнительныеБиблиотеки)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ФункциональныеТребования">
        <xsl:text>&#10;5) ФУНКЦИОНАЛЬНЫЕ ТРЕБОВАНИЯ&#10;</xsl:text>

        <xsl:text>&#10;5.1. Оплата (транзакции)&#10;</xsl:text>
        <xsl:for-each select="ОплатаТранзакции/Пункт">
            <xsl:text>   * </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>

        <xsl:text>&#10;5.2. Медиа в отзывах&#10;</xsl:text>
        <xsl:for-each select="МедиаВОтзывахТребования/Пункт">
            <xsl:text>   * </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>

        <xsl:text>&#10;5.3. Техподдержка (приватные диалоги)&#10;</xsl:text>
        <xsl:for-each select="ТехподдержкаТребования/Пункт">
            <xsl:text>   * </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>

        <xsl:text>&#10;5.4. Рейтинг и сортировка отелей&#10;</xsl:text>
        <xsl:for-each select="РейтингСортировка/Пункт">
            <xsl:text>   * </xsl:text>
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="Тестирование">
        <xsl:text>&#10;6) ТЕСТИРОВАНИЕ&#10;</xsl:text>
        <xsl:text>Виды тестирования: </xsl:text>
        <xsl:value-of select="normalize-space(ВидыТестирования)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each select="ТестовыеСценарии/Сценарий">
            <xsl:text>&#10;Сценарий: </xsl:text>
            <xsl:value-of select="normalize-space(Название)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>   Шаги: </xsl:text>
            <xsl:value-of select="normalize-space(Шаги)"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>   Ожидаемый результат: </xsl:text>
            <xsl:value-of select="normalize-space(ОжидаемыйРезультат)"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
