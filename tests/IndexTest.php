<?php

namespace TamakiiiSandbox\PhpSandbox\Test;

use TamakiiiSandbox\PhpSandbox\Index;
use PHPUnit\Framework\TestCase;

class IndexTest extends TestCase
{
    protected function setUp() : void
    {
        $this->index = new Index;
    }

    /**
     * @test
     */
    public function hi_throws_exception_if_argument_not_iterable()
    {
        $users = null;
        $this->index->hi($users);
    }
}
