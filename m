Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvXw4-0000Ud-TS
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 13:42:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvWqs-0000Yt-8R
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:32:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvWqq-00019Q-Bz
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 12:32:38 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:42178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvWqd-00013U-W3; Wed, 16 Jan 2013 12:32:24 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 314579FE58;
	Wed, 16 Jan 2013 18:32:21 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 94CEF200A8; Wed, 16 Jan 2013 18:32:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 18:32:11 +0100
Message-Id: <1358357540-29862-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358357540-29862-1-git-send-email-armbru@redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: [Qemu-trivial] [PATCH v2 02/11] g_strdup(NULL) returns NULL;
	simplify
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
X-List-Received-Date: Wed, 16 Jan 2013 18:42:02 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/9pfs/virtio-9p-device.c | 6 +-----
 hw/block-common.c          | 4 +---
 net/net.c                  | 4 +---
 slirp/slirp.c              | 8 ++------
 util/qemu-option.c         | 8 ++------
 5 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 6f427df..6eab7f7 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -85,11 +85,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf)
     }
 
     s->ctx.export_flags = fse->export_flags;
-    if (fse->path) {
-        s->ctx.fs_root = g_strdup(fse->path);
-    } else {
-        s->ctx.fs_root = NULL;
-    }
+    s->ctx.fs_root = g_strdup(fse->path);
     s->ctx.exops.get_st_gen = NULL;
     len = strlen(conf->tag);
     if (len > MAX_TAG_LEN - 1) {
diff --git a/hw/block-common.c b/hw/block-common.c
index 0f1b64e..d21ec3a 100644
--- a/hw/block-common.c
+++ b/hw/block-common.c
@@ -18,9 +18,7 @@ void blkconf_serial(BlockConf *conf, char **serial)
     if (!*serial) {
         /* try to fall back to value set with legacy -drive serial=... */
         dinfo = drive_get_by_blockdev(conf->bs);
-        if (dinfo->serial) {
-            *serial = g_strdup(dinfo->serial);
-        }
+        *serial = g_strdup(dinfo->serial);
     }
 }
 
diff --git a/net/net.c b/net/net.c
index 02b5458..0ff5262 100644
--- a/net/net.c
+++ b/net/net.c
@@ -566,9 +566,7 @@ static int net_init_nic(const NetClientOptions *opts, const char *name,
         assert(peer);
         nd->netdev = peer;
     }
-    if (name) {
-        nd->name = g_strdup(name);
-    }
+    nd->name = g_strdup(name);
     if (nic->has_model) {
         nd->model = g_strdup(nic->model);
     }
diff --git a/slirp/slirp.c b/slirp/slirp.c
index e93b578..0e6e232 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -225,12 +225,8 @@ Slirp *slirp_init(int restricted, struct in_addr vnetwork,
         pstrcpy(slirp->client_hostname, sizeof(slirp->client_hostname),
                 vhostname);
     }
-    if (tftp_path) {
-        slirp->tftp_prefix = g_strdup(tftp_path);
-    }
-    if (bootfile) {
-        slirp->bootp_filename = g_strdup(bootfile);
-    }
+    slirp->tftp_prefix = g_strdup(tftp_path);
+    slirp->bootp_filename = g_strdup(bootfile);
     slirp->vdhcp_startaddr = vdhcp_start;
     slirp->vnameserver_addr = vnameserver;
 
diff --git a/util/qemu-option.c b/util/qemu-option.c
index f532b76..c12e724 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -643,9 +643,7 @@ static void opt_set(QemuOpts *opts, const char *name, const char *value,
         QTAILQ_INSERT_TAIL(&opts->head, opt, next);
     }
     opt->desc = desc;
-    if (value) {
-        opt->str = g_strdup(value);
-    }
+    opt->str = g_strdup(value);
     qemu_opt_parse(opt, &local_err);
     if (error_is_set(&local_err)) {
         error_propagate(errp, local_err);
@@ -792,9 +790,7 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
         }
     }
     opts = g_malloc0(sizeof(*opts));
-    if (id) {
-        opts->id = g_strdup(id);
-    }
+    opts->id = g_strdup(id);
     opts->list = list;
     loc_save(&opts->loc);
     QTAILQ_INIT(&opts->head);
-- 
1.7.11.7


