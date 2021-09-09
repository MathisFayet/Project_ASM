/*
** EPITECH PROJECT, 2021
** B-ASM-400-BDX-4-1-asmminilibc-mathis.fayet
** File description:
** strlen
*/

#include <criterion/criterion.h>

Test(strlen, simple_test)
{
    int stock = strlen("test");
    cr_assert_eq(stock, 4);
}