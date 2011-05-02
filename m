Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QGnxX-00031F-NO
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2011 03:54:23 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxV-0002wv-Gg
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1QGnxU-0003yw-RM
	for qemu-trivial@nongnu.org; Mon, 02 May 2011 03:54:21 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:36438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1QGnxT-0003yb-0n; Mon, 02 May 2011 03:54:19 -0400
Received: by gwb19 with SMTP id 19so2230984gwb.4
	for <multiple recipients>; Mon, 02 May 2011 00:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=3EShjAnrtQyYanN1VZHZJIwU4SfriMfMvpVdbcyMwFA=;
	b=LxppzH2H1HlrYz2DJe+R90/A0QaOJOPVv/3nKiUmFAMtce6Z6WP4A6Dxn/8Ewl7/qi
	ULcwMdrGn3uQwuxRzkRPLiZJ36B/f16sXcDgaflWGBmTiie6G+h/r8ljI/Jaw9YiTjJM
	yxefDXnzh+pN3wUA0pZR0ZLE4UyN/dA7+5Ldw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=tu9w7xO/oq0gEOVPug11ZabhxxBfOHGaXDLiTNmErpGhTtRzQsc1dHJlIP3HR+Wf/f
	SdrJEY5z7eoTMvLK8PRy4+Z2s+8w2yyIUSmnrLg0+IROgIzgHZVQfOsjkVAAt9Z5WBGu
	wEk/2j7VsHitUAqomdAC00y3KaBw22FbZOqlM=
Received: by 10.91.145.6 with SMTP id x6mr6396926agn.152.1304322858086;
	Mon, 02 May 2011 00:54:18 -0700 (PDT)
Received: from localhost.localdomain (93-34-184-88.ip51.fastwebnet.it
	[93.34.184.88])
	by mx.google.com with ESMTPS id t16sm3488849anm.16.2011.05.02.00.54.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 00:54:17 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 May 2011 09:54:03 +0200
Message-Id: <1304322846-24376-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.4.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/4] libcacard: add correct subdirectory
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
X-List-Received-Date: Mon, 02 May 2011 07:54:22 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
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
index 44ce368..0ba989f 100644
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



