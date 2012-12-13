Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tj9km-0004Y8-82
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2012 09:27:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Tj9ki-0004MP-Ax
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2012 09:27:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Tj9kd-000313-60
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2012 09:27:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1Tj9kc-00030n-UX; Thu, 13 Dec 2012 09:27:03 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBDER19h032678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 13 Dec 2012 09:27:01 -0500
Received: from lacos-laptop.usersys.redhat.com (vpn1-5-167.ams2.redhat.com
	[10.36.5.167])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBDE0250026724; Thu, 13 Dec 2012 09:00:02 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lersek@redhat.com
Date: Thu, 13 Dec 2012 15:01:49 +0100
Message-Id: <1355407309-7138-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] vmmouse_reset(): remove minimal code
	duplication
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
X-List-Received-Date: Thu, 13 Dec 2012 14:27:11 -0000

Commit 069ab0eb added a vmmouse_disable() call to vmmouse_reset().
vmmouse_disable() resets the status already.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/vmmouse.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/vmmouse.c b/hw/vmmouse.c
index 6338efa..578122c 100644
--- a/hw/vmmouse.c
+++ b/hw/vmmouse.c
@@ -252,7 +252,6 @@ static void vmmouse_reset(DeviceState *d)
 {
     VMMouseState *s = container_of(d, VMMouseState, dev.qdev);
 
-    s->status = 0xffff;
     s->queue_size = VMMOUSE_QUEUE_SIZE;
 
     vmmouse_disable(s);
-- 
1.7.1


