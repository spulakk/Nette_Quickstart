<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;

class ChatPresenter extends Nette\Application\UI\Presenter
{
    private $database;

    public function __construct(Nette\Database\Context $database)
    {
        $this->database = $database;
    }

    public function renderDefault()
    {
        $this->template->chat = $this->database->table('chat')
            ->order('created_at');
    }

    protected function createComponentChatForm()
    {
        $form = new Form;

        $form->addText('name', 'Jméno:')->setRequired();

        $form->addTextArea('content', 'Zpráva:')->setRequired();

        $form->addSubmit('send', 'Odeslat');

        $form->onSuccess[] = [$this, 'chatFormSucceeded'];

        return $form;
    }

    public function chatFormSucceeded($form, $values)
    {
        $this->database->table('chat')->insert($values);

        $this->redirect('this');
    }
}