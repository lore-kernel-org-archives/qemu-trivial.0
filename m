Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLj-0003g8-TQ
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVl-0004wj-Nz
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVl-0001sH-2k
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52051)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVa-0001mg-QY; Thu, 27 Jul 2017 08:03:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE935108E4F;
	Thu, 27 Jul 2017 12:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BE935108E4F
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 357266128A;
	Thu, 27 Jul 2017 12:03:12 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 27 Jul 2017 08:02:09 -0400
Message-Id: <20170727120210.6943-5-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 27 Jul 2017 12:03:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:09 -0400
Subject: [Qemu-trivial] [PATCH 4/5] qemu-iotests: remove comment about root
 privileges requirement
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:26 -0000

The check script contains a commented out root user requirement,
probably because of its xfstests heritage.  This requirement doesn't
apply to qemu-iotests, so it better be gone.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/check | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 437ef65..d504b6e 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -123,12 +123,6 @@ fi
 # we need common
 . "$source_iotests/common"
 
-#if [ `id -u` -ne 0 ]
-#then
-#    echo "check: QA must be run as root"
-#    exit 1
-#fi
-
 TIMESTAMP_FILE=check.time-$IMGPROTO-$IMGFMT
 
 tmp="${TEST_DIR}"/$$
-- 
2.9.4


