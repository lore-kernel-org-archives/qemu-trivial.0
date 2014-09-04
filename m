Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPY6T-0003dp-JP
	for mharc-qemu-trivial@gnu.org; Thu, 04 Sep 2014 10:33:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XPY6H-0003Pm-O3
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 10:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XPY68-0005GF-Mv
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 10:33:25 -0400
Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b]:51222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XPY5p-00059g-Gj; Thu, 04 Sep 2014 10:32:57 -0400
Received: by mail-pd0-f171.google.com with SMTP id y13so13683499pdi.16
	for <multiple recipients>; Thu, 04 Sep 2014 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=FmtxNKAlfPsfSL4USYS1gVwkqMZtpfITlYADgpERXSY=;
	b=eV+PgfWz6dQ0koRPcGx9oCtmBCTyzlJgioKn8isPdLbHQJfP061ttosWJ1obvsNVRv
	MOqglawH5C/QXiWWPEzpRUvYeDgxKjDvb7SSgZ1bPd1x882InJjO3CrVj7IptYEVbuT2
	QYqsw61CJ8U496qHqmuFDSPSo2tqOIfeaunck/+0Oe02tRxt7U1cQydmkSn1Y1NDrlHd
	ghjqF3H27u7qJQHzDC1dQ4OvVBZqYy1kPVoJ2AXhu8MyXZ9Cz7/3a0H67qeOUbS+VAZJ
	gF0yXvdwp9DiRZhDWZ94BEhujX2cVvxGfhFpP9YuAnB9V6iwoWfxbcOownCjDaA1AKCr
	5ZHw==
X-Received: by 10.66.246.109 with SMTP id xv13mr9111491pac.144.1409841173569; 
	Thu, 04 Sep 2014 07:32:53 -0700 (PDT)
Received: from [192.168.1.103] ([223.72.65.17])
	by mx.google.com with ESMTPSA id b9sm1831853pbu.91.2014.09.04.07.32.50
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 04 Sep 2014 07:32:52 -0700 (PDT)
Message-ID: <5408780E.70607@gmail.com>
Date: Thu, 04 Sep 2014 22:32:46 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: stefano.stabellini@eu.citrix.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22b
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] xen-hvm.c: Always return -1 when failure
	occurs in xen_hvm_init()
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
X-List-Received-Date: Thu, 04 Sep 2014 14:33:35 -0000

When failure occurs, it need use "return -1" instead of exit(1), so can
let upper caller has chance to print failure information, too.

For simplify thinking, in xen_hvm_init(), also use '-1' instead of all
'-errno', since all related upper callers always exit(1) for failure.

It is not a normal function, it does not release related resources when
return -1, so need give related comments for it.


It passes common check:

  "./configure --enable-xen && make && make check"
  "echo $? == 0"


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 xen-hvm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen-hvm.c b/xen-hvm.c
index 0d09940..2c6285d 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -978,6 +978,7 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
     xc_set_hvm_param(xen_xc, xen_domid, HVM_PARAM_ACPI_S_STATE, 0);
 }
 
+/* return 0 means OK, or -1 means critical issue -- will exit(1) */
 int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
                  MemoryRegion **ram_memory)
 {
@@ -991,15 +992,13 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
     state->xce_handle = xen_xc_evtchn_open(NULL, 0);
     if (state->xce_handle == XC_HANDLER_INITIAL_VALUE) {
         perror("xen: event channel open");
-        g_free(state);
-        return -errno;
+        return -1;
     }
 
     state->xenstore = xs_daemon_open();
     if (state->xenstore == NULL) {
         perror("xen: xenstore open");
-        g_free(state);
-        return -errno;
+        return -1;
     }
 
     state->exit.notify = xen_exit_notifier;
@@ -1069,7 +1068,7 @@ int xen_hvm_init(ram_addr_t *below_4g_mem_size, ram_addr_t *above_4g_mem_size,
     /* Initialize backend core & drivers */
     if (xen_be_init() != 0) {
         fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION__);
-        exit(1);
+        return -1;
     }
     xen_be_register("console", &xen_console_ops);
     xen_be_register("vkbd", &xen_kbdmouse_ops);
-- 
1.9.3

