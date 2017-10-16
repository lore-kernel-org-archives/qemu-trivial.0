Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CE2-0006kr-68
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:43:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDy-0006fj-CP
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CDx-0006Tk-KY
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:42:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CDs-0006Pi-Sr; Mon, 16 Oct 2017 16:42:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 39AA540D2E;
	Mon, 16 Oct 2017 23:42:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 94348C3B;
	Mon, 16 Oct 2017 23:33:44 +0300 (MSK)
Received: (nullmailer pid 12332 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:38 +0300
Message-Id: <626e4a4b69d7f3952b526a5d0aa8a4a040a7cd52.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/14] MAINTAINERS: Fix Sun4v file
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
X-List-Received-Date: Mon, 16 Oct 2017 20:42:59 -0000

From: Fam Zheng <famz@redhat.com>

Suggested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 86c9ec9cde..6ce393f50d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -778,7 +778,7 @@ F: pc-bios/openbios-sparc64
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
 S: Maintained
-F: hw/sparc64/sun4v.c
+F: hw/sparc64/niagara.c
 F: hw/timer/sun4v-rtc.c
 F: include/hw/timer/sun4v-rtc.h
 
-- 
2.11.0


