Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAQ5z-0000aO-8T
	for mharc-qemu-trivial@gnu.org; Mon, 15 May 2017 20:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5w-0000Qm-EJ
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 20:12:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5v-0005oH-HO
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 20:12:08 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAQ5p-0005mg-GG; Mon, 15 May 2017 20:12:01 -0400
Received: by mail-qk0-x241.google.com with SMTP id o85so20179618qkh.0;
	Mon, 15 May 2017 17:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xse/+I8Sq0TY/YBBp3CJjaPeIuFl4v97plC9+Bj1nTM=;
	b=QS1jSmVkjVLCB6YO9/NgkndUFhxOZ1reXI2FZXjtQt6l/tNPvNlwIXSsri94fZVzfv
	n1tiqMgVTCHzr3Sx3Nkuy35qh2NQoecO9fPsXLQLjpK0NmZstWMtedNuq+w+iep7I7ZA
	j1QK1Invb2gQBcy/gfU6gEWyFwBU9WGV+87qdsWzLWFjArCgnmZY4OiR9XVaTLM8BCAx
	FEh54fsbSOPvMMkgrrbOPMiOdwownO5t7UNPoLEaimQN7Wq2eBsiswpq7ihLoUPzNGsW
	DiNE5bI7J15YNZ/lB44j8Dev08laWh3XsBNko2xXSlRMc+KKLksyZlYAuwn4MUhBTlfW
	Qk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Xse/+I8Sq0TY/YBBp3CJjaPeIuFl4v97plC9+Bj1nTM=;
	b=K5G8llo/FKJn3hKUGR5p+ABHaTFqk8VrRqHIb4/3pfQ9CYys86VsGcsTFQ2X1LQBIZ
	J4jCjfr6R/+IoUa4WU5/hOogG+qZYhFlLfJSTQf8S7PJlpqkvHlWCMK7AGNn9rDCmFpa
	LbV80OYjOk6Rj58FVPYLQNSxlstnpUp/Kemou/8W0A1uuGL1i4rmBh7qXAWbOSSP6EnL
	cklZRdwr79Ij4dUBePLSkhRiLOf8nHEQrx2VBnxC/3EoEfwJv7YGfTTJbTmXxClNPo6Q
	phWzsJOiIIs+JJ9tFam6yCeey+xR/LeZcoZ9NUJ0+3k4qk1km4bIBAA/dHWKd6oKk4jP
	ZYjg==
X-Gm-Message-State: AODbwcCpN881WZNQ8XZ3F7onUapBbnjgoAvnjK9RDCvg47hC+mqTZ49b
	RIgyGSbPZgd7Lw==
X-Received: by 10.55.98.71 with SMTP id w68mr7283559qkb.124.1494893520939;
	Mon, 15 May 2017 17:12:00 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s21sm9424522qtc.58.2017.05.15.17.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 17:12:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Lieven <pl@kamp.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 15 May 2017 21:11:49 -0300
Message-Id: <20170516001150.11508-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH] oslib: strip trailing '\n' from error_setg()
 string argument
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
X-List-Received-Date: Tue, 16 May 2017 00:12:09 -0000

spotted by Coccinelle script scripts/coccinelle/err-bad-newline.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/oslib-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 4d9189e9ef..7ca02f0103 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -447,7 +447,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     /* touch pages simultaneously */
     if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
         error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
-            "pages available to allocate guest RAM\n");
+            "pages available to allocate guest RAM");
     }
 
     ret = sigaction(SIGBUS, &oldact, NULL);
-- 
2.11.0


