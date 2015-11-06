Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuhYV-0007aS-VI
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:59:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZuhYT-0007W1-26
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:59:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZuhYR-0005E9-Ti
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:59:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZuhYL-0005Bg-MW; Fri, 06 Nov 2015 08:59:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2BEA740D82;
	Fri,  6 Nov 2015 16:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 802D0AC8;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31703 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:52 +0300
Message-Id: <98f343395e937fa1db3a28dfb4f303f97cfddd6c.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 15/24] usb: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Fri, 06 Nov 2015 13:59:50 -0000

From: Markus Armbruster <armbru@redhat.com>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/ccid-card-emulated.c | 4 ++--
 hw/usb/dev-mtp.c            | 3 +--
 hw/usb/hcd-xhci.c           | 2 +-
 hw/usb/redirect.c           | 6 +++---
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 72329ed..869a63c 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -166,7 +166,7 @@ static void emulated_push_event(EmulatedState *card, EmulEvent *event)
 
 static void emulated_push_type(EmulatedState *card, uint32_t type)
 {
-    EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent));
+    EmulEvent *event = g_new(EmulEvent, 1);
 
     assert(event);
     event->p.gen.type = type;
@@ -175,7 +175,7 @@ static void emulated_push_type(EmulatedState *card, uint32_t type)
 
 static void emulated_push_error(EmulatedState *card, uint64_t code)
 {
-    EmulEvent *event = (EmulEvent *)g_malloc(sizeof(EmulEvent));
+    EmulEvent *event = g_new(EmulEvent, 1);
 
     assert(event);
     event->p.error.type = EMUL_ERROR;
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 809b1cb..a276267 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -359,8 +359,7 @@ static void usb_mtp_object_readdir(MTPState *s, MTPObject *o)
     }
     while ((entry = readdir(dir)) != NULL) {
         if ((o->nchildren % 32) == 0) {
-            o->children = g_realloc(o->children,
-                                    (o->nchildren + 32) * sizeof(MTPObject *));
+            o->children = g_renew(MTPObject *, o->children, o->nchildren + 32);
         }
         o->children[o->nchildren] =
             usb_mtp_object_alloc(s, s->next_handle++, o, entry->d_name);
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 1c57e20..268ab36 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -2188,7 +2188,7 @@ static void xhci_kick_ep(XHCIState *xhci, unsigned int slotid,
             xfer->trbs = NULL;
         }
         if (!xfer->trbs) {
-            xfer->trbs = g_malloc(sizeof(XHCITRB) * length);
+            xfer->trbs = g_new(XHCITRB, length);
             xfer->trb_alloced = length;
         }
         xfer->trb_count = length;
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 38086cd..30ff742 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -322,7 +322,7 @@ static void packet_id_queue_add(struct PacketIdQueue *q, uint64_t id)
 
     DPRINTF("adding packet id %"PRIu64" to %s queue\n", id, q->name);
 
-    e = g_malloc0(sizeof(struct PacketIdQueueEntry));
+    e = g_new0(struct PacketIdQueueEntry, 1);
     e->id = id;
     QTAILQ_INSERT_TAIL(&q->head, e, next);
     q->size++;
@@ -468,7 +468,7 @@ static void bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
     }
 
-    bufp = g_malloc(sizeof(struct buf_packet));
+    bufp = g_new(struct buf_packet, 1);
     bufp->data   = data;
     bufp->len    = len;
     bufp->offset = 0;
@@ -2234,7 +2234,7 @@ static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused)
 
     endp->bufpq_size = qemu_get_be32(f);
     for (i = 0; i < endp->bufpq_size; i++) {
-        bufp = g_malloc(sizeof(struct buf_packet));
+        bufp = g_new(struct buf_packet, 1);
         bufp->len = qemu_get_be32(f);
         bufp->status = qemu_get_be32(f);
         bufp->offset = 0;
-- 
2.1.4


