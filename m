Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xktwg-0005vy-6O
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:07:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwZ-0005k5-N8
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XktwV-0004go-BI
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:07:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XktwK-0004e2-Vd; Sun, 02 Nov 2014 07:07:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D911C402BC;
	Sun,  2 Nov 2014 15:07:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5D3FC706;
	Sun,  2 Nov 2014 14:58:48 +0300 (MSK)
Received: (nullmailer pid 14960 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:17 +0300
Message-Id: <0d61f18b57432e56340b2fabe01222fc464fe92a.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 05/23] target-arm: A64: remove redundant store
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
X-List-Received-Date: Sun, 02 Nov 2014 12:07:40 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

There is not much point storing the same value twice in a row.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-arm/translate-a64.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 3a3c48a..80d2c07 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -748,7 +748,6 @@ static void do_fp_st(DisasContext *s, int srcidx, TCG=
v_i64 tcg_addr, int size)
     } else {
         TCGv_i64 tcg_hiaddr =3D tcg_temp_new_i64();
         tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TEQ);
-        tcg_gen_qemu_st64(tmp, tcg_addr, get_mem_index(s));
         tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
         tcg_gen_qemu_st_i64(tmp, tcg_hiaddr, get_mem_index(s), MO_TEQ);
--=20
1.7.10.4


