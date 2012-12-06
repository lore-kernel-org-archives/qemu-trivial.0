Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgaG0-0005Ir-2p
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 07:08:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaFt-0004yX-G3
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaFn-0005Jc-E9
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:08:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1TgaFc-0005Hr-4n; Thu, 06 Dec 2012 07:08:24 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB6C8N0x004784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Dec 2012 07:08:23 -0500
Received: from Host-001.privatebox (vpn1-6-33.ams2.redhat.com [10.36.6.33])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qB6C8Li2002242; Thu, 6 Dec 2012 07:08:22 -0500
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu,  6 Dec 2012 14:08:20 +0200
Message-Id: <1354795700-3052-1-git-send-email-alevy@redhat.com>
In-Reply-To: <1354795349-2613-1-git-send-email-alevy@redhat.com>
References: <1354795349-2613-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] arch_init/ram_load: add error message for
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
X-List-Received-Date: Thu, 06 Dec 2012 12:08:46 -0000

Signed-off-by: Alon Levy <alevy@redhat.com>
---
Please ignore previous version, accidentally removed goto done and used wrong
format size specifiers.

 arch_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch_init.c b/arch_init.c
index e6effe8..fba24f3 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -808,6 +808,9 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
                     QLIST_FOREACH(block, &ram_list.blocks, next) {
                         if (!strncmp(id, block->idstr, sizeof(id))) {
                             if (block->length != length) {
+                                fprintf(stderr, "Length mismatch: %s: %ld "
+                                        "in != %ld\n", id, length,
+                                        block->length);
                                 ret =  -EINVAL;
                                 goto done;
                             }
-- 
1.8.0.1


