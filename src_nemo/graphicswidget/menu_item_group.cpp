#include "menu_item_group.h"
#include "menu_item.h"
#include "button.h"
#include "k.h"

#include <QPainter>
#include <QStyleOptionGraphicsItem>
#include <QDebug>
#include <QGraphicsScene>
#include <QTimer>

karin::menu_item_group::menu_item_group(QGraphicsWidget *parent)
	: karin::list_view(parent),
	m_exclusive(true),
	m_touchId(-1),
	m_touchAction(0),
	m_itemWidth(karin::menu_item_group::M_ItemWidth),
	m_itemHeight(karin::menu_item_group::M_ItemHeight)
{
	setObjectName(OBJECTNAME_MENU_ITEM_GROUP);
	setAutoFixedSize(true);
	m_lastPos.setX(-1);
	m_lastPos.setY(-1);

}

karin::menu_item_group::~menu_item_group()
{
}

bool karin::menu_item_group::touchAction(const QTouchEvent *event)
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
						if(w && Object_IsType(w, OBJECTNAME_BUTTON))
						{
							m_touchAction = static_cast<karin::menu_item *>((static_cast<karin::button *>(w))->parentWidget());
							if(m_touchAction)
							{
								m_touchId = e->id();
								m_lastPos = e->scenePos();
								manageActions(m_touchAction, true);
								return true;
							}
						}
					}
				}
			}
			break;
		case QEvent::TouchUpdate:
		case QEvent::TouchCancel:
			{
				if(m_touchId != -1)
				{
					m_touchId = -1;
					m_touchAction->cancel();
					m_lastPos.setX(-1);
					m_lastPos.setY(-1);
					m_touchAction = 0;
					return true;
				}
				break;
			}
		case QEvent::TouchEnd:
			{
				//if(m_touchAction) // touch point not move
				if(m_touchId != -1)
				{
					K_FOREACH_CONST(QList<QTouchEvent::TouchPoint>, points)
					{
						if(itor->id() != m_touchId)
							continue;
						m_touchId = -1;
						manageActions(m_touchAction, false);
						m_lastPos.setX(-1);
						m_lastPos.setY(-1);
						m_touchAction = 0;
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

bool karin::menu_item_group::sceneEvent(QEvent *e)
{
	switch (e->type()) {
		case QEvent::TouchBegin: 
			{
				touchAction(static_cast<QTouchEvent *>(e));
				return karin::list_view::sceneEvent(e);
			}
		case QEvent::TouchUpdate:
		case QEvent::TouchEnd:
		case QEvent::TouchCancel:
			{
				touchAction(static_cast<QTouchEvent *>(e));
			}
			break;
		default:
			break;
	}
	return karin::list_view::sceneEvent(e);
}

void karin::menu_item_group::reset()
{
	bool changed;
	karin::menu_item *item;
	QList<QGraphicsWidget *> actions = items();
	K_FOREACH_CONST(QList<QGraphicsWidget *>, actions)
	{
		item = static_cast<menu_item *>(*itor);
		item->reset();
	}
	changed = m_checkedActions.size() != 0;
	m_checkedActions.clear();
	m_checkedIndexs.clear();
	if(changed)
	{
		emit checkedChanged();
		update();
	}
}

void karin::menu_item_group::manageActions(karin::menu_item *btn, bool on)
{
	if(!btn)
		return;

	if(m_exclusive)
	{
		btn->touchEvent(on);
		if(m_checkedActions.size() > 0)
		{
			if(btn == m_checkedActions.at(0))
			{
				if(!btn->isOn())
					btn->setOn(true);
				return;
			}
			if(btn->isOn())
			{
				m_checkedActions[0]->reset();
				m_checkedActions.removeAt(0);
				m_checkedIndexs.removeAt(0);
				m_checkedActions.push_back(btn);
				m_checkedIndexs.push_back(indexOf(btn));
				emit checkedChanged();
			}
		}
		else
		{
			if(btn->isOn())
			{
				m_checkedActions.push_back(btn);
				m_checkedIndexs.push_back(indexOf(btn));
				emit checkedChanged();
			}
		}
	}
	else
	{
		btn->touchEvent(on);
		if(btn->isOn())
		{
			m_checkedActions.push_back(btn);
			m_checkedIndexs.push_back(indexOf(btn));
		}
		else
		{
			m_checkedActions.removeOne(btn);
			m_checkedIndexs.removeOne(indexOf(btn));
		}
		emit checkedChanged();
	}
	update();
}

void karin::menu_item_group::setCheckedIndexs(const QList<int> &indexs)
{
	int i;
	QList<QGraphicsWidget *> is;
	karin::menu_item *item;
	bool b;

	reset();
	if(indexs.isEmpty())
		return;
	is = items();
	if(is.isEmpty())
		return;

	if(m_exclusive)
	{
		i = indexs.at(0);
		if(i < 0 || i >= is.size())
			return;
		item = static_cast<karin::menu_item *>(is[i]);
		m_checkedActions.push_back(item);
		m_checkedIndexs.push_back(indexOf(item));
		item->setOn(true);
		emit checkedChanged();
	}
	else
	{
		K_FOREACH_CONST(QList<int>, indexs)
		{
			i = *itor;
			if(i < 0 || i >= is.size())
				continue;
			b = true;
			item = static_cast<karin::menu_item *>(is[i]);
			m_checkedActions.push_back(item);
			m_checkedIndexs.push_back(indexOf(item));
			item->setOn(true);
		}
		if(b)
			emit checkedChanged();
	}
	update();
}

void karin::menu_item_group::triggeredSlot(const QString &name, const QVariant &value)
{
	emit triggered(name, value);
}

void karin::menu_item_group::clear()
{
	bool changed;

	list_view::clear();
	changed = m_checkedActions.size() != 0;
	m_checkedActions.clear();
	m_checkedIndexs.clear();
	if(changed)
	{
		emit checkedChanged();
		update();
	}
}

void karin::menu_item_group::addAction(const QString &label, const QString &name, const QVariant &value, int i)
{
	karin::menu_item *btn;

	QFont f = font();
	//f.setPixelSize(24);
	btn = new karin::menu_item;
	btn->setAutoRelease(false);
	btn->setFixedWidth(orientation() == Qt::Horizontal ? m_itemWidth : width());
	btn->setFixedHeight(orientation() == Qt::Horizontal ? height() : m_itemHeight);
	btn->setFont(f);
	btn->setText(label);
	btn->setName(name);
	btn->setValue(value);
	connect(btn, SIGNAL(triggered(const QString &, const QVariant &)), this, SLOT(triggeredSlot(const QString &, const QVariant &)));
	addItem(btn, i);
}

void karin::menu_item_group::removeAction(int index)
{
	removeItem(index);
}

void karin::menu_item_group::updateAction(int index, const QString &label)
{
	karin::menu_item *item;
	if(index >= 0 && index < count())
	{
		item = static_cast<karin::menu_item *>(operator[](index));
		if(!item)
			return;

		item->setText(label);
	}
}

void karin::menu_item_group::setItemWidth(int w)
{
	if(m_itemWidth == w)
		return;

	m_itemWidth = w;

	if(orientation() == Qt::Horizontal)
	{
		QList<QGraphicsWidget *> actions = items();
		K_FOREACH_CONST(QList<QGraphicsWidget *>, actions)
		{
			Widget_SetFixedWidth(*itor, m_itemWidth);
		}
	}
}

void karin::menu_item_group::setItemHeight(int h)
{
	if(m_itemHeight == h)
		return;

	m_itemHeight = h;

	if(orientation() == Qt::Vertical)
	{
		QList<QGraphicsWidget *> actions = items();
		K_FOREACH_CONST(QList<QGraphicsWidget *>, actions)
		{
			Widget_SetFixedHeight(*itor, m_itemHeight);
		}
	}
}
