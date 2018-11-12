#ifndef _KARIN_TOOLBAR_H
#define _KARIN_TOOLBAR_H

#include "list_view.h"

class QTimer;

namespace karin
{
	class base_key;
	class toolbar;

	class toolbar : public list_view
	{
		Q_OBJECT

		public:
			toolbar(QGraphicsWidget *parent = 0);
			~toolbar();
			void addAction(base_key *action, int i = -1);
			base_key * getAction(const QString &name);
			void setFixedHeight(int h);
			int fixedHeight() const { return m_fixedHeight; }
			void bindTerminalDisplay(QGraphicsWidget *term);
			QGraphicsWidget * terminalDisplay() { return m_terminalDisplay; }
			bool loadLayout(const QString &src);
			int activeToolbarIndex() const { return m_activeToolbarIndex; }
			void setNextActiveToolbar();
			void setPrevActiveToolbar();
			void setActiveToolbarIndex(int index);
			int setActiveToolbar(QString fileName);

		public:
			static const QStringList & getAllToolbars();
			static QString ToolbarDirectory();

		public Q_SLOTS:
			void setToolKeyState(const QString &name, unsigned state); // 0 - release, 1 - long-pressed, 2 - pressed
		void reset();
		void updateToolbarDirectory(const QString &path = QString());

Q_SIGNALS:
			void sendKeySignal(unsigned base_key, unsigned modifier, bool pressed);
			void toolbarLayoutListChanged(const QStringList &list);

		protected:
			virtual bool sceneEvent(QEvent *e);

			private Q_SLOTS:
				void sendKeySlot(unsigned base_key, unsigned modifier, bool pressed);
			void clickSlot();

		private:
			bool touchKey(const QTouchEvent *event);

		private:
			int m_fixedHeight;
			QGraphicsWidget *m_terminalDisplay;
			int m_activeToolbarIndex;
			int m_touchId;
			QPointF m_lastPos;
			QTimer *m_timer;
			base_key *m_touchKey;
			bool m_pressed;


			static const int M_FixedHeight = 60;
			static const int M_PressInterval = 120;
			static const int M_ReleaseInterval = 60;

			Q_DISABLE_COPY(toolbar)
	};

};

#endif
