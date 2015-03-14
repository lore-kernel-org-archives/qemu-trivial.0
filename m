Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQY-0006iW-U0
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:20:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQQ-0006Qw-Hq
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQD-0004C1-So
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:54 -0400
Received: from e06smtp11.uk.ibm.com ([195.75.94.107]:60949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQD-0004Bf-Jc
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:41 -0400
Received: from /spool/local
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:40 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:37 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id A2B8517D8042; 
	Sat, 14 Mar 2015 06:20:00 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JbEq11534618; Sat, 14 Mar 2015 06:19:37 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JbvH013417; Sat, 14 Mar 2015 02:19:37 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkW013361; Sat, 14 Mar 2015 02:19:36 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:31 +0100
Message-Id: <1426313974-25607-5-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0041-0000-0000-000003B69E6B
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.107
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 4/7] monitor: Remove unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:58 -0000

The functions ringbuf_read_completion() and monitor_get_rs()
are not used anywhere anymore, so let's remove them.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Luiz Capitulino <lcapitulino@redhat.com>
---
 hmp.h                     |    1 -
 include/monitor/monitor.h |    1 -
 monitor.c                 |   13 -------------
 3 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/hmp.h b/hmp.h
index 81177b2..0c96e9a 100644
--- a/hmp.h
+++ b/hmp.h
@@ -106,7 +106,6 @@ void set_link_completion(ReadLineState *rs, int nb_args, const char *str);
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
index c86a89e..18d7f23 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4385,14 +4385,6 @@ static void ringbuf_completion(ReadLineState *rs, const char *str)
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
@@ -5370,11 +5362,6 @@ static void bdrv_password_cb(void *opaque, const char *password,
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
1.7.1


