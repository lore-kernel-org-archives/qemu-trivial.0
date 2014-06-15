Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ww7Ia-0002HW-MW
	for mharc-qemu-trivial@gnu.org; Sun, 15 Jun 2014 06:04:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Ww7IT-00028n-HZ
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 06:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Ww7IN-00077H-7K
	for qemu-trivial@nongnu.org; Sun, 15 Jun 2014 06:04:21 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:36539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Ww7IA-00076C-VS; Sun, 15 Jun 2014 06:04:03 -0400
Received: by mail-wg0-f41.google.com with SMTP id a1so4448972wgh.24
	for <multiple recipients>; Sun, 15 Jun 2014 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=t5FNs0spc+RMb9hFs90dHWa+cbyX1dBjTkA4CI23e1I=;
	b=XvBIqtH+JqTELMUXu4EWBn3TwK/BwW13TFM5knrTr2GwXpI7W+cdHS7e+FseRxwFlu
	KVyMAIBiuWjrkmwioHFfuqnNQw85+vERv3gW3fpgXqBLrKQ175MwA2nAEgnoFxcjYUH4
	ru5Jj2X1psx1AQhUV7D1vlBfWe9xTg27lTG6V5lfIZ5OpNehnXiYyt1VvzJE2Y0cvVFk
	p5ciSXcxicNwFbna4UOsXqvmonq0MKa8+xhsZsvxoLYj3cbvTBnouLv+JIRnEe8UwGDl
	Ta4BrLhvzjLr9/JjfPmio4m/yWzL97QKkQFclHA/g12/SihKOJ5tZd9UzQ7y8jykVASD
	Z5vA==
X-Received: by 10.180.13.47 with SMTP id e15mr14485368wic.28.1402826641852;
	Sun, 15 Jun 2014 03:04:01 -0700 (PDT)
Received: from localhost.localdomain ([41.103.8.66])
	by mx.google.com with ESMTPSA id jy8sm13639646wjc.7.2014.06.15.03.04.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Jun 2014 03:04:01 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun, 15 Jun 2014 11:03:56 +0100
Message-Id: <1402826636-12435-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Subject: [Qemu-trivial] [PATCH] watchdog: Export watchdog actions list.
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
X-List-Received-Date: Sun, 15 Jun 2014 10:04:27 -0000

Also, use it instead of using hard-coded values.

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
Should have been part of the last monitor completion series, but better late
then never. :)

 hw/watchdog/watchdog.c    | 35 +++++++++++++++++++----------------
 include/sysemu/watchdog.h |  6 ++++++
 monitor.c                 | 19 ++++++++++++-------
 3 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index f28161b..3bea6fe 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -39,6 +39,16 @@
 static int watchdog_action = WDT_RESET;
 static QLIST_HEAD(watchdog_list, WatchdogTimerModel) watchdog_list;
 
+struct watchdog_action watchdog_actions[] = {
+    { "reset",  WDT_RESET },
+    { "shutdown", WDT_SHUTDOWN },
+    { "poweroff", WDT_POWEROFF },
+    { "pause", WDT_PAUSE },
+    { "debug", WDT_DEBUG },
+    { "none", WDT_NONE },
+    { NULL, 0 },
+};
+
 void watchdog_add_model(WatchdogTimerModel *model)
 {
     QLIST_INSERT_HEAD(&watchdog_list, model, entry);
@@ -83,22 +93,15 @@ int select_watchdog(const char *p)
 
 int select_watchdog_action(const char *p)
 {
-    if (strcasecmp(p, "reset") == 0)
-        watchdog_action = WDT_RESET;
-    else if (strcasecmp(p, "shutdown") == 0)
-        watchdog_action = WDT_SHUTDOWN;
-    else if (strcasecmp(p, "poweroff") == 0)
-        watchdog_action = WDT_POWEROFF;
-    else if (strcasecmp(p, "pause") == 0)
-        watchdog_action = WDT_PAUSE;
-    else if (strcasecmp(p, "debug") == 0)
-        watchdog_action = WDT_DEBUG;
-    else if (strcasecmp(p, "none") == 0)
-        watchdog_action = WDT_NONE;
-    else
-        return -1;
-
-    return 0;
+    int i;
+
+    for (i = 0; watchdog_actions[i].name; i++) {
+        if (!strcasecmp(p, watchdog_actions[i].name)) {
+            watchdog_action = watchdog_actions[i].action;
+            return 0;
+        }
+    }
+    return -1;
 }
 
 static void watchdog_mon_event(const char *action)
diff --git a/include/sysemu/watchdog.h b/include/sysemu/watchdog.h
index 3e9a970..2bfe2fc 100644
--- a/include/sysemu/watchdog.h
+++ b/include/sysemu/watchdog.h
@@ -34,6 +34,12 @@ struct WatchdogTimerModel {
 };
 typedef struct WatchdogTimerModel WatchdogTimerModel;
 
+struct watchdog_action {
+    const char *name;
+    int action;
+};
+extern struct watchdog_action watchdog_actions[];
+
 /* in hw/watchdog.c */
 int select_watchdog(const char *p);
 int select_watchdog_action(const char *action);
diff --git a/monitor.c b/monitor.c
index ee9390f..57d23c6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4562,16 +4562,21 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
 
 void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
 {
+    int i;
+    size_t len;
+
     if (nb_args != 2) {
         return;
     }
-    readline_set_completion_index(rs, strlen(str));
-    add_completion_option(rs, str, "reset");
-    add_completion_option(rs, str, "shutdown");
-    add_completion_option(rs, str, "poweroff");
-    add_completion_option(rs, str, "pause");
-    add_completion_option(rs, str, "debug");
-    add_completion_option(rs, str, "none");
+    len = strlen(str);
+    readline_set_completion_index(rs, len);
+    for (i = 0; watchdog_actions[i].name; i++) {
+        const char *name = watchdog_actions[i].name;
+
+        if (!strncmp(str, name, len)) {
+            readline_add_completion(rs, name);
+        }
+    }
 }
 
 void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
-- 
1.8.3.2


