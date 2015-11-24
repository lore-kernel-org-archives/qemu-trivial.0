Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1Mza-0001hw-BN
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2015 18:27:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1MzX-0001aR-3x
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 18:27:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1MzV-0000Sd-V3
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 18:27:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59209)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1a1MzR-0000R5-R0; Tue, 24 Nov 2015 18:27:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 64B925711;
	Tue, 24 Nov 2015 23:27:13 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAONRCLc012519; Tue, 24 Nov 2015 18:27:12 -0500
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 24 Nov 2015 18:27:11 -0500
Message-Id: <1448407631-9405-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [trivial for-2.6] util/id: fully allocate names table
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
X-List-Received-Date: Tue, 24 Nov 2015 23:27:20 -0000

Trivial: this array should be allocated to have ID_MAX entries always.
Otherwise if someone were to forget to expand this table, the assertion
in the id generator won't actually trigger; it will read junk data.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 util/id.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/id.c b/util/id.c
index bcc64d8..b7ca4d2 100644
--- a/util/id.c
+++ b/util/id.c
@@ -29,7 +29,7 @@ bool id_wellformed(const char *id)
 
 #define ID_SPECIAL_CHAR '#'
 
-static const char *const id_subsys_str[] = {
+static const char *const id_subsys_str[ID_MAX] = {
     [ID_QDEV]  = "qdev",
     [ID_BLOCK] = "block",
 };
-- 
2.4.3


