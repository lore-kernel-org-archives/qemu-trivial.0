Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ztajj-0004q3-1b
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2015 07:30:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1Ztaje-0004mU-5A
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1Ztaja-0003LC-Ug
	for qemu-trivial@nongnu.org; Tue, 03 Nov 2015 07:30:46 -0500
Received: from [59.151.112.132] (port=36707 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1ZtajZ-0003HF-1f; Tue, 03 Nov 2015 07:30:42 -0500
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Nov 2015 20:30:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA3CTjBC022164;
	Tue, 3 Nov 2015 20:29:45 +0800
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.57) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 3 Nov 2015 20:30:21 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 3 Nov 2015 20:30:29 +0800
Message-ID: <1446553829-28463-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.57]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, marcel@redhat.com
Subject: [Qemu-trivial] [PATCH] set_memory_options: remove code that make no
	sense
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
X-List-Received-Date: Tue, 03 Nov 2015 12:30:48 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 vl.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/vl.c b/vl.c
index f5f7c3f..13f2c8b 100644
--- a/vl.c
+++ b/vl.c
@@ -2860,11 +2860,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
     sz = 0;
     mem_str = qemu_opt_get(opts, "size");
     if (mem_str) {
-        if (!*mem_str) {
-            error_report("missing 'size' option value");
-            exit(EXIT_FAILURE);
-        }
-
         sz = qemu_opt_get_size(opts, "size", ram_size);
 
         /* Fix up legacy suffix-less format */
@@ -2886,10 +2881,6 @@ static void set_memory_options(uint64_t *ram_slots, ram_addr_t *maxram_size,
 
     sz = QEMU_ALIGN_UP(sz, 8192);
     ram_size = sz;
-    if (ram_size != sz) {
-        error_report("ram size too large");
-        exit(EXIT_FAILURE);
-    }
 
     /* store value for the future use */
     qemu_opt_set_number(opts, "size", ram_size, &error_abort);
-- 
2.1.0


