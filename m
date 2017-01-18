Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTlE3-0004U8-2o
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 03:04:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTlE1-0004Sc-A2
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 03:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTlE0-0004me-HT
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 03:04:09 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:33202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTlDu-0004hv-TC; Wed, 18 Jan 2017 03:04:03 -0500
Received: by mail-pg0-x243.google.com with SMTP id 194so765718pgd.0;
	Wed, 18 Jan 2017 00:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=l9UEjunqRv+Xks8NVNvCTnXlOSm5XzYwoj+Uv39edUE=;
	b=LmhJ8Str8KvL+NFEMdTKUKGrtrUneJhzew8Xzwk3GnKNaGlPARLMUPZ6xkhrLA6v0v
	B7CFaB4SNzwVdsXTiEJms4lFOQ+ysX3h7pEx6LeGOgr89zp2FvvLrw4noD9eBW9HY7f0
	IXz3G3ZoI6RSKTali7h8xdn0X2DlTOXNfmYrxLhHec2kqjIhRnxR+AgVgpFA7D479EpV
	KIV3isaR5nBUiCIJp5SuPTBvbOtMTUlHAoPZDDvTGRiZ2XwrtluZIjZDqq8F+yoWwNEb
	MVhcuBgEjh+CQ3u+uHYPnYPsNhL4uGD3nRnR/ReCMcscqkOYqrxM1m710jJf4xDas08f
	OR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l9UEjunqRv+Xks8NVNvCTnXlOSm5XzYwoj+Uv39edUE=;
	b=ShitJ0rP2xXvzJXH3n8ON3Y/uMUazsWNQ9raUyuKIBTJ9gs5jf4HDFdJpivwLJ56je
	132pbXu7rog3wkGiJIdwVIivATOyQ0NfeRNSaX0BI2+ZqRDvsVyIDRVRoQDqz5Hgwuir
	4VJqBMN5F/UJyQlFC/sTycf5HxTExr/qD78i7NlvSBcwLslqcNkXFBo98uVuCsxjR+mn
	9QHxz2LofCoHC+9wvTkmVINyg5qU49G1KlvajPpMXw7wyczW+MRePPPkzEOvCJ6dI4xh
	+rPWkpnyPoNO9yNoNMN4/3ljeyJBTjWYBg4K2SdpW40qGvN/ihNQoQ9oacoGyZL50XkQ
	NhZQ==
X-Gm-Message-State: AIkVDXJQ9E14nyhEhUcG1WeD3P44qMJaqU6cQeUXmLoaTiR3JWy2Ca+6IB1yu2ssGsTEMA==
X-Received: by 10.84.178.7 with SMTP id y7mr3163973plb.60.1484726641999;
	Wed, 18 Jan 2017 00:04:01 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189]) by smtp.gmail.com with ESMTPSA id
	r74sm25175919pfb.67.2017.01.18.00.03.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jan 2017 00:04:00 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 16:03:29 +0800
Message-Id: <1484726609-16537-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-trivial] [PATCH v5 2/2] gdbstub.c: update old error report
 statements
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
X-List-Received-Date: Wed, 18 Jan 2017 08:04:10 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

Some updates from fprintf(stderr, ...) to error_report.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 gdbstub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 426d55e..959f6dc 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -637,8 +637,8 @@ void gdb_register_coprocessor(CPUState *cpu,
     *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
-            fprintf(stderr, "Error: Bad gdb register numbering for '%s'\n"
-                    "Expected %d got %d\n", xml, g_pos, s->base_reg);
+            error_report("Error: Bad gdb register numbering for '%s', "
+                         "expected %d got %d", xml, g_pos, s->base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
@@ -890,7 +890,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         }
     case 'k':
         /* Kill the target */
-        fprintf(stderr, "\nQEMU: Terminated via GDBstub\n");
+        error_report("QEMU: Terminated via GDBstub");
         exit(0);
     case 'D':
         /* Detach packet */
@@ -1358,8 +1358,8 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va)
                 break;
             default:
             bad_format:
-                fprintf(stderr, "gdbstub: Bad syscall format string '%s'\n",
-                        fmt - 1);
+                error_report("gdbstub: Bad syscall format string '%s'",
+                             fmt - 1);
                 break;
             }
         } else {
--
2.7.4


