Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHcn-0001ZU-Ki
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:15:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcl-0001Xt-Tj
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHcl-0005NF-70
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:15:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36767)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHcg-0005Im-Hw; Sun, 20 May 2018 02:15:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 51E954111E;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0405710B4;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: (nullmailer pid 7356 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Sun, 20 May 2018 09:14:50 +0300
Message-Id: <0b816e986dd5b39ff5dfacd6c74e012b3b4c09e1.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/22] qemu-option-trace: -trace enable= is a
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
X-List-Received-Date: Sun, 20 May 2018 06:15:20 -0000

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


