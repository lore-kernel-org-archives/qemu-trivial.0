Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLT7S-00060Z-TM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 03:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VLT7L-0005qU-9q
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 03:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VLT7F-0001wF-85
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 03:21:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VLT72-0001uc-SD; Mon, 16 Sep 2013 03:20:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8G7KhQG011720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 16 Sep 2013 03:20:43 -0400
Received: from T430s.nay.redhat.com ([10.66.6.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8G7KeXY028510; Mon, 16 Sep 2013 03:20:42 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2013 15:20:40 +0800
Message-Id: <1379316040-19320-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, benoit.canet@irqsave.net
Subject: [Qemu-trivial] [PATCH] tests/.gitignore: ignore test-throttle
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
X-List-Received-Date: Mon, 16 Sep 2013 07:21:13 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index d11cc22..ae5280e 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,6 +5,7 @@ check-qjson
 check-qlist
 check-qstring
 test-aio
+test-throttle
 test-cutils
 test-hbitmap
 test-iov
-- 
1.8.3.1


