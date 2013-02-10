Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4f6W-0000ry-TK
	for mharc-qemu-trivial@gnu.org; Sun, 10 Feb 2013 17:10:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U4f6U-0000jt-2O
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2013 17:10:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1U4f6T-0000YR-5m
	for qemu-trivial@nongnu.org; Sun, 10 Feb 2013 17:10:30 -0500
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:51004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1U4f6P-0000S6-O2; Sun, 10 Feb 2013 17:10:26 -0500
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 5E9379400D0;
	Sun, 10 Feb 2013 23:10:10 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2013 23:11:05 +0100
Message-Id: <1360534265-6477-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] Remove forward declaration of non-existant
	variable
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
X-List-Received-Date: Sun, 10 Feb 2013 22:10:31 -0000

This variable has been removed 5 years ago in 970ac5a3082428dca91171f270d=
cd95d6f4b2636.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 include/sysemu/sysemu.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 1d9599e..ae49088 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -94,7 +94,6 @@ typedef enum DisplayType
 } DisplayType;
=20
 extern int autostart;
-extern int bios_size;
=20
 typedef enum {
     VGA_NONE, VGA_STD, VGA_CIRRUS, VGA_VMWARE, VGA_XENFB, VGA_QXL,
--=20
1.7.10.4


