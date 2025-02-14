Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiofh-0000YU-V8
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2025 00:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tioff-0000Xf-Dh; Fri, 14 Feb 2025 00:55:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1tiofd-00083f-2x; Fri, 14 Feb 2025 00:55:26 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B6AABEAB0B;
 Fri, 14 Feb 2025 08:55:12 +0300 (MSK)
Received: from gandalf.tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B24411B5FC1;
 Fri, 14 Feb 2025 08:55:20 +0300 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
 id A779D5345E; Fri, 14 Feb 2025 08:55:20 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	qemu-trivial@nongnu.org
Subject: [PULL 0/4] Trivial patches for 2025-02-14
Date: Fri, 14 Feb 2025 08:55:16 +0300
Message-Id: <20250214055520.3159764-1-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 14 Feb 2025 05:55:28 -0000

The following changes since commit ce315328f8e9bf5201db4217f3ffe0784110aa4b:

  Merge tag 'tracing-pull-request' of https://gitlab.com/stefanha/qemu into staging (2025-02-13 11:23:57 -0500)

are available in the Git repository at:

  https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches

for you to fetch changes up to b79b05d1a06a013447ea93b81c07612766b735f2:

  make-release: don't rely on $CWD when excluding subproject directories (2025-02-14 08:49:57 +0300)

----------------------------------------------------------------
trivial patches for 2025-02-14

There's nothing exciting here, just 4 very simple patches,
but one of them is important for qemu-stable.

----------------------------------------------------------------
Michael Roth (1):
      make-release: don't rely on $CWD when excluding subproject directories

Philippe Mathieu-Daudé (2):
      overall: Remove unnecessary g_strdup_printf() calls
      qemu/timer: Clarify timer_new*() must be freed with timer_free()

Rob Bradford (1):
      target/riscv: Fix minor whitespace issue in riscv_cpu_properties

 crypto/hash-afalg.c  |  2 +-
 hw/ppc/spapr_caps.c  |  2 +-
 include/qemu/timer.h | 10 ++++++++++
 plugins/loader.c     |  2 +-
 scripts/make-release |  9 +++++----
 target/i386/cpu.c    |  2 +-
 target/riscv/cpu.c   |  6 +++---
 trace/simple.c       |  2 +-
 ui/console.c         |  4 +---
 ui/gtk.c             |  3 +--
 util/module.c        |  2 +-
 11 files changed, 26 insertions(+), 18 deletions(-)

