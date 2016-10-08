Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnkc-0006dT-S9
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0006aR-VU
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0000oC-1t
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:16:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkU-0000hV-Jb; Sat, 08 Oct 2016 05:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D8FC140EB7;
	Sat,  8 Oct 2016 12:16:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 342ADB43;
	Sat,  8 Oct 2016 11:58:17 +0300 (MSK)
Received: (nullmailer pid 19266 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:08 +0300
Message-Id: <56bef8511a576deef32d3e763b993b5001015c2d.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/26] CODING_STYLE: Fix a typo ("have" vs.
 "has")
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:01 -0000

From: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 CODING_STYLE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index e7fde15..f53180b 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -9,7 +9,7 @@ patches before submitting.
 Of course, the most important aspect in any coding style is whitespace.
 Crusty old coders who have trouble spotting the glasses on their noses
 can tell the difference between a tab and eight spaces from a distance
-of approximately fifteen parsecs.  Many a flamewar have been fought and
+of approximately fifteen parsecs.  Many a flamewar has been fought and
 lost on this issue.
=20
 QEMU indents are four spaces.  Tabs are never used, except in Makefiles
--=20
2.1.4


