Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecTz0-00051X-IU
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 05:33:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ecTyy-00050B-Ip
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 05:33:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ecTyx-0005BH-Q2
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 05:33:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ecTyt-000551-CQ; Fri, 19 Jan 2018 05:33:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5B9D1112;
	Fri, 19 Jan 2018 10:33:05 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-96.brq.redhat.com [10.40.204.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 948765D6B2;
	Fri, 19 Jan 2018 10:33:02 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 19 Jan 2018 11:32:33 +0100
Message-Id: <20180119103233.26075-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 19 Jan 2018 10:33:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] build: fix typo in error message
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
X-List-Received-Date: Fri, 19 Jan 2018 10:33:13 -0000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/git-submodule.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index bc7224a27f..807ca0b4f8 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -28,7 +28,7 @@ error() {
     echo
     echo "and then manually update submodules prior to running make, with:"
     echo
-    echo " $ scripts/git-sbumodule.sh update $modules"
+    echo " $ scripts/git-submodule.sh update $modules"
     echo
     exit 1
 }
-- 
2.14.3


