Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xn6My-0007uX-FT
	for mharc-qemu-trivial@gnu.org; Sat, 08 Nov 2014 08:48:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <willem_qemu@lekkertech.net>) id 1Xmxyj-00077j-01
	for qemu-trivial@nongnu.org; Fri, 07 Nov 2014 23:50:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <willem_qemu@lekkertech.net>) id 1Xmxyd-00042e-QI
	for qemu-trivial@nongnu.org; Fri, 07 Nov 2014 23:50:24 -0500
Received: from mail-wg0-f50.google.com ([74.125.82.50]:64930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <willem_qemu@lekkertech.net>) id 1Xmxyd-00040t-Kx
	for qemu-trivial@nongnu.org; Fri, 07 Nov 2014 23:50:19 -0500
Received: by mail-wg0-f50.google.com with SMTP id z12so5046458wgg.9
	for <qemu-trivial@nongnu.org>; Fri, 07 Nov 2014 20:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=xfo7y+8EeTuguKMMeLUm2Z5a2Siq4/q9vRP9pRibIuw=;
	b=R7qkmiHyslC8ROFPZRM0l66uSCrE3USkir8RnEoBvtsvuPmHXda7hK38Bv0vxYtiUb
	T98CupRjpmnH18aiFv9NNTM3xbg/PXxDYEnJnoKEphg6X/Hb3+7eTrV3H5mqUzEt5Fd/
	XaPzjKDZy1Aqr9fyRhXui9znbQ60HgHZj3DCdH88t1g/7AH/GsJV6gKyaw4ceM+C9P7m
	Kc9wBoG4+cJoXgTMQTfkbzGm6WuBrTgf1GytEHdOgeuz+8bs5Sxq1zTLtmviVrOFl2qz
	nyJCXf+KIwKlFIP+BDFBTqT2P+q6Jw62/cThckTtVHenudMzGdzft4ymCcfeUVsIKhAF
	qXaA==
X-Gm-Message-State: ALoCoQmG7TWImh9kQzGgoY1EAGeORwWjNmXb91g10cLSWm1SFY03b/5Z4Sh9YPAyxHkLwTbM3K/w
X-Received: by 10.180.103.226 with SMTP id fz2mr6735366wib.4.1415422216961;
	Fri, 07 Nov 2014 20:50:16 -0800 (PST)
Received: from [127.0.0.1] (xs8.xs4all.nl. [2001:888:0:1::888])
	by mx.google.com with ESMTPSA id s8sm14178360wjx.9.2014.11.07.20.50.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 20:50:16 -0800 (PST)
Message-ID: <545D935F.3070300@lekkertech.net>
Date: Fri, 07 Nov 2014 19:51:59 -0800
From: Willem Pinckaers <willem_qemu@lekkertech.net>
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.50
X-Mailman-Approved-At: Sat, 08 Nov 2014 08:47:58 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] coroutine-sigaltstack: Change jmp_buf to
	sigjmp_buf
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
X-List-Received-Date: Sat, 08 Nov 2014 04:50:30 -0000


This is a simple patch to change the type of old_env from jmp_buf
to sigjmp_buf.  old_env is used by sigsetjmp and as such should be
a sigjmp_buf.

This fixes a stack_chk fail in a OSX 32bit build. Since at least on
OSX sigjmp_buf is four bytes larger then a jmpbuf, resulting in an
overflow in sigsetjmp. Due to variable reordering this overwrites
the stack cookie.

Signed-off-by: Willem Pinckaers <willem_qemu@lekkertech.net>
---
 coroutine-sigaltstack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/coroutine-sigaltstack.c b/coroutine-sigaltstack.c
index 3de0bb3..63519ff 100644
--- a/coroutine-sigaltstack.c
+++ b/coroutine-sigaltstack.c
@@ -155,7 +155,7 @@ Coroutine *qemu_coroutine_new(void)
     stack_t oss;
     sigset_t sigs;
     sigset_t osigs;
-    jmp_buf old_env;
+    sigjmp_buf old_env;

     /* The way to manipulate stack is with the sigaltstack function. We
      * prepare a stack, with it delivering a signal to ourselves and then
-- 
1.9.3 (Apple Git-50)


