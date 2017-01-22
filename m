Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVIM1-0004N5-Ek
	for mharc-qemu-trivial@gnu.org; Sun, 22 Jan 2017 08:38:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cVILy-0004Ks-DJ
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 08:38:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1cVILx-0000XJ-Hj
	for qemu-trivial@nongnu.org; Sun, 22 Jan 2017 08:38:42 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:37961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1cVILt-0000WW-2J; Sun, 22 Jan 2017 08:38:37 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 9C75A11810A8;
	Sun, 22 Jan 2017 14:38:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 3hgxQehSiGpK; Sun, 22 Jan 2017 14:38:32 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 3A8B211810A5;
	Sun, 22 Jan 2017 14:38:32 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 111BD460C23; Sun, 22 Jan 2017 14:38:32 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, Stefan Weil <sw@weilnetz.de>
Date: Sun, 22 Jan 2017 14:38:31 +0100
Message-Id: <20170122133831.26150-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] qapi2texi: Suppress unwanted commas in
 generated output
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
X-List-Received-Date: Sun, 22 Jan 2017 13:38:43 -0000

Parts of the code use #optional followed by a comma.

We don't want that comma to be part of the generated documentation,
so remove it, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I added the generated documentation to https://qemu.weilnetz.de/doc/.

See https://qemu.weilnetz.de/doc/qemu-qmp-ref.html for an
example of the output without this patch (look for ", net").

We could also remove the commas from the code, but I think
that removing them programmatically is more robust (and also
allows people placing commas as they like).

Regards
Stefan

 scripts/qapi2texi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py
index 83ded95c2d..65c4aecfaf 100755
--- a/scripts/qapi2texi.py
+++ b/scripts/qapi2texi.py
@@ -146,7 +146,7 @@ def texi_body(doc):
             desc = str(section)
             opt = ''
             if "#optional" in desc:
-                desc = desc.replace("#optional", "")
+                desc = re.sub("#optional,?", "", desc)
                 opt = ' (optional)'
             body += "@item @code{'%s'}%s\n%s\n" % (arg, opt,
                                                    texi_format(desc))
-- 
2.11.0


