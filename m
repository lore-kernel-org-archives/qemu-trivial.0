Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbAcx-0008Ik-Ob
	for mharc-qemu-trivial@gnu.org; Tue, 29 Oct 2013 10:50:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VbAco-0008Df-Uh
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 10:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VbAci-0001kO-L0
	for qemu-trivial@nongnu.org; Tue, 29 Oct 2013 10:50:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VbAcW-0001ia-9R; Tue, 29 Oct 2013 10:50:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9TEoA5W007280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 29 Oct 2013 10:50:11 -0400
Received: from localhost (ovpn-112-41.ams2.redhat.com [10.36.112.41])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9TEo2JX002202; Tue, 29 Oct 2013 10:50:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 29 Oct 2013 15:44:31 +0100
Message-Id: <1383057871-3897-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] usb: drop unused USBNetState.inpkt field
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
X-List-Received-Date: Tue, 29 Oct 2013 14:50:36 -0000

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/usb/dev-network.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 660d774..4c532b7 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -637,7 +637,6 @@ typedef struct USBNetState {
     unsigned int out_ptr;
     uint8_t out_buf[2048];
 
-    USBPacket *inpkt;
     unsigned int in_ptr, in_len;
     uint8_t in_buf[2048];
 
-- 
1.8.3.1


