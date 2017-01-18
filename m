Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTgpN-0004li-Pq
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 22:22:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgpL-0004jl-5T
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:22:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgpK-0006Yq-9W
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:22:23 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTgpG-0006V6-1g; Tue, 17 Jan 2017 22:22:18 -0500
Received: by mail-pf0-x241.google.com with SMTP id 19so78256pfo.3;
	Tue, 17 Jan 2017 19:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mmw4fM7PXzN9aWc33A3BlRF4Vt102IoZlaw0L/kaFMU=;
	b=DWnHXTUaD48NqyOxMkrlwY721MJDno0dlWD57V+X4GZCdAptSMM/fCbhrvmS1JTa3y
	apn5UGzFOUDeiMtNTW4KunVKFzFcGvnomCMEkYyC1fcdevf+r5LKZhZlCMXPnuURcdAL
	ztDsdTVcVRwaNNqEKkj0/1eG5UdUy8oKv+1v+6WVmcojangcFcbEuN+clvpodxLJHtWO
	TDL7p6RN5/aZI+jQpZs/453J9v81dfcIgWUg4/MJ9OUUeaHYuxxlbQMm6aX1qBRkgfLM
	3vX6esd9wpW/o+/aG+v7ZOyEr6h6Pz9THvP+zN7mFrnEoauOK7AP8Mii8m2FkC9HT4It
	lbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mmw4fM7PXzN9aWc33A3BlRF4Vt102IoZlaw0L/kaFMU=;
	b=Pkm8n3BSqBzD7NyqrO8VDN6cP8rCFqvpIf/D13/vdB5Y4O3S5JXxCXOwHW1c94ylDL
	m7ekrhDcWS07+llw3FoZSP+sLe+Ul9a656keNgpTBuASfjpsbpRUNlEUD1xPz6Ia2K1u
	SM9Cjt1Ij2N3479JoRNtGnhw5Kav0I4H4pUKGwNsLL/on8EuXWO2Usm7nF1Us3ndSZXb
	YHO+TdokR852IU0z0QTiW1/6adQ7oEqlrym5HOR7OIoIBWjfyQNGqHjjkNmnd5x8y2hm
	3vLGkb0OSibxEx/Fm+E6vdgHYv0Qje2i81GEHGp2+F5h+4McSFX5ljzcy6jz2ItuhKVi
	uuJg==
X-Gm-Message-State: AIkVDXIpGPii1QtIzDxUa3plsf+KrvZ4m6TBpBEgvzhoQ3t2+nW87wXgQYUIuoT8SCr6gw==
X-Received: by 10.98.73.74 with SMTP id w71mr1288769pfa.52.1484709737112;
	Tue, 17 Jan 2017 19:22:17 -0800 (PST)
Received: from yzy-ge62-2qd.pku.edu.cn
	(v133-130-103-189.a02c.g.tyo1.static.cnode.io. [133.130.103.189])
	by smtp.gmail.com with ESMTPSA id
	n84sm58900507pfk.25.2017.01.17.19.22.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 19:22:16 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 11:22:02 +0800
Message-Id: <1484709722-3546-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial] [PATCH v4 2/2] gdbstub.c: update old error report
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
X-List-Received-Date: Wed, 18 Jan 2017 03:22:24 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

Some updates from fprintf(stderr, ...) to error_report.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 gdbstub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 426d55e..fe1d0f8 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -637,8 +637,8 @@ void gdb_register_coprocessor(CPUState *cpu,
     *p = s;
     if (g_pos) {
         if (g_pos != s->base_reg) {
-            fprintf(stderr, "Error: Bad gdb register numbering for '%s'\n"
-                    "Expected %d got %d\n", xml, g_pos, s->base_reg);
+            error_report("Error: Bad gdb register numbering for '%s', "
+                         "Expected %d got %d", xml, g_pos, s->base_reg);
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


