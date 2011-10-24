Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIImN-0002U9-70
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2011 07:33:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RIImH-0002F2-Vj
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 07:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RIImG-00057g-5B
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 07:33:13 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:57679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RIImC-00056o-Vg; Mon, 24 Oct 2011 07:33:09 -0400
Received: by wwi36 with SMTP id 36so7950750wwi.10
	for <multiple recipients>; Mon, 24 Oct 2011 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=NBEkQkjIV6FmhRmRWDQPfyB/sno/KCdCadg3LvMJ8Zs=;
	b=G9eo409v/7BsaWLhWfx3XDSwn7y1DU//RAl9dqgRmQP1xwPJXnBhnNTQtWJlAf53ws
	qb+SW+mGreFv3t8IFT/g7k28ICmT4E8CVkFSoyTK9Oz0dNXPKv0jUedDHVT20KBs2IQK
	Rp+D/iuz5KUgprxVFAnxSJrxa+PqFpgrg0WZM=
Received: by 10.227.61.80 with SMTP id s16mr9047269wbh.73.1319455987870;
	Mon, 24 Oct 2011 04:33:07 -0700 (PDT)
Received: from localhost.localdomain (nat-pool-mxp-t.redhat.com.
	[209.132.186.18])
	by mx.google.com with ESMTPS id es5sm38447532wbb.11.2011.10.24.04.33.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 04:33:07 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Oct 2011 13:33:01 +0200
Message-Id: <1319455981-27042-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] tools: reorganize Makefile variables
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2011 11:33:16 -0000

- Add all dependencies of the block layer to block-obj-y, and all
  dependencies of QObject to qobject-obj-y

- Remove the block layer from tools-obj-y, add it to qemu-img, qemu-nbd,
  qemu-io

- Add qobject-obj-y and tools-obj-y wherever useful, remove duplicates

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile      |   32 +++++++++++++++-----------------
 Makefile.objs |    8 ++++----
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index f63fc02..ba8d738 100644
--- a/Makefile
+++ b/Makefile
@@ -146,27 +146,25 @@ endif
 qemu-img.o: qemu-img-cmds.h
 qemu-img.o qemu-tool.o qemu-nbd.o qemu-io.o cmd.o qemu-ga.o: $(GENERATED_HEADERS)
 
-tools-obj-y = qemu-tool.o qemu-error.o $(oslib-obj-y) $(trace-obj-y) \
-        $(block-obj-y) $(qobject-obj-y) $(version-obj-y) qemu-timer-common.o
+tools-obj-y = qemu-tool.o $(oslib-obj-y) $(trace-obj-y) \
+	qemu-timer-common.o cutils.o
 
-qemu-img$(EXESUF): qemu-img.o $(tools-obj-y)
-qemu-nbd$(EXESUF): qemu-nbd.o $(tools-obj-y)
-qemu-io$(EXESUF): qemu-io.o cmd.o $(tools-obj-y)
+qemu-img$(EXESUF): qemu-img.o $(tools-obj-y) $(block-obj-y)
+qemu-nbd$(EXESUF): qemu-nbd.o $(tools-obj-y) $(block-obj-y)
+qemu-io$(EXESUF): qemu-io.o cmd.o $(tools-obj-y) $(block-obj-y)
 
 qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"  GEN   $@")
 
 check-qint.o check-qstring.o check-qdict.o check-qlist.o check-qfloat.o check-qjson.o test-coroutine.o: $(GENERATED_HEADERS)
 
-CHECK_PROG_DEPS = $(oslib-obj-y) $(trace-obj-y) qemu-tool.o
-
-check-qint: check-qint.o qint.o $(CHECK_PROG_DEPS)
-check-qstring: check-qstring.o qstring.o $(CHECK_PROG_DEPS)
-check-qdict: check-qdict.o qdict.o qfloat.o qint.o qstring.o qbool.o qlist.o $(CHECK_PROG_DEPS)
-check-qlist: check-qlist.o qlist.o qint.o $(CHECK_PROG_DEPS)
-check-qfloat: check-qfloat.o qfloat.o $(CHECK_PROG_DEPS)
-check-qjson: check-qjson.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o qjson.o json-streamer.o json-lexer.o json-parser.o error.o qerror.o qemu-error.o $(CHECK_PROG_DEPS)
-test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y) $(CHECK_PROG_DEPS)
+check-qint: check-qint.o qint.o $(tools-obj-y)
+check-qstring: check-qstring.o qstring.o $(tools-obj-y)
+check-qdict: check-qdict.o qdict.o qfloat.o qint.o qstring.o qbool.o qlist.o $(tools-obj-y)
+check-qlist: check-qlist.o qlist.o qint.o $(tools-obj-y)
+check-qfloat: check-qfloat.o qfloat.o $(tools-obj-y)
+check-qjson: check-qjson.o $(qobject-obj-y) $(tools-obj-y)
+test-coroutine: test-coroutine.o qemu-timer-common.o async.o $(coroutine-obj-y) $(tools-obj-y)
 
 $(qapi-obj-y): $(GENERATED_HEADERS)
 qapi-dir := qapi-generated
@@ -204,16 +202,16 @@ qmp-marshal.c: $(SRC_PATH)/qapi-schema.json $(SRC_PATH)/scripts/qapi-commands.py
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-commands.py -m -o "." < $<, "  GEN   $@")
 
 test-visitor.o: $(addprefix $(qapi-dir)/, test-qapi-types.c test-qapi-types.h test-qapi-visit.c test-qapi-visit.h) $(qapi-obj-y)
-test-visitor: test-visitor.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o
+test-visitor: test-visitor.o $(qobject-obj-y) $(qapi-obj-y) $(tools-obj-y) $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o
 
 test-qmp-commands.o: $(addprefix $(qapi-dir)/, test-qapi-types.c test-qapi-types.h test-qapi-visit.c test-qapi-visit.h test-qmp-marshal.c test-qmp-commands.h) $(qapi-obj-y)
-test-qmp-commands: test-qmp-commands.o qfloat.o qint.o qdict.o qstring.o qlist.o qbool.o $(qapi-obj-y) error.o osdep.o $(oslib-obj-y) qjson.o json-streamer.o json-lexer.o json-parser.o qerror.o qemu-error.o qemu-tool.o $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
+test-qmp-commands: test-qmp-commands.o $(qobject-obj-y) $(qapi-obj-y) $(tools-obj-y) $(qapi-dir)/test-qapi-visit.o $(qapi-dir)/test-qapi-types.o $(qapi-dir)/test-qmp-marshal.o module.o
 
 QGALIB_GEN=$(addprefix $(qapi-dir)/, qga-qapi-types.c qga-qapi-types.h qga-qapi-visit.c qga-qmp-marshal.c)
 $(QGALIB_GEN): $(GENERATED_HEADERS)
 $(qga-obj-y) qemu-ga.o: $(QGALIB_GEN)
 
-qemu-ga$(EXESUF): qemu-ga.o $(qga-obj-y) $(qapi-obj-y) $(trace-obj-y) $(qobject-obj-y) $(version-obj-y) $(addprefix $(qapi-dir)/, qga-qapi-visit.o qga-qapi-types.o qga-qmp-marshal.o)
+qemu-ga$(EXESUF): qemu-ga.o $(qga-obj-y) $(qapi-obj-y) $(tools-obj-y) $(qobject-obj-y) $(version-obj-y) $(addprefix $(qapi-dir)/, qga-qapi-visit.o qga-qapi-types.o qga-qmp-marshal.o)
 
 QEMULIBS=libhw32 libhw64 libuser libdis libdis-user
 
diff --git a/Makefile.objs b/Makefile.objs
index 01587c8..a19e7c5 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -2,7 +2,7 @@
 # QObject
 qobject-obj-y = qint.o qstring.o qdict.o qlist.o qfloat.o qbool.o
 qobject-obj-y += qjson.o json-lexer.o json-streamer.o json-parser.o
-qobject-obj-y += qerror.o error.o
+qobject-obj-y += qerror.o error.o qemu-error.o
 
 #######################################################################
 # oslib-obj-y is code depending on the OS (win32 vs posix)
@@ -25,7 +25,7 @@ coroutine-obj-$(CONFIG_WIN32) += coroutine-win32.o
 
 block-obj-y = cutils.o cache-utils.o qemu-option.o module.o async.o
 block-obj-y += nbd.o block.o aio.o aes.o qemu-config.o qemu-progress.o qemu-sockets.o
-block-obj-y += $(coroutine-obj-y)
+block-obj-y += $(coroutine-obj-y) $(qobject-obj-y) $(version-obj-y)
 block-obj-$(CONFIG_POSIX) += posix-aio-compat.o
 block-obj-$(CONFIG_LINUX_AIO) += linux-aio.o
 
@@ -76,7 +76,7 @@ common-obj-y = $(block-obj-y) blockdev.o
 common-obj-y += $(net-obj-y)
 common-obj-y += $(qobject-obj-y)
 common-obj-$(CONFIG_LINUX) += $(fsdev-obj-$(CONFIG_LINUX))
-common-obj-y += readline.o console.o cursor.o qemu-error.o
+common-obj-y += readline.o console.o cursor.o
 common-obj-y += $(oslib-obj-y)
 common-obj-$(CONFIG_WIN32) += os-win32.o
 common-obj-$(CONFIG_POSIX) += os-posix.o
@@ -415,7 +415,7 @@ common-obj-y += qmp.o hmp.o
 
 qga-nested-y = guest-agent-commands.o guest-agent-command-state.o
 qga-obj-y = $(addprefix qga/, $(qga-nested-y))
-qga-obj-y += qemu-ga.o qemu-tool.o qemu-error.o qemu-sockets.o module.o qemu-option.o cutils.o osdep.o
+qga-obj-y += qemu-ga.o qemu-sockets.o module.o qemu-option.o
 qga-obj-$(CONFIG_WIN32) += oslib-win32.o
 qga-obj-$(CONFIG_POSIX) += oslib-posix.o
 
-- 
1.7.6


