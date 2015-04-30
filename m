Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnhJb-0006vN-CJ
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:47:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhJX-0006oN-WA
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YnhJW-0006cE-SX
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:47:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YnhJS-0006Zo-D7; Thu, 30 Apr 2015 01:47:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02EC242B95;
	Thu, 30 Apr 2015 08:46:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 07BA2961;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4325 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:29 +0300
Message-Id: <c15f225567f2b239ec9073cdec4f207f8e98288e.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Thomas Huth <thuth@linux.vnet.ibm.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PULL 16/42] monitor: Remove unused functions
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
X-List-Received-Date: Thu, 30 Apr 2015 05:47:13 -0000

From: Thomas Huth <thuth@linux.vnet.ibm.com>

The functions ringbuf_read_completion() and monitor_get_rs()
are not used anywhere anymore, so let's remove them.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Luiz Capitulino <lcapitulino@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hmp.h                     |  1 -
 include/monitor/monitor.h |  1 -
 monitor.c                 | 13 -------------
 3 files changed, 15 deletions(-)

diff --git a/hmp.h b/hmp.h
index 2b9308b..12acb6d 100644
--- a/hmp.h
+++ b/hmp.h
@@ -109,7 +109,6 @@ void set_link_completion(ReadLineState *rs, int nb_args, const char *str);
 void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str);
-void ringbuf_read_completion(ReadLineState *rs, int nb_args, const char *str);
 void watchdog_action_completion(ReadLineState *rs, int nb_args,
                                 const char *str);
 void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1c06bed..df67d56 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -47,7 +47,6 @@ typedef void (MonitorCompletion)(void *opaque, QObject *ret_data);
 
 void monitor_set_error(Monitor *mon, QError *qerror);
 void monitor_read_command(Monitor *mon, int show_prompt);
-ReadLineState *monitor_get_rs(Monitor *mon);
 int monitor_read_password(Monitor *mon, ReadLineFunc *readline_func,
                           void *opaque);
 
diff --git a/monitor.c b/monitor.c
index 31369d3..d831d98 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4390,14 +4390,6 @@ static void ringbuf_completion(ReadLineState *rs, const char *str)
     qapi_free_ChardevInfoList(start);
 }
 
-void ringbuf_read_completion(ReadLineState *rs, int nb_args, const char *str)
-{
-    if (nb_args != 2) {
-        return;
-    }
-    ringbuf_completion(rs, str);
-}
-
 void ringbuf_write_completion(ReadLineState *rs, int nb_args, const char *str)
 {
     if (nb_args != 2) {
@@ -5392,11 +5384,6 @@ static void bdrv_password_cb(void *opaque, const char *password,
     monitor_read_command(mon, 1);
 }
 
-ReadLineState *monitor_get_rs(Monitor *mon)
-{
-    return mon->rs;
-}
-
 int monitor_read_bdrv_key_start(Monitor *mon, BlockDriverState *bs,
                                 BlockCompletionFunc *completion_cb,
                                 void *opaque)
-- 
2.1.4


