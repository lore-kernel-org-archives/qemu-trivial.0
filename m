Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6Sbs-0002WT-Gq
	for mharc-qemu-trivial@gnu.org; Thu, 04 May 2017 22:04:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1d6Sbp-0002TH-Nz
	for qemu-trivial@nongnu.org; Thu, 04 May 2017 22:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1d6Sbp-0004O0-1x
	for qemu-trivial@nongnu.org; Thu, 04 May 2017 22:04:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1d6Sbi-0004Iq-Rq; Thu, 04 May 2017 22:04:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92CE665750;
	Fri,  5 May 2017 02:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 92CE665750
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 92CE665750
Received: from lemon.redhat.com (ovpn-8-36.pek2.redhat.com [10.72.8.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CF817D94A;
	Fri,  5 May 2017 02:04:32 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri,  5 May 2017 10:04:30 +0800
Message-Id: <20170505020430.2305-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 05 May 2017 02:04:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tests: Remove redundant assignment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 05 May 2017 02:04:42 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/postcopy-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/postcopy-test.c b/tests/postcopy-test.c
index de35a18..e86f876 100644
--- a/tests/postcopy-test.c
+++ b/tests/postcopy-test.c
@@ -41,7 +41,7 @@ static bool ufd_version_check(void)
     struct uffdio_api api_struct;
     uint64_t ioctl_mask;
 
-    int ufd = ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    int ufd = syscall(__NR_userfaultfd, O_CLOEXEC);
 
     if (ufd == -1) {
         g_test_message("Skipping test: userfaultfd not available");
-- 
2.9.3


