Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C41D2D0EB
	for <qemu-trivial@archiver.kernel.org>; Tue, 13 Jan 2026 12:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vfdzZ-0001LA-3V; Tue, 13 Jan 2026 07:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1vfdzY-0001J6-65
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 07:59:24 -0500
Received: from isrv.corpit.ru ([212.248.84.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1vfdzW-0000hw-GX
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 07:59:23 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1A28617D9AC;
 Tue, 13 Jan 2026 15:58:47 +0300 (MSK)
Received: from think4mjt.tls.msk.ru (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 14C9234C400;
 Tue, 13 Jan 2026 15:58:52 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-user@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH trivial 7/7] rename CONFIG_EPOLL_CREATE1 to CONFIG_EPOLL
Date: Tue, 13 Jan 2026 15:58:48 +0300
Message-ID: <20260113125849.910112-11-mjt@tls.msk.ru>
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

Since CONFIG_EPOLL is now unused, it's okay to
perform this rename, to make it less ugly.

Since epoll is linux-specific and is always
present, we might as well make CONFIG_EPOLL equal
to CONFIG_LINUX.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 meson.build      | 2 +-
 util/aio-posix.h | 4 ++--
 util/meson.build | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index f8b4f06049..552b34f34e 100644
--- a/meson.build
+++ b/meson.build
@@ -2713,7 +2713,7 @@ config_host_data.set('CONFIG_INOTIFY1', have_inotify_init1)
 # has_header_symbol
 config_host_data.set('CONFIG_BLKZONED',
                      cc.has_header_symbol('linux/blkzoned.h', 'BLKOPENZONE'))
-config_host_data.set('CONFIG_EPOLL_CREATE1',
+config_host_data.set('CONFIG_EPOLL',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
diff --git a/util/aio-posix.h b/util/aio-posix.h
index 0cedb8d189..ab894a3c0f 100644
--- a/util/aio-posix.h
+++ b/util/aio-posix.h
@@ -52,7 +52,7 @@ extern const FDMonOps fdmon_poll_ops;
 /* Switch back to poll(2). list_lock must be held. */
 void fdmon_poll_downgrade(AioContext *ctx);
 
-#ifdef CONFIG_EPOLL_CREATE1
+#ifdef CONFIG_EPOLL
 bool fdmon_epoll_try_upgrade(AioContext *ctx, unsigned npfd);
 void fdmon_epoll_setup(AioContext *ctx);
 
@@ -71,7 +71,7 @@ static inline void fdmon_epoll_setup(AioContext *ctx)
 static inline void fdmon_epoll_disable(AioContext *ctx)
 {
 }
-#endif /* !CONFIG_EPOLL_CREATE1 */
+#endif /* !CONFIG_EPOLL */
 
 #ifdef CONFIG_LINUX_IO_URING
 bool fdmon_io_uring_setup(AioContext *ctx, Error **errp);
diff --git a/util/meson.build b/util/meson.build
index 35029380a3..44f0312e8c 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -6,7 +6,7 @@ endif
 if host_os != 'windows'
   util_ss.add(files('aio-posix.c'))
   util_ss.add(files('fdmon-poll.c'))
-  if config_host_data.get('CONFIG_EPOLL_CREATE1')
+  if config_host_data.get('CONFIG_EPOLL')
     util_ss.add(files('fdmon-epoll.c'))
   endif
   util_ss.add(files('compatfd.c'))
-- 
2.47.3


