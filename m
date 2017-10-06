Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cRg-0001Yh-Lz
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:54:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRd-0001Us-0o
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRc-0007J0-Cr
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:54:17 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cRa-0007HV-FV; Fri, 06 Oct 2017 19:54:14 -0400
Received: by mail-qk0-x243.google.com with SMTP id b124so10273282qke.1;
	Fri, 06 Oct 2017 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+zuWrVpblRzWFsye7f7a+A4b0twr9QIqjpgKHzFWJOM=;
	b=DIdnjvtDhhfO/GA4ZiHsmauyQyYSFQSd50ndOTrLabz1WvFxOuCwR5DEZ2hlj5jZrC
	FKUAYqQoO7eUXXP0JpzxPNJa+y+ZXWBwyeM3vv5TefG9jPyQkwaT1aNj9QTjRyLu9o3S
	uDbDTL3bo01Z1mRDhrGRmFnV8DFsVRrKiX8lm8ZJUR3kL+lODngIhmG7+tQ9n51CXisu
	sKMDm7ZqHR1Oh4kSdtOUjh80WBIDROu+bJN3jG0CtBXpfVbLQ+y95hPgPpApKQst6lGR
	oovCdqeev8j4hLxzDCn+/whX7t8fshKi3tsuZGwF5eS5TD8+meOnArDb+1yPRxVfkgd4
	c1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+zuWrVpblRzWFsye7f7a+A4b0twr9QIqjpgKHzFWJOM=;
	b=mrC1WDQuHU89w7c9NmUu6nA4+Wz5X4RrPu+ZCUNLLFM3gmte9jkCK4+jlFQubjakPj
	9HeagGuuyfNQYnRHuisNtw7By9tewxoS29TOU+qa/5VSG6hdixBl3YbHCj1Nv4ai2NyU
	XbopiT4GlDpTrTf76Tahl2xoWSeDk2a09ZsdjO61GJ6ZY2V16xbLft1EtQUxl6D/1jXm
	OVTbkMEC2HcbdQ9F9JVh9z6g5UMzP9MbY1jPcNavFQep1kAAsHIgaZFZIJd911aiXu1h
	8ows4s9VEWLwVp3g3eM0Kb1bbBaxvoDQknn9XlevVex3M8bcA0uS/hlZj8cFHDN4GUOE
	0zXA==
X-Gm-Message-State: AMCzsaVH1B+ACA2sFb8xSgfz52ZjXxM5S36hchIGrISbFGtWG7D90/p/
	pKlBkj8qI5WoHxpsQ6IUJ3s=
X-Google-Smtp-Source: AOwi7QAPN2JUdyhR9QvLVH58v0PF2CDlPv4xGEwMXc9aPG3nQi6lIMuYT43ugmbpC/Iwr+XOuVBHEQ==
X-Received: by 10.55.56.14 with SMTP id f14mr740256qka.286.1507334053945;
	Fri, 06 Oct 2017 16:54:13 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	Kamil Rytarowski <kamil@netbsd.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:58 -0300
Message-Id: <20171006235023.11952-64-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 63/88] bsd-user/syscall: fix a memory leak on
 EFAULT, use g_new()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:54:18 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Kamil are you interested in maintaining bsd-user? :)
 
 bsd-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 66492aaf5d..9120cea61e 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -227,7 +227,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
     void *hnamep, *holdp, *hnewp = NULL;
     size_t holdlen;
     abi_ulong oldlen = 0;
-    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
+    int32_t *snamep, *p, *q, i;
     uint32_t kind = 0;
 
     if (oldlenp)
@@ -239,6 +239,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
     if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0)))
         return -TARGET_EFAULT;
     holdlen = oldlen;
+    snamep = g_new(int32_t, namelen);
     for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
        *q++ = tswap32(*p);
     oidfmt(snamep, namelen, NULL, &kind);
-- 
2.14.2


