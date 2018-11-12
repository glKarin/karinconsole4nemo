#ifndef _KARIN_MENU_H
#define _KARIN_MENU_H

#include "popup.h"
#include "list_view.h"

namespace karin
{
	class button;
	class abstract_menu_item;
	class combobox;

	class menu : public list_view
	{
		Q_OBJECT

		public:
			menu(QGraphicsWidget *parent = 0);
			~menu();
			void addMenuItem(abstract_menu_item *item);

Q_SIGNALS:
			void triggered(const QString &name, const QVariant &value = QVariant());

		protected:
			virtual bool sceneEvent(QEvent *e);

			private Q_SLOTS:
				void triggeredSlot(const QString &name, const QVariant &value = QVariant());

		private:
			bool touchAction(const QTouchEvent *event);

			private:
			int m_touchId;
			QPointF m_lastPos;
			button *m_touchAction;

			static const int M_PressInterval = 120;
			static const int M_ReleaseInterval = 60;

			Q_DISABLE_COPY(menu)
	};


	class main_menu : public popup
	{
		Q_OBJECT

		public:
			main_menu(QGraphicsWidget *parent = 0);
			~main_menu();

			public Q_SLOTS:
				void setCurrentTabIndex(int index);
			void addTab(int i, const QPair<qint64, QString> &p);
			void updateTab(int i, const QString &label);
			void setSelectionMode(bool on);

Q_SIGNALS:
			void triggered(const QString &name, const QVariant &value = QVariant());

			private Q_SLOTS:
				void triggeredSlot(const QString &name, const QVariant &value = QVariant());

		private:
			void setupMenu();

			private:
			menu *m_menu;
			combobox *m_selectionButton;
			combobox *m_tabComboBox;

			static const int M_FixedWidth = 480;

			Q_DISABLE_COPY(main_menu)
	};
}

#endif
