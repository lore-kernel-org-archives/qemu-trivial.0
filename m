Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0pW7-0007CF-Fj
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 14:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1m0pW6-0007Bu-3o; Tue, 06 Jul 2021 14:09:54 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:39864
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1m0pW3-0006ml-Ij; Tue, 06 Jul 2021 14:09:53 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 832AFDA0F37;
 Tue,  6 Jul 2021 20:09:47 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 2054F460015; Tue,  6 Jul 2021 20:09:47 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] target/avr: Fix compiler errors (-Werror=enum-conversion)
Date: Tue,  6 Jul 2021 20:09:36 +0200
Message-Id: <20210706180936.249912-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jul 2021 18:09:54 -0000

../target/avr/translate.c: In function ‘gen_jmp_ez’:
../target/avr/translate.c:1012:22: error: implicit conversion from ‘enum <anonymous>’ to ‘DisasJumpType’ [-Werror=enum-conversion]
 1012 |     ctx->base.is_jmp = DISAS_LOOKUP;
      |                      ^

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

-Werror=enum-conversion is not enabled by -Wall, but by -Weverything
with clang for example.

As other targets use similar define statements, I think that's a simple fix.

Regards,
Stefan


 target/avr/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index c06ce45bc7..fcc839ac36 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -70,11 +70,9 @@ static const char reg_names[NUMBER_OF_CPU_REGISTERS][8] = {
 };
 #define REG(x) (cpu_r[x])
 
-enum {
-    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
-    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
-    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
-};
+#define DISAS_EXIT   DISAS_TARGET_0  /* We want return to the cpu main loop.  */
+#define DISAS_LOOKUP DISAS_TARGET_1  /* We have a variable condition exit.  */
+#define DISAS_CHAIN  DISAS_TARGET_2  /* We have a single condition exit.  */
 
 typedef struct DisasContext DisasContext;
 
-- 
2.30.2


