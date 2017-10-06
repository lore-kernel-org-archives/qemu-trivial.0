Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cP9-0007Yi-0e
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP6-0007VI-2n
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP5-0005D2-Ec
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:40 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP3-0005BQ-Df; Fri, 06 Oct 2017 19:51:37 -0400
Received: by mail-qk0-x241.google.com with SMTP id 17so5917540qkq.5;
	Fri, 06 Oct 2017 16:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ghZP7L4yP7uTN13RiHneifNe/t4pi72rDTbu8R7L+tk=;
	b=K+jukSIIqb36dgQPsgC5uze6ooJbH9/Y4tT3xaV2AkqWgzTtFSbHnejwzL8SmHHmpo
	ADWg+M7uBAy9MHuhe5CbFE6dkCHzPoj8vj5POtgfmxbRMkC19TIglrE5L2L53fpJXo6i
	5llrd8a7SCSUUfZP0cyBASg+LnmJ0yJ0FHupZYbblA5ZSt+YdJyXoa6AHBB62Lnd/B4s
	GkekQk4SjRgKnQwDif7C7dQOuhpx4sxPgrrql3pnojLGtjFQUIm6mhtwrek1xyjrNvFI
	eQuCQ1c1w4E2R+aOLMsHrgAkP0imKmBHHqAFYXuG4SQQiaT8zPPRrKRXKBLXyHxO+xqm
	8ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ghZP7L4yP7uTN13RiHneifNe/t4pi72rDTbu8R7L+tk=;
	b=SaASX1NmYt2+++NB8mh8f92UjAVgGfW8sHsFqD9JJz1EjML3Wsz+FOlN3eHSasaT47
	CwLXIo0IgHhMXAubqC7XVP4Qd1PKW1vz6U/defsUvnqBAqwhx+ziJnEkm+wDd/jpLMpV
	xhv0NPI1osC5Vt6kSeqJbhpnUc4rpU2+kSkXg1dNLGOngHZ8qE5x7PGFva/tYrhHrbXL
	Air5USSlgBNlnETiLh1x7v7mSjzJQNoZkx8Almk7hRyVG8pkOp2syjzM1Isy/zPEaytQ
	5wZf1MreDZy+FE+UjZ4xfn0sHLl5VUtfsx3UY840XGz+ZSrVuZNH7xyRlgRe3ACW4iwu
	uH0A==
X-Gm-Message-State: AMCzsaVvrTru3DjvTcBPTLKFw3lOR00LIdqZuZmpQcecgw66+VmzBsKW
	pUMZ3UCAiXXFj50qfo43k7o=
X-Google-Smtp-Source: AOwi7QCgY/0DVC4SVsgF7jvrFuGcrl8yXWbOjtsI41qm28a5MOdcjfty03Nr4ABbrJHUP6l183ngOA==
X-Received: by 10.55.207.11 with SMTP id e11mr701216qkj.89.1507333896890;
	Fri, 06 Oct 2017 16:51:36 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:13 -0300
Message-Id: <20171006235023.11952-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 18/88] memory: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:41 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
does this file belong to the Memory API subsystem in MAINTAINERS?

 memory_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory_mapping.c b/memory_mapping.c
index a5d38552a6..9c78b41363 100644
--- a/memory_mapping.c
+++ b/memory_mapping.c
@@ -43,7 +43,7 @@ static void create_new_memory_mapping(MemoryMappingList *list,
 {
     MemoryMapping *memory_mapping;
 
-    memory_mapping = g_malloc(sizeof(MemoryMapping));
+    memory_mapping = g_new(MemoryMapping, 1);
     memory_mapping->phys_addr = phys_addr;
     memory_mapping->virt_addr = virt_addr;
     memory_mapping->length = length;
-- 
2.14.2


