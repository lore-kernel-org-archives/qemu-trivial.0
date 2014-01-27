Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W7hWx-0001FD-6i
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2014 03:26:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1W7hWp-00014W-8k
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 03:26:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1W7hWj-0005Jj-76
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 03:26:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1W7hWW-00057U-SF; Mon, 27 Jan 2014 03:26:29 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0R8QPJV015241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 27 Jan 2014 03:26:28 -0500
Received: from T430.redhat.com ([10.66.7.25])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0R8QIB5013986; Mon, 27 Jan 2014 03:26:20 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jan 2014 16:26:21 +0800
Message-Id: <1390811181-21772-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Subject: [Qemu-trivial] [PATCH] tests/.gitignore: Ignore
	tests/check-qom-interface
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
X-List-Received-Date: Mon, 27 Jan 2014 08:26:53 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 1aed224..9ba9d96 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -4,6 +4,7 @@ check-qint
 check-qjson
 check-qlist
 check-qstring
+check-qom-interface
 test-aio
 test-bitops
 test-throttle
-- 
1.8.5.3


