Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCD1D2D0ED
	for <qemu-trivial@archiver.kernel.org>; Tue, 13 Jan 2026 12:59:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vfdzW-0001Bo-Uh; Tue, 13 Jan 2026 07:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1vfdzO-0000h3-Fc
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 07:59:16 -0500
Received: from isrv.corpit.ru ([212.248.84.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1vfdzL-0000fR-Eh
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 07:59:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AE8B017D9A6;
 Tue, 13 Jan 2026 15:58:46 +0300 (MSK)
Received: from think4mjt.tls.msk.ru (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9EC5E34C3FA;
 Tue, 13 Jan 2026 15:58:51 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-user@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial 2/7] meson.build: stop checking for splice()
Date: Tue, 13 Jan 2026 15:58:42 +0300
Message-ID: <20260113125849.910112-5-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113125849.910112-1-mjt@tls.msk.ru>
References: <20260113125849.910112-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.248.84.144; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

CONFIG_SPLICE was only needed for linux-user/, where it is not
used anymore (assuming splice &Co is always present)

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 meson.build | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meson.build b/meson.build
index c58007291a..9b5f1540ff 100644
--- a/meson.build
+++ b/meson.build
@@ -2913,14 +2913,6 @@ config_host_data.set('CONFIG_PTHREAD_AFFINITY_NP', cc.links(osdep_prefix + '''
 config_host_data.set('CONFIG_SIGNALFD', cc.links(osdep_prefix + '''
   #include <sys/signalfd.h>
   int main(void) { return signalfd(-1, NULL, SFD_CLOEXEC); }'''))
-config_host_data.set('CONFIG_SPLICE', cc.links(osdep_prefix + '''
-  int main(void)
-  {
-    int len, fd = 0;
-    len = tee(STDIN_FILENO, STDOUT_FILENO, INT_MAX, SPLICE_F_NONBLOCK);
-    splice(STDIN_FILENO, NULL, fd, NULL, len, SPLICE_F_MOVE);
-    return 0;
-  }'''))
 
 config_host_data.set('HAVE_MLOCKALL', cc.links(osdep_prefix + '''
   #include <sys/mman.h>
-- 
2.47.3


