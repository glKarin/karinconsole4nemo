#############################################################################
# Makefile for building: karin-console
# Generated by qmake (3.0) (Qt 5.6.3)
# Project:  karin-console.pro
# Template: subdirs
# Command: /usr/lib/qt5/bin/qmake CONFIG+=debug_and_release -o Makefile karin-console.pro
#############################################################################

MAKEFILE      = Makefile

first: make_first
QMAKE         = /usr/lib/qt5/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = karin-console1.0.0
DISTDIR = /home/nemo/meego-terminal/karinconsole-master/.tmp/karin-console1.0.0
SUBTARGETS    =  \
		sub-lib \
		sub-graphicsview_src


sub-lib-qmake_all:  FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile
	cd lib/ && $(MAKE) -f Makefile qmake_all
sub-lib: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile
sub-lib-make_first-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile 
sub-lib-make_first: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile 
sub-lib-all-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile all
sub-lib-all: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile all
sub-lib-clean-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile clean
sub-lib-clean: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile clean
sub-lib-distclean-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile distclean
sub-lib-distclean: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile distclean
sub-lib-install_subtargets-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile install
sub-lib-install_subtargets: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile install
sub-lib-uninstall_subtargets-ordered: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile uninstall
sub-lib-uninstall_subtargets: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile uninstall
sub-graphicsview_src-qmake_all: sub-lib-qmake_all FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile
	cd graphicsview_src/ && $(MAKE) -f Makefile qmake_all
sub-graphicsview_src: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile
sub-graphicsview_src-make_first-ordered: sub-lib-make_first-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile 
sub-graphicsview_src-make_first: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile 
sub-graphicsview_src-all-ordered: sub-lib-all-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile all
sub-graphicsview_src-all: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile all
sub-graphicsview_src-clean-ordered: sub-lib-clean-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile clean
sub-graphicsview_src-clean: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile clean
sub-graphicsview_src-distclean-ordered: sub-lib-distclean-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile distclean
sub-graphicsview_src-distclean: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile distclean
sub-graphicsview_src-install_subtargets-ordered: sub-lib-install_subtargets-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile install
sub-graphicsview_src-install_subtargets: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile install
sub-graphicsview_src-uninstall_subtargets-ordered: sub-lib-uninstall_subtargets-ordered  FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile uninstall
sub-graphicsview_src-uninstall_subtargets: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile uninstall

Makefile: karin-console.pro /usr/share/qt5/mkspecs/linux-g++/qmake.conf /usr/share/qt5/mkspecs/features/spec_pre.prf \
		/usr/share/qt5/mkspecs/common/unix.conf \
		/usr/share/qt5/mkspecs/common/linux.conf \
		/usr/share/qt5/mkspecs/common/sanitize.conf \
		/usr/share/qt5/mkspecs/common/gcc-base.conf \
		/usr/share/qt5/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt5/mkspecs/common/g++-base.conf \
		/usr/share/qt5/mkspecs/common/g++-unix.conf \
		/usr/share/qt5/mkspecs/qconfig.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_core.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_core_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_feedback.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_feedback_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_gui.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_network.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_network_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_opengl.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_openglextensions.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_qml.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_qml_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_quick.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_quick_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_sql.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_sql_private.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_widgets.pri \
		/usr/share/qt5/mkspecs/modules/qt_lib_widgets_private.pri \
		/usr/share/qt5/mkspecs/features/qt_functions.prf \
		/usr/share/qt5/mkspecs/features/qt_config.prf \
		/usr/share/qt5/mkspecs/linux-g++/qmake.conf \
		/usr/share/qt5/mkspecs/features/spec_post.prf \
		/usr/share/qt5/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt5/mkspecs/features/default_pre.prf \
		/usr/share/qt5/mkspecs/features/resolve_config.prf \
		/usr/share/qt5/mkspecs/features/exclusive_builds_post.prf \
		/usr/share/qt5/mkspecs/features/default_post.prf \
		/usr/share/qt5/mkspecs/features/warn_on.prf \
		/usr/share/qt5/mkspecs/features/file_copies.prf \
		/usr/share/qt5/mkspecs/features/testcase_targets.prf \
		/usr/share/qt5/mkspecs/features/exceptions.prf \
		/usr/share/qt5/mkspecs/features/yacc.prf \
		/usr/share/qt5/mkspecs/features/lex.prf \
		karin-console.pro
	$(QMAKE) CONFIG+=debug_and_release -o Makefile karin-console.pro
/usr/share/qt5/mkspecs/features/spec_pre.prf:
/usr/share/qt5/mkspecs/common/unix.conf:
/usr/share/qt5/mkspecs/common/linux.conf:
/usr/share/qt5/mkspecs/common/sanitize.conf:
/usr/share/qt5/mkspecs/common/gcc-base.conf:
/usr/share/qt5/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt5/mkspecs/common/g++-base.conf:
/usr/share/qt5/mkspecs/common/g++-unix.conf:
/usr/share/qt5/mkspecs/qconfig.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_core.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_core_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_feedback.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_feedback_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_gui.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_gui_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_network.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_network_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_opengl.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_opengl_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_openglextensions.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_qml.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_qml_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_quick.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_quick_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_sql.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_sql_private.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_widgets.pri:
/usr/share/qt5/mkspecs/modules/qt_lib_widgets_private.pri:
/usr/share/qt5/mkspecs/features/qt_functions.prf:
/usr/share/qt5/mkspecs/features/qt_config.prf:
/usr/share/qt5/mkspecs/linux-g++/qmake.conf:
/usr/share/qt5/mkspecs/features/spec_post.prf:
/usr/share/qt5/mkspecs/features/exclusive_builds.prf:
/usr/share/qt5/mkspecs/features/default_pre.prf:
/usr/share/qt5/mkspecs/features/resolve_config.prf:
/usr/share/qt5/mkspecs/features/exclusive_builds_post.prf:
/usr/share/qt5/mkspecs/features/default_post.prf:
/usr/share/qt5/mkspecs/features/warn_on.prf:
/usr/share/qt5/mkspecs/features/file_copies.prf:
/usr/share/qt5/mkspecs/features/testcase_targets.prf:
/usr/share/qt5/mkspecs/features/exceptions.prf:
/usr/share/qt5/mkspecs/features/yacc.prf:
/usr/share/qt5/mkspecs/features/lex.prf:
karin-console.pro:
qmake: FORCE
	@$(QMAKE) CONFIG+=debug_and_release -o Makefile karin-console.pro

qmake_all: sub-lib-qmake_all sub-graphicsview_src-qmake_all FORCE

make_first: sub-lib-make_first-ordered sub-graphicsview_src-make_first-ordered  FORCE
all: sub-lib-all-ordered sub-graphicsview_src-all-ordered  FORCE
clean: sub-lib-clean-ordered sub-graphicsview_src-clean-ordered  FORCE
distclean: sub-lib-distclean-ordered sub-graphicsview_src-distclean-ordered  FORCE
	-$(DEL_FILE) Makefile
install_subtargets: sub-lib-install_subtargets-ordered sub-graphicsview_src-install_subtargets-ordered FORCE
uninstall_subtargets: sub-lib-uninstall_subtargets-ordered sub-graphicsview_src-uninstall_subtargets-ordered FORCE

sub-lib-debug_ordered:
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile debug
sub-graphicsview_src-debug_ordered: sub-lib-debug_ordered 
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile debug
debug: sub-lib-debug_ordered sub-graphicsview_src-debug_ordered

sub-lib-release_ordered:
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile release
sub-graphicsview_src-release_ordered: sub-lib-release_ordered 
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile release
release: sub-lib-release_ordered sub-graphicsview_src-release_ordered

sub-lib-check_ordered:
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile check
sub-graphicsview_src-check_ordered: sub-lib-check_ordered 
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile check
check: sub-lib-check_ordered sub-graphicsview_src-check_ordered

sub-lib-benchmark_ordered:
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile benchmark
sub-graphicsview_src-benchmark_ordered: sub-lib-benchmark_ordered 
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -f Makefile benchmark
benchmark: sub-lib-benchmark_ordered sub-graphicsview_src-benchmark_ordered
install:install_subtargets  FORCE

uninstall: uninstall_subtargets FORCE

FORCE:

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`/$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: sub-lib-distdir sub-graphicsview_src-distdir FORCE
	@test -d $(DISTDIR) || mkdir -p $(DISTDIR)
	$(COPY_FILE) --parents /usr/share/qt5/mkspecs/features/spec_pre.prf /usr/share/qt5/mkspecs/common/unix.conf /usr/share/qt5/mkspecs/common/linux.conf /usr/share/qt5/mkspecs/common/sanitize.conf /usr/share/qt5/mkspecs/common/gcc-base.conf /usr/share/qt5/mkspecs/common/gcc-base-unix.conf /usr/share/qt5/mkspecs/common/g++-base.conf /usr/share/qt5/mkspecs/common/g++-unix.conf /usr/share/qt5/mkspecs/qconfig.pri /usr/share/qt5/mkspecs/modules/qt_lib_core.pri /usr/share/qt5/mkspecs/modules/qt_lib_core_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_feedback.pri /usr/share/qt5/mkspecs/modules/qt_lib_feedback_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_gui.pri /usr/share/qt5/mkspecs/modules/qt_lib_gui_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_network.pri /usr/share/qt5/mkspecs/modules/qt_lib_network_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_opengl.pri /usr/share/qt5/mkspecs/modules/qt_lib_opengl_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_openglextensions.pri /usr/share/qt5/mkspecs/modules/qt_lib_openglextensions_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_qml.pri /usr/share/qt5/mkspecs/modules/qt_lib_qml_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_quick.pri /usr/share/qt5/mkspecs/modules/qt_lib_quick_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_sql.pri /usr/share/qt5/mkspecs/modules/qt_lib_sql_private.pri /usr/share/qt5/mkspecs/modules/qt_lib_widgets.pri /usr/share/qt5/mkspecs/modules/qt_lib_widgets_private.pri /usr/share/qt5/mkspecs/features/qt_functions.prf /usr/share/qt5/mkspecs/features/qt_config.prf /usr/share/qt5/mkspecs/linux-g++/qmake.conf /usr/share/qt5/mkspecs/features/spec_post.prf /usr/share/qt5/mkspecs/features/exclusive_builds.prf /usr/share/qt5/mkspecs/features/default_pre.prf /usr/share/qt5/mkspecs/features/resolve_config.prf /usr/share/qt5/mkspecs/features/exclusive_builds_post.prf /usr/share/qt5/mkspecs/features/default_post.prf /usr/share/qt5/mkspecs/features/warn_on.prf /usr/share/qt5/mkspecs/features/file_copies.prf /usr/share/qt5/mkspecs/features/testcase_targets.prf /usr/share/qt5/mkspecs/features/exceptions.prf /usr/share/qt5/mkspecs/features/yacc.prf /usr/share/qt5/mkspecs/features/lex.prf karin-console.pro $(DISTDIR)/

sub-lib-distdir: FORCE
	@test -d lib/ || mkdir -p lib/
	cd lib/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/lib/lib.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -e -f Makefile distdir DISTDIR=$(DISTDIR)/lib

sub-graphicsview_src-distdir: FORCE
	@test -d graphicsview_src/ || mkdir -p graphicsview_src/
	cd graphicsview_src/ && ( test -e Makefile || $(QMAKE) /home/nemo/meego-terminal/karinconsole-master/graphicsview_src/graphicsview_src.pro CONFIG+=debug_and_release -o Makefile ) && $(MAKE) -e -f Makefile distdir DISTDIR=$(DISTDIR)/graphicsview_src

