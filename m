Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ulz02-0003v1-KX
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 06:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Ulz00-0003su-4J
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1Ulyzx-0006yR-QC
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:06:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1Ulyzx-0006yG-IJ; Mon, 10 Jun 2013 06:06:49 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5AA6nbE005182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 06:06:49 -0400
Received: from choo.home.annexia.org (vpn1-6-48.ams2.redhat.com [10.36.6.48])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id r5AA6jhc014101; Mon, 10 Jun 2013 06:06:47 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Jun 2013 11:06:36 +0100
Message-Id: <1370858796-16217-2-git-send-email-rjones@redhat.com>
In-Reply-To: <1370858796-16217-1-git-send-email-rjones@redhat.com>
References: <1370858796-16217-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] block/curl.c: Refuse to open the handle for
	writes.
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
X-List-Received-Date: Mon, 10 Jun 2013 10:06:53 -0000

From: "Richard W.M. Jones" <rjones@redhat.com>

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block/curl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/curl.c b/block/curl.c
index b8935fd..f1e302b 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -406,6 +406,10 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags)
 
     static int inited = 0;
 
+    if (flags & BDRV_O_RDWR) {
+        return -ENOTSUP;
+    }
+
     opts = qemu_opts_create_nofail(&runtime_opts);
     qemu_opts_absorb_qdict(opts, options, &local_err);
     if (error_is_set(&local_err)) {
-- 
1.8.2.1


