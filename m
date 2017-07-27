Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlK-0005OI-5e
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlI-0005Lz-3v
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlH-0007ob-4q
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:52 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlF-0007lR-6R; Wed, 26 Jul 2017 22:42:49 -0400
Received: by mail-qt0-x243.google.com with SMTP id p3so8854706qtg.5;
	Wed, 26 Jul 2017 19:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tRS700DdLgCnDatCRcUUxY0ze33cvg1a1EXjrLyuMfk=;
	b=H7zQcdq16qO+QOADRLriRglbpsrEE2Fp78EdSccxGJl6x4vOI38OKVdjBYDnev2AVw
	Kij1/xp3+XyV6G3qoTLtLyU4KAUV6WmcGpytBI113NyHvtt3EoE5vVi4Ga3PmfaFk/Cd
	n7cYg+36SaI+Lza9drXOEcASM0T0f3ayC805HfEU1TggvySIsyCyO/9TpK+6nFcuOIoT
	g22KZEdFhHSBgKOqLzub23SethKxfEy+9+jDOLskMx4XT6hVUs7x5G9JTSFcxneOyY2R
	LDso2GZdFL5gF/2+8QdRkyIdzau9YmCYZFlNHwA7hzJVpOGgxKghDaG6ViZCAnsQ1clf
	Xg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=tRS700DdLgCnDatCRcUUxY0ze33cvg1a1EXjrLyuMfk=;
	b=dq2uXbA7OMT8+HZjqE0O+4W0FvX+TonBXS0/JN0cGsgTr8+GmpKyNCXzwvaeeb7x7T
	aitEVMTQ5i1ydWe3lbbZjPICf5xcFilGu7IUEvZGOyjffAx7fZ96lKMSIxzfGTEAmflA
	HMfHFwaUNROiSe5giJ+ARcNuLw5FpNCm4jUaaoBIJATgFzYcCNDC230I4T+catMt0JyY
	qpnGoqCyHYaQCNyD8SEMdNlie7HBPuQLyMJUzVNyFIvdfpmMeUEjkI7pm5iuZM3XPTdN
	J2qgC7ZR6s9vGSf1H9wdO7jlpLzFYgziu8TaVFVK1ZOjd5C1cWnIu8KM2ZAcRNpF0O9d
	+U0g==
X-Gm-Message-State: AIVw111uv/XDO+O3qUDBYZgU29mXgWFq7OjwwcSR3gnkjB+T5ITk0KoW
	PV6kBIiymcoEejbGLMoR1w==
X-Received: by 10.237.62.177 with SMTP id n46mr3871652qtf.336.1501123368711;
	Wed, 26 Jul 2017 19:42:48 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:10 -0300
Message-Id: <20170727024224.22900-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 v2 05/20] qcow2: fix null pointer
 dereference
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:53 -0000

It seems this assert() was somehow misplaced.

block/qcow2-refcount.c:2193:42: warning: Array access (from variable 'on_disk_reftable') results in a null pointer dereference
        on_disk_reftable[refblock_index] = refblock_offset;
        ~~~~~~~~~~~~~~~~                 ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c9b0dcb4f3..168fc32e7b 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2189,6 +2189,8 @@ write_refblocks:
              * this will leak that range, but we can easily fix that by running
              * a leak-fixing check after this rebuild operation */
             reftable_offset = -1;
+        } else {
+            assert(on_disk_reftable);
         }
         on_disk_reftable[refblock_index] = refblock_offset;
 
@@ -2258,8 +2260,6 @@ write_refblocks:
         goto write_refblocks;
     }
 
-    assert(on_disk_reftable);
-
     for (refblock_index = 0; refblock_index < reftable_size; refblock_index++) {
         cpu_to_be64s(&on_disk_reftable[refblock_index]);
     }
-- 
2.13.3


