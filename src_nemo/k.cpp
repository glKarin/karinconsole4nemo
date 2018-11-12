#include "k.h"

#include <QFontMetrics>
#include <QGraphicsWidget>
#include <QDebug>

#define K_FONT_CHAR 'k'
#define K_ZERO 0.00001

QPointF Font_GetStringCenter(const QString &str, const QFont &font)
{
	int fw;
	int fh;

	QFontMetrics fm(font);
	fw = fm.width(str);
	fh = fm.boundingRect(K_FONT_CHAR).height();

	return QPointF(fw / 2, -fh / 2);
}

bool Math_isZero(float f)
{
	return f < K_ZERO && f > -K_ZERO;
}

int String_StringToInt(const QString &s, bool *ok)
{
	int r;
	bool rb;

	if(s.isEmpty())
	{
		if(ok)
			*ok = true;
		return 0;
	}

	r = 0;
	rb = false;

	if(s.indexOf("0x", Qt::CaseInsensitive) == 0)
		r = s.mid(2).toInt(&rb, 16);
	else
		r = s.toInt(&rb, 10);
	if(ok)
		*ok = rb;
	return rb ? r : 0;
}

QString String_ArrayToString(const QStringList &s, int *ok)
{
	bool rb;
	int code;
	int err;
	QString r("");

	if(s.isEmpty())
	{
		if(ok)
			*ok = -1;
		return QString::null;
	}

	err = 0;
	K_FOREACH_CONST(QStringList, s)
	{
		rb = false;
		code = String_StringToInt(*itor, &rb);
		if(!rb)
		{
			err++;
			continue;
		}
		r.append(QChar(code));
	}
	
	if(ok)
		*ok = err;
	return r;
}

bool Object_IsType(const QObject *obj, const QString &type)
{
	int i;
	if(!obj)
		return false;

	const QString Split("::");
	const QString Namespace("karin");

	const QStringList olist = obj->objectName().split(Split);
	const QStringList list = type.split(Split);

	if(olist.size() <= 1 || list.size() <= 1)
		return false;
	if(olist[0] != Namespace || list[0] != Namespace)
		return false;

	for(i = 1; i < list.size(); i++)
	{
		if(olist.size() > i)
		{
			if(olist[i] != list[i])
				return false;
		}
		else
			return false;
	}
	return true;
}

void Widget_SetFixedWidth(QGraphicsWidget *widget, qreal w)
{
	if(!widget)
		return;
	widget->setMaximumWidth(w);
	widget->setMinimumWidth(w);
	widget->setPreferredWidth(w);
	K_SET_WIDTH(widget, w);
}

void Widget_SetFixedHeight(QGraphicsWidget *widget, qreal h)
{
	if(!widget)
		return;
	widget->setMaximumHeight(h);
	widget->setMinimumHeight(h);
	widget->setPreferredHeight(h);
	K_SET_HEIGHT(widget, h);
}

void Widget_SetFixedSize(QGraphicsWidget *widget, qreal w, qreal h)
{
	if(!widget)
		return;
	Widget_SetFixedSize(widget, QSizeF(w, h));
}

void Widget_SetFixedSize(QGraphicsWidget *widget, const QSizeF &s)
{
	if(!widget)
		return;
	widget->setMaximumSize(s);
	widget->setMinimumSize(s);
	widget->setPreferredSize(s);
	widget->resize(s);
}
