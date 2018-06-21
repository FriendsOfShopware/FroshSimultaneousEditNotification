<?php

namespace FroshSimultaneousEditNotification;

use Shopware\Components\Plugin;
use Symfony\Component\DependencyInjection\ContainerBuilder;

class FroshSimultaneousEditNotification extends Plugin
{
    /**
     * @param ContainerBuilder $container
     */
    public function build(ContainerBuilder $container)
    {
        $container->setParameter('frosh_simultaneous_edit_notification.plugin_dir', $this->getPath());
        parent::build($container);
    }
}
