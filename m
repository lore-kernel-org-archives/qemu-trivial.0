Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R3VDX-00040P-EI
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2011 11:48:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1R3VDT-0003sA-QL
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2011 11:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1R3VDS-00057Q-QY
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2011 11:48:07 -0400
Received: from mail-ew0-f46.google.com ([209.85.215.46]:38503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1R3VDP-00056d-HX; Tue, 13 Sep 2011 11:48:03 -0400
Received: by ewy4 with SMTP id 4so529685ewy.33
	for <multiple recipients>; Tue, 13 Sep 2011 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=BUfu9DBd7OKIoHrB1WjZXm+AiL4uoUJQrOloff0ek3c=;
	b=vV5FtHwFDEPoP5p84snsgKwMCwWCdvS1Bt5NlBWEnsItJhAX+RV7l/TsDLlveZ9Lfa
	f/LPqOPu+4cGsC3077Q0h4F/bm9eNNf+TYJmhbQJLIz5qmw+LMovMn9bforlc5FaWBtA
	jbqvm4SItGOae/fZoXi791HMfeYFMx7yLztwA=
Received: by 10.52.65.71 with SMTP id v7mr3687301vds.335.1315928881104;
	Tue, 13 Sep 2011 08:48:01 -0700 (PDT)
Received: from localhost.localdomain (93-34-199-31.ip51.fastwebnet.it.
	[93.34.199.31])
	by mx.google.com with ESMTPS id x19sm367089vdf.10.2011.09.13.08.47.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Sep 2011 08:48:00 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Sep 2011 17:47:52 +0200
Message-Id: <1315928872-6730-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.46
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] fix compilation with stderr trace backend
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
X-List-Received-Date: Tue, 13 Sep 2011 15:48:09 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 trace-events |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/trace-events b/trace-events
index a8e7684..1e9e717 100644
--- a/trace-events
+++ b/trace-events
@@ -454,7 +454,7 @@ milkymist_vgafb_memory_write(uint32_t addr, uint32_t value) "addr %08x value %08
 mipsnet_send(uint32_t size) "sending len=%u"
 mipsnet_receive(uint32_t size) "receiving len=%u"
 mipsnet_read(uint64_t addr, uint32_t val) "read addr=0x%" PRIx64 " val=0x%x"
-mipsnet_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64
+mipsnet_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64 ""
 mipsnet_irq(uint32_t isr, uint32_t intctl) "set irq to %d (%02x)"
 
 # xen-all.c
-- 
1.7.6


