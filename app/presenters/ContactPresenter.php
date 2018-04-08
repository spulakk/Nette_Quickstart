<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\Mail\Message;
use Nette\Mail\SendmailMailer;

class ContactPresenter extends Nette\Application\UI\Presenter
{
    protected function createComponentContactForm() {
        $form = new Form;

        $form->addText('name', 'Jméno')->setRequired();

        $form->addTextArea('content', 'obsah')->setRequired();

        $form->addSubmit('send', 'Odeslat');

        $form->onSuccess[] = [$this, 'contactFormSucceeded'];

        return $form;
    }

    public function contactFormSucceeded($form, $values) {
        $mail = new Message;

        $mail->setFrom($values->name . '@netteblog.cz')
            ->addTo('spulak.k@seznam.cz')
            ->setSubject('Zpráva z Nette blogu')
            ->setBody($values->content);

        $mailer = new SendmailMailer;
        $mailer->send($mail);
    }
}