Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLrNh-0001xs-7M
	for mharc-qemu-trivial@gnu.org; Thu, 12 Feb 2015 05:52:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNe-0001vW-Hx
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLrNd-0006Un-KO
	for qemu-trivial@nongnu.org; Thu, 12 Feb 2015 05:52:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLrNZ-0006TS-9N; Thu, 12 Feb 2015 05:52:17 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1CAqGpr001276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 12 Feb 2015 05:52:16 -0500
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1CAqELf001507
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Feb 2015 05:52:16 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2D1B1303F913; Thu, 12 Feb 2015 11:52:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Feb 2015 11:52:12 +0100
Message-Id: <1423738334-13545-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1423738334-13545-1-git-send-email-armbru@redhat.com>
References: <1423738334-13545-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] hmp: Clean up declarations for long-gone
	info handlers
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
X-List-Received-Date: Thu, 12 Feb 2015 10:52:24 -0000

Leftovers from
d1f2964 qapi: Convert query-spice
791e7c8 qapi: Convert query-migrate
0fe6a7f slirp: Drop statistic code

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/migration/migration.h | 4 ----
 include/sysemu/sysemu.h       | 3 ---
 include/ui/qemu-spice.h       | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/include/migration/migration.h b/include/migration/migration.h
index f37348b..703b7d7 100644
--- a/include/migration/migration.h
+++ b/include/migration/migration.h
@@ -71,10 +71,6 @@ void qemu_start_incoming_migration(const char *uri, Error **errp);
 
 uint64_t migrate_max_downtime(void);
 
-void do_info_migrate_print(Monitor *mon, const QObject *data);
-
-void do_info_migrate(Monitor *mon, QObject **ret_data);
-
 void exec_start_incoming_migration(const char *host_port, Error **errp);
 
 void exec_start_outgoing_migration(MigrationState *s, const char *host_port, Error **errp);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 748d059..c42649c 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -90,9 +90,6 @@ void qemu_savevm_state_cancel(void);
 uint64_t qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size);
 int qemu_loadvm_state(QEMUFile *f);
 
-/* SLIRP */
-void do_info_slirp(Monitor *mon);
-
 typedef enum DisplayType
 {
     DT_DEFAULT,
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 762e063..25b94c7 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -45,9 +45,6 @@ int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject,
                             MonitorCompletion cb, void *opaque);
 
-void do_info_spice_print(Monitor *mon, const QObject *data);
-void do_info_spice(Monitor *mon, QObject **ret_data);
-
 CharDriverState *qemu_chr_open_spice_vmc(const char *type);
 #if SPICE_SERVER_VERSION >= 0x000c02
 CharDriverState *qemu_chr_open_spice_port(const char *name);
-- 
1.9.3


