Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dNwkK-0005rn-Tn
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 03:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1dNwkJ-0005qY-GR
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 03:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1dNwkI-0007JC-Lj
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 03:41:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:38341 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1dNwkB-0007IN-Iy; Thu, 22 Jun 2017 03:41:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 5840FAC03;
	Thu, 22 Jun 2017 07:41:34 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu, 22 Jun 2017 09:41:58 +0200
Message-Id: <1498117318-162102-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: [Qemu-trivial] [PATCH] input: Decrement queue count on kbd delay
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jun 2017 07:41:44 -0000

Delays in the input layer are special cased input events. Every input
event is accounted for in a global intput queue count. The special cased
delays however did not get removed from the queue, leading to queue overruns
and thus silent key drops after typing quite a few characters.

Signed-off-by: Alexander Graf <agraf@suse.de>
Fixes: be1a7176 ("input: add support for kbd delays")
Cc: qemu-stable@nongnu.org
---
 ui/input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/input.c b/ui/input.c
index 290ca9f..650a57e 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -257,6 +257,7 @@ static void qemu_input_queue_process(void *opaque)
     item = QTAILQ_FIRST(queue);
     g_assert(item->type == QEMU_INPUT_QUEUE_DELAY);
     QTAILQ_REMOVE(queue, item, node);
+    queue_count--;
     g_free(item);
 
     while (!QTAILQ_EMPTY(queue)) {
-- 
1.8.5.6


