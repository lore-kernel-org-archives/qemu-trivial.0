Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sVaex-0004Sw-Rl
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jul 2024 13:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1sVa0J-0005Zu-3Z
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2024 13:05:47 -0400
Received: from mail-a.sr.ht ([46.23.81.152])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1sVa0G-0002pw-LN
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2024 13:05:46 -0400
DKIM-Signature: a=rsa-sha256; bh=aAguMqs7qQpDpiVcdc3KhyfaFgvVLazT4VWZcoNA0No=; 
 c=simple/simple; d=git.sr.ht;
 h=From:Date:Subject:Reply-to:To:Cc; 
 q=dns/txt; s=20240113; t=1721581540; v=1;
 b=TQC9miY4mTsY5SvlTNKYOI5ayiyeGpR7kiJvq8cYqPpqFmDoJqHtTG33iYJyxNGM2gTxQkrY
 RDqKp7xJxqWP16ZTlOrY/Ao9ezqSlpUBB3qP84lguovAIOEcbq59yRHXmjjxcktwNP1XprrLJqz
 HySjhtzAa5v+QhesQJu+eSnK9+X0tClbsKkQfzP8LfvC6+VoqYVxOZBAUFySyPUThGXvZaPH/Vn
 VtfU/2LQBDS7nUNX0ve4I6UaieuBZzAOZDrvC19+b5uK3jQmufczcTKzfuck3q5u7NS7pByRDdT
 2QcdGBiFeYChJRTuvA1gVS+zcWuLoPBoapsI/f+vMcXIA==
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id C6F4620170;
 Sun, 21 Jul 2024 17:05:40 +0000 (UTC)
From: ~fvanhovell <fvanhovell@git.sr.ht>
Date: Sun, 21 Jul 2024 18:13:22 +0200
Subject: [PATCH qemu] [hw/char/bcm2835_aux] Fix receive FIFO filling up
 (raspi3)
MIME-Version: 1.0
Message-ID: <172158154072.9480.4077116485578955977-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~fvanhovell <frederik@fvhovell.nl>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=46.23.81.152; envelope-from=outgoing@sr.ht;
 helo=mail-a.sr.ht
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Jul 2024 13:47:45 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jul 2024 17:05:47 -0000

From: Frederik van H=C3=B6vell <frederik@fvhovell.nl>

When a bare-metal application on the raspi3 board reads the
AUX_MU_STAT_REG MMIO register while the device's buffer is
at full receive FIFO capacity
(i.e. `s->read_count =3D=3D BCM2835_AUX_RX_FIFO_LEN`) the
assertion `assert(s->read_count < BCM2835_AUX_RX_FIFO_LEN)`
fails.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/459
Signed-off-by: Frederik van H=C3=B6vell <frederik@fvhovell.nl>
---
 hw/char/bcm2835_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 83990e20f7..fca2f27a55 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -138,7 +138,7 @@ static uint64_t bcm2835_aux_read(void *opaque, hwaddr off=
set, unsigned size)
         res =3D 0x30e; /* space in the output buffer, empty tx fifo, idle tx=
/rx */
         if (s->read_count > 0) {
             res |=3D 0x1; /* data in input buffer */
-            assert(s->read_count < BCM2835_AUX_RX_FIFO_LEN);
+            assert(s->read_count <=3D BCM2835_AUX_RX_FIFO_LEN);
             res |=3D ((uint32_t)s->read_count) << 16; /* rx fifo fill level =
*/
         }
         return res;
--=20
2.43.4

