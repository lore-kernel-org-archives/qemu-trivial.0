Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eE8YQ-00079q-2h
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 01:49:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eE8YK-00078L-IK
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 01:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1eE8YJ-0005EJ-Pe
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 01:49:04 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:51910
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan@weilnetz.de>)
	id 1eE8YF-0005Cm-8d; Mon, 13 Nov 2017 01:48:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 4D815DA8D7E;
	Mon, 13 Nov 2017 07:48:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZrgWuugLhga3; Mon, 13 Nov 2017 07:48:56 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 91305DA8C5C;
	Mon, 13 Nov 2017 07:48:56 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 32C944621FA; Mon, 13 Nov 2017 07:48:56 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 13 Nov 2017 07:48:45 +0100
Message-Id: <20171113064845.29142-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH for 2.12] target/i386: Fix compiler warnings
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
X-List-Received-Date: Mon, 13 Nov 2017 06:49:08 -0000

These gcc warnings are fixed:

target/i386/translate.c:4461:12: warning:
 variable =E2=80=98prefixes=E2=80=99 might be clobbered by =E2=80=98longj=
mp=E2=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]
target/i386/translate.c:4466:9: warning:
 variable =E2=80=98rex_w=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]
target/i386/translate.c:4466:16: warning:
 variable =E2=80=98rex_r=E2=80=99 might be clobbered by =E2=80=98longjmp=E2=
=80=99 or =E2=80=98vfork=E2=80=99 [-Wclobbered]

Tested with x86_64-w64-mingw32-gcc from Debian stretch.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target/i386/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 088a9d9766..f410938244 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4467,10 +4467,7 @@ static target_ulong disas_insn(DisasContext *s, CP=
UState *cpu)
     target_ulong pc_start =3D s->base.pc_next;
=20
     s->pc_start =3D s->pc =3D pc_start;
-    prefixes =3D 0;
     s->override =3D -1;
-    rex_w =3D -1;
-    rex_r =3D 0;
 #ifdef TARGET_X86_64
     s->rex_x =3D 0;
     s->rex_b =3D 0;
@@ -4484,6 +4481,10 @@ static target_ulong disas_insn(DisasContext *s, CP=
UState *cpu)
         return s->pc;
     }
=20
+    prefixes =3D 0;
+    rex_w =3D -1;
+    rex_r =3D 0;
+
  next_byte:
     b =3D x86_ldub_code(env, s);
     /* Collect prefixes.  */
--=20
2.11.0


