<?php

namespace ShyimBackendNotification;


use Shopware\Components\Plugin;
use Symfony\Component\DependencyInjection\ContainerBuilder;

/**
 * Class ShyimBackendNotification
 * @package ShyimBackendNotification
 */
class ShyimBackendNotification extends Plugin
{
    /**
     * @param ContainerBuilder $container
     */
    public function build(ContainerBuilder $container)
    {
        $container->setParameter('shyim_backend_notification.plugin_dir', $this->getPath());
        parent::build($container);
    }
}