Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRc-0001Tr-6r
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRZ-0001Qr-Kz
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRW-0007Fq-Qt
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:13 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRT-0007Db-JY; Fri, 06 Oct 2017 19:54:07 -0400
Received: by mail-qk0-x244.google.com with SMTP id z14so12862051qkg.3;
	Fri, 06 Oct 2017 16:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dusgOxJe7/1VyXSe7SGQ7qXnNCPleel/uoLcXQUFiAw=;
	b=iS8SJk2yY0h8QpODa2Jy8DUbsnKL8VkltPmffgg/J7ZRNNc47jfTl2PQeyuC0ENDEn
	3XxejhY4JB+cDLdfVNT3cLHYCWPlcxqkWFQpXETXxjShKvPfKPpPaOmnE2gudAlRP3K6
	RvP3Tul+sYfkHGeFASGwG1HtQaEZpy9Y5ZXH6G7gks7DKQl+DURzLxdZydm51fYE8Skm
	Df2ZGGaAB4lbGwIFITH/AzO60HnB7HB7tS/KFOQ65sR54Xxi3vC/5VqeLRbPTb7rYzqa
	h1KqOBGXn+B3aaFPKZcuDOdCUYuNPm7+peCajSzj5kQfuX8Z8PezexQSBeqjXpqeeMHd
	aHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dusgOxJe7/1VyXSe7SGQ7qXnNCPleel/uoLcXQUFiAw=;
	b=mo1nhQQQY9cd2Lq/J7q4nvSLJaFWAlnuNAwrZdwCzNKVq/pk0sQfeWBIcLj9MOyfpo
	pYheLQVTSOZ1kMXA5ZussZhUTarz3KsgAIW6NvQ4bl1IKBTqHI+M2i4t0KoQExxgdzNe
	39tJFgN9c46GaTdtpN+hH4QM1Is3Sk4M9hLz36MCR6wlhPRDy9eEuH37GqMukq8KkqDR
	L5WveGkczKveMeZz2wNoi2+S+7wr/mgayynJDChZ3UzWfJnElO419QGI9SC8RypK2izG
	Uxz5EgLhDaywnnLikmAUC6x+/HpYYTgKN7ODByStKaWGvwhuMSY/mSw787fqcHGyPtfK
	ly+g==
X-Gm-Message-State: AMCzsaUbg5G3QqXUSBlkgVgoqf91mk9AOvzkYF7drJ2xlsrGTn2mHnwC
	uSf+ORMmFldf1Hos/w3Ou0A=
X-Google-Smtp-Source: AOwi7QDp8D0GHCJNxFnfkFNbywC+gTxp/XEO5/xT6wKRW3QdL4pLi7QY93SF6xuDGJHaWc58L+3Pjw==
X-Received: by 10.55.181.129 with SMTP id e123mr767495qkf.128.1507334047012;
	Fri, 06 Oct 2017 16:54:07 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:56 -0300
Message-Id: <20171006235023.11952-62-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 61/88] tests: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:15 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: split of some files in other commits of the same series, add libqtest.c]
---
 tests/ahci-test.c     | 4 ++--
 tests/fw_cfg-test.c   | 4 ++--
 tests/libqos/ahci.c   | 2 +-
 tests/libqos/libqos.c | 2 +-
 tests/libqos/malloc.c | 6 +++---
 tests/libqtest.c      | 2 +-
 tests/pc-cpu-test.c   | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index 999121bb7c..cb84edc8fb 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -155,7 +155,7 @@ static AHCIQState *ahci_vboot(const char *cli, va_list ap)
 {
     AHCIQState *s;
 
-    s = g_malloc0(sizeof(AHCIQState));
+    s = g_new0(AHCIQState, 1);
     s->parent = qtest_pc_vboot(cli, ap);
     alloc_set_flags(s->parent->alloc, ALLOC_LEAK_ASSERT);
 
@@ -1806,7 +1806,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
     char *name;
     AHCIIOTestOptions *opts;
 
-    opts = g_malloc(sizeof(AHCIIOTestOptions));
+    opts = g_new(AHCIIOTestOptions, 1);
     opts->length = len;
     opts->address_type = addr;
     opts->io_type = type;
diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 688342bed5..81f45bdfc8 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -79,8 +79,8 @@ static void test_fw_cfg_numa(void)
 
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_NUMA), ==, nb_nodes);
 
-    cpu_mask = g_malloc0(sizeof(uint64_t) * max_cpus);
-    node_mask = g_malloc0(sizeof(uint64_t) * nb_nodes);
+    cpu_mask = g_new0(uint64_t, max_cpus);
+    node_mask = g_new0(uint64_t, nb_nodes);
 
     qfw_cfg_read_data(fw_cfg, cpu_mask, sizeof(uint64_t) * max_cpus);
     qfw_cfg_read_data(fw_cfg, node_mask, sizeof(uint64_t) * nb_nodes);
diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
index 1ca7f456b5..13c0749582 100644
--- a/tests/libqos/ahci.c
+++ b/tests/libqos/ahci.c
@@ -843,7 +843,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     AHCICommand *cmd;
 
     g_assert(props);
-    cmd = g_malloc0(sizeof(AHCICommand));
+    cmd = g_new0(AHCICommand, 1);
     g_assert(!(props->dma && props->pio));
     g_assert(!(props->lba28 && props->lba48));
     g_assert(!(props->read && props->write));
diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index 6226546c28..991bc1aec2 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -17,7 +17,7 @@ QOSState *qtest_vboot(QOSOps *ops, const char *cmdline_fmt, va_list ap)
 {
     char *cmdline;
 
-    struct QOSState *qs = g_malloc(sizeof(QOSState));
+    struct QOSState *qs = g_new(QOSState, 1);
 
     cmdline = g_strdup_vprintf(cmdline_fmt, ap);
     qs->qts = qtest_start(cmdline);
diff --git a/tests/libqos/malloc.c b/tests/libqos/malloc.c
index b8eff5f495..ac05874b0a 100644
--- a/tests/libqos/malloc.c
+++ b/tests/libqos/malloc.c
@@ -129,7 +129,7 @@ static MemBlock *mlist_new(uint64_t addr, uint64_t size)
     if (!size) {
         return NULL;
     }
-    block = g_malloc0(sizeof(MemBlock));
+    block = g_new0(MemBlock, 1);
 
     block->addr = addr;
     block->size = size;
@@ -305,8 +305,8 @@ QGuestAllocator *alloc_init(uint64_t start, uint64_t end)
     s->start = start;
     s->end = end;
 
-    s->used = g_malloc(sizeof(MemList));
-    s->free = g_malloc(sizeof(MemList));
+    s->used = g_new(MemList, 1);
+    s->free = g_new(MemList, 1);
     QTAILQ_INIT(s->used);
     QTAILQ_INIT(s->free);
 
diff --git a/tests/libqtest.c b/tests/libqtest.c
index cbd709470b..adf71188b6 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -171,7 +171,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     gchar *command;
     const char *qemu_binary = qtest_qemu_binary();
 
-    s = g_malloc(sizeof(*s));
+    s = g_new(QTestState, 1);
 
     socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
     qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
diff --git a/tests/pc-cpu-test.c b/tests/pc-cpu-test.c
index c4211a4e85..11d3e810ef 100644
--- a/tests/pc-cpu-test.c
+++ b/tests/pc-cpu-test.c
@@ -87,7 +87,7 @@ static void add_pc_test_case(const char *mname)
     if (!g_str_has_prefix(mname, "pc-")) {
         return;
     }
-    data = g_malloc(sizeof(PCTestData));
+    data = g_new(PCTestData, 1);
     data->machine = g_strdup(mname);
     data->cpu_model = "Haswell"; /* 1.3+ theoretically */
     data->sockets = 1;
-- 
2.14.2


