Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePqxS-0005UR-Bv
	for mharc-qemu-trivial@gnu.org; Fri, 15 Dec 2017 09:27:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ePqxQ-0005TA-1n
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 09:27:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ePqxP-0007sV-8e
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 09:27:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ePqxK-0007l2-4a; Fri, 15 Dec 2017 09:27:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02A762D2689;
	Fri, 15 Dec 2017 14:27:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-117-38.ams2.redhat.com [10.36.117.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4D7F60602;
	Fri, 15 Dec 2017 14:27:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 15:27:10 +0100
Message-Id: <1513348030-7689-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 15 Dec 2017 14:27:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] scripts/make-release: No need to delete
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
X-List-Received-Date: Fri, 15 Dec 2017 14:27:24 -0000

The pixman submodule has been removed in commit c12b6d70e384c769ca372e1,
so there is no need anymore to delete pixman/.git while building a
release tarball.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Rebased to current master branch (there was a contextual conflict)

 scripts/make-release | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index 3917df7..7af11af 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -19,7 +19,7 @@ pushd ${destination}
 git checkout "v${version}"
 git submodule update --init
 (cd roms/seabios && git describe --tags --long --dirty > .version)
-rm -rf .git roms/*/.git dtc/.git pixman/.git
+rm -rf .git roms/*/.git dtc/.git
 # FIXME: The following line is a workaround for avoiding filename collisions
 # when unpacking u-boot sources on case-insensitive filesystems. Once we
 # update to something with u-boot commit 610eec7f0 we can drop this line.
-- 
1.8.3.1


