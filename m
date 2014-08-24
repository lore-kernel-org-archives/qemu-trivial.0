Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXtK-0004I1-Dp
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXtD-00044N-NZ
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXt9-0004HP-9l
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXsw-0004FD-4Z; Sun, 24 Aug 2014 09:31:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4761E44A02;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E0BE06DF;
	Sun, 24 Aug 2014 17:31:03 +0400 (MSK)
Received: (nullmailer pid 30083 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:57 +0400
Message-Id: <1408887062-30022-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Liming Wang <liming.wang@canonical.com>
Subject: [Qemu-trivial] [PULL 06/11] configure: no need to mkdir QMP
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
X-List-Received-Date: Sun, 24 Aug 2014 13:31:28 -0000

From: Liming Wang <liming.wang@canonical.com>

commit 7537fe04 QMP: QMP/ -> docs/qmp/

Above commit has moved last QMP files to docs/qmp and it's not necessary
to create QMP directory. So remove it from configure.

Signed-off-by: Liming Wang <liming.wang@canonical.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index c4e47e1..2063cf6 100755
--- a/configure
+++ b/configure
@@ -5372,10 +5372,6 @@ for rom in seabios vgabios ; do
     echo "LD=$ld" >> $config_mak
 done
 
-if test "$docs" = "yes" ; then
-  mkdir -p QMP
-fi
-
 # set up qemu-iotests in this build directory
 iotests_common_env="tests/qemu-iotests/common.env"
 iotests_check="tests/qemu-iotests/check"
-- 
1.7.10.4


