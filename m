Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ze87k-0007T9-No
	for mharc-qemu-trivial@gnu.org; Mon, 21 Sep 2015 16:55:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Ze87g-0007QN-Tp
	for qemu-trivial@nongnu.org; Mon, 21 Sep 2015 16:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Ze87g-00032H-3x
	for qemu-trivial@nongnu.org; Mon, 21 Sep 2015 16:55:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Ze87a-00030c-1w; Mon, 21 Sep 2015 16:55:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 76E5F368E3;
	Mon, 21 Sep 2015 20:55:33 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8LKtVqg003036; Mon, 21 Sep 2015 16:55:31 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 21 Sep 2015 16:55:29 -0400
Message-Id: <1442868929-17777-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] qtest/ahci: fix redundant assertion
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
X-List-Received-Date: Mon, 21 Sep 2015 20:55:42 -0000

Fixes https://bugs.launchpad.net/qemu/+bug/1497711

(!ncq || (ncq && lba48)) is the same as
(!ncq || lba48).

The intention is simply: "If a command is NCQ,
it must also be LBA48."

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/libqos/ahci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
index cf66b3e..adb2665 100644
--- a/tests/libqos/ahci.c
+++ b/tests/libqos/ahci.c
@@ -742,7 +742,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!(props->lba28 && props->lba48));
     g_assert(!(props->read && props->write));
     g_assert(!props->size || props->data);
-    g_assert(!props->ncq || (props->ncq && props->lba48));
+    g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
     cmd->props = props;
-- 
2.4.3


