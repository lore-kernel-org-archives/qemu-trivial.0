Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tz6js-0001SK-Pt
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 09:28:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Tz6jo-0001QU-T6
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 09:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1Tz6jj-0002pH-Q5
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 09:28:08 -0500
Received: from mout.web.de ([212.227.15.4]:60722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1Tz6jj-0002p0-GO; Sat, 26 Jan 2013 09:28:03 -0500
Received: from localhost.localdomain ([84.148.27.138]) by smtp.web.de
	(mrweb002) with ESMTPSA (Nemesis) id 0MgwO8-1UL3Qn3i76-00MaPq;
	Sat, 26 Jan 2013 15:28:02 +0100
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>
To: qemu-devel@nongnu.org
Date: Sat, 26 Jan 2013 15:27:59 +0100
Message-Id: <1359210479-12807-1-git-send-email-andreas.faerber@web.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:X8EgTQjYe3itf80hD581RzQ2Fj0MNAU5aaw8rbxGazp
	cOau1hdpejNDWVYly7fIafJ/gC7aoSJFr99ckpVDq2XKNE+EfJ
	10UnUHxOMV+UdQd5fbDPXHf64+SO3lVZ9H63BFzr7jlCRSoZBx
	wkwK6XFn0Oo7opONdyBoGpDcmeU39A7aa9rBfW8Kq/qCTKUfII
	5dVZzkj+7kxiFcWZR/VSw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 212.227.15.4
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4] tests: Fix {rtc,
	m48t59}-test build on illumos
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
X-List-Received-Date: Sat, 26 Jan 2013 14:28:10 -0000

Struct tm does not have tm_gmtoff field on illumos.
Fix the build by not zero-initializing these fields on Solaris.

Cc: qemu-stable@nongnu.org
Signed-off-by: Andreas Färber <andreas.faerber@web.de>
---
 tests/m48t59-test.c |    2 ++
 tests/rtc-test.c    |    2 ++
 2 Dateien geändert, 4 Zeilen hinzugefügt(+)

diff --git a/tests/m48t59-test.c b/tests/m48t59-test.c
index d79f554..77d69b3 100644
--- a/tests/m48t59-test.c
+++ b/tests/m48t59-test.c
@@ -142,7 +142,9 @@ static void cmos_get_date_time(struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
+#ifndef __sun__
     date->tm_gmtoff = 0;
+#endif
 
     ts = mktime(date);
 }
diff --git a/tests/rtc-test.c b/tests/rtc-test.c
index e7123ca..203c0fc 100644
--- a/tests/rtc-test.c
+++ b/tests/rtc-test.c
@@ -115,7 +115,9 @@ static void cmos_get_date_time(struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
+#ifndef __sun__
     date->tm_gmtoff = 0;
+#endif
 
     ts = mktime(date);
 }
-- 
1.7.10.4


