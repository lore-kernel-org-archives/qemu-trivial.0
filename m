Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7ux-0007vx-A7
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7ut-0007rT-39
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7us-00023V-D3
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:27:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7uo-0001yc-3F; Mon, 31 Jul 2017 06:27:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5315442A9D;
	Mon, 31 Jul 2017 13:27:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D9381B89;
	Mon, 31 Jul 2017 13:21:45 +0300 (MSK)
Received: (nullmailer pid 5565 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:32 +0300
Message-Id: <4b5660e403c9cae998dc70b51288968655977896.1501496349.git.mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 13/25] m68k/translate: fix incorrect copy/paste
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
X-List-Received-Date: Mon, 31 Jul 2017 10:27:16 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

db3d7945ae extended gen_cc_cond() for cond [6, 7, 9, 10] but misswrote [4=
, 5]

target/m68k/translate.c:1323:70: warning: identical expressions on both s=
ides of logical operator
        if (op =3D=3D CC_OP_ADDB || op =3D=3D CC_OP_ADDW || op =3D=3D CC_=
OP_ADDL ||
            op =3D=3D CC_OP_ADDB || op =3D=3D CC_OP_ADDW || op =3D=3D CC_=
OP_ADDL) {
            ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index ada2a91b64..be24355080 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1321,7 +1321,7 @@ static void gen_cc_cond(DisasCompare *c, DisasConte=
xt *s, int cond)
     case 5: /* CS (C) */
         /* Some cases fold C into X.  */
         if (op =3D=3D CC_OP_ADDB || op =3D=3D CC_OP_ADDW || op =3D=3D CC=
_OP_ADDL ||
-            op =3D=3D CC_OP_ADDB || op =3D=3D CC_OP_ADDW || op =3D=3D CC=
_OP_ADDL) {
+            op =3D=3D CC_OP_SUBB || op =3D=3D CC_OP_SUBW || op =3D=3D CC=
_OP_SUBL) {
             tcond =3D TCG_COND_NE;
             c->v1 =3D QREG_CC_X;
             goto done;
--=20
2.11.0


