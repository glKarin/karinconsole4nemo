#include "MButton.h"

#include <QCheckBox>
#include <QPushButton>

MButton::MButton(QGraphicsProxyWidget *parent)
	: QGraphicsProxyWidget(parent),
	type(MButtonType::generalType),
	checkbox(0),
	pushbutton(0)
{
	setButton();
}

MButton::~MButton()
{
}

void MButton::setCheckable(bool b)
{
	QAbstractButton *btn;
	
	btn = button();
	if(btn)
		btn->setCheckable(b);
}

void MButton::setChecked(bool b)
{
	QAbstractButton *btn;
	
	btn = button();
	if(btn)
		btn->setChecked(b);
}

void MButton::setEnabled(bool b)
{
	QAbstractButton *btn;
	
	btn = button();
	if(btn)
		btn->setEnabled(b);
}

QAbstractButton * MButton::button()
{
	QWidget *w;

	w = widget();

	if(!w)
		return 0;
	switch(type)
	{
		case MButton::checkboxType:
		case MButton::switchType:
			return checkbox;
		default:
			return pushbutton;
	}
}

void MButton::setViewType(MButton::MButtonType t)
{
	if(type == t)
		return;
	type = t;
}

void MButton::setButton()
{
	QAbstractButton *btn;

	btn = button();
	if(type == MButton::checkboxType || type == MButtonType::switchType)
	{
		if(btn)
		{
			if(btn == checkbox)
				return;
			else
			{
				setWidget(0);
				disconnect(btn, 0, 0, 0);
				delete pushbutton;
				pushbutton = 0;
			}
		}
		if(!checkbox)
			checkbox = new QCheckBox;
		
		setWidget(checkbox);
		connect(checkbox, SIGNAL(clicked(bool)), this, SIGNAL(clicked(bool)));
		connect(checkbox, SIGNAL(pressed()), this, SIGNAL(pressed()));
		connect(checkbox, SIGNAL(released()), this, SIGNAL(released()));
		connect(checkbox, SIGNAL(toggled(bool)), this, SIGNAL(toggled(bool)));
	}
	else
	{
		if(btn)
		{
			if(btn == pushbutton)
				return;
			else
			{
				setWidget(0);
				disconnect(btn, 0, 0, 0);
				delete checkbox;
				checkbox = 0;
			}
		}
		if(!pushbutton)
			pushbutton = new QPushButton;
		
		setWidget(pushbutton);
		connect(pushbutton, SIGNAL(clicked(bool)), this, SIGNAL(clicked(bool)));
		connect(pushbutton, SIGNAL(pressed()), this, SIGNAL(pressed()));
		connect(pushbutton, SIGNAL(released()), this, SIGNAL(released()));
		connect(pushbutton, SIGNAL(toggled(bool)), this, SIGNAL(toggled(bool)));
	}
}

void MButton::disconnectSignals()
{
	QAbstractButton *btn = button();
	if(btn)
	{
		disconnect(btn, 0, 0, 0);
	}
}
