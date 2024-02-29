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
return [
    \Psr\EventDispatcher\EventDispatcherInterface::class => static function (\Psr\Container\ContainerInterface $container): \Psr\EventDispatcher\EventDispatcherInterface {
        return new \Hyperf\Event\EventDispatcher($container->get(\Psr\EventDispatcher\ListenerProviderInterface::class));
    },
];
