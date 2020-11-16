Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keUZp-0006kS-D5
	for mharc-qemu-trivial@gnu.org; Sun, 15 Nov 2020 21:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZl-0006bk-TO; Sun, 15 Nov 2020 21:49:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZh-0002sX-Rd; Sun, 15 Nov 2020 21:49:05 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZD6H4YMkzkX2L;
 Mon, 16 Nov 2020 10:48:39 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:48 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Richard
 Henderson" <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH v3 3/7] accel/tcg/user-exec: silence the compiler warnings
Date: Mon, 16 Nov 2020 10:48:06 +0800
Message-ID: <20201116024810.2415819-4-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:16:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 16 Nov 2020 02:49:06 -0000

When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler showed warning:
../accel/tcg/user-exec.c: In function ‘handle_cpu_signal’:
../accel/tcg/user-exec.c:169:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
  169 |             cpu_exit_tb_from_sighandler(cpu, old_set);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../accel/tcg/user-exec.c:172:9: note: here
  172 |         default:

Mark the cpu_exit_tb_from_sighandler() function with QEMU_NORETURN to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
v1->v2: Add QEMU_NORETURN to cpu_exit_tb_from_sighandler() function
to avoid the compiler warnings(Base on Thomas's and Richard's comments).

Cc: Thomas Huth <thuth@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/user-exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..293ee86ea4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -49,7 +49,8 @@ __thread uintptr_t helper_retaddr;
 /* exit the current TB from a signal handler. The host registers are
    restored in a state compatible with the CPU emulator
  */
-static void cpu_exit_tb_from_sighandler(CPUState *cpu, sigset_t *old_set)
+static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
+                                                      sigset_t *old_set)
 {
     /* XXX: use siglongjmp ? */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-- 
2.27.0


