Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3V9O-0000fR-H3
	for mharc-qemu-trivial@gnu.org; Wed, 26 Apr 2017 18:11:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3V9M-0000e7-Pw
	for qemu-trivial@nongnu.org; Wed, 26 Apr 2017 18:11:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3V9L-0004Di-QW
	for qemu-trivial@nongnu.org; Wed, 26 Apr 2017 18:11:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d3V9C-0004Aw-GD; Wed, 26 Apr 2017 18:10:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19BA881235;
	Wed, 26 Apr 2017 22:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 19BA881235
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 19BA881235
Received: from red.redhat.com (ovpn-123-177.rdu2.redhat.com [10.10.123.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51D7882732;
	Wed, 26 Apr 2017 22:10:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Wed, 26 Apr 2017 17:10:46 -0500
Message-Id: <20170426221046.4596-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 26 Apr 2017 22:10:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] iotests: Fix typo in 026
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
X-List-Received-Date: Wed, 26 Apr 2017 22:11:05 -0000

s/refcout/refcount/

CC: qemu-trivial@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/026             | 2 +-
 tests/qemu-iotests/026.out         | 2 +-
 tests/qemu-iotests/026.out.nocache | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/026 b/tests/qemu-iotests/026
index f5a7f02..7fadfba 100755
--- a/tests/qemu-iotests/026
+++ b/tests/qemu-iotests/026
@@ -119,7 +119,7 @@ done


 echo
-echo === Refcout table growth tests ===
+echo === Refcount table growth tests ===
 echo
 CLUSTER_SIZE=512

diff --git a/tests/qemu-iotests/026.out b/tests/qemu-iotests/026.out
index 59b8f74..86a50a2 100644
--- a/tests/qemu-iotests/026.out
+++ b/tests/qemu-iotests/026.out
@@ -462,7 +462,7 @@ Event: cluster_alloc; errno: 28; imm: off; once: off; write -b
 write failed: No space left on device
 No errors were found on the image.

-=== Refcout table growth tests ===
+=== Refcount table growth tests ===

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824

diff --git a/tests/qemu-iotests/026.out.nocache b/tests/qemu-iotests/026.out.nocache
index b4aeebc..ea2e166 100644
--- a/tests/qemu-iotests/026.out.nocache
+++ b/tests/qemu-iotests/026.out.nocache
@@ -470,7 +470,7 @@ Event: cluster_alloc; errno: 28; imm: off; once: off; write -b
 write failed: No space left on device
 No errors were found on the image.

-=== Refcout table growth tests ===
+=== Refcount table growth tests ===

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824 

-- 
2.9.3


