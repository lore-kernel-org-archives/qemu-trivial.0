Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7Cet-0000fG-87
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 23:47:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e78JU-0008MZ-6k
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1e78JT-0002hG-5Z
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 19:08:48 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:56107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1e78JT-0002gt-0b; Tue, 24 Oct 2017 19:08:47 -0400
Received: by mail-oi0-x242.google.com with SMTP id g125so40112233oib.12;
	Tue, 24 Oct 2017 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UNX5LeRBaPungLYmGR+puUMm13E5PYH1s0dHXYJceIg=;
	b=hXaUq/1Hk/bass8EBhiJrFq8Jp95tBYAet92Q3ilQPd1U8Ot7YHxpgfhwHrn6sGEsK
	mnfZDB9kLj0xDOJeYraeocQv5++bflxU3SyPIkmjq/YmgxZpNe7hy97KOZFNjnwUNiUw
	vWe6UP68d4t/zXu0L4qZft8oM/A4X10jFp/zsfEJe6MCK2JC1Poh4FqNFqvPhmMPJQGm
	CO4xrZhqPtrnz3r/Qy/8VGmUFx4o06Vohux6Y2qQHKwu5j/EqwoJCq79t0Hhi40DvDYn
	otHPdbvwLVNT05DIcxDbKC4ETfcEDiLNQ8EZ3GJFAL4wS2DaHjmn0/RtynhaVXMIlTOY
	B0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UNX5LeRBaPungLYmGR+puUMm13E5PYH1s0dHXYJceIg=;
	b=kQlxrLsbwi0nw0bxmVF916YPRI0MiO9xDkWfpExosviKPbccpvx7X2WMOeLh9YnrTl
	Kjo5tTfJWiqPxQHSdgmLm0XpH9VTyd6HHl24qJIMTO/oxvOw/hwJzffpi+LrvukodDYq
	7Av3QB+IbO3ZN22F3Hy0H1QI4Ya2OmZANFry/FTdPdXuuxr/Iadu8rrPN5jv3uW0VJBS
	Xxc0QR5/F6VNKrKj1nA6k6Y2Jvi/SuRlBsULx/LD5owGwq++QCGMWp5StuvlpMbR/vjT
	P0sHCGq/7MziLLhn7cfGGFlzpSnzEchXPnc2vnp5c2bq2DzOqyLjn1X1AVn57PQiThAA
	2Y6A==
X-Gm-Message-State: AMCzsaUN5gwqXzrnBAOBSMn2lvcs0s33CZYFwpLq7IH+DCJMo7QZYpGG
	+7Q06jxaNk1AkEdzxP2OEObJsvsw
X-Google-Smtp-Source: ABhQp+ROqJhp7noCwcuG4TY9ntQMlGzuKQbjcZhMnwQu94MW6cYp8/L0KMEl3b7t5nsQyC86f3PXrg==
X-Received: by 10.202.240.65 with SMTP id o62mr131065oih.300.1508886525734;
	Tue, 24 Oct 2017 16:08:45 -0700 (PDT)
Received: from riggle-macbookpro.roam.corp.google.com.com
	([2620:15c:2a:2:3c3d:b40:6b34:821])
	by smtp.gmail.com with ESMTPSA id 8sm713761otf.13.2017.10.24.16.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 16:08:44 -0700 (PDT)
From: Zach Riggle <zachriggle@gmail.com>
X-Google-Original-From: Zach Riggle <riggle@google.com>
To: 
Cc: qemu-trivial@nongnu.org, Zach Riggle <zachriggle@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Tue, 24 Oct 2017 18:07:58 -0500
Message-Id: <20171024230758.31779-1-riggle@google.com>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
X-Mailman-Approved-At: Tue, 24 Oct 2017 23:47:09 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: fix is_proc_myself to check the
 paths via realpath
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
X-List-Received-Date: Tue, 24 Oct 2017 23:08:50 -0000

From: Zach Riggle <zachriggle@gmail.com>

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
 linux-user/syscall.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9bf901fa11..8fef3bb28e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7496,26 +7496,32 @@ static int open_self_auxv(void *cpu_env, int fd)

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
+    if(PATH_MAX < snprintf(proc_self_entry, sizeof(proc_self_entry), "/proc/self/%s", entry)) {
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


