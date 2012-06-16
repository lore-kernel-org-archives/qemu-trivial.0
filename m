Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SfnRm-0007ba-Kc
	for mharc-qemu-trivial@gnu.org; Sat, 16 Jun 2012 03:29:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SfnRk-0007VO-74
	for qemu-trivial@nongnu.org; Sat, 16 Jun 2012 03:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SfnRi-0001IP-Ec
	for qemu-trivial@nongnu.org; Sat, 16 Jun 2012 03:29:23 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SfnRf-0001I2-9b; Sat, 16 Jun 2012 03:29:19 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	756A572800C0; Sat, 16 Jun 2012 09:29:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id djXmHTZspnlU; Sat, 16 Jun 2012 09:29:16 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2F9CB72800C1; Sat, 16 Jun 2012 09:29:16 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 16 Jun 2012 09:29:10 +0200
Message-Id: <1339831750-14704-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [Qemu-trivial] [PATCH] qemu-config: Use QEMU instead of Qemu
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
X-List-Received-Date: Sat, 16 Jun 2012 07:29:25 -0000

This new 'Qemu' was recently added.
Replace it by the official all upper case 'QEMU'.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-config.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-config.h b/qemu-config.h
index e9f2ef4..12ddf3e 100644
--- a/qemu-config.h
+++ b/qemu-config.h
@@ -19,7 +19,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
 
 int qemu_read_config_file(const char *filename);
 
-/* Read default Qemu config files
+/* Read default QEMU config files
  */
 int qemu_read_default_config_files(bool userconfig);
 
-- 
1.7.10


