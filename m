Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnkd-0006eJ-Hf
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkb-0006aV-56
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0000oJ-52
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkU-0000hX-K3; Sat, 08 Oct 2016 05:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 120CF40ED9;
	Sat,  8 Oct 2016 12:16:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 72C6CB2F;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19231 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:51 +0300
Message-Id: <c13e9912d9aa2ac485825bc7ca6879b0797cd715.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/26] MAINTAINERS: Add some more files to the
 HMP section
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:02 -0000

From: Thomas Huth <thuth@redhat.com>

The hmp-commands-info.hx, hmp.h and include/monitor/hmp-target.h
files were classified as unmaintained. Let's add them to the
HMP section.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index adc5e4e..ba50167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1183,8 +1183,9 @@ Human Monitor (HMP)
 M: Luiz Capitulino <lcapitulino@redhat.com>
 S: Maintained
 F: monitor.c
-F: hmp.c
-F: hmp-commands.hx
+F: hmp.[ch]
+F: hmp-commands*.hx
+F: include/monitor/hmp-target.h
 T: git git://repo.or.cz/qemu/qmp-unstable.git queue/qmp
 
 Network device backends
-- 
2.1.4


