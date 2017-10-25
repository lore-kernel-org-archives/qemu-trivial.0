Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7Ces-0000eK-3B
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 23:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e7CT0-0006pa-AV
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 23:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e7CSz-0005Vi-Ef
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 23:34:54 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:51191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1e7CSz-0005VA-AI; Tue, 24 Oct 2017 23:34:53 -0400
Received: by mail-yw0-x243.google.com with SMTP id i198so16915228ywe.7;
	Tue, 24 Oct 2017 20:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H6uq2BY2WAil6dqudVuF2JhQ6M7GsnKg+U188Ogwfa0=;
	b=eAsdUnnxcK1WlF+2X/vkRhGNdBT9B2wDgNKxK3IXL6WREB6AJiMSRwufpIczK0fKTL
	U6COoMetw7vHTT2KP/m2BhpBV3cFEF/Be0qVzIv1Dd9VbVG5M9KJZkEJ/DgsWF7+45+8
	T5aYbFTPzWe6SrWCIMWq6mjXAdVoKXc7t92xh/5i4Fr3eeK+elFczbgvI8GsLQjwjj/A
	JfzfGqZDAGYD2oLt85l4Pe6ebA+L83PoJHv5sO9S1AtVZ8TY/IlcU4g3O+YRlvt1m4Ev
	knLZ3s3z52gSOq2DaC9zZTX+xYInhgXnDwei2ETXIXjDO5EdyCGykeoMsOzSBEtCC3B5
	6Mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H6uq2BY2WAil6dqudVuF2JhQ6M7GsnKg+U188Ogwfa0=;
	b=VH8SRMSwU4jwJYKvPWQzEw2F9WXLa5XfnybNLFcNNR6aDw3m8kNABRu02L6MglTg5t
	7V1LxNlwI73o40JWLhepE2pTUIijhpK5SAfJYHqxUV65gL/l3PtFNJksoZVfXIPVxZ4l
	D4OgGIxl3GSCTP0uCBc3ir8eYQx+ll2QEh5Vl89TgaNruOgp8OXcjwwS95ttxsPb/QWu
	Ji1TXQScz8OaN/2oHcF8IcthO4XDHjJErtFg6aGEIBzshfAEynSTih3KJzPyOpdYdFI+
	jmRd2nGafzuzGOlsC/b/tFjQq0H12tNp0OGEmuv02hWp0vJWV263NjmR+joh4wdcWroT
	k9gw==
X-Gm-Message-State: AMCzsaUusUCFOp61VWueuSatXIv7w99IikdjeyDfwRH5/qr3xFiDNxRG
	k2UfhLoa2NRcAdci10KAixtM0prt
X-Google-Smtp-Source: ABhQp+TbEIa37ARMxg20ughdLIA08lppakLlqrHnTrSQ60ejhw0vH3gqvppKigUCllRJYYzkq0zzRw==
X-Received: by 10.129.160.129 with SMTP id x123mr12794736ywg.508.1508902492318;
	Tue, 24 Oct 2017 20:34:52 -0700 (PDT)
Received: from riggle-macbookpro.roam.corp.google.com.com
	([2620:15c:2a:2:3c3d:b40:6b34:821]) by smtp.gmail.com with ESMTPSA id
	b129sm915949ywe.99.2017.10.24.20.34.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 20:34:51 -0700 (PDT)
From: Zach Riggle <zachriggle@gmail.com>
To: 
Cc: qemu-trivial@nongnu.org, Zach Riggle <zachriggle@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Tue, 24 Oct 2017 22:34:42 -0500
Message-Id: <20171025033442.44872-1-zachriggle@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171024230758.31779-1-riggle@google.com>
References: <20171024230758.31779-1-riggle@google.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::243
X-Mailman-Approved-At: Tue, 24 Oct 2017 23:47:09 -0400
Subject: [Qemu-trivial] [PATCH v2] linux-user: fix is_proc_myself to check
 the paths via realpath
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
X-List-Received-Date: Wed, 25 Oct 2017 03:34:55 -0000

Previously, it was possible to get a handle to the "real" /proc/self/mem
by creating a symlink to it and opening the symlink, or opening e.g.
"./mem" after chdir'ing to "/proc/self".

    $ ln -s /proc/self self
    $ cat self/maps
    60000000-602bc000 r-xp 00000000 fc:01 270375                             /usr/bin/qemu-arm-static
    604bc000-6050f000 rw-p 002bc000 fc:01 270375                             /usr/bin/qemu-arm-static
    ...

Signed-off-by: Zach Riggle <zachriggle@gmail.com>
---
 linux-user/syscall.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9bf901fa11..6c1f28a1f7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7496,26 +7496,35 @@ static int open_self_auxv(void *cpu_env, int fd)

 static int is_proc_myself(const char *filename, const char *entry)
 {
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
-            }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
-        }
+    char proc_self_entry[PATH_MAX + 1];
+    char proc_self_entry_realpath[PATH_MAX + 1];
+    char filename_realpath[PATH_MAX + 1];
+
+    if (PATH_MAX < snprintf(proc_self_entry,
+                            sizeof(proc_self_entry),
+                            "/proc/self/%s",
+                            entry)) {
+        /* Full path to "entry" is too long to fit in the buffer */
+        return 0;
     }
-    return 0;
+
+    if (!realpath(filename, filename_realpath)) {
+        /* File does not exist, or can't be canonicalized */
+        return 0;
+    }
+
+    if (!realpath(proc_self_entry, proc_self_entry_realpath)) {
+        /* Procfs entry does not exist */
+        return 0;
+    }
+
+    if (strcmp(filename_realpath, proc_self_entry_realpath) != 0) {
+        /* Paths are different */
+        return 0;
+    }
+
+    /* filename refers to /proc/self/<entry> */
+    return 1;
 }

 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
--
2.14.3


