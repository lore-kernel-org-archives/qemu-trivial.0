Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z33sO-0003x2-7z
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jun 2015 10:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z32NB-000163-1U
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 09:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z32N6-0005bw-U2
	for qemu-trivial@nongnu.org; Thu, 11 Jun 2015 09:18:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>)
	id 1Z32My-0005Yb-PG; Thu, 11 Jun 2015 09:18:08 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 79B3C373BDA;
	Thu, 11 Jun 2015 13:18:08 +0000 (UTC)
Received: from rhwork.redhat.com (vpn1-7-156.ams2.redhat.com [10.36.7.156])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5BDI3aF008890; Thu, 11 Jun 2015 09:18:06 -0400
From: Frediano Ziglio <fziglio@redhat.com>
To: fziglio@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 11 Jun 2015 14:17:57 +0100
Message-Id: <1434028677-26160-2-git-send-email-fziglio@redhat.com>
In-Reply-To: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 11 Jun 2015 10:54:39 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] Check value for invalid negative values
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
X-List-Received-Date: Thu, 11 Jun 2015 13:18:22 -0000

In qxl_v2n check that value is not negative.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 hw/display/qxl-logger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index d944d3f..faed869 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -93,7 +93,7 @@ static const char *const spice_cursor_type[] = {
 
 static const char *qxl_v2n(const char *const n[], size_t l, int v)
 {
-    if (v >= l || !n[v]) {
+    if (v < 0 || v >= l || !n[v]) {
         return "???";
     }
     return n[v];
-- 
2.1.0


