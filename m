Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPE-0007hX-NS
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPC-0007by-6z
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPB-0005Ja-Cv
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:46 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:50908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP6-0005Ee-U1; Fri, 06 Oct 2017 19:51:40 -0400
Received: by mail-qt0-x241.google.com with SMTP id f15so34348508qtf.7;
	Fri, 06 Oct 2017 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ou5DYi2TigEtJhbKCSg64Q9IEsfjgCcfCqLZSaXAnpo=;
	b=vAromYtI3jDnprhua2sa/QZVahbRxSIOcSTLcLUfDI7sXq7B5AX7erIDoHwhjR2w25
	cjgjOVHl0nJAOUUTo2kKshMIVMP86EqZHRRUYgnuEH9t7aQQHIM1h0YormHseIcO3nRG
	RvTaZPwoYPDcgBbgB1f8pnjH3XZVWXVz6J9z3bA8C/H//ClnMgEMkLqT+yjTTaPCWD4a
	0r1f59M448q8ayMZf9+qGO1yKjxkW9jm9w1xbVbaTnvWmoPzcYgvehFuJKczRjzbTXFB
	T6idFuaSagcfsv1svYgDNNnDrPWAkLDOt/UVqtBgYzHViTupCNc3zLQ812+gfiCH07Az
	3QQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ou5DYi2TigEtJhbKCSg64Q9IEsfjgCcfCqLZSaXAnpo=;
	b=GAWWG7l4w5BzoQzQt4Byv3e51yMeNh2LZG1/IMmLs9K7QmvHHJPbfujlAnMFoQwKUF
	dKyzkBF5CPkUTzzwKS+c5n8LO4DwH+LqGRVSe7Oj/htK214kO92IIGrBnJQ0Rs+QWPo1
	3IW5xRwjVDCCsWgxSB5JP9dp79TZX7U0XYJQ5zn1WQc/5eybT7NtR7chS5tpY9QOEt7N
	oJbQWFWNSZz17P50Cy/8OBYZGu//6puFwreGuHqxjnBArkiqAMznhEdrkhJ3eJD3Rh3b
	nZCzLzzpCsPWiNfL7CnV3s9+x39JjbfaJdvsRig1Gbbzp+pDmX3s0J5ChbH1sD6ney1n
	iH2g==
X-Gm-Message-State: AMCzsaUjZmqK66u/seT5rga2gsRLArUB4GH0YzQ5mF0ZST0lWZAJUkFE
	9DBfJBVVdIa3RwDOrhZafik1tj4Q
X-Google-Smtp-Source: AOwi7QBhVJFTfQjmbhtAjMx5x/gYQoWY4eRtcMxq7oaIrakKwg75nq9+kTqreFySW21geDWBTVWv4Q==
X-Received: by 10.200.52.56 with SMTP id u53mr5494951qtb.16.1507333900415;
	Fri, 06 Oct 2017 16:51:40 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:14 -0300
Message-Id: <20171006235023.11952-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 19/88] exec: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/exec.c b/exec.c
index 7a80460725..e060c6fea7 100644
--- a/exec.c
+++ b/exec.c
@@ -836,7 +836,7 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                      VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
         return -EINVAL;
     }
-    wp = g_malloc(sizeof(*wp));
+    wp = g_new(CPUWatchpoint, 1);
 
     wp->vaddr = addr;
     wp->len = len;
@@ -922,7 +922,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 {
     CPUBreakpoint *bp;
 
-    bp = g_malloc(sizeof(*bp));
+    bp = g_new(CPUBreakpoint, 1);
 
     bp->pc = pc;
     bp->flags = flags;
@@ -1975,7 +1975,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    new_block = g_malloc0(sizeof(*new_block));
+    new_block = g_new0(RAMBlock, 1);
     new_block->mr = mr;
     new_block->used_length = size;
     new_block->max_length = size;
@@ -2036,7 +2036,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
 
     size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
-    new_block = g_malloc0(sizeof(*new_block));
+    new_block = g_new0(RAMBlock, 1);
     new_block->mr = mr;
     new_block->resized = resized;
     new_block->used_length = size;
-- 
2.14.2


