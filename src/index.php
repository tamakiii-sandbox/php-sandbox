<?php

namespace TamakiiiSandbox\PhpSandbox;

class Index
{
    public function hi($users)
    {
        if (!is_iterable($users)) {
            throw new \InvalidArgumentException('Users must be iterable');
        }
    }
}
