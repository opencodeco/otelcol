<?php

declare(strict_types=1);
/**
 * This file is part of Hyperf.
 *
 * @link     https://www.hyperf.io
 * @document https://hyperf.wiki
 * @contact  group@hyperf.io
 * @license  https://github.com/hyperf/hyperf/blob/master/LICENSE
 */

namespace App\Controller;

use Hyperf\Di\Annotation\Inject;
use Hyperf\Metric\Contract\MetricFactoryInterface;
use Hyperf\Metric\Metric;

class IndexController extends AbstractController
{
    #[Inject]
    private MetricFactoryInterface $metric;

    public function index()
    {
        $user = $this->request->input('user', 'Hyperf');
        $method = $this->request->getMethod();

        $this->metric->makeCounter('another_custom_counter', ['foo'])->with('bar')->add(1);

        Metric::count('my_custom_counter', 1, ['foo' => 'bar']);

        return [
            'method' => $method,
            'message' => "Hello {$user}.",
        ];
    }
}
