Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOVIj-0000go-R2
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 12:49:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOVId-0000YB-8m
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOVIY-0003CH-D0
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 12:49:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WOVIO-000371-C9; Fri, 14 Mar 2014 12:49:20 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EGnHqY021499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 12:49:17 -0400
Received: from colepc.home.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2EGnFef021127; Fri, 14 Mar 2014 12:49:16 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 14 Mar 2014 12:49:13 -0400
Message-Id: <1493d560c83eef5eefe313cb6b4a1d17985a2471.1394815720.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@amazon.com>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 for-2.0] scripts/make-release: Don't
	distribute .git directories
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
X-List-Received-Date: Fri, 14 Mar 2014 16:49:40 -0000

[crobinso@localhost qemu-2.0.0-rc0]$ find . -name .git
./dtc/.git
./pixman/.git

This is already done for the rom submodules.

https://bugs.launchpad.net/qemu/+bug/1224414
Signed-off-by: Cole Robinson <crobinso@redhat.com>
---

v2:
    pixman/*.git -> pixman/.git for consistency

 scripts/make-release | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index 196c755..186358d 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -18,7 +18,7 @@ git clone "${src}" ${destination}
 pushd ${destination}
 git checkout "v${version}"
 git submodule update --init
-rm -rf .git roms/*/.git
+rm -rf .git roms/*/.git dtc/.git pixman/.git
 popd
 tar cfj ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
1.8.5.3


