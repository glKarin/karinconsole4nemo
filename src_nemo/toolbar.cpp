#include "toolbar.h"

#include "key.h"
#include "k.h"

#include "MTerminalDisplay.h"

#include <QPainter>
#include <QStyleOptionGraphicsItem>
#include <QDebug>
#include <QGraphicsScene>
#include <QTimer>


karin::toolbar::toolbar(QGraphicsWidget *parent)
	: karin::list_view(parent),
	m_terminalDisplay(0),
	m_activeToolbarIndex(-1),
	m_touchId(-1),
	m_timer(new QTimer(this)),
	m_touchKey(0),
	m_pressed(false)
{
	setBgColor(QColor(255, 255, 255));
	setAutoFixedSize(true);
	m_lastPos.setX(-1);
	m_lastPos.setY(-1);
	setFixedHeight(M_FixedHeight);

	m_timer->setInterval(karin::toolbar::M_PressInterval);
	m_timer->setSingleShot(true);
	connect(m_timer, SIGNAL(timeout()), this, SLOT(clickSlot()));

	updateToolbarDirectory();

	setObjectName(OBJECTNAME_TOOLBAR);
}

karin::toolbar::~toolbar()
{
}

void karin::toolbar::addAction(karin::base_key *action, int i)
{
	if(!action)
		return;

	addItem(action, i);
	action->setFixedWidth(64);
	QFont f = font();
	f.setPixelSize(24);
	action->setFont(f);
	connect(action, SIGNAL(sendKeySignal(unsigned, unsigned, bool)), this, SLOT(sendKeySlot(unsigned, unsigned, bool)));
}

void karin::toolbar::setFixedHeight(int h)
{
	m_fixedHeight = h;
	setMinimumHeight(m_fixedHeight);
	setMaximumHeight(m_fixedHeight);
	setPreferredHeight(m_fixedHeight);
	K_SET_HEIGHT(this, m_fixedHeight);
}

karin::base_key * karin::toolbar::getAction(const QString &name)
{
	karin::base_key *key;
	QList<QGraphicsWidget *> actions = items();
	K_FOREACH_CONST(QList<QGraphicsWidget *>, actions)
	{
		key = static_cast<base_key *>(*itor);
		if(key->name() == name)
			return key;
	}
	return 0;
}

bool karin::toolbar::touchKey(const QTouchEvent *event)
{
	QGraphicsWidget *w;
	const QTouchEvent::TouchPoint *e;
	const QGraphicsScene *scene;
	if(!event)
		return false;

	scene = QGraphicsWidget::scene();
	if(!scene)
		return false;

	const QList<QTouchEvent::TouchPoint> &points = event->touchPoints();
	if(points.isEmpty())
		return false;

	switch(event->type())
	{
		case QEvent::TouchBegin:
			{
				if(m_touchId == -1)
				{
					e = &(points[0]);
					QList<QGraphicsItem *> items = scene->items(e->scenePos());
					if(items.size() > 0)
					{
						w = dynamic_cast<QGraphicsWidget *>(items[0]);
						if(w && Object_IsType(w, OBJECTNAME_BASE_KEY))
						{
							m_touchKey = (static_cast<karin::base_key *>(w));
							if(m_touchKey)
							{
								m_pressed = false;
								m_touchId = e->id();
								m_lastPos = e->scenePos();
								m_timer->start();
								return true;
							}
						}
					}
				}
			}
			break;
		case QEvent::TouchUpdate:
			{
				if(m_touchId != -1)
				{
					m_timer->stop();
					if(m_pressed)
						clickSlot();
					m_touchId = -1;
					m_touchKey = 0;
					m_pressed = false;
					m_lastPos.setX(-1);
					m_lastPos.setY(-1);
					return true;
				}
				break;
			}
		case QEvent::TouchEnd:
		case QEvent::TouchCancel:
			{
				//if(m_touchKey) // touch point not move
				if(m_touchId != -1)
				{
					K_FOREACH_CONST(QList<QTouchEvent::TouchPoint>, points)
					{
						if(itor->id() != m_touchId)
							continue;
						if(m_pressed)
						{
							m_timer->stop();
							m_pressed = false;
							m_touchKey->touchEvent(false);
							m_touchKey = 0;
							m_touchId = -1;
							m_lastPos.setX(-1);
							m_lastPos.setY(-1);
						}
						else
						{
							m_pressed = true;
							m_touchKey->touchEvent(true);
						}
						return true;
					}
				}
			}
			break;
		default:
			return false;
	}
	return false;
}

void karin::toolbar::clickSlot()
{
	if(!m_touchKey)
		return;
	if(!m_pressed) // click
	{
		m_touchKey->touchEvent(true); // press key
		m_pressed = true;
	}
	else
	{
		m_touchKey->touchEvent(false); // release key, maybe second call this slot.
		m_touchId = -1;
		m_touchKey = 0;
		m_lastPos.setX(-1);
		m_lastPos.setY(-1);
		m_timer->stop();
	}
}

bool karin::toolbar::sceneEvent(QEvent *e)
{
	switch (e->type()) {
		case QEvent::TouchBegin: 
			{
				touchKey(static_cast<QTouchEvent *>(e));
				return karin::list_view::sceneEvent(e);
			}
		case QEvent::TouchUpdate:
		case QEvent::TouchEnd:
		case QEvent::TouchCancel:
			{
				touchKey(static_cast<QTouchEvent *>(e));
			}
			break;
		default:
			break;
	}
	return karin::list_view::sceneEvent(e);
}

void karin::toolbar::sendKeySlot(unsigned key, unsigned modifier, bool pressed)
{
	if(m_terminalDisplay)
	{
		//QKeyEvent key_event(pressed ? QEvent::KeyPress : QEvent::KeyRelease, key, static_cast<Qt::KeyboardModifier>(modifier), QString(key)/*, const QString &text = QString(), bool autorep = false, ushort count = 1*/);
		//QApplication::sendEvent(m_terminalDisplay, &key_event);
		//m_terminalDisplay->setFocus(Qt::MouseFocusReason);
		(static_cast<MTerminalDisplay *>(m_terminalDisplay))->recvKeySlot(key, modifier, pressed);
	}
	emit sendKeySignal(key, modifier, pressed);
}

void karin::toolbar::bindTerminalDisplay(QGraphicsWidget *term)
{
	if(m_terminalDisplay != term)
	{
		m_terminalDisplay = term;
		reset();
	}
	/*
		 if(m_terminalDisplay)
		 connect(this, SIGNAL(sendKeySignal(unsigned, unsigned, bool)), m_terminalDisplay, SLOT(recvKeySlot(unsigned, unsigned, bool)));
		 */
}

void karin::toolbar::setToolKeyState(const QString &name, unsigned state)
{
	base_key *key;

	if(m_activeToolbarIndex == -1)
		return;

	key = getAction(name);
	if(!key)
		return;

	key->setState(static_cast<karin::base_key::Key_State>(state));
}

void karin::toolbar::reset()
{
	karin::base_key *key;
	QList<QGraphicsWidget *> actions = items();
	K_FOREACH_CONST(QList<QGraphicsWidget *>, actions)
	{
		key = static_cast<base_key *>(*itor);
		key->reset();
	}
}
