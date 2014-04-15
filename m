Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaDFD-0005Nh-5F
	for mharc-qemu-trivial@gnu.org; Tue, 15 Apr 2014 19:58:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDF2-0005Ak-Q0
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WaDEt-0006cv-L9
	for qemu-trivial@nongnu.org; Tue, 15 Apr 2014 19:58:16 -0400
Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231]:33628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WaDEb-0006Za-CW; Tue, 15 Apr 2014 19:57:49 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so9905642pdj.8
	for <multiple recipients>; Tue, 15 Apr 2014 16:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aIxD6mj3wbf4Pui+gxN/RXKa0fj0BTZ6IMCwydA2Rp4=;
	b=OryDR1exT5bx8CXtKiiMMG0sUj6Mmi+p9youcyQONn3+x69eLkcDDC5F5Q6Gcmamf4
	d7orfKJ9nDOz0bxwa+5wAPrdoe1INkNDYFQUmQgIYdD5N0vNpM12OBf/vdUXxuK6YtJI
	4djXyWnO/ptrgFe3Ne4+Ae4zg5zz8vdm9l9qZU7dn9hGwwJBdcdl+9NjKKTPChSx+ctX
	F8zEKvmRgA3gkq0+9A+iUghkCY1YRJEg82RS6m+fwPZLVew1ngFr8rdu6fk+cOOlooYF
	QH18xSH0f+Rk9WvyNOgpauuHJ9i6mf9q8p8xYX2oxAb7F2qY6/5EkcN2F5M4fiJdNYj+
	c78g==
X-Received: by 10.68.136.226 with SMTP id qd2mr5123060pbb.72.1397606268209;
	Tue, 15 Apr 2014 16:57:48 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.238.172])
	by mx.google.com with ESMTPSA id gj9sm42903454pbc.7.2014.04.15.16.57.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Apr 2014 16:57:47 -0700 (PDT)
Message-ID: <534DC775.9000006@gmail.com>
Date: Wed, 16 Apr 2014 07:57:41 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Anthony Liguori <aliguori@amazon.com>
References: <534DC6EA.6050203@gmail.com>
In-Reply-To: <534DC6EA.6050203@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH trivial v2 2/2] vl: Eliminate a superfluous
	local variable
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
X-List-Received-Date: Tue, 15 Apr 2014 23:58:25 -0000

CODING_STYLE frowns upon mixing declarations and statements.  main()
has such a declaration.  Clean up by eliminating the variable.

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

