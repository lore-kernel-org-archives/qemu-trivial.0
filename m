Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpEr-0003He-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEk-00035c-Pk
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEg-0003gJ-03
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:06 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:64722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEV-0003cd-Bu; Mon, 11 Aug 2014 09:01:51 -0400
Received: from 172.24.2.119 (EHLO szxeml402-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAC71194; Mon, 11 Aug 2014 21:01:15 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml402-hub.china.huawei.com
	(10.82.67.32) with Microsoft SMTP Server id 14.3.158.1; Mon, 11 Aug 2014
	21:01:05 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:52 +0800
Message-ID: <1407762058-11512-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 2/8] usb: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:11 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/usb/dev-audio.c | 2 +-
 hw/usb/dev-mtp.c   | 4 ++--
 hw/usb/hcd-ehci.c  | 2 +-
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
1.7.12.4



