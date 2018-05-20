Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKGua-0004MH-Hq
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 01:29:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKGuY-0004Fl-Mc
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 01:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKGuX-0005Dg-VB
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 01:29:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKGuS-0005A8-MP; Sun, 20 May 2018 01:29:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 55BA7410E4;
	Sun, 20 May 2018 08:29:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3D0D3F4A;
	Sun, 20 May 2018 08:29:30 +0300 (MSK)
Received: (nullmailer pid 3523 invoked by uid 1000);
	Sun, 20 May 2018 05:29:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 08:29:27 +0300
Message-Id: <20180520052927.3479-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] qemu-option-trace: -trace enable= is a
 pattern, not a file
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
X-List-Received-Date: Sun, 20 May 2018 05:29:39 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-option-trace.texi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qemu-option-trace.texi b/qemu-option-trace.texi
index 4166d5cdc2..7d1b7f05c5 100644
--- a/qemu-option-trace.texi
+++ b/qemu-option-trace.texi
@@ -2,9 +2,8 @@ Specify tracing options.
 
 @table @option
 @item [enable=]@var{pattern}
-Immediately enable events matching @var{pattern}.
-The file must contain one event name (as listed in the @file{trace-events-all}
-file) per line; globbing patterns are accepted too.  This option is only
+Immediately enable events matching @var{pattern}
+(either event name or a globbing pattern).  This option is only
 available if QEMU has been compiled with the @var{simple}, @var{log}
 or @var{ftrace} tracing backend.  To specify multiple events or patterns,
 specify the @option{-trace} option multiple times.
-- 
2.11.0


