Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPq-0008Kn-Lt
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPo-0008IL-4t
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPl-0005pq-42
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:24 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPi-0005nE-2w; Fri, 06 Oct 2017 19:52:18 -0400
Received: by mail-qt0-x244.google.com with SMTP id 6so25229433qtw.3;
	Fri, 06 Oct 2017 16:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3pReIJ0yowHE70t9Y0HHBB+Pqm3BLEjrcslGdOP3trA=;
	b=JYLtn33pUa+juR0o/PWMjqGguI6mavdffsdtfhx1w2mM3XjrxhqTY66ctxrRahPi7Q
	lKQKEDb7I2IPe+6eYTTgfBMSgYWdlDAwAgfFf0/Q2mXDfgAfOahR+geHgr2t8m9ScgBB
	YaSN5f8LxF6BFfUJUkmTf0sVFfhs+/ZDstuIpkcIHTJE5cpJKKMopDf08UHb1ElOd1Us
	s2KKFf3B+h0leZLBikPYPSpfvXFfqdu1xNvsVq0+UOzSituOeR0/wgVCrJS4UXHUsIki
	mhrX5ojaVOxgQDMk3ZNX9wF4SVm3R6q8r7ETUJOPLdcAMvlgN/spv8RjgsKAPwZEhsX8
	MpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3pReIJ0yowHE70t9Y0HHBB+Pqm3BLEjrcslGdOP3trA=;
	b=JBOvoVph6d4SPode6CQs0MMM5LZIrC7tXQ+xEuzfrDqJU1/ja8mTdSYGJNc0Q/xdic
	smKCMEVgQpT/CbHc4QJIc4rFOi7GQqd4zkmmhPjTzlNLM2hnumgZK3TZLK3pTxkzbI49
	kWpubZTo/FXCVF673EZD8Kf+jy0lGNkdkSymO+ESc3iw087htZRpTdiX2JFwhgHpG7mL
	Uda4524rZtw7fkcInIN1jXZ8DYXPjtxMOLgfsSMTk5WsTIi3Z9H1x5Jlu+D0roIayBjO
	m0ad7Y5bg4SIXJGcbecKQ51VPLkAd0do2XkSyouOIRMsbBbIDolm6Y2l4jt8COUfaNlB
	qrhw==
X-Gm-Message-State: AMCzsaWzReEXOLsN22V97f2Qwxv1bs0t4fdrZRk7EeMERQ1HyLdQ4u9U
	9e+E4+m+BDz4SFwlN+AmdwU=
X-Google-Smtp-Source: AOwi7QDv6zAFRIBtwv06cveNRLVEoIFUOZO0xRJ+6pF74G3/41aI8fIHKLaDWcXqJB4IRZxtI4nuQg==
X-Received: by 10.200.39.122 with SMTP id h55mr5582018qth.238.1507333937063;
	Fri, 06 Oct 2017 16:52:17 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:25 -0300
Message-Id: <20171006235023.11952-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 30/88] QEMU Guest Agent: use g_new() family
 of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:25 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added qga/commands-posix.c and qga/commands-win32.c]
---
 qga/commands-posix.c | 20 ++++++++++----------
 qga/commands-win32.c | 12 ++++++------
 qga/commands.c       |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ab0c63d931..3a4deb6ae0 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -906,16 +906,16 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
         }
     }
 
-    pciaddr = g_malloc0(sizeof(*pciaddr));
+    pciaddr = g_new0(GuestPCIAddress, 1);
     pciaddr->domain = pci[0];
     pciaddr->bus = pci[1];
     pciaddr->slot = pci[2];
     pciaddr->function = pci[3];
 
-    disk = g_malloc0(sizeof(*disk));
+    disk = g_new0(GuestDiskAddress, 1);
     disk->pci_controller = pciaddr;
 
-    list = g_malloc0(sizeof(*list));
+    list = g_new0(GuestDiskAddressList, 1);
     list->value = disk;
 
     if (strcmp(driver, "ata_piix") == 0) {
@@ -1380,7 +1380,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
         return NULL;
     }
 
-    response = g_malloc0(sizeof(*response));
+    response = g_new0(GuestFilesystemTrimResponse, 1);
 
     QTAILQ_FOREACH(mount, &mounts, next) {
         result = g_malloc0(sizeof(*result));
@@ -1897,12 +1897,12 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
         GuestLogicalProcessor *vcpu;
         GuestLogicalProcessorList *entry;
 
-        vcpu = g_malloc0(sizeof *vcpu);
+        vcpu = g_new0(GuestLogicalProcessor, 1);
         vcpu->logical_id = current++;
         vcpu->has_can_offline = true; /* lolspeak ftw */
         transfer_vcpu(vcpu, true, &local_err);
 
-        entry = g_malloc0(sizeof *entry);
+        entry = g_new0(GuestLogicalProcessorList, 1);
         entry->value = vcpu;
 
         *link = entry;
@@ -2267,13 +2267,13 @@ GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
             continue;
         }
 
-        mem_blk = g_malloc0(sizeof *mem_blk);
+        mem_blk = g_new0(GuestMemoryBlock, 1);
         /* The d_name is "memoryXXX",  phys_index is block id, same as XXX */
         mem_blk->phys_index = strtoul(&de->d_name[6], NULL, 10);
         mem_blk->has_can_offline = true; /* lolspeak ftw */
         transfer_memory_block(mem_blk, true, NULL, &local_err);
 
-        entry = g_malloc0(sizeof *entry);
+        entry = g_new0(GuestMemoryBlockList, 1);
         entry->value = mem_blk;
 
         *link = entry;
@@ -2308,13 +2308,13 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
         GuestMemoryBlockResponseList *entry;
         GuestMemoryBlock *current_mem_blk = mem_blks->value;
 
-        result = g_malloc0(sizeof(*result));
+        result = g_new0(GuestMemoryBlockResponse, 1);
         result->phys_index = current_mem_blk->phys_index;
         transfer_memory_block(current_mem_blk, false, result, &local_err);
         if (local_err) { /* should never happen */
             goto err;
         }
-        entry = g_malloc0(sizeof *entry);
+        entry = g_new0(GuestMemoryBlockResponseList, 1);
         entry->value = result;
 
         *link = entry;
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 619dbd2bc2..908f110b8b 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -617,7 +617,7 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
         goto out_close;
     }
 
-    disk = g_malloc0(sizeof(*disk));
+    disk = g_new0(GuestDiskAddress, 1);
     disk->bus_type = find_bus_type(bus);
     if (bus == BusTypeScsi || bus == BusTypeAta || bus == BusTypeRAID
 #if (_WIN32_WINNT >= 0x0600)
@@ -641,7 +641,7 @@ static GuestDiskAddressList *build_guest_disk_info(char *guid, Error **errp)
          disk->pci_controller = NULL;
     }
 
-    list = g_malloc0(sizeof(*list));
+    list = g_new0(GuestDiskAddressList, 1);
     list->value = disk;
     list->next = NULL;
 out_close:
@@ -694,7 +694,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
     }
 
     fs_name[sizeof(fs_name) - 1] = 0;
-    fs = g_malloc(sizeof(*fs));
+    fs = g_new(GuestFilesystemInfo, 1);
     fs->name = g_strdup(guid);
     if (len == 0) {
         fs->mountpoint = g_strdup("System Reserved");
@@ -877,7 +877,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
             continue;
         }
 
-        uc_path = g_malloc(sizeof(WCHAR) * char_count);
+        uc_path = g_new(WCHAR, char_count);
         if (!GetVolumePathNamesForVolumeNameW(guid, uc_path, char_count,
                                               &char_count) || !*uc_path) {
             /* strange, but this condition could be faced even with size == 2 */
@@ -1348,12 +1348,12 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
                     GuestLogicalProcessor *vcpu;
                     GuestLogicalProcessorList *entry;
 
-                    vcpu = g_malloc0(sizeof *vcpu);
+                    vcpu = g_new0(GuestLogicalProcessor, 1);
                     vcpu->logical_id = current++;
                     vcpu->online = true;
                     vcpu->has_can_offline = true;
 
-                    entry = g_malloc0(sizeof *entry);
+                    entry = g_new0(GuestLogicalProcessorList, 1);
                     entry->value = vcpu;
 
                     *link = entry;
diff --git a/qga/commands.c b/qga/commands.c
index ff89e805cf..d4c78ac935 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -239,7 +239,7 @@ static char **guest_exec_get_args(const strList *entry, bool log)
 
     str = g_malloc(str_size);
     *str = 0;
-    args = g_malloc(count * sizeof(char *));
+    args = g_new(char *, count);
     for (it = entry; it != NULL; it = it->next) {
         args[i++] = it->value;
         pstrcat(str, str_size, it->value);
-- 
2.14.2


