Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQb-0000YE-4E
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQY-0000Vu-VM
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQY-0006Rt-7j
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:11 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:48142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQT-0006Ny-QK; Fri, 06 Oct 2017 19:53:05 -0400
Received: by mail-qt0-x244.google.com with SMTP id d13so33659726qta.5;
	Fri, 06 Oct 2017 16:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WWJSXR6oz9H0fjG+8qlk4h49zt78HYqwsPCvnQ6cPvo=;
	b=NpQ0wxXYI3iAswZHrp2V7QBMf8AmQIUQ//HEsqYAAnSa7AmAWYrksJX5IBffCNxCkx
	RAYRiihd1pfj4ShqyxsflR8JsO8ocBrTHKqH1YKFO//MxVVNMXzpt1NJN53RTgtD33Hc
	+7c5X7z4Xz/NtqKtKnerOgcuqh1SWt9LhF83UBRIWCO5hE/uTGEEc9nDmsJ3vQZxR9G2
	bPIgvgltq13OF10RjYpxGDOoN9Efk3bWtIptWrj1nGhIaNWBiaPS9GykoV/FLe8jMiGY
	wZGoYrAHiFbKBE5VxLhOwOrJNmsHm01FkH4Q0ogLsQb77qLnFiBrDIifX7iXoTbjmO8F
	akTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WWJSXR6oz9H0fjG+8qlk4h49zt78HYqwsPCvnQ6cPvo=;
	b=n4PHdvAr0Vzuihesik2k4tQ1P+9a6bB6++SmmOrztWxWeldOW411BZ6C7dFuCXJQzV
	SDGBVK40JP25G6/kS+3b/Dc36WQsmd7DhrycSTYSKRMu3C9SPqCAYzbJ1sPac4KJ7BIv
	aZrkkOSi3bSyiJrv0RPnO1oOZMV7T1Akex6meS2sl+pitcHVCNUvRLI7719vrDWziQz6
	WVxiTyU2ZtEHMyShO0fpH6W6RMlQaVo6pFsEHn+zivPpRWgPsOWS2coN6FHLOo1iN2QI
	zDFIAmshrYYep/TEKqBcxz19msGiHBU00xbFML1gUM0uIFZGVTYuVNcpd/GE/D2uR4nk
	rpog==
X-Gm-Message-State: AMCzsaVyTKrJ/2UKl6jNImZXSzy0PsGl+QVSjZb6KT8bC41eR4FDlui9
	Yj3+zSTfiReFYhzgTQ0teTI=
X-Google-Smtp-Source: AOwi7QBqutmFqWCHSgQoXr/AkO5zL6t4JfdP6QC90OH1PLS6eg4AwFTWJgBpexA2RvxD7J+6m9JQpQ==
X-Received: by 10.237.36.125 with SMTP id s58mr5559393qtc.24.1507333985284;
	Fri, 06 Oct 2017 16:53:05 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:39 -0300
Message-Id: <20171006235023.11952-45-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 44/88] hw/core/loader: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 4593061445..def4766dbb 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -899,7 +899,7 @@ int rom_add_file(const char *file, const char *fw_dir,
         return -1;
     }
 
-    rom = g_malloc0(sizeof(*rom));
+    rom = g_new0(Rom, 1);
     rom->name = g_strdup(file);
     rom->path = qemu_find_file(QEMU_FILE_TYPE_BIOS, rom->name);
     rom->as = as;
@@ -996,7 +996,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
     Rom *rom;
     MemoryRegion *mr = NULL;
 
-    rom           = g_malloc0(sizeof(*rom));
+    rom           = g_new0(Rom, 1);
     rom->name     = g_strdup(name);
     rom->as       = as;
     rom->addr     = addr;
@@ -1039,7 +1039,7 @@ int rom_add_elf_program(const char *name, void *data, size_t datasize,
 {
     Rom *rom;
 
-    rom           = g_malloc0(sizeof(*rom));
+    rom = g_new0(Rom, 1);
     rom->name     = g_strdup(name);
     rom->addr     = addr;
     rom->datasize = datasize;
-- 
2.14.2


