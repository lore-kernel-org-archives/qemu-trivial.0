Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekQ0K-0002io-PF
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 02:55:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0I-0002fp-Ez
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ekQ0H-0000iL-7i
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 02:55:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ekQ0B-0000dC-EX; Sat, 10 Feb 2018 02:55:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A4D640C54;
	Sat, 10 Feb 2018 10:55:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9034B7A3;
	Sat, 10 Feb 2018 10:55:15 +0300 (MSK)
Received: (nullmailer pid 22787 invoked by uid 1000);
	Sat, 10 Feb 2018 07:55:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sat, 10 Feb 2018 10:54:56 +0300
Message-Id: <8ff5b30b38cae61f7709114307b04bab879f3f04.1518249254.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
References: <cover.1518249254.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/17] qapi-schema.json: spelling (independant
 comparation)
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
 qapi-schema.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 5c06745c79..0262b9f20b 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -2023,7 +2023,7 @@
 #
 # @static: Expand to a static CPU model, a combination of a static base
 #          model name and property delta changes. As the static base model will
-#          never change, the expanded CPU model will be the same, independant of
+#          never change, the expanded CPU model will be the same, independent of
 #          independent of QEMU version, machine type, machine options, and
 #          accelerator options. Therefore, the resulting model can be used by
 #          tooling without having to specify a compatibility machine - e.g. when
@@ -2102,7 +2102,7 @@
 ##
 # @CpuModelCompareResult:
 #
-# An enumeration of CPU model comparation results. The result is usually
+# An enumeration of CPU model comparison results. The result is usually
 # calculated using e.g. CPU features or CPU generations.
 #
 # @incompatible: If model A is incompatible to model B, model A is not
-- 
2.11.0


