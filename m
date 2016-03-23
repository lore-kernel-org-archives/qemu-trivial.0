Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aicBD-00071c-ML
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 02:22:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1aicBB-0006yE-Fp
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 02:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1aicBA-0000Aj-LG
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 02:22:05 -0400
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11]:37427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1aicB6-00008B-9e; Wed, 23 Mar 2016 02:22:00 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 2868D4B0045;
	Wed, 23 Mar 2016 07:17:24 +0100 (CET)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 07:21:40 +0100
Message-Id: <1458714100-28885-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 2a01:e0c:1:1599::11
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] ps2kbd: default to scancode_set 2,
	as with KBD_CMD_RESET
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
X-List-Received-Date: Wed, 23 Mar 2016 06:22:06 -0000

This line has been added in commit ef74679a810fe6858f625b9d52b68cc3fc61eb=
3d with
other initializations. However, scancode set 0 doesn't exist (only 1, 2, =
3).
This works well as long as operating system is resetting keyboard, or ove=
rwriting
the current scancode set with the one it wants.

This fixes IBM 40p firmware, which doesn't bother sending KBD_CMD_RESET o=
r KBD_CMD_SCANCODE.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 58892d5..a8aa36f 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -628,7 +628,7 @@ static void ps2_kbd_reset(void *opaque)
     ps2_common_reset(&s->common);
     s->scan_enabled =3D 0;
     s->translate =3D 0;
-    s->scancode_set =3D 0;
+    s->scancode_set =3D 2;
 }
=20
 static void ps2_mouse_reset(void *opaque)
--=20
2.1.4


