Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cS4-0001yX-60
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cS2-0001t1-25
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cS1-0007e6-5H
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:42 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRw-0007Za-PN; Fri, 06 Oct 2017 19:54:36 -0400
Received: by mail-qk0-x242.google.com with SMTP id 17so5920308qkq.5;
	Fri, 06 Oct 2017 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dCfaAM0acezQcI245LE9dyOnJRkUYyTmmnx7CBUHFn4=;
	b=Qoj5+J6UTuLI0+8RuovsBUUXLUr2IdmpcUxmec8/93303cy7ElVHIDpbnCDBkJ8R8o
	ICktrD8Wv8XI71OiQMhYDlAyca1z3eXtV2lle4IwiFud8GI+iobNpsfYsk88G9gSgbL3
	4to9l4R6/ynYbEj7DzFuyTYYfHSYjlYmBkQ4KPoPZ3ud/3RgjRT8xeSd0zPeWUi3ZUsJ
	yah9kKGUSI0R7ipFXbuh4MPmPN8mXZAWlikN6r19vnMUKrTyoC5uZovgPzcehROBeSZx
	SZoJCgOqLOJRsUAAfUVoD0Gwg3bGmnMXr0cd3yN/dlKZzNhYxEI0CTpf7SZlJf/xNGHM
	7Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dCfaAM0acezQcI245LE9dyOnJRkUYyTmmnx7CBUHFn4=;
	b=C6kZkzBMZ8krwRoTUOUps7PkmY6SKvCagxwA2MT1YOHDnzhOpdCxdK5aAjpsMAqT6P
	3evZubyFibm2Otytg1kfs/hm4LxHCEiil9maPt0SPblf4OF27WfT7KeY/nJIUgpaE9VA
	Z0UF8010CFoOMP/xoHsn0Esi+ytFAX4XSzrCZln62ty1grWnJFoChe11gTpDx0gQDpmN
	FICLkTIQbCJkqK4Yhfk0d4K8wftrJs9WhEihk0u/JzkHNJmqeUblHU3WMIBXmOjPJBDJ
	tbjM8M2VsO0WoUJgNgO6QpEmjqqigvrM+nT5/j5nXqLc0x7GSxnw9V/QqiuTLVpd57cM
	94Og==
X-Gm-Message-State: AMCzsaWxen/rvS8MAMz/vfzfLmeMyC8shpl+/23qrED1uVNfTBfqOWaT
	E2WAcJw9NkJ3OssEYn/ltrI=
X-Google-Smtp-Source: AOwi7QAKk1nDbEZ9seTW+X+SFPi2oV6PaiEUQmIMavD3sesqObhx3/nGytS8iNg7IDo10wf3sm1aig==
X-Received: by 10.55.91.199 with SMTP id p190mr677630qkb.291.1507334076194;
	Fri, 06 Oct 2017 16:54:36 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Greg Kurz <groug@kaod.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:50:04 -0300
Message-Id: <20171006235023.11952-70-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 69/88] virtio-9p: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:43 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added 2 more uses in hw/9pfs/9p-synth.c]
---
 hw/9pfs/9p-handle.c | 2 +-
 hw/9pfs/9p-proxy.c  | 2 +-
 hw/9pfs/9p-synth.c  | 8 ++++----
 hw/9pfs/9p.c        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p-handle.c b/hw/9pfs/9p-handle.c
index 9875f1894c..357ced3079 100644
--- a/hw/9pfs/9p-handle.c
+++ b/hw/9pfs/9p-handle.c
@@ -609,7 +609,7 @@ static int handle_init(FsContext *ctx)
     int ret, mnt_id;
     struct statfs stbuf;
     struct file_handle fh;
-    struct handle_data *data = g_malloc(sizeof(struct handle_data));
+    struct handle_data *data = g_new(struct handle_data, 1);
 
     data->mountfd = open(ctx->fs_root, O_DIRECTORY);
     if (data->mountfd < 0) {
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 28b20a7c3d..2de303d713 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1136,7 +1136,7 @@ static int proxy_parse_opts(QemuOpts *opts, struct FsDriverEntry *fs)
 
 static int proxy_init(FsContext *ctx)
 {
-    V9fsProxy *proxy = g_malloc(sizeof(V9fsProxy));
+    V9fsProxy *proxy = g_new(V9fsProxy, 1);
     int sock_id;
 
     if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index df0a8de08a..3aa69cf465 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -43,7 +43,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
 
     /* Add directory type and remove write bits */
     mode = ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     if (attr) {
         /* We are adding .. or . entries */
         node->attr = attr;
@@ -124,7 +124,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     }
     /* Add file type and remove write bits */
     mode = ((mode & 0777) | S_IFREG);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     node->attr         = &node->actual_attr;
     node->attr->inode  = synth_node_count++;
     node->attr->nlink  = 1;
@@ -180,7 +180,7 @@ static int synth_opendir(FsContext *ctx,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    synth_open = g_new(V9fsSynthOpenState, 1);
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;
@@ -264,7 +264,7 @@ static int synth_open(FsContext *ctx, V9fsPath *fs_path,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    synth_open = g_new(V9fsSynthOpenState, 1);
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 23ac7bb532..510867b4dc 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -298,7 +298,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
             return NULL;
         }
     }
-    f = g_malloc0(sizeof(V9fsFidState));
+    f = g_new0(V9fsFidState, 1);
     f->fid = fid;
     f->fid_type = P9_FID_NONE;
     f->ref = 1;
-- 
2.14.2


