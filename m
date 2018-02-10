Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ0K-0002iS-Hi
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:55:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0I-0002f4-07
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0H-0000i9-6n
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ0B-0000dA-EA; Sat, 10 Feb 2018 02:55:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3916940C56;
	Sat, 10 Feb 2018 10:55:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B62FD7AA;
	Sat, 10 Feb 2018 10:55:15 +0300 (MSK)
Received: (nullmailer pid 22790 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sat, 10 Feb 2018 10:54:57 +0300
Message-Id: <8c2486a5122e50a5f88f2ecb47c5086ad52c716e.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/17] scripts/argparse.py: spelling
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
X-List-Received-Date: Sat, 10 Feb 2018 07:55:23 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


