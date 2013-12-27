Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfhC-00012k-EG
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:15:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh6-0000pq-0U
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfh1-0005qn-5T
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:15:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vwfgq-0005nu-IU; Fri, 27 Dec 2013 17:15:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A8F684389C;
	Sat, 28 Dec 2013 02:15:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B8DA0608;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10342 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:21 +0400
Message-Id: <1388182050-10270-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 08/17] vl: make boot_strict variable static
	(not used outside vl.c)
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
X-List-Received-Date: Fri, 27 Dec 2013 22:15:53 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Amos Kong <akong@redhat.com>
---
 vl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 7511e70..ed8debb 100644
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


