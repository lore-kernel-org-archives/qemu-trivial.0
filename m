Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgukW-0002R1-PO
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 06:33:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukQ-0002Jm-IY
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukO-0001g5-MT
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:50 -0400
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:44398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukO-0001fF-1d
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:48 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <lilei@linux.vnet.ibm.com>;
	Mon, 27 May 2013 15:58:29 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
	by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 27 May 2013 15:58:27 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id 99C883940057;
	Mon, 27 May 2013 16:03:40 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4RAXVfk12583290; Mon, 27 May 2013 16:03:31 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4RAXc8F017081; Mon, 27 May 2013 20:33:38 +1000
Received: from localhost.localdomain ([9.125.24.193])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4RAXYrc016928; Mon, 27 May 2013 20:33:37 +1000
From: Lei Li <lilei@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 27 May 2013 18:33:01 +0800
Message-Id: <1369650782-14608-2-git-send-email-lilei@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
References: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052710-3864-0000-0000-00000850FC0C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, Lei Li <lilei@linux.vnet.ibm.com>,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] docs: Fix typo and update file in
	migration
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
X-List-Received-Date: Mon, 27 May 2013 10:33:54 -0000

This patch fix some typo and update the file that already
moved.

Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
---
 docs/migration.txt |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/docs/migration.txt b/docs/migration.txt
index 0719a55..0e0a1d4 100644
--- a/docs/migration.txt
+++ b/docs/migration.txt
@@ -41,7 +41,7 @@ All these four migration protocols use the same infrastructure to
 save/restore state devices.  This infrastructure is shared with the
 savevm/loadvm functionality.
 
-=== State Live Migration ==
+=== State Live Migration ===
 
 This is used for RAM and block devices.  It is not yet ported to vmstate.
 <Fill more information here>
@@ -83,7 +83,7 @@ pointer that is passed to all functions.
 The important functions for us are put_buffer()/get_buffer() that
 allow to write/read a buffer into the QEMUFile.
 
-=== How to save the state of one device ==
+=== How to save the state of one device ===
 
 The state of a device is saved using intermediate buffers.  There are
 some helper functions to assist this saving.
@@ -97,7 +97,7 @@ associated with a series of fields saved.  The save_state always saves
 the state as the newer version.  But load_state sometimes is able to
 load state from an older version.
 
- === Legacy way ===
+=== Legacy way ===
 
 This way is going to disappear as soon as all current users are ported to VMSTATE.
 
@@ -133,7 +133,7 @@ to interpret that definition to be able to load/save the state.  As
 the state is declared only once, it can't go out of sync in the
 save/load functions.
 
-An example (from hw/pckbd.c)
+An example (from hw/input/pckbd.c)
 
 static const VMStateDescription vmstate_kbd = {
     .name = "pckbd",
@@ -158,9 +158,9 @@ We registered this with:
 Note: talk about how vmstate <-> qdev interact, and what the instance ids mean.
 
 You can search for VMSTATE_* macros for lots of types used in QEMU in
-hw/hw.h.
+include/hw/hw.h.
 
-=== More about versions ==
+=== More about versions ===
 
 You can see that there are several version fields:
 
@@ -227,7 +227,7 @@ using a specific functionality, ....
 
 It is impossible to create a way to make migration from any version to
 any other version to work.  But we can do better than only allowing
-migration from older versions no newer ones.  For that fields that are
+migration from older versions to newer ones.  For that fields that are
 only needed sometimes, we add the idea of subsections.  A subsection
 is "like" a device vmstate, but with a particularity, it has a Boolean
 function that tells if that values are needed to be sent or not.  If
@@ -247,7 +247,8 @@ static bool ide_drive_pio_state_needed(void *opaque)
 {
     IDEState *s = opaque;
 
-    return (s->status & DRQ_STAT) != 0;
+    return ((s->status & DRQ_STAT) != 0)
+        || (s->bus->error_status & BM_STATUS_PIO_RETRY);
 }
 
 const VMStateDescription vmstate_ide_drive_pio_state = {
-- 
1.7.7.6


