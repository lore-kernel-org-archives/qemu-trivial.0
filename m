Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZdu3-0000gR-Id
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 09:32:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eZdtv-0000ah-Fw
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:32:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eZdtu-00026P-L7
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 09:32:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eZdtj-0001rh-F1; Thu, 11 Jan 2018 09:32:03 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D4C1F408EA;
	Thu, 11 Jan 2018 17:32:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8DB13E0E;
	Thu, 11 Jan 2018 17:32:02 +0300 (MSK)
Received: (nullmailer pid 17909 invoked by uid 1000);
	Thu, 11 Jan 2018 14:32:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Thu, 11 Jan 2018 17:32:01 +0300
Message-Id: <20180111143201.17865-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial] scripts/argparse.py: spelling
 (independant)
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
X-List-Received-Date: Thu, 11 Jan 2018 14:32:21 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/argparse.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/argparse.py b/scripts/argparse.py
index 288c1f06c0..27d1f28935 100644
--- a/scripts/argparse.py
+++ b/scripts/argparse.py
@@ -76,7 +76,7 @@ considered public as object names -- the API of the formatter objects is
 still considered an implementation detail.)
 """
 
-__version__ = '1.4.0'  # we use our own version number independant of the
+__version__ = '1.4.0'  # we use our own version number independent of the
                        # one in stdlib and we release this on pypi.
 
 __external_lib__ = True  # to make sure the tests really test THIS lib,
-- 
2.11.0


