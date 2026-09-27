<?php namespace Tests\Feature; use Tests\TestCase; class ExampleTest extends TestCase { public function test_example() { $this->get('/api/v1/health')->assertStatus(200); } }
