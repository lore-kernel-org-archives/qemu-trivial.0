Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXUmT-0000MV-2l
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 08:05:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUmG-0008Sv-UN
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WXUm7-0004sr-Tr
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 08:05:20 -0400
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230]:50394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WXUm7-0004sT-NU; Tue, 08 Apr 2014 08:05:11 -0400
Received: by mail-pb0-f48.google.com with SMTP id md12so937753pbc.35
	for <multiple recipients>; Tue, 08 Apr 2014 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HuYuKbNwwzHBg70l/241FyA6+0zN1qaTKzTqBWRBASc=;
	b=EypmrFN5T7GI+lRtpAVTKtICxQXjzWMzWg+N5vM/jZBmIujfokEK/QC6xQDks3XwR2
	56DsN0xVYDBgvYkUkel5K7nP6owL4aBsBnjWPJug+J+r8lyzgok6sg+YzsQ0xayIf2wT
	Rkh1rJIQQ7OEO/4Fi75QxNOn7PSFKq4IwmqxtV9c2RjjihIzFx1Ec6p/tCjLrxPDsQ90
	eQ2YaYP2qt+YBz9flfzEFHgSDXypIXWJVHbgEPw/DFzEdLE/iSDlcDcq8PZJBQOTYB7i
	RyZWD+Oke0pmgBwArJzeWM3tz2ADe9GEYniVJIwtLDw+q+KqNlN7IlPiPPk2bf0czYKn
	annQ==
X-Received: by 10.68.100.1 with SMTP id eu1mr4218583pbb.36.1396958710861;
	Tue, 08 Apr 2014 05:05:10 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.227.121])
	by mx.google.com with ESMTPSA id i10sm9413459pat.36.2014.04.08.05.05.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 05:05:09 -0700 (PDT)
Message-ID: <5343E5ED.2040906@gmail.com>
Date: Tue, 08 Apr 2014 20:05:01 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com> <5343E571.60407@gmail.com>
In-Reply-To: <5343E571.60407@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial 3/3] vl: remove local variable 'args'
 in the middle of code block
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
X-List-Received-Date: Tue, 08 Apr 2014 12:05:31 -0000

For C code, it does not recommend to define a local variable in the
middle of code block without "{...}". The original author may want to
zero members not mentioned in structure assignment.

So recommend to use structure initializing block "{...}" for structure
assignment in the middle of code block.

And at present, we can assume that all related gcc versions will be
latest enough to notice about this grammar.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 vl.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/vl.c b/vl.c
index 377f962..d381443 100644
--- a/vl.c
+++ b/vl.c
@@ -4368,15 +4368,15 @@ int main(int argc, char **argv, char **envp)
 
     qdev_machine_init();
 
-    QEMUMachineInitArgs args = { .machine = machine,
-                                 .ram_size = ram_size,
-                                 .boot_order = boot_order,
-                                 .kernel_filename = kernel_filename,
-                                 .kernel_cmdline = kernel_cmdline,
-                                 .initrd_filename = initrd_filename,
-                                 .cpu_model = cpu_model };
-
-    current_machine->init_args = args;
+    current_machine->init_args = (QEMUMachineInitArgs) {
+        .machine = machine,
+        .ram_size = ram_size,
+        .boot_order = boot_order,
+        .kernel_filename = kernel_filename,
+        .kernel_cmdline = kernel_cmdline,
+        .initrd_filename = initrd_filename,
+        .cpu_model = cpu_model };
+
     machine->init(&current_machine->init_args);
 
     audio_init();
-- 
1.7.9.5

