Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWOFS-0002qC-Ol
	for mharc-qemu-trivial@gnu.org; Sun, 28 Apr 2013 05:50:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UWOFN-0002jG-Nz
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 05:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UWOFK-0004Dd-Uu
	for qemu-trivial@nongnu.org; Sun, 28 Apr 2013 05:50:17 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1UWOFE-0003yE-TH; Sun, 28 Apr 2013 05:50:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6245D728003E; Sun, 28 Apr 2013 11:50:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id tV8hIVf8KHN2; Sun, 28 Apr 2013 11:49:59 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 476597280041; Sun, 28 Apr 2013 11:49:59 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 28 Apr 2013 11:49:57 +0200
Message-Id: <1367142597-28810-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] Trivial grammar and spelling fixes
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
X-List-Received-Date: Sun, 28 Apr 2013 09:50:21 -0000

similiar -> similar
recieve -> receive
transfered -> transferred
preperation -> preparation

Most changes are in comments, one modifies a parameter name in a function
prototype.

The spelling fixes were made using codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

More improvements are needed for include/hw/stream.h.
Maybe the author or a native speaker can have a look.

Regards,
Stefan W.

 hw/moxie/moxiesim.c      |    2 +-
 include/hw/stream.h      |    6 +++---
 include/sysemu/rng.h     |    2 +-
 qmp-commands.hx          |    2 +-
 target-s390x/translate.c |    2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 70bf28f..649f9a7 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -1,7 +1,7 @@
 /*
  * QEMU/moxiesim emulation
  *
- * Emulates a very simple machine model similiar to the one use by the
+ * Emulates a very simple machine model similar to the one used by the
  * GDB moxie simulator.
  *
  * Copyright (c) 2008, 2009, 2010, 2013 Anthony Green
diff --git a/include/hw/stream.h b/include/hw/stream.h
index 35eb083..30ccc56 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -25,9 +25,9 @@ typedef struct StreamSlaveClass {
     /**
      * can push - determine if a stream slave is capable of accepting at least
      * one byte of data. Returns false if cannot accept. If not implemented, the
-     * slave is assumed to always be capable of recieveing.
+     * slave is assumed to always be capable of receiving.
      * @notify: Optional callback that the slave will call when the slave is
-     * capable of recieving again. Only called if false is returned.
+     * capable of receiving again. Only called if false is returned.
      * @notify_opaque: opaque data to pass to notify call.
      */
     bool (*can_push)(StreamSlave *obj, StreamCanPushNotifyFn notify,
@@ -37,7 +37,7 @@ typedef struct StreamSlaveClass {
      * returned. If the slave short returns, the master must wait before trying
      * again, the slave may continue to just return 0 waiting for the vm time to
      * advance. The can_push() function can be used to trap the point in time
-     * where the slave is ready to recieve again, otherwise polling on a QEMU
+     * where the slave is ready to receive again, otherwise polling on a QEMU
      * timer will work.
      * @obj: Stream slave to push to
      * @buf: Data to write
diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
index 509abd0..7637fac 100644
--- a/include/sysemu/rng.h
+++ b/include/sysemu/rng.h
@@ -37,7 +37,7 @@ struct RngBackendClass
     ObjectClass parent_class;
 
     void (*request_entropy)(RngBackend *s, size_t size,
-                            EntropyReceiveFunc *recieve_entropy, void *opaque);
+                            EntropyReceiveFunc *receive_entropy, void *opaque);
     void (*cancel_requests)(RngBackend *s);
 
     void (*opened)(RngBackend *s, Error **errp);
diff --git a/qmp-commands.hx b/qmp-commands.hx
index 0e89132..d15bec1 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -2493,7 +2493,7 @@ The main json-object contains the following:
             byte (json-int)
             These are sent over the wire much more efficiently.
          - "skipped": number of skipped zero pages (json-int)
-         - "normal" : number of whole pages transfered.  I.e. they
+         - "normal" : number of whole pages transferred.  I.e. they
             were not sent as duplicate or xbzrle pages (json-int)
          - "normal-bytes" : number of bytes transferred in whole
             pages. This is just normal pages times size of one page,
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 0c3cf68..f97e431 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -3806,7 +3806,7 @@ static void cout_tm64(DisasContext *s, DisasOps *o)
 }
 
 /* ====================================================================== */
-/* The "PREPeration" generators.  These initialize the DisasOps.OUT fields
+/* The "PREParation" generators.  These initialize the DisasOps.OUT fields
    with the TCG register to which we will write.  Used in combination with
    the "wout" generators, in some cases we need a new temporary, and in
    some cases we can write to a TCG global.  */
-- 
1.7.10.4


