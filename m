Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOD-0006lJ-Mo
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:50:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cO9-0006j0-4M
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cO7-0004fJ-UM
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:41 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cO4-0004e2-TY; Fri, 06 Oct 2017 19:50:36 -0400
Received: by mail-qk0-x244.google.com with SMTP id w63so11295169qkd.2;
	Fri, 06 Oct 2017 16:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i/vhrUBaARR/Mhy6khnw9WsMSCJbNAoI8AgQVF/EVpk=;
	b=i1TsrS65/hsywiFJv8cmSrW6St/IdNrApRlX+e24OWbAeoARGp0jpXw8p1MqRTrOA1
	3Bksb+dm+Bk2ne6CKXUk5B16jUVFfmeBhokTPpzmOMtk45ofXdRDZhF7E3cGt/x1kFqg
	NENUgLAb0bBnkNhwfuiblc4HD37Q4dpiDrII5X7KbAxLYdRxzg4FeMJ+MmX/i2zZZorl
	EOLmx9pasMV43ZV0sy9Vsul//P+8Awi9q1qxoKvh9MlwaXafyMOiF+qG+8bfiG/B4Sbs
	zOogz8H3jxPWLe2ToeQooLn3FpAWraLhItYm7PI+BLBHYNLo6BSR+A8FGNS8Xh7IkG5Z
	NjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=i/vhrUBaARR/Mhy6khnw9WsMSCJbNAoI8AgQVF/EVpk=;
	b=fqExgyuaUpmr+Ui2D9i9WTmAvULvho4OwOoU3V9CJlWHQJ93yYiDQefOOTT1EXhLIy
	LxJcaUi1tOFX0j9NmqifOpr3/mJSJv3oQVTFwNEExLcLwnLGqNwkm6tQO6etl2vFRlep
	MPKufCOKxrYC0/5WCVhHWvVo+L5kxRKvrthmwI7h/lv2jY3mWh7nUUw5HjPTMZj70/C6
	wZvD2bThzLHVJ/H+lKNzFxuiEgHc+c2q8pidbhQqDkyXHugwM/EG3r77DoXsXy2TE1l/
	AEX2x9YSOI3QcNpOS4enA0Dz5SdxYnI5dLgCslad3EPONdkOnlaIV13MGESAnMvp0Hw8
	MwIw==
X-Gm-Message-State: AMCzsaW2MYP1BULindZar0DC8gSIaSqM8eHXXs/eCRbUdNEh+LQ1M2KY
	VbaEvdCmPtbF7WJVexUCknQ=
X-Google-Smtp-Source: AOwi7QB/ZPKbCsUTS1NtP15Gj5C5IP6H6QG5buOlbgB/+EGSRHDZfytfgwJ8o1r7UNWkg009GhcMrg==
X-Received: by 10.55.26.138 with SMTP id l10mr727791qkh.71.1507333836317;
	Fri, 06 Oct 2017 16:50:36 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:48:56 -0300
Message-Id: <20171006235023.11952-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 01/88] cocci: script to use g_new() & friends
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
X-List-Received-Date: Fri, 06 Oct 2017 23:50:42 -0000

Imported from Markus Armbruster commit b45c03f

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Signed-off-by: Markus Armbruster <armbru@redhat.com>?

 scripts/coccinelle/g_new.cocci | 101 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 scripts/coccinelle/g_new.cocci

diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
new file mode 100644
index 0000000000..1e57685a6b
--- /dev/null
+++ b/scripts/coccinelle/g_new.cocci
@@ -0,0 +1,101 @@
+/* transform g_new*() alloc with size arguments of the form sizeof(T) [* N]
+ *
+ *   g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
+ *   for two reasons.  One, it catches multiplication overflowing size_t.
+ *   two, it returns T * rather than void *, which lets the compiler catch
+ *   more type errors.
+ *
+ *    Copyright: (C) 2017 Markus Armbruster <armbru@redhat.com>. GPLv2+.
+ *    (Imported from b45c03f585ea9bb1af76c73e82195418c294919d)
+ *
+ * See http://lists.nongnu.org/archive/html/qemu-devel/2017-09/msg00908.html:
+ *
+ *   g_new() advantages (from glib doc):
+ *   - the returned pointer is cast to a pointer to the given type.
+ *   - care is taken to avoid overflow when calculating the size of the
+ *   allocated block.
+ *
+ *   p = g_malloc(sizeof(*p)) is idiomatic, and not obviously inferior to
+ *   p = g_new(T, 1), where T is the type of *p.
+ *   But once you add multiplication, g_new() adds something useful: overflow
+ *   protection.  Conversion to g_new() might make sense then.
+ */
+
+@@
+type T;
+@@
+-g_malloc(sizeof(T))
++g_new(T, 1)
+@@
+type T;
+@@
+-g_try_malloc(sizeof(T))
++g_try_new(T, 1)
+@@
+type T;
+@@
+-g_malloc0(sizeof(T))
++g_new0(T, 1)
+@@
+type T;
+@@
+-g_try_malloc0(sizeof(T))
++g_try_new0(T, 1)
+
+@@
+type T;
+expression n;
+@@
+-g_malloc(sizeof(T) * (n))
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc(sizeof(T) * (n))
++g_try_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_malloc0(sizeof(T) * (n))
++g_new0(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc0(sizeof(T) * (n))
++g_try_new0(T, n)
+
+@@
+type T;
+expression p, n;
+@@
+-g_realloc(p, sizeof(T) * (n))
++g_renew(T, p, n)
+@@
+type T;
+expression p, n;
+@@
+-g_try_realloc(p, sizeof(T) * (n))
++g_try_renew(T, p, n)
+
+// drop superfluous cast
+@@
+type T;
+expression n;
+@@
+-(T *)g_new(T, n)
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-(T *)g_new0(T, n)
++g_new0(T, n)
+@@
+type T;
+expression p, n;
+@@
+-(T *)g_renew(T, p, n)
++g_renew(T, p, n)
-- 
2.14.2


