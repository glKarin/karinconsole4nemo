#ifndef _KARIN_M_LABEL_H
#define _KARIN_M_LABEL_H

#include <QGraphicsProxyWidget>

class QLabel;

class MLabel : public QGraphicsProxyWidget
{
	Q_OBJECT

	public:
		MLabel(QGraphicsProxyWidget *parent = 0);
		~MLabel();

		void setText(const QString &s);
		void setColor(const QColor &c);
		void setFont(const QFont &f);
		QFont font() const;

Q_SIGNALS:

	private:
		QLabel *label;

		Q_DISABLE_COPY(MLabel)

};

#endif

