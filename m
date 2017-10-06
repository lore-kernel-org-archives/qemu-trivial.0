Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSb-0002XI-6X
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSU-0002S0-9r
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSS-00088I-W2
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:10 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:56020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSQ-00086y-Q9; Fri, 06 Oct 2017 19:55:06 -0400
Received: by mail-qt0-x242.google.com with SMTP id x54so34282319qth.12;
	Fri, 06 Oct 2017 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mbPzHoE9CW3Im1xwfRsfkRXPgnRHAU2qMoJkZNG+VaE=;
	b=iIrTMF3cr9p0AqRIL+dD4PlqDIrP4UXEp4K/N+CVQt3/6j3qM5+jYD0gfTKCkFaHWt
	2bF60bMr4X/OQNwpXyIHKztmsK9V7jKiWgYolZP8ZiVFQC0NPR0WQ6U7lRZ5sL3pd8nl
	YIeH5LFzQg1TARN+ZucBlWlbqONC0K8ZJFhcR2nJjXqtKF3Dq9t5MMBRcwW5pkcL6cKD
	ihZvsy2VHFnLCZrXLxFAiFqewjfBDhU9CGBKrh4GcSex9WcdwEf1ba1yrDbGUK6NMchy
	eYKltori08OXLja24g+brJI+79XBrKxvgUhoY2UPWxQqSygNBaOkUPR92J/8QKKXrr1B
	/V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mbPzHoE9CW3Im1xwfRsfkRXPgnRHAU2qMoJkZNG+VaE=;
	b=t5n5kEgmJRkhroANtdJAZB7E4HYo2A/aWFTzAYLuqAHBHlAfxDi7VSQpJ7mcTXPL18
	kijaotG6vGe6veI3Vhz0yjfn9tGLbeapOOp+av36blM33sBR/pi5WPMM1u+h4vSdJla9
	TsUhHr1wsVNJhB9m8+nZngiNYREG+V17oRNZ8yhgAC2lCV13yqS2vJiM0lSNOB7okiej
	BXqK9vl04K3zNluvZ56g9Q75eIg7t/d9E1j/Qv+qY+gS8lMFosaKfgTuG1UTvcxFPxqt
	4T8jbtAJco/kffQU9aSFAZre2xNhHay3r14rNbYtrV4PZGJ5TEO77zDKbE8VvTf898l3
	08ig==
X-Gm-Message-State: AMCzsaWmR9zTtFbdjf7CKDymSB+QoXTbC8TLJAJta2M5f5Ucmyy0MQxN
	0jBbr0ZoGwK5hPr2+8p3IRCY83Ma4pQ=
X-Google-Smtp-Source: AOwi7QB5Op2pdeUSL/FdrqjkUANCpiSjQU7RAVrEIDNrzTBV+XZnFWRrHl5E8/8DqU2jz5kOAqnNKw==
X-Received: by 10.200.8.53 with SMTP id u50mr5641466qth.260.1507334106176;
	Fri, 06 Oct 2017 16:55:06 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:05 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:12 -0300
Message-Id: <20171006235023.11952-78-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 77/88] dump: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:15 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 dump.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/dump.c b/dump.c
index 7ebcf553b2..884221a904 100644
--- a/dump.c
+++ b/dump.c
@@ -1825,29 +1825,28 @@ void qmp_dump_guest_memory(bool paging, const char *file,
 DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
 {
     DumpGuestMemoryFormatList *item;
-    DumpGuestMemoryCapability *cap =
-                                  g_malloc0(sizeof(DumpGuestMemoryCapability));
+    DumpGuestMemoryCapability *cap = g_new0(DumpGuestMemoryCapability, 1);
 
     /* elf is always available */
-    item = g_malloc0(sizeof(DumpGuestMemoryFormatList));
+    item = g_new0(DumpGuestMemoryFormatList, 1);
     cap->formats = item;
     item->value = DUMP_GUEST_MEMORY_FORMAT_ELF;
 
     /* kdump-zlib is always available */
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
+    item->next = g_new0(DumpGuestMemoryFormatList, 1);
     item = item->next;
     item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_ZLIB;
 
     /* add new item if kdump-lzo is available */
 #ifdef CONFIG_LZO
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
+    item->next = g_new0(DumpGuestMemoryFormatList, 1);
     item = item->next;
     item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_LZO;
 #endif
 
     /* add new item if kdump-snappy is available */
 #ifdef CONFIG_SNAPPY
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
+    item->next = g_new0(DumpGuestMemoryFormatList, 1);
     item = item->next;
     item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY;
 #endif
-- 
2.14.2


