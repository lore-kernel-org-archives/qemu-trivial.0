Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqYrb-0008MC-Ot
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 21:49:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqYrU-0008De-ST
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 21:49:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XqYrO-0007pA-J1
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 21:49:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XqYrB-0007g9-RU; Mon, 17 Nov 2014 21:49:30 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAI2nSpr027799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 21:49:28 -0500
Received: from fam-t430.nay.redhat.com (dhcp-14-161.nay.redhat.com
	[10.66.14.161])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAI2nNeu011094; Mon, 17 Nov 2014 21:49:24 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Nov 2014 10:49:46 +0800
Message-Id: <1416278986-17320-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mjt@tls.msk.ru,
	stefanha@redhat.com, mreitz@redhat.com
Subject: [Qemu-trivial] [PATCH] qemu-iotests: Fix error message if which(1)
	not installed
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
X-List-Received-Date: Tue, 18 Nov 2014 02:49:55 -0000

When which(1) is not installed, we complain "perl not found" because
it's the first set_prog_path check. The error message is misleading.

Fix it by adding a check for which(1) in the beginning.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/qemu-iotests/common.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common.config
index bd6790b..9674f3a 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -73,6 +73,8 @@ _fatal()
     exit 1
 }
 
+which -v &>/dev/null || _fatal "which not found"
+
 export PERL_PROG="`set_prog_path perl`"
 [ "$PERL_PROG" = "" ] && _fatal "perl not found"
 
-- 
1.9.3


