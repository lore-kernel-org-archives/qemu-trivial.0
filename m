Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XeIop-0007CL-Rw
	for mharc-qemu-trivial@gnu.org; Wed, 15 Oct 2014 03:16:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XeIoj-0007Az-Ej
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 03:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XeIoe-0000UI-FV
	for qemu-trivial@nongnu.org; Wed, 15 Oct 2014 03:16:17 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:35899 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XeIoe-0000UB-98; Wed, 15 Oct 2014 03:16:12 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XeJGf-0000C6-Eo; Wed, 15 Oct 2014 09:45:09 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed, 15 Oct 2014 08:16:31 +0100
Message-Id: <1413357391-26869-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-arm: A64: remove redundant store
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
X-List-Received-Date: Wed, 15 Oct 2014 07:16:22 -0000

There is not much point storing the same value twice in a row.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target-arm/translate-a64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 35ae3ea..337f4d4 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -748,7 +748,6 @@ static void do_fp_st(DisasContext *s, int srcidx, TCGv_i64 tcg_addr, int size)
     } else {
         TCGv_i64 tcg_hiaddr = tcg_temp_new_i64();
         tcg_gen_qemu_st_i64(tmp, tcg_addr, get_mem_index(s), MO_TEQ);
-        tcg_gen_qemu_st64(tmp, tcg_addr, get_mem_index(s));
         tcg_gen_ld_i64(tmp, cpu_env, fp_reg_hi_offset(s, srcidx));
         tcg_gen_addi_i64(tcg_hiaddr, tcg_addr, 8);
         tcg_gen_qemu_st_i64(tmp, tcg_hiaddr, get_mem_index(s), MO_TEQ);
-- 
2.1.1


