Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGC4-0002HJ-1k
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBv-0001yq-JB
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBu-0001en-Eh
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBc-0001Zg-Cp; Wed, 04 Mar 2015 15:46:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 499894091E;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 46D2694C;
	Wed,  4 Mar 2015 20:07:08 +0300 (MSK)
Received: (nullmailer pid 17575 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:07:02 +0300
Message-Id: <9b3e6a14e038a07a05e1bb6d8e67e0225472d8f6.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Subject: [Qemu-trivial] [PULL 45/47] milkymist-pfpu: fix GCC 5.0.0
	aggressive-loop-optimizations warning
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:55 -0000

From: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>

man gcc:
  Warn if in a loop with constant number of iterations the compiler
  detects undefined behavior in some statement during one or more of
  the iterations.

Milkymist pfpu has no jump instructions, so checking for MICROCODE_WORDS
instructions should have kept us in bounds of s->microcode, but i++
allowed one loop too many,

  hw/misc/milkymist-pfpu.c: In function =E2=80=98pfpu_write=E2=80=99:
  hw/misc/milkymist-pfpu.c:365:20: error: loop exit may only be reached a=
fter undefined behavior [-Werror=3Daggressive-loop-optimizations]
                   if (i++ >=3D MICROCODE_WORDS) {
                      ^
  hw/misc/milkymist-pfpu.c:167:14: note: possible undefined statement is =
here
       uint32_t insn =3D s->microcode[pc];
                ^

The code can still access out of bounds, because it presumes that PC regi=
ster
always begins at 0, and we allow writing to it.

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/milkymist-pfpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 609f33f..08b604f 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -362,7 +362,7 @@ static void pfpu_start(MilkymistPFPUState *s)
             i =3D 0;
             while (pfpu_decode_insn(s)) {
                 /* decode at most MICROCODE_WORDS instructions */
-                if (i++ >=3D MICROCODE_WORDS) {
+                if (++i >=3D MICROCODE_WORDS) {
                     error_report("milkymist_pfpu: too many instructions =
"
                             "executed in microcode. No VECTOUT?");
                     break;
--=20
2.1.4


