Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4yh-0002db-Db
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:11:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yZ-0002NY-I4
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4yY-0007EL-O7
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:11:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4yO-00077b-PQ; Tue, 10 Feb 2015 02:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E9E341812;
	Tue, 10 Feb 2015 10:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 06AA195F;
	Tue, 10 Feb 2015 09:34:48 +0300 (MSK)
Received: (nullmailer pid 9421 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:32 +0300
Message-Id: <65b837ff7cf023dd9ab220bae624e9a74d907704.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 43/46] spice: Add missing 'static' attribute
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
X-List-Received-Date: Tue, 10 Feb 2015 07:11:20 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 spice-qemu-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 7e0d300..a4f4e57 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -158,7 +158,7 @@ static gboolean spice_char_source_dispatch(GSource *source,
     return func(NULL, G_IO_OUT, user_data);
 }
 
-GSourceFuncs SpiceCharSourceFuncs = {
+static GSourceFuncs SpiceCharSourceFuncs = {
     .prepare  = spice_char_source_prepare,
     .check    = spice_char_source_check,
     .dispatch = spice_char_source_dispatch,
-- 
2.1.4


