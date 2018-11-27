Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRiSa-00020Y-7t
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 13:51:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1gRiSW-0001vu-4X
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 13:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1gRiQX-0006ua-5q
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 13:49:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1gRiQS-0006t5-RM; Tue, 27 Nov 2018 13:49:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01B563154862;
	Tue, 27 Nov 2018 18:49:35 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-2.bos.redhat.com [10.18.17.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 798375D6A9;
	Tue, 27 Nov 2018 18:49:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Tue, 27 Nov 2018 13:49:29 -0500
Message-Id: <20181127184929.20065-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 27 Nov 2018 18:49:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] scsi: Address spurious clang warning
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
X-List-Received-Date: Tue, 27 Nov 2018 18:51:47 -0000

Some versions of Clang prior to 6.0 (and some builds of clang after,
such as 6.0.1-2.fc28) fail to recognize { 0 } as a valid initializer
for a struct with subobjects when -Wmissing-braces is enabled.

https://bugs.llvm.org/show_bug.cgi?id=21689 and
https://reviews.llvm.org/rL314499 suggests this should be fixed in 6.0,
but it might not be the case for older versions or downstream versions.

For now, follow the precedent of ebf2a499 and replace the standard { 0 }
with the accepted { } to silence this warning and allow the build to
work under clang 6.0.1-2.fc28, and builds prior to 6.0.

Signed-off-by: John Snow <jsnow@redhat.com>

---

What I am actually less clear on is why this appears to be a problem
only now; since the introduction of { 0 } was in 2.11. It might be
a regression only in the fedora distribution of Clang 6.0.

With apologies to Paolo, who hates these patches.
---
 scsi/qemu-pr-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index ce40008bfc..e7af637232 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -236,7 +236,7 @@ static void dm_init(void)
         perror("Cannot open " CONTROL_PATH);
         exit(1);
     }
-    struct dm_ioctl dm = { 0 };
+    struct dm_ioctl dm = { };
     if (!dm_ioctl(DM_VERSION, &dm)) {
         perror("ioctl");
         exit(1);
-- 
2.17.2


