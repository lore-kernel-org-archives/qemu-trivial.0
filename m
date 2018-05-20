Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHld-00089o-QO
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:24:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0007to-Ug
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0008NP-3f
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHlU-0008Jn-5t; Sun, 20 May 2018 02:24:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 015664112C;
	Sun, 20 May 2018 09:24:19 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B22611076;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: (nullmailer pid 7405 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:15:03 +0300
Message-Id: <201376cb9e500f64209444cb95f566679c0f54a2.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/22] typedefs: Remove PcGuestInfo from
 qemu/typedefs.h
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
X-List-Received-Date: Sun, 20 May 2018 06:24:25 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

It is long gone since e4e8ba04c2007 ...

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/typedefs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index a46b0b347b..325c72de33 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -62,7 +62,6 @@ typedef struct NetClientState NetClientState;
 typedef struct NetFilterState NetFilterState;
 typedef struct NICInfo NICInfo;
 typedef struct NumaNodeMem NumaNodeMem;
-typedef struct PcGuestInfo PcGuestInfo;
 typedef struct PCIBridge PCIBridge;
 typedef struct PCIBus PCIBus;
 typedef struct PCIDevice PCIDevice;
--=20
2.11.0


