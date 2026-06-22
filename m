Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AE2CDB471
	for <qemu-trivial@archiver.kernel.org>; Mon, 22 Jun 2026 07:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wbZDI-0004vu-47; Mon, 22 Jun 2026 03:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wbZDF-0004ve-QM
 for qemu-trivial@nongnu.org; Mon, 22 Jun 2026 03:36:58 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wbZDE-0000qS-Ap
 for qemu-trivial@nongnu.org; Mon, 22 Jun 2026 03:36:57 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c0c15bd6b8fso224572766b.0
 for <qemu-trivial@nongnu.org>; Mon, 22 Jun 2026 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782113814; x=1782718614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=saIQ4DchUtqXUcglD5meLYr7HCQgbtL46j6H8F1dSwU=;
 b=CtFKCE0Yk1fQefoRDPyeyBRHymE2/dDzrMk7Xp9wGSooU5ScczusqGBAbzPWz2IWlE
 0k3Mcyl8VvZ3z4jZNwOA6MuvwBHOXRAx5E8L8YJ3aW9jJ5KWnQ/G907xsKpzyaV6HBVo
 2HibIqZ1HGy0CMoEs2gyq9ZrD4VvNsfkh+dTYgDyFkCLWzsTjrULEosV4OTVBtD7xQ8o
 X3L6bJNzxN6a7b63qzgjPi59RZrcwVuOzxPh1ZPK4ZA5yaXaTOxZM8E/0W3nW26XfaNh
 jUixhzDiPPOSgtPjb7wjtky5gPyiU3Wkv4PTKRx3lJp4A/jVfaJy6Nj2njvBfiZrfHtO
 DQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782113814; x=1782718614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saIQ4DchUtqXUcglD5meLYr7HCQgbtL46j6H8F1dSwU=;
 b=qKJ9jBR2/aUeeOKYZmQWbDXvNCxMK2NyDjwl5mX9WUPfRDEqYRNlFGapFJJxhj6/aC
 DdpHzzURsK1s8D1UrDJUU3G+lhhhq4Ig7Lnb5+i3AGJTD4eSHI7RkiUlutoWxfiFdyOH
 CyWeXExZWWGK8ZWkjfgt7yy7loKvOhtOqz19lCXtGkfRwLf7RpGZm5Mmzf+dhr79ImFn
 4nzJ3SIstwljAznJa1UiLSQr4z0M6XnR6qAzTH3JzHYG3pIMqBgfQzfVZOWcRdQYjPV9
 8hi74H6d/YlqCxViySQqgXpcKrf+tFy8wjAv9Kt7USbNMg5+AyRfCmzGpdpEqth4Vguw
 pWiw==
X-Gm-Message-State: AOJu0YylcWA8WEd/dtTOuDzA9ktUQwN44iCFEzmU10pmtdCIkVPea9o8
 D4V9dFXfatdTJEqpyIDJfDpBUhffU8wUzSLcVGcL7xFe+elhII9ytftE
X-Gm-Gg: AfdE7cnCovjH3InhnJHG1PD0XaPLxx7wddwkgw6/1Gw2fPhHuuyKhWxA++Jl49O3+kg
 5/dYPALtRTTLvO+ATg+JNQwMGnXl8BTn5Bjw4lcGeCtVIHlFaU+/8/0wnwNMhMB7keOScR2xxI+
 Et1HUD8xMvPS3LxJ4qYAgiR5oW+kV5YwHor22Erd0ac6EamVXi34cZCL/geUdiNYZpO7QjNGlFa
 0FtkxzdsE4xMna5mVYb9/Jecanu35wgkRVyddmk5gjhl+MXdtkUJzofKxEGidi8RSb5ILjVeTP/
 oOd3nk+fvL/fDsCAxwet2ZA5oGIvGk2epLbBo+e3BrPMBrocen+t+f+oKqug2klbh30VB0eKsRk
 fxn17wW7n1zbcvXkSybycpCsnqxy4VP14/8jHh/+YoRHDzcN3a83NzhxBSGY7Pjy6rcPEpctPw3
 QHpW4hnl7JLWZfzGOa
X-Received: by 2002:a17:907:3e0b:b0:c06:c347:e7c7 with SMTP id
 a640c23a62f3a-c097ade1ea5mr638813466b.12.1782113813914; 
 Mon, 22 Jun 2026 00:36:53 -0700 (PDT)
Received: from machine.. ([37.113.214.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c5e99977fsm305347866b.20.2026.06.22.00.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 00:36:53 -0700 (PDT)
From: Evgeny Kolmakov <randomjack94dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, berrange@redhat.com,
 Evgeny Kolmakov <randomjack94dev@gmail.com>
Subject: [PATCH] util/filemonitor-inotify: Use QEMU_LOCK_GUARD()
Date: Mon, 22 Jun 2026 10:36:47 +0300
Message-ID: <20260622073647.3721-1-randomjack94dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=randomjack94dev@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace manual qemu_mutex_(un)lock() calls with
QEMU_LOCK_GUARD() to remove 'goto cleanup' code

Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
---
 util/filemonitor-inotify.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/util/filemonitor-inotify.c b/util/filemonitor-inotify.c
index 7352b9fe53..fe2057f820 100644
--- a/util/filemonitor-inotify.c
+++ b/util/filemonitor-inotify.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/filemonitor.h"
 #include "qemu/main-loop.h"
+#include "qemu/lockable.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -59,10 +60,9 @@ static void qemu_file_monitor_watch(void *arg)
     int used = 0;
     int len;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
 
     if (mon->fd == -1) {
-        qemu_mutex_unlock(&mon->lock);
         return;
     }
 
@@ -72,11 +72,10 @@ static void qemu_file_monitor_watch(void *arg)
         if (errno != EAGAIN) {
             error_report("Failure monitoring inotify FD '%s',"
                          "disabling events", strerror(errno));
-            goto cleanup;
         }
 
         /* no more events right now */
-        goto cleanup;
+        return;
     }
 
     /* Loop over all events in the buffer */
@@ -151,9 +150,6 @@ static void qemu_file_monitor_watch(void *arg)
             }
         }
     }
-
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
 }
 
 
@@ -257,9 +253,8 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
 {
     QFileMonitorDir *dir;
     QFileMonitorWatch watch;
-    int64_t ret = -1;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
     dir = g_hash_table_lookup(mon->dirs, dirpath);
     if (!dir) {
         int rv = inotify_add_watch(mon->fd, dirpath,
@@ -268,7 +263,7 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
 
         if (rv < 0) {
             error_setg_errno(errp, errno, "Unable to watch '%s'", dirpath);
-            goto cleanup;
+            return -1;
         }
 
         trace_qemu_file_monitor_enable_watch(mon, dirpath, rv);
@@ -297,11 +292,7 @@ qemu_file_monitor_add_watch(QFileMonitor *mon,
                                       filename ? filename : "<none>",
                                       cb, opaque, watch.id);
 
-    ret = watch.id;
-
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
-    return ret;
+    return watch.id;
 }
 
 
@@ -312,13 +303,13 @@ void qemu_file_monitor_remove_watch(QFileMonitor *mon,
     QFileMonitorDir *dir;
     gsize i;
 
-    qemu_mutex_lock(&mon->lock);
+    QEMU_LOCK_GUARD(&mon->lock);
 
     trace_qemu_file_monitor_remove_watch(mon, dirpath, id);
 
     dir = g_hash_table_lookup(mon->dirs, dirpath);
     if (!dir) {
-        goto cleanup;
+        return;
     }
 
     for (i = 0; i < dir->watches->len; i++) {
@@ -342,7 +333,4 @@ void qemu_file_monitor_remove_watch(QFileMonitor *mon,
             qemu_set_fd_handler(mon->fd, NULL, NULL, NULL);
         }
     }
-
- cleanup:
-    qemu_mutex_unlock(&mon->lock);
 }
-- 
2.43.0


