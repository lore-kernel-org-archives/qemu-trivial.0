Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vpw4L-00032Q-Dv
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2013 03:19:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vpw4D-0002sf-TA
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 03:19:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vpw47-0008EQ-QA
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 03:19:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vpw3v-0008Bu-KI; Mon, 09 Dec 2013 03:19:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 069DC40FBF;
	Mon,  9 Dec 2013 12:19:31 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E54885E0;
	Mon,  9 Dec 2013 12:19:30 +0400 (MSK)
Received: (nullmailer pid 6888 invoked by uid 1000);
	Mon, 09 Dec 2013 08:19:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Dec 2013 12:19:30 +0400
Message-Id: <1386577170-6851-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vl: make boot_strict variable static (not
	used outside vl.c)
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
X-List-Received-Date: Mon, 09 Dec 2013 08:19:56 -0000

---
 vl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index ae6d0c6..e47fea1 100644
--- a/vl.c
+++ b/vl.c
@@ -230,7 +230,7 @@ int ctrl_grab = 0;
 unsigned int nb_prom_envs = 0;
 const char *prom_envs[MAX_PROM_ENVS];
 int boot_menu;
-bool boot_strict;
+static bool boot_strict;
 uint8_t *boot_splash_filedata;
 size_t boot_splash_filedata_size;
 uint8_t qemu_extra_params_fw[2];
-- 
1.7.10.4


