Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOE-0006m1-B1
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOB-0006jc-MT
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOA-0004ge-Ox
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:43 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:50902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cO8-0004fP-L0; Fri, 06 Oct 2017 19:50:40 -0400
Received: by mail-qt0-x242.google.com with SMTP id f15so34346253qtf.7;
	Fri, 06 Oct 2017 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JsXbrPXUr8vAPutje9KpsJZsy/a75rUDkdTpn+HwdwQ=;
	b=IWiDkeM4R7mhR4QjipwFVrz9v8avasSYrIBniaiGpDcYPoQ6XmAEBmdJ+QqSn2G59g
	5uPo4wIp435VwjDOAtpA+gcG/wDFktZSqiQY5u6KKhg/yK9eqBZCCR9Pl/3OuvoDeh7f
	kezsXN51/6CzVRgnegsDIlgINmzYPcL4G+zwY9uhOMtxNZzDlJa39tpx6gkrDIRlPx2m
	mDFKeCj77XM3ikJy0khRgrx1B4k6BuDpn/FxdySCgxToH9a301p3ghAMHxk1iTzUaoUE
	HRdM9JA2ghBKirti3KYxsRHXjzvCMSu/2x5ac0OxgrKXiILJpJmNN1tXgd74v5hyo0h9
	RzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JsXbrPXUr8vAPutje9KpsJZsy/a75rUDkdTpn+HwdwQ=;
	b=qsdQwBdWVVSaUhxYfmGOsKdBM6eUPm+xbDTnobBmcjPLj1zYLPfcjq5pbdqsom2765
	RX1GMLUn3xBVr/VUiSYZP6VrSi5BRLVS6VnSyR6vBCEivwwQbl/Vmx4zNVk0rCAM0/SM
	lMJY0oE12FH3y4pvtXQjEO7SXS1YOdZxAiFHoZYgV0yUR6RuBruveOX/79xDf/c+yhgn
	fFcnkU/LhBcnpOEkR2BQbX/0vQlg+JTLA3sGyToEOhqUsZ9I/y/FJr9vNnlflbU40SbM
	+7l/CWMVOQmVtNUzHVMM6LDwlt0Z32I8kyZS/acA46M19XKYJ+HhcXrsT+wCtE9tARPO
	51GQ==
X-Gm-Message-State: AMCzsaVKZUnrYHrgvVD2kTe7dItn4WcCgu/GOmAoRZXNZWUzzXDaI3YU
	twHleloKlmmHNKiirDIc1pE=
X-Google-Smtp-Source: AOwi7QAmTOvSlZl9txnTqfGUUr6xs3FbVgaN8NGZ6UE8lEmWbwQ1fGpSaLIcwaMaLiFs8hGlr/20BQ==
X-Received: by 10.200.27.98 with SMTP id p31mr5461771qtk.149.1507333840060;
	Fri, 06 Oct 2017 16:50:40 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:39 -0700 (PDT)
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
Date: Fri,  6 Oct 2017 20:48:57 -0300
Message-Id: <20171006235023.11952-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 02/88] cocci: add more g_new() transformations
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
X-List-Received-Date: Fri, 06 Oct 2017 23:50:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/g_new.cocci | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
index 1e57685a6b..c767325a21 100644
--- a/scripts/coccinelle/g_new.cocci
+++ b/scripts/coccinelle/g_new.cocci
@@ -80,6 +80,49 @@ expression p, n;
 -g_try_realloc(p, sizeof(T) * (n))
 +g_try_renew(T, p, n)
 
+@@
+type T;
+expression n;
+@@
+(
+-g_malloc_n(n, sizeof(T))
++g_new(T, n)
+|
+-g_malloc0_n(n, sizeof(T))
++g_new0(T, n)
+|
+-g_try_malloc_n(n, sizeof(T))
++g_try_new(T, n)
+|
+-g_try_malloc0_n(n, sizeof(T))
++g_try_new0(T, n)
+)
+
+@@
+type T;
+identifier m;
+@@
+T *m;
+...
+(
+-m = g_malloc(sizeof(*m));
++m = g_new(T, 1);
+|
+-m = g_malloc0(sizeof(*m));
++m = g_new0(T, 1);
+|
+-m = g_try_malloc(sizeof(*m));
++m = g_try_new(T, 1);
+|
+-m = g_try_malloc0(sizeof(*m));
++m = g_try_new0(T, 1);
+)
+
+////////////////////////////////////////
+//
+// last transformations: cleanups
+//
+
 // drop superfluous cast
 @@
 type T;
@@ -99,3 +142,33 @@ expression p, n;
 @@
 -(T *)g_renew(T, p, n)
 +g_renew(T, p, n)
+@@
+type T;
+expression n;
+@@
+(
+-(T *)g_try_new(T, n)
++g_try_new(T, n)
+|
+-(T *)g_try_new0(T, n)
++g_try_new0(T, n)
+)
+
+// drop superfluous parenthesis
+@@
+type T;
+expression c;
+@@
+(
+-g_new(T, (c))
++g_new(T, c)
+|
+-g_try_new(T, (c))
++g_try_new(T, c)
+|
+-g_new0(T, (c))
++g_new0(T, c)
+|
+-g_try_new0(T, (c))
++g_try_new0(T, c)
+)
-- 
2.14.2


