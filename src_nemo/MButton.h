#ifndef _KARIN_M_BUTTON_H
#define _KARIN_M_BUTTON_H

#include <QGraphicsProxyWidget>

class QCheckBox;
class QPushButton;
class QAbstractButton;

class MButton : public QGraphicsProxyWidget
{
	Q_OBJECT

	public:
		enum MButtonType
		{
			generalType = 0,
			switchType,
			checkboxType,
			customType,
		};
		
	public:
		MButton(QGraphicsProxyWidget *parent = 0);
		~MButton();

		void setCheckable(bool b);
		void setChecked(bool b);
		void setEnabled(bool b);
		void setViewType(MButtonType type);

	protected:
		QAbstractButton * button();

	private:
		void disconnectSignals();
		void setButton();

Q_SIGNALS:
		void	clicked(bool checked = false);
		void	pressed();
		void	released();
		void	toggled(bool checked);

	private:
		MButtonType type;
		QCheckBox *checkbox;
		QPushButton *pushbutton;

		Q_DISABLE_COPY(MButton)

};

#endif
