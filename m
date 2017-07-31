Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc84c-00065w-BG
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:37:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84Z-00063C-L6
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84Y-0006zJ-Os
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc84U-0006vn-CI; Mon, 31 Jul 2017 06:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A8A0142AC1;
	Mon, 31 Jul 2017 13:37:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66B37B79;
	Mon, 31 Jul 2017 13:21:44 +0300 (MSK)
Received: (nullmailer pid 5544 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:22 +0300
Message-Id: <1b61270be156872e52291698afc1fdec5b055842.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/25] MAINTAINERS: Improve the NetBSD regex
 pattern
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
X-List-Received-Date: Mon, 31 Jul 2017 10:37:16 -0000

From: Thomas Huth <thuth@redhat.com>

Currently get_maintainers.pl claims that the configure script is
maintained by Kamil:

 $ scripts/get_maintainer.pl -f configure
 Kamil Rytarowski <kamil@netbsd.org> (maintainer:NETBSD)
 qemu-devel@nongnu.org (open list:All patches CC here)

This happens because the regex pattern for the NETBSD entry triggers
on everything that contains the keyword "NetBSD". Ease the situation
a little bit by restricting this to "Subject:" lines only, like
we do it in the "trivial patches" section already.

Reported-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ea273f899..577e17b78d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -353,7 +353,7 @@ NETBSD
 L: qemu-devel@nongnu.org
 M: Kamil Rytarowski <kamil@netbsd.org>
 S: Maintained
-K: (?i)NetBSD
+K: ^Subject:.*(?i)NetBSD
=20
 W32, W64
 L: qemu-devel@nongnu.org
--=20
2.11.0


