Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLkQ-0003IQ-NV
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:12:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkM-0003Er-Cm
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkL-0004K7-GC
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:38 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkL-0004Jy-C8; Tue, 18 Jul 2017 02:12:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id p25so239275qtp.2;
	Mon, 17 Jul 2017 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sSvS5o/TuNncdarissGPM02fcrMCl/9iJibg/MYUZ+o=;
	b=pedJUsNmvMN3uG9RhYIasX3vNvGtOSfaq3F1xgt+QgzJVI4AdOIexp5oVYyCd+yT0E
	xAlS7L6HiqhdbTp+H4P8edo/oTvlNJNG37d80kO5M74mNikkMjraow9Sxx6iVflP70Mu
	yCRHhLe39RkUamu6ZVNW4tzKLv2Debk9uLKbJfnqDr6rVkES7ZsbXVBA0JG56PMgNZXT
	urkJIjJgL9QANDQIpewOLML/BLdfIGRfZgxbct9Lrjk4tbU+i8P5ZZJL9tsYhV/t4/ML
	vuTa3C6+qsd0qvhMqlNNUd3jpJNs2L9rPdJbdViwFQFqN4OcEQcc2dn9E7KXPpqQiYbc
	RYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sSvS5o/TuNncdarissGPM02fcrMCl/9iJibg/MYUZ+o=;
	b=ABktoYk8cEOZmn++IJ3CwXYDhsQ6g4YnaunQItw+5tVUx3q8iatAPKgWQq7gClNfBU
	NvuGBAd+W06NXAkeOo9OiYagLCT5OAZgSvAstPwfzVo7sjhd0Y1f/ZtGlNSEXUELNdUe
	+PAfs4nUiEgKICELDA05GEPdpM9fDKE7cpeEpbl0b8lSdsf9NxDxr8CZI9wW/jZaKb+Z
	na+Ss08STJC4sNOjym7lB6dSIXfYQI7FnNGZ94ZI69TcfiWLlDux1qg9PeoHNm8P67fU
	m5WzSr3SOAD6ca7bOszNZpEUY6g3pLu5XPHps57DnAa8k4LywNVLCDkA+kaGcDi1s0Z7
	gWfA==
X-Gm-Message-State: AIVw1118htVN4NZCmHOrwMKzegmh+9KOA3GTIy2KDCAr+MW2uYiROj8g
	GWgWLGu7jwTXaADlXSKwWA==
X-Received: by 10.200.47.152 with SMTP id l24mr4921qta.153.1500358356846;
	Mon, 17 Jul 2017 23:12:36 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:12:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:38 -0300
Message-Id: <20170718061005.29518-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 02/29] pci: remove superfluous parenthesis
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
X-List-Received-Date: Tue, 18 Jul 2017 06:12:39 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pci-testdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 7d5990213e..b928ce7e84 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -63,8 +63,8 @@ static const char *iotest_type[] = {
 
 #define IOTEST_TEST(i) (iotest_test[((i) % ARRAY_SIZE(iotest_test))])
 #define IOTEST_TYPE(i) (iotest_type[((i) / ARRAY_SIZE(iotest_test))])
-#define IOTEST_MAX_TEST (ARRAY_SIZE(iotest_test))
-#define IOTEST_MAX_TYPE (ARRAY_SIZE(iotest_type))
+#define IOTEST_MAX_TEST ARRAY_SIZE(iotest_test)
+#define IOTEST_MAX_TYPE ARRAY_SIZE(iotest_type)
 #define IOTEST_MAX (IOTEST_MAX_TEST * IOTEST_MAX_TYPE)
 
 enum {
-- 
2.13.2


