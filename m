Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXyZM-0003y8-Rr
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 16:58:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YXyZK-0003vd-EY
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 16:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YXyZJ-0003u6-Nt
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 16:58:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YXyZD-0003rU-6F; Tue, 17 Mar 2015 16:58:23 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 70E0DC63F1;
	Tue, 17 Mar 2015 20:58:22 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2HKwLib005109; Tue, 17 Mar 2015 16:58:21 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 17 Mar 2015 16:58:19 -0400
Message-Id: <1426625899-25348-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qtest/ahci: Fix clang 3.5.0 error
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
X-List-Received-Date: Tue, 17 Mar 2015 20:58:31 -0000

A thinko that clang 3.5.0 caught.
Thankfully does not introduce any new failures.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/ahci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index cf0b98b..169e83b 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -583,7 +583,7 @@ static void ahci_test_port_spec(AHCIQState *ahci, uint8_t port)
         ASSERT_BIT_CLEAR(reg, AHCI_PX_CMD_MPSP);
     }
     /* If, via CPD or MPSP we detect a drive, HPCP must be on. */
-    if (BITANY(reg, AHCI_PX_CMD_CPD || AHCI_PX_CMD_MPSP)) {
+    if (BITANY(reg, AHCI_PX_CMD_CPD | AHCI_PX_CMD_MPSP)) {
         ASSERT_BIT_SET(reg, AHCI_PX_CMD_HPCP);
     }
     /* HPCP and ESP cannot both be active. */
-- 
2.1.0


