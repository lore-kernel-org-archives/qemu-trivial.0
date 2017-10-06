Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOQ-0006vh-Gy
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:50:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOM-0006rN-T7
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOM-0004m3-5S
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:54 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOG-0004ic-1g; Fri, 06 Oct 2017 19:50:48 -0400
Received: by mail-qt0-x242.google.com with SMTP id o52so34320457qtc.9;
	Fri, 06 Oct 2017 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vcj6Jlodf4B7QdgUY0fLzYwgMTJp2L4HdhMmrytvkpE=;
	b=STinJnO2+jOW2QKjv/0vG7eSTK2SMQqMiQUzsCdSZzytE+ZY+4xJ8B/6j9JgO96Nvq
	Ll4NLtL03bKWksQ2Nv4mjLK56R4Rnnzs3pLDMHzRDEp7QEwzgADiHkiP8Xcqv0u+aQ6D
	/QwCcm/b/fcOxkzoS8End+9oKV9zSmkr0EuW1HgcEdKB6kGs1ulnbUmnEHJyfQhONE/j
	kvyoOQ54oiplA3mUluMXwMeRBpDjUoaJee2YUVkK0rUhhgzhmbswc/GL9QTWgw7dGjTA
	Ig36qNIe47hJLOVu/qhNvEMqaVr0y5P5GcEZX44HITfo46ZLPQdRzXrzXX9bqFtFmdhC
	WG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vcj6Jlodf4B7QdgUY0fLzYwgMTJp2L4HdhMmrytvkpE=;
	b=U3JSVcWL533TgQe4esX/GVo630CE4OfwpS968OqCJWVOFPUDp3tco9+O81+6FKbIcJ
	1Pc7gf/gF/ZmXzcVmfJm4Wg8aI25Y/zbNcLbtad5SE5FlEmhkvtMQfCSiMmloDLc8q7a
	vd5U+3GJho4GqwD1GboD04mZhs7WKqtISSjgwBQGNeFvCEFbP6qVUiXcBomLICD6A4CA
	mtxSJI16aPreIWAaaJaUEo3jf81GOzsKgdX7BfBEEF/ohHhVCcAEyJQpSG3xHIk8l42I
	KpVqQWugjlzn2aydkSLP3P3WkNzCrqnff7Q0DFI+KrjA8iXEh4aNoW/gBKotpzASOdjD
	khAw==
X-Gm-Message-State: AMCzsaW7LkqobpnZ8fjT4o3g+uxbC8pfGFIKvyphRuq0VdiIjOHoGEsJ
	KOqz47PG29X/H+GHHJTY9ww=
X-Google-Smtp-Source: AOwi7QC7UwcOFtn2j0dGhcTH7PZlQXXo81OExZG5Lo4Z/qrDaP4ekMMCr87isSmkpdRWRry6EfDCsA==
X-Received: by 10.200.25.137 with SMTP id u9mr5693239qtj.81.1507333847539;
	Fri, 06 Oct 2017 16:50:47 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:46 -0700 (PDT)
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
Date: Fri,  6 Oct 2017 20:48:59 -0300
Message-Id: <20171006235023.11952-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 04/88] cocci: avoid use of g_new0()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:50:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/g_new.cocci | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
index 368f0c5651..9643ce3f23 100644
--- a/scripts/coccinelle/g_new.cocci
+++ b/scripts/coccinelle/g_new.cocci
@@ -127,6 +127,52 @@ T **m;
 - *m = g_malloc0(sizeof(**m));
 + *m = g_new0(T *, 1);
 
+////////////////////////////////////////
+//
+// no point in zeroing the allocation
+//
+
+// the loop right afterwards fully initializes the memory
+@@
+type T;
+identifier a, i;
+expression c, e;
+@@
+(
+-a = g_new0(T, c);
+    ... when != a, c
++a = g_new(T, c);
+    for (i = 0; i < c; i++) {
+        a[i] = e;
+    }
+|
+-a = g_try_new0(T, c);
+    ... when != a, c
++a = g_try_new(T, c);
+    for (i = 0; i < c; i++) {
+        a[i] = e;
+    }
+)
+
+// compound literals
+@@
+type T;
+identifier p;
+expression s, e;
+@@
+(
+- p = g_malloc0(s);
++ p = g_malloc(s);
+|
+- p = g_try_malloc0(s);
++ p = g_try_malloc(s);
+|
+- p = g_new0(T, 1);
++ p = g_new(T, 1);
+)
+  ... when != p
+  *p = e;
+
 ////////////////////////////////////////
 //
 // last transformations: cleanups
-- 
2.14.2


