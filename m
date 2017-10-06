Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPu-0008PF-EB
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPr-0008Lp-Fy
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPq-0005sD-4F
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:27 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPk-0005pY-Sh; Fri, 06 Oct 2017 19:52:20 -0400
Received: by mail-qk0-x242.google.com with SMTP id z12so9699423qkb.0;
	Fri, 06 Oct 2017 16:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SratUe3w9q0+0lXX2FxlOcFtdtVwgrAbdCNWZ/OQwXY=;
	b=Wgptvq13msx2ZRmfbNFSI/q+8tYflPRB9oeSdIQ1ngKne7dGT125cC0AQqVLnr9ypx
	+SINvlUGz6d1ta4Os4yHN/JaW2n0B8OuLVOkQJy6xAR8WWBTwAcni6S3PS0xz6hkkORm
	4+MqIFimClrDsRRGNaG0esaYifTTUpIUm/Ws6x1wTdXu9zZzRWEECKhCfwa56C73u/yt
	5dIi+J6c6rEWv2FMDe1EV3quSG8E1nCzfohI0JP6ML8xPEpW5R8SjXu8HcsRz4tVJD5D
	vnfhZqrO7V3Azj+y6G3HTwJ9fM30Ba5xmzVgBQB0xMY4xrA/pe918KqlEX40BOr373+P
	JcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=SratUe3w9q0+0lXX2FxlOcFtdtVwgrAbdCNWZ/OQwXY=;
	b=pmC/t9cDDWQgA3PsOiJRQpRvXnFO5YWzmlSd2VmIJGyGbN7ZmihiPewKyUHKV6knVD
	+ohkUFdrDQXHoJnxVjJ+W17YDrBd42KSxsy9MH+zBEvNGM5ac/Kacm1J1hBZZS6A0kic
	jpiVt705tcVSZYDKDALxLcnLDhH52IkIsXhD7xnC5Z6w9xPKQw4MDdTLnUbxeHdC0tR1
	jDMyOXRzh4B7i73PcaX6mi8QoCmq6Jz7C1O5TLQp9QbtjdFkHU4E8VmPhawOR6qvzZEV
	R9N9Yiz00vbpCawsd/6YxI2gmKxy9uvA/TeBsYGVPFxmRlLRTxrURlBLo7M7QBKKb9ut
	dIjw==
X-Gm-Message-State: AMCzsaW+1WHkS/F7thQTpqJ4gN/ZUZFngZAxxHI9k4KS7njpuzaog16/
	Z4Xgt6xHmglTgUzEtzIvrfXV4Tp7gvU=
X-Google-Smtp-Source: AOwi7QC1JHBjbc1iz149lfWfIP7JrqkBTwOCJ24WmBo0BKsC2SoizzEjjxe9TaprOf2D8yaJP/006A==
X-Received: by 10.55.16.87 with SMTP id a84mr766136qkh.170.1507333940301;
	Fri, 06 Oct 2017 16:52:20 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:26 -0300
Message-Id: <20171006235023.11952-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 31/88] QMP: use g_new() family of functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 23:52:29 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: more changes]
---
 monitor.c                 | 14 +++++++-------
 qmp.c                     | 14 +++++++-------
 tests/test-qmp-commands.c | 14 +++++++-------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/monitor.c b/monitor.c
index fe0d1bdbb4..ea6a485f11 100644
--- a/monitor.c
+++ b/monitor.c
@@ -906,7 +906,7 @@ static void query_commands_cb(QmpCommand *cmd, void *opaque)
         return;
     }
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(CommandInfoList, 1);
     info->value = g_malloc0(sizeof(*info->value));
     info->value->name = g_strdup(cmd->name);
     info->next = *list;
@@ -1799,7 +1799,7 @@ static void hmp_wavcapture(Monitor *mon, const QDict *qdict)
     int nchannels = qdict_get_try_int(qdict, "nchannels", -1);
     CaptureState *s;
 
-    s = g_malloc0 (sizeof (*s));
+    s = g_new0(CaptureState, 1);
 
     freq = has_freq ? freq : 44100;
     bits = has_bits ? bits : 16;
@@ -1947,7 +1947,7 @@ void qmp_getfd(const char *fdname, Error **errp)
         return;
     }
 
-    monfd = g_malloc0(sizeof(mon_fd_t));
+    monfd = g_new0(mon_fd_t, 1);
     monfd->name = g_strdup(fdname);
     monfd->fd = fd;
 
@@ -2110,7 +2110,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
         QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
             FdsetFdInfoList *fdsetfd_info;
 
-            fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
+            fdsetfd_info = g_new0(FdsetFdInfoList, 1);
             fdsetfd_info->value = g_malloc0(sizeof(*fdsetfd_info->value));
             fdsetfd_info->value->fd = mon_fdset_fd->fd;
             if (mon_fdset_fd->opaque) {
@@ -2199,7 +2199,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
         }
     }
 
-    mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
+    mon_fdset_fd = g_new0(MonFdsetFd, 1);
     mon_fdset_fd->fd = fd;
     mon_fdset_fd->removed = false;
     if (has_opaque) {
@@ -2207,7 +2207,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
     }
     QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
 
-    fdinfo = g_malloc0(sizeof(*fdinfo));
+    fdinfo = g_new0(AddfdInfo, 1);
     fdinfo->fdset_id = mon_fdset->id;
     fdinfo->fd = mon_fdset_fd->fd;
 
@@ -4102,7 +4102,7 @@ void monitor_init(Chardev *chr, int flags)
         is_first_init = 0;
     }
 
-    mon = g_malloc(sizeof(*mon));
+    mon = g_new(Monitor, 1);
     monitor_data_init(mon);
 
     qemu_chr_fe_init(&mon->chr, chr, &error_abort);
diff --git a/qmp.c b/qmp.c
index e8c303116a..e965020e37 100644
--- a/qmp.c
+++ b/qmp.c
@@ -232,7 +232,7 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
     while ((prop = object_property_iter_next(&iter))) {
         ObjectPropertyInfoList *entry = g_malloc0(sizeof(*entry));
 
-        entry->value = g_malloc0(sizeof(ObjectPropertyInfo));
+        entry->value = g_new0(ObjectPropertyInfo, 1);
         entry->next = props;
         props = entry;
 
@@ -432,7 +432,7 @@ static void qom_list_types_tramp(ObjectClass *klass, void *data)
     ObjectTypeInfo *info;
     ObjectClass *parent = object_class_get_parent(klass);
 
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(ObjectTypeInfo, 1);
     info->name = g_strdup(object_class_get_name(klass));
     info->has_abstract = info->abstract = object_class_is_abstract(klass);
     if (parent) {
@@ -440,7 +440,7 @@ static void qom_list_types_tramp(ObjectClass *klass, void *data)
         info->parent = g_strdup(object_class_get_name(parent));
     }
 
-    e = g_malloc0(sizeof(*e));
+    e = g_new0(ObjectTypeInfoList, 1);
     e->value = info;
     e->next = *pret;
     *pret = e;
@@ -490,7 +490,7 @@ static DevicePropertyInfo *make_device_property_info(ObjectClass *klass,
                 return NULL;           /* no way to set it, don't show */
             }
 
-            info = g_malloc0(sizeof(*info));
+            info = g_new0(DevicePropertyInfo, 1);
             info->name = g_strdup(prop->name);
             info->type = default_type ? g_strdup(default_type)
                                       : g_strdup(prop->info->name);
@@ -502,7 +502,7 @@ static DevicePropertyInfo *make_device_property_info(ObjectClass *klass,
     } while (klass != object_class_by_name(TYPE_DEVICE));
 
     /* Not a qdev property, use the default type */
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(DevicePropertyInfo, 1);
     info->name = g_strdup(name);
     info->type = g_strdup(default_type);
     info->has_description = !!description;
@@ -568,7 +568,7 @@ DevicePropertyInfoList *qmp_device_list_properties(const char *typename,
             continue;
         }
 
-        entry = g_malloc0(sizeof(*entry));
+        entry = g_new0(DevicePropertyInfoList, 1);
         entry->value = info;
         entry->next = prop_list;
         prop_list = entry;
@@ -712,7 +712,7 @@ ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
 
 MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 {
-    MemoryInfo *mem_info = g_malloc0(sizeof(MemoryInfo));
+    MemoryInfo *mem_info = g_new0(MemoryInfo, 1);
 
     mem_info->base_memory = ram_size;
 
diff --git a/tests/test-qmp-commands.c b/tests/test-qmp-commands.c
index 904c89d4d4..e715c45a23 100644
--- a/tests/test-qmp-commands.c
+++ b/tests/test-qmp-commands.c
@@ -28,8 +28,8 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
                               Error **errp)
 {
     UserDefTwo *ret;
-    UserDefOne *ud1c = g_malloc0(sizeof(UserDefOne));
-    UserDefOne *ud1d = g_malloc0(sizeof(UserDefOne));
+    UserDefOne *ud1c = g_new0(UserDefOne, 1);
+    UserDefOne *ud1d = g_new0(UserDefOne, 1);
 
     ud1c->string = strdup(ud1a->string);
     ud1c->integer = ud1a->integer;
@@ -209,23 +209,23 @@ static void test_dealloc_types(void)
     UserDefOne *ud1test, *ud1a, *ud1b;
     UserDefOneList *ud1list;
 
-    ud1test = g_malloc0(sizeof(UserDefOne));
+    ud1test = g_new0(UserDefOne, 1);
     ud1test->integer = 42;
     ud1test->string = g_strdup("hi there 42");
 
     qapi_free_UserDefOne(ud1test);
 
-    ud1a = g_malloc0(sizeof(UserDefOne));
+    ud1a = g_new0(UserDefOne, 1);
     ud1a->integer = 43;
     ud1a->string = g_strdup("hi there 43");
 
-    ud1b = g_malloc0(sizeof(UserDefOne));
+    ud1b = g_new0(UserDefOne, 1);
     ud1b->integer = 44;
     ud1b->string = g_strdup("hi there 44");
 
-    ud1list = g_malloc0(sizeof(UserDefOneList));
+    ud1list = g_new0(UserDefOneList, 1);
     ud1list->value = ud1a;
-    ud1list->next = g_malloc0(sizeof(UserDefOneList));
+    ud1list->next = g_new0(UserDefOneList, 1);
     ud1list->next->value = ud1b;
 
     qapi_free_UserDefOneList(ud1list);
-- 
2.14.2


