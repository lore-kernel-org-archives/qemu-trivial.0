Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEAwJ-0004aM-Nx
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 04:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEAwG-0004Ua-Rn
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 04:21:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEAwG-0006uX-1X
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 04:21:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEAwB-0006r9-Mv; Mon, 13 Nov 2017 04:21:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 861BC25C21;
	Mon, 13 Nov 2017 09:21:50 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8B5F5F931;
	Mon, 13 Nov 2017 09:21:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, kraxel@redhat.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Mon, 13 Nov 2017 10:21:45 +0100
Message-Id: <1510564905-6185-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 13 Nov 2017 09:21:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] scripts/make-release: No need to delete
 pixman/.git anymore
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
X-List-Received-Date: Mon, 13 Nov 2017 09:21:57 -0000

The pixman submodule has been removed in commit c12b6d70e384c769ca372e1,
so there is no need anymore to delete pixman/.git while building a
release tarball.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index fa6323f..70367ab 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -19,7 +19,7 @@ pushd ${destination}
 git checkout "v${version}"
 git submodule update --init
 (cd roms/seabios && git describe --tags --long --dirty > .version)
-rm -rf .git roms/*/.git dtc/.git pixman/.git
+rm -rf .git roms/*/.git dtc/.git
 popd
 tar cfj ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
1.8.3.1


