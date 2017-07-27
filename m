Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYln-0005qB-NM
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYll-0005nt-GX
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlk-0008CE-Ht
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:21 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYli-0008B9-BB; Wed, 26 Jul 2017 22:43:18 -0400
Received: by mail-qt0-x241.google.com with SMTP id d10so7551975qtb.4;
	Wed, 26 Jul 2017 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aboSAXbLM3RFrT0NbLrX1Bi6xcmP5uJ8po8xpKKm3oU=;
	b=ftr6cSvT6TjI4v5Tlmw+RXp2QUxQXYPTzkRu6I9qo2TLk7laL1rupZZLmiRzx0IbiA
	tso4XeqvLABi6vefG+/Lo/TtMqIQEIBxmXukl/DXhbtyWbBrZI3i4pDUdz+05lK4J62g
	/C/2utR++YCy1Bg6SBqn7UWBmFW4X3ckxrC9tG9cgUfe3cPykjhAW2X2ZjgVsEsOcDNK
	5UVKUTUrc8aBlHb5aPyAfJ9yfHvD+mO1ijQbYF2oblJiYGRrCu8HeYBdpD9Kho5LFVSp
	w1CHMFRtXde1UxvWfFbkW1x90m21JaP3YJ0SQ6OKhfrANt40Scg6W81alNrXJsBfCfKP
	A52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=aboSAXbLM3RFrT0NbLrX1Bi6xcmP5uJ8po8xpKKm3oU=;
	b=Nj4IpeOX+sLY3IvB3fCYT7y3wmdc8BezF/k01cmWH9+53EbNHVDjLH67oTklpYrx0H
	Ra2wfjatXxl4enb7MLrkNb4GGw6leBqPcPUs9EfEigIcHAD6ue1pLYO2NR9PR14x3yNr
	t2XqRvByYFDHizv96gB1av7tRSxN0GJUTkX+RbIF41RDBFA08WaDFneVxztQBLJpa8wA
	WOkyT5RbMN/xg4wEnHhQFOs8pwI0LdD/QMHgkFJgKD/NUTdQujt9bLndrMnebLQ8sJ16
	fPXi3ItmaurwpyPy3XMmJhkivaL8SIQ4i8fbIGRqYXNVZIzMGyF/95Ipe2QpzcoL9hfM
	GanQ==
X-Gm-Message-State: AIVw111hmZfOyhSX3dgRWT9WifX3TN4ZQaYRz0o7zZGsFROVfG1AFyGk
	h3y0cTQolIwKOQ==
X-Received: by 10.200.3.135 with SMTP id t7mr3932309qtg.216.1501123397839;
	Wed, 26 Jul 2017 19:43:17 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:19 -0300
Message-Id: <20170727024224.22900-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 v2 14/20] syscall: check inotify()
 and eventfd() return value
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:22 -0000

linux-user/syscall.c:555:25: warning: Out of bound memory access (accessed memory precedes memory block)
    target_fd_trans[fd] = trans;
    ~~~~~~~~~~~~~~~~~~~~^~~~~~~

Reported-by: Clang Static Analyzer
Suggested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 81f52f7483..dfc1301e63 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11742,7 +11742,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)
     case TARGET_NR_inotify_init:
         ret = get_errno(sys_inotify_init());
-        fd_trans_register(ret, &target_inotify_trans);
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_inotify_trans);
+        }
         break;
 #endif
 #ifdef CONFIG_INOTIFY1
@@ -11750,7 +11752,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_inotify_init1:
         ret = get_errno(sys_inotify_init1(target_to_host_bitmask(arg1,
                                           fcntl_flags_tbl)));
-        fd_trans_register(ret, &target_inotify_trans);
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_inotify_trans);
+        }
         break;
 #endif
 #endif
@@ -11916,7 +11920,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_eventfd)
     case TARGET_NR_eventfd:
         ret = get_errno(eventfd(arg1, 0));
-        fd_trans_register(ret, &target_eventfd_trans);
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_eventfd_trans);
+        }
         break;
 #endif
 #if defined(TARGET_NR_eventfd2)
@@ -11930,7 +11936,9 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
             host_flags |= O_CLOEXEC;
         }
         ret = get_errno(eventfd(arg1, host_flags));
-        fd_trans_register(ret, &target_eventfd_trans);
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_eventfd_trans);
+        }
         break;
     }
 #endif
-- 
2.13.3


