Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRx-0001oL-HO
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRv-0001mO-It
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRu-0007YQ-Ng
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:35 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRo-0007Ui-Ux; Fri, 06 Oct 2017 19:54:29 -0400
Received: by mail-qk0-x244.google.com with SMTP id a12so10183880qka.4;
	Fri, 06 Oct 2017 16:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6SrTUgrcPIWvRxuO+094cSdZdcC2kM6yMdPdbvsNfaw=;
	b=S5xDx76iVknmD1CBu6ta7BFcNkEq+o0IsZ0GMLR4/LC5HQiFHi29PerhMpOL8YYrqJ
	TAxbrqkCYGRA2TSFgL1HbOKpLdrc/s8c0qwzWU0O4U4BCzQobRUo0JszktZDjWFSJoDr
	t1XiobS/sMlTjxheL9NhGUekjhbWCqm1sHqhq1VkcfzacpeXhjOfkXlj6mR1KyNqyE7j
	IDBy63n5zaJ/W9be2O6/4FEUQe5N6bkqEG+9McgoQtXEc/UDNpErtAw1yNQwl5ANE2Z7
	H9gMwhcJPiBhbr+xIpCWg0LC8nIlElrjq3/72LUR+QSnAERPVM0p48B0FKFjB038PboS
	xm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6SrTUgrcPIWvRxuO+094cSdZdcC2kM6yMdPdbvsNfaw=;
	b=lF6093HOWr7aCRk6X/N53HI2lGyZsSegc3NpTH6odvi0OivhAYtodJXJuKj4HVeJff
	Nm0CprM96NXFurdPtpFj47SPtTHv9K9cNjjOL5vfHOsNEPclfp50Vuf+6PB1aVhECzWe
	euVdzlBPLCPHh9QYq6xii80O/aUDmiKkbacUNuXcfiuCKQRrucvKcz8rUlYafHeZ0CTe
	7d2E4hKrUpOkNcjqPwWN0IMWA4bShqbFgYFy/PrWo3PygrpHO9hgbKKqvUdPh5nNG3UD
	L8NYBjRoMO1GbB+zjlMjrCe8lyOS9HplnMQtChqRKhxfZEyMhQip2/CA5SuEnqDXpqMp
	POhQ==
X-Gm-Message-State: AMCzsaUMoQm5mqc93vmdPKiC17/sC3/mrdnsObSRX7uarT4f3Dh5/5ma
	OuNP6Nhf8GaX3pQg7tSN5BA=
X-Google-Smtp-Source: AOwi7QBGqdeHt81aSeqWV5ZhKxhi2hPBAvH9HCVv3GXGWcfxXAmuZ7zHCJjd8zTfckKwG1Q71TP4hw==
X-Received: by 10.55.95.1 with SMTP id t1mr662489qkb.254.1507334068439;
	Fri, 06 Oct 2017 16:54:28 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:02 -0300
Message-Id: <20171006235023.11952-68-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 67/88] util/coroutine: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:36 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/coroutine-sigaltstack.c | 2 +-
 util/coroutine-ucontext.c    | 2 +-
 util/coroutine-win32.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index f6fc49a0e5..4fe4bbf1b5 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -163,7 +163,7 @@ Coroutine *qemu_coroutine_new(void)
      * sigaltstack way of manipulating stacks.
      */
 
-    co = g_malloc0(sizeof(*co));
+    co = g_new0(CoroutineSigAltStack, 1);
     co->stack_size = COROUTINE_STACK_SIZE;
     co->stack = qemu_alloc_stack(&co->stack_size);
     co->base.entry_arg = &old_env; /* stash away our jmp_buf */
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 6621f3f692..c14dca19b4 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -100,7 +100,7 @@ Coroutine *qemu_coroutine_new(void)
         abort();
     }
 
-    co = g_malloc0(sizeof(*co));
+    co = g_new0(CoroutineUContext, 1);
     co->stack_size = COROUTINE_STACK_SIZE;
     co->stack = qemu_alloc_stack(&co->stack_size);
     co->base.entry_arg = &old_env; /* stash away our jmp_buf */
diff --git a/util/coroutine-win32.c b/util/coroutine-win32.c
index de6bd4fd3e..6762ff83c2 100644
--- a/util/coroutine-win32.c
+++ b/util/coroutine-win32.c
@@ -74,7 +74,7 @@ Coroutine *qemu_coroutine_new(void)
     const size_t stack_size = COROUTINE_STACK_SIZE;
     CoroutineWin32 *co;
 
-    co = g_malloc0(sizeof(*co));
+    co = g_new0(CoroutineWin32, 1);
     co->fiber = CreateFiber(stack_size, coroutine_trampoline, &co->base);
     return &co->base;
 }
-- 
2.14.2


