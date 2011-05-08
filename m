Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ6Uw-0006q8-6r
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 12:06:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1QJ6Uo-0006bD-Li
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 12:06:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1QJ6Un-0007as-O3
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 12:06:14 -0400
Received: from mtagate7.uk.ibm.com ([194.196.100.167]:60117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>)
	id 1QJ6Uf-0007YU-Vl; Sun, 08 May 2011 12:06:06 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com
	(d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate7.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p48G65LY029778;
	Sun, 8 May 2011 16:06:05 GMT
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
	[9.149.37.252])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id p48G7KO72244608; Sun, 8 May 2011 17:07:20 +0100
Received: from d06av11.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id p48G64er021802; Sun, 8 May 2011 10:06:04 -0600
Received: from stefanha-thinkpad.ibm.com (sig-9-146-157-45.uk.ibm.com
	[9.146.157.45])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id p48G5njo021096; Sun, 8 May 2011 10:06:04 -0600
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Sun,  8 May 2011 17:05:18 +0100
Message-Id: <1304870719-20885-24-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1304870719-20885-1-git-send-email-stefanha@linux.vnet.ibm.com>
References: <1304870719-20885-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 194.196.100.167
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 23/24] libcacard: add correct subdirectory
	dependencies
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
X-List-Received-Date: Sun, 08 May 2011 16:06:15 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 Makefile           |    2 ++
 Makefile.objs      |    7 +++----
 libcacard/Makefile |    9 +--------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 67c0268..2b0438c 100644
--- a/Makefile
+++ b/Makefile
@@ -88,6 +88,8 @@ include $(SRC_PATH)/Makefile.objs
 endif
 
 $(common-obj-y): $(GENERATED_HEADERS)
+subdir-libcacard: $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o
+
 $(filter %-softmmu,$(SUBDIR_RULES)): $(trace-obj-y) $(common-obj-y) subdir-libdis
 
 $(filter %-user,$(SUBDIR_RULES)): $(GENERATED_HEADERS) $(trace-obj-y) subdir-libdis-user subdir-libuser
diff --git a/Makefile.objs b/Makefile.objs
index d82c60d..4478c61 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -7,8 +7,8 @@ qobject-obj-y += qerror.o
 #######################################################################
 # oslib-obj-y is code depending on the OS (win32 vs posix)
 oslib-obj-y = osdep.o
-oslib-obj-$(CONFIG_WIN32) += oslib-win32.o
-oslib-obj-$(CONFIG_POSIX) += oslib-posix.o
+oslib-obj-$(CONFIG_WIN32) += oslib-win32.o qemu-thread-win32.o
+oslib-obj-$(CONFIG_POSIX) += oslib-posix.o qemu-thread-posix.o
 
 #######################################################################
 # block-obj-y is code used by both qemu system emulation and qemu-img
@@ -143,8 +143,7 @@ common-obj-y += $(addprefix ui/, $(ui-obj-y))
 common-obj-$(CONFIG_VNC) += $(addprefix ui/, $(vnc-obj-y))
 
 common-obj-y += iov.o acl.o
-common-obj-$(CONFIG_POSIX) += qemu-thread-posix.o compatfd.o
-common-obj-$(CONFIG_WIN32) += qemu-thread-win32.o
+common-obj-$(CONFIG_POSIX) += compatfd.o
 common-obj-y += notify.o event_notifier.o
 common-obj-y += qemu-timer.o qemu-timer-common.o
 
diff --git a/libcacard/Makefile b/libcacard/Makefile
index 4010029..1d34df0 100644
--- a/libcacard/Makefile
+++ b/libcacard/Makefile
@@ -4,14 +4,7 @@
 
 $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/libcacard)
 
-ifeq ($(CONFIG_WIN32),y)
-QEMU_THREAD=qemu-thread-win32.o
-else
-QEMU_THREAD=qemu-thread-posix.o
-endif
-
-
-QEMU_OBJS=$(addprefix ../, $(QEMU_THREAD) $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o)
+QEMU_OBJS=$(addprefix ../, $(oslib-obj-y) $(trace-obj-y) qemu-malloc.o qemu-timer-common.o)
 
 QEMU_CFLAGS+=-I../
 
-- 
1.7.4.4


