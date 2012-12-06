Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgaAS-00034r-HK
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 07:03:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaAH-0002Yd-7N
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:03:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaA5-0003o0-Fo
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:02:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Tga9z-0003mN-Cf; Thu, 06 Dec 2012 07:02:35 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB6C2WUo018092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Dec 2012 07:02:33 -0500
Received: from Host-001.privatebox (vpn1-6-33.ams2.redhat.com [10.36.6.33])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qB6C2UVX009142; Thu, 6 Dec 2012 07:02:31 -0500
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu,  6 Dec 2012 14:02:29 +0200
Message-Id: <1354795349-2613-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] arch_init/ram_load: add error message for
	block length mismatch
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
X-List-Received-Date: Thu, 06 Dec 2012 12:03:03 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 arch_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index e6effe8..84bca99 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -808,8 +808,10 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                     QLIST_FOREACH(block, &ram_list.blocks, next) {
                         if (!strncmp(id, block->idstr, sizeof(id))) {
                             if (block->length != length) {
+                                fprintf(stderr, "Length mismatch: %s: %d "
+                                        "in != %d\n", id, length,
+                                        block->length);
                                 ret =  -EINVAL;
-                                goto done;
                             }
                             break;
                         }
-- 
1.8.0.1


