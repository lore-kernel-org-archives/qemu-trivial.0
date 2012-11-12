Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TXvKW-0008Eq-8s
	for mharc-qemu-trivial@gnu.org; Mon, 12 Nov 2012 09:49:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TXvKQ-0007wd-Sl
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 09:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1TXvKN-00038k-PB
	for qemu-trivial@nongnu.org; Mon, 12 Nov 2012 09:49:34 -0500
Received: from mail-vb0-f45.google.com ([209.85.212.45]:59629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1TXvKH-000387-GG; Mon, 12 Nov 2012 09:49:25 -0500
Received: by mail-vb0-f45.google.com with SMTP id p1so6095300vbi.4
	for <multiple recipients>; Mon, 12 Nov 2012 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wAJ6z7sztX801vb0TAl71ZPIdCsCcAw+o/Ja0bzkr5A=;
	b=PskC+Ejq3YrpcSVtayawWPYpDtjn0dHCu03BhrxVUuAx+YLG/EqUZRFT2Pz0M1CmTA
	/PGByCJVPeV6Gcp5he6gdWHPtMTIsXeico71kjxXRryCTz0s3sVLZboKhQmqI0hsTi4y
	eQwilfOciwafiIVkGLlRv0Pg4X4j6eOXYtdHyrogpFFOa38oN1onNdDd9AzdKtZU+efR
	KGpAqQfibtwNG3jW+0OTtBFAxxLhEupv6NGhcIStYLNXouuCwbdszLRsfaPAw0eUJWqf
	aany2ru5egQZ34JiM0MGeyY0vl/4Vktpio/11V8dVn8Ey8+CRX/r8frqw/QObOM1+7S5
	pnQw==
Received: by 10.52.173.74 with SMTP id bi10mr22550381vdc.81.1352731765001;
	Mon, 12 Nov 2012 06:49:25 -0800 (PST)
Received: from hedwig.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.5])
	by mx.google.com with ESMTPS id g5sm6688303vez.6.2012.11.12.06.49.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 06:49:24 -0800 (PST)
Date: Mon, 12 Nov 2012 09:49:19 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20121112144918.GA2107@hedwig.ini.cmu.edu>
References: <20121111221650.GA3575@foober.ini.cmu.edu>
	<50A0CECA.9060102@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50A0CECA.9060102@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.45
Cc: somlo@cmu.edu, jbaron@redhat.com, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] ehci: fix compile error with EHCI_DEBUG
	enabled
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
X-List-Received-Date: Mon, 12 Nov 2012 14:49:38 -0000

This patch fixes a few debugging print statements whose arguments fell
out of sync over time with changes being made to the active code base.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---

On Mon, Nov 12, 2012 at 11:26:18AM +0100, Gerd Hoffmann wrote:
> Seems macos doesn't like something in our ehci emulation ...
> Can you send a trace with all ehci tracepoints enabled?

Turning EHCI_DEBUG on gave me compile errors. This is my best guess
as to what the DPRINTF arguments *should* be, hope I guessed right :)

This patch works against both master and the q35 branch, BTW.

I'll reply to your email again with the debug output, figured I'd get
this out of the way first...

Thanks,
  Gabriel

 hw/usb/hcd-ehci.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index d9dc576..e3ccb59 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1188,7 +1188,7 @@ static void ehci_execute_complete(EHCIQueue *q)
            p->async == EHCI_ASYNC_FINISHED);
 
     DPRINTF("execute_complete: qhaddr 0x%x, next %x, qtdaddr 0x%x, status %d\n",
-            q->qhaddr, q->qh.next, q->qtdaddr, q->usb_status);
+            q->qhaddr, q->qh.next, q->qtdaddr, p->usb_status);
 
     if (p->usb_status < 0) {
         switch (p->usb_status) {
@@ -1305,8 +1305,8 @@ static int ehci_execute(EHCIPacket *p, const char *action)
     trace_usb_ehci_packet_action(p->queue, p, action);
     ret = usb_handle_packet(p->queue->dev, &p->packet);
     DPRINTF("submit: qh %x next %x qtd %x pid %x len %zd endp %x ret %d\n",
-            q->qhaddr, q->qh.next, q->qtdaddr, q->pid,
-            q->packet.iov.size, endp, ret);
+            p->queue->qhaddr, p->queue->qh.next, p->queue->qtdaddr, p->pid,
+            p->packet.iov.size, endp, ret);
 
     if (ret > BUFF_SIZE) {
         fprintf(stderr, "ret from usb_handle_packet > BUFF_SIZE\n");
-- 
1.7.7.6


