Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJEG-0001Bw-N6
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE8-00011e-L1
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE3-0005cp-Ux
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDn-0005aN-GP; Fri, 15 Aug 2014 11:15:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ADF644307A;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 879046E1;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: (nullmailer pid 17916 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:58 +0400
Message-Id: <1408115711-17836-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/20] usb: don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/dev-audio.c |    2 +-
 hw/usb/dev-mtp.c   |    4 ++--
 hw/usb/hcd-ehci.c  |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index bfebfe9..7b9957b 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -371,7 +371,7 @@ static void output_callback(void *opaque, int avail)
             return;
         }
         data = streambuf_get(&s->out.buf);
-        if (NULL == data) {
+        if (!data) {
             return;
         }
         AUD_write(s->out.voice, data, USBAUDIO_PACKET_SIZE);
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 384d4a5..0820046 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -832,7 +832,7 @@ static void usb_mtp_command(MTPState *s, MTPControl *c)
             return;
         }
         data_in = usb_mtp_get_object(s, c, o);
-        if (NULL == data_in) {
+        if (data_in == NULL) {
             usb_mtp_queue_result(s, RES_GENERAL_ERROR,
                                  c->trans, 0, 0, 0);
             return;
@@ -851,7 +851,7 @@ static void usb_mtp_command(MTPState *s, MTPControl *c)
             return;
         }
         data_in = usb_mtp_get_partial_object(s, c, o);
-        if (NULL == data_in) {
+        if (data_in == NULL) {
             usb_mtp_queue_result(s, RES_GENERAL_ERROR,
                                  c->trans, 0, 0, 0);
             return;
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index a00a93c..448e007 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1596,7 +1596,7 @@ static EHCIQueue *ehci_state_fetchqh(EHCIState *ehci, int async)
 
     entry = ehci_get_fetch_addr(ehci, async);
     q = ehci_find_queue_by_qh(ehci, entry, async);
-    if (NULL == q) {
+    if (q == NULL) {
         q = ehci_alloc_queue(ehci, entry, async);
     }
 
-- 
1.7.10.4


