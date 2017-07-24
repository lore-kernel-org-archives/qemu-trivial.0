Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6y-0001Kh-Fp
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6v-0001HY-L7
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6u-0005sC-Pj
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:41 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36307)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6q-0005m6-LB; Mon, 24 Jul 2017 14:29:36 -0400
Received: by mail-qt0-x241.google.com with SMTP id l55so12887240qtl.3;
	Mon, 24 Jul 2017 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qnbYYX+IG7GzYSOGIFhdBZxjwL/rUovFZSD0NbwCE1A=;
	b=JDyMQrqPvHDomUfbjjEd7QsYfpBQ4yNcl4AZiyOUnk9pQkc/JguXeKdNjw0WNmq9h5
	T6P/ywoF96dL+P0l/6+INQ/rlxtwTXOqyYI3442G6j6t/lRSDll3caf7dswFGWmHRP13
	EMQkqWJwgYbGs9IQ+W4LmvkjEF4zDVsc3kSbJIhtavo2Zre65Pcq6I9RZcoA3UaWioiV
	XoAUrz323EPIayJWH6pmX53f38f1w61K7T5x0bJxrSizH0ygS/THUJwdWkGXiibRTwVg
	ZV89QP7DpwBezmf4uQ3c4l/bdy8NwA5lmOYRsFPee9w8CfY5mcRTTEvpxC/mcqVqXRsO
	Xh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qnbYYX+IG7GzYSOGIFhdBZxjwL/rUovFZSD0NbwCE1A=;
	b=Ll+oXSVKOCKWjthWNzh6woBDWikkOn+oKuBBICkc09GtIOwOi1WdwNkJQoiw1oKm2S
	l5p0wZ979IMMgL8qRLq1RY1sAKdGZ56zbokeT6bN34MMyXkxQgVFDoGm+wnedp9ZSxX2
	S/8ulpeKCD8qZcghngJ+jahgrWa5f1UORiR0tx/jywd3j26DuiRQkPSJRxPvTl4B71bH
	fpjxkaH8KBLdeUe4A+UKDd0UapHCBqhqhLMRrl4WJZK1wLyD+oHWfQyV6aTb2ZDx9jUN
	LZRWFwsXQSyt7f4CAp9aoJ6VUV70DyWR51yaLrhmouWcQupEmW9UNSauEOTJROC4w8H7
	n3TA==
X-Gm-Message-State: AIVw110JnxyVy8tNlC52691njwIM3RAUHWSMCE9BNzaJxd/JVY8C652F
	RkTyVh3Ui0B4YQ==
X-Received: by 10.200.46.19 with SMTP id r19mr4611467qta.24.1500920976193;
	Mon, 24 Jul 2017 11:29:36 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:46 -0300
Message-Id: <20170724182751.18261-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 30/35] syscall: fix use of
 uninitialized values
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:42 -0000

linux-user/syscall.c:1627:35: warning: 1st function call argument is an uninitialized value
        target_saddr->sa_family = tswap16(addr->sa_family);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
linux-user/syscall.c:1629:25: warning: The left operand of '==' is a garbage value
    if (addr->sa_family == AF_NETLINK && len >= sizeof(struct sockaddr_nl)) {
        ~~~~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 26450d235f..963b9c8f4b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1618,6 +1618,7 @@ static inline abi_long host_to_target_sockaddr(abi_ulong target_addr,
     if (len == 0) {
         return 0;
     }
+    assert(addr);
 
     target_saddr = lock_user(VERIFY_WRITE, target_addr, len, 0);
     if (!target_saddr)
-- 
2.13.3


