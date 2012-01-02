Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhmmB-0003cI-2w
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:38:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmCA-00013R-PF
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC9-0001B1-Iu
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:14 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:55466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmC5-0001A8-Ab; Mon, 02 Jan 2012 13:01:09 -0500
Received: by ghbg16 with SMTP id g16so6034153ghb.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=6i+bV9xF6KhMhRSJ6LYWj5nmaGTDaqT0Tz96OcayJTY=;
	b=t/Hw16WBjpEZYF9DcYEHCS0Cdo83va5Z8f5aIKEWFF129dCs/6RlgvTCL+ymC8D6d7
	yz54nEV40r9B99EekiH/SvNYrlYyzzYQVkCeqwxH4G0tVSknkvtQJ5UHgzFFdAYbItgY
	59tXyc8acYvKPzS3K4Ce/TTE4mdqrueSmYRlY=
Received: by 10.236.190.230 with SMTP id e66mr18295215yhn.54.1325527268718;
	Mon, 02 Jan 2012 10:01:08 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:01:08 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:33 +0100
Message-Id: <1325527237-24146-5-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 4/8] ccid: switch to QTAILQ
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
X-List-Received-Date: Mon, 02 Jan 2012 18:38:25 -0000

CCID emulation needs to insert at tail.  Use a QTAILQ, even though
the double links are strictly not necessary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ccid-card-emulated.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/ccid-card-emulated.c b/hw/ccid-card-emulated.c
index 2d2ebce..1d0e67d 100644
--- a/hw/ccid-card-emulated.c
+++ b/hw/ccid-card-emulated.c
@@ -89,7 +89,7 @@ static const char *emul_event_to_string(uint32_t emul_event)
 }
 
 typedef struct EmulEvent {
-    QSIMPLEQ_ENTRY(EmulEvent) entry;
+    QTAILQ_ENTRY(EmulEvent) entry;
     union {
         struct {
             uint32_t type;
@@ -118,11 +118,11 @@ struct EmulatedState {
     char    *db;
     uint8_t  atr[MAX_ATR_SIZE];
     uint8_t  atr_length;
-    QSIMPLEQ_HEAD(event_list, EmulEvent) event_list;
+    QTAILQ_HEAD(event_list, EmulEvent) event_list;
     QemuMutex event_list_mutex;
     QemuThread event_thread_id;
     VReader *reader;
-    QSIMPLEQ_HEAD(guest_apdu_list, EmulEvent) guest_apdu_list;
+    QTAILQ_HEAD(guest_apdu_list, EmulEvent) guest_apdu_list;
     QemuMutex vreader_mutex; /* and guest_apdu_list mutex */
     QemuMutex handle_apdu_mutex;
     QemuCond handle_apdu_cond;
@@ -142,7 +142,7 @@ static void emulated_apdu_from_guest(CCIDCardState *base,
     event->p.data.len = len;
     memcpy(event->p.data.data, apdu, len);
     qemu_mutex_lock(&card->vreader_mutex);
-    QSIMPLEQ_INSERT_TAIL(&card->guest_apdu_list, event, entry);
+    QTAILQ_INSERT_TAIL(&card->guest_apdu_list, event, entry);
     qemu_mutex_unlock(&card->vreader_mutex);
     qemu_mutex_lock(&card->handle_apdu_mutex);
     qemu_cond_signal(&card->handle_apdu_cond);
@@ -160,7 +160,7 @@ static const uint8_t *emulated_get_atr(CCIDCardState *base, uint32_t *len)
 static void emulated_push_event(EmulatedState *card, EmulEvent *event)
 {
     qemu_mutex_lock(&card->event_list_mutex);
-    QSIMPLEQ_INSERT_TAIL(&(card->event_list), event, entry);
+    QTAILQ_INSERT_TAIL(&(card->event_list), event, entry);
     qemu_mutex_unlock(&card->event_list_mutex);
     if (write(card->pipe[1], card, 1) != 1) {
         DPRINTF(card, 1, "write to pipe failed\n");
@@ -243,10 +243,10 @@ static void *handle_apdu_thread(void* arg)
             break;
         }
         qemu_mutex_lock(&card->vreader_mutex);
-        while (!QSIMPLEQ_EMPTY(&card->guest_apdu_list)) {
-            event = QSIMPLEQ_FIRST(&card->guest_apdu_list);
+        while (!QTAILQ_EMPTY(&card->guest_apdu_list)) {
+            event = QTAILQ_FIRST(&card->guest_apdu_list);
             assert((unsigned long)event > 1000);
-            QSIMPLEQ_REMOVE_HEAD(&card->guest_apdu_list, entry);
+            QTAILQ_REMOVE(&card->guest_apdu_list, event, entry);
             if (event->p.data.type != EMUL_GUEST_APDU) {
                 DPRINTF(card, 1, "unexpected message in handle_apdu_thread\n");
                 g_free(event);
@@ -369,7 +369,7 @@ static void pipe_read(void *opaque)
         len = read(card->pipe[0], &dummy, sizeof(dummy));
     } while (len == sizeof(dummy));
     qemu_mutex_lock(&card->event_list_mutex);
-    QSIMPLEQ_FOREACH_SAFE(event, &card->event_list, entry, next) {
+    QTAILQ_FOREACH_SAFE(event, &card->event_list, entry, next) {
         DPRINTF(card, 2, "event %s\n", emul_event_to_string(event->p.gen.type));
         switch (event->p.gen.type) {
         case EMUL_RESPONSE_APDU:
@@ -400,7 +400,7 @@ static void pipe_read(void *opaque)
         }
         g_free(event);
     }
-    QSIMPLEQ_INIT(&card->event_list);
+    QTAILQ_INIT(&card->event_list);
     qemu_mutex_unlock(&card->event_list_mutex);
 }
 
@@ -489,8 +489,8 @@ static int emulated_initfn(CCIDCardState *base)
     VCardEmulError ret;
     EnumTable *ptable;
 
-    QSIMPLEQ_INIT(&card->event_list);
-    QSIMPLEQ_INIT(&card->guest_apdu_list);
+    QTAILQ_INIT(&card->event_list);
+    QTAILQ_INIT(&card->guest_apdu_list);
     qemu_mutex_init(&card->event_list_mutex);
     qemu_mutex_init(&card->vreader_mutex);
     qemu_mutex_init(&card->handle_apdu_mutex);
-- 
1.7.7.1



