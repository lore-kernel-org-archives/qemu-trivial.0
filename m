Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYm0-00064n-EX
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYly-00062L-8D
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlv-0008Jt-2V
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:34 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYls-0008Hp-Vo; Wed, 26 Jul 2017 22:43:29 -0400
Received: by mail-qt0-x244.google.com with SMTP id d10so7552234qtb.4;
	Wed, 26 Jul 2017 19:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vHf7NQRpXAMKOJSzs2A5PVsngL5mFHlrA66IeKjyaR8=;
	b=HETQKDA+/iovzUzmWFIM6LoLkiQ2EHDIekQwpY6Ef+aQ7XzFbk6s5mndeYxtM6Q4lP
	ojnYZ+TKTklv3KdMMORDiUUaiwUu4zxwl15NTM3DgY2tDw0J0wydlz5GcjjXO6+nWhFh
	ve2qkDivJjqLGlBxWsUF7VNZ/q+v6IvWyPrzpoCg3G+tFndnHkDEhFVc5qXBMgZ0ugzG
	3C2a7WDZKPQqcvOCsDR+G/5wCLC5n0rDureQCKnE6xsoeq9LUnrrsLj7v01o+l9rQP8J
	WQLddszd07Uy1JYtMZMZAUhS++CFsrMhvGR/W6bZHbfvuKG/rjE0PXcmLBfqPXmC9POs
	f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vHf7NQRpXAMKOJSzs2A5PVsngL5mFHlrA66IeKjyaR8=;
	b=KVyrU5DkqpHQfFnF2l0fSMmZvcDL2G9hmNJNTJlgG4EC6+S7aHJPMErYAzqEdPD8D0
	ofQBYl4DGB4PTqh2bCacW1WoK4mFLIeKZM4v5bnt4GnuVc0zwHt6nvGi05xPwhSlOQSN
	1o+3mlAK8sPeEyIsG/h+k3mKfpGckzDC0NbR9PEHqCAWvRnptxZ7bZaFdtk4qvF7nTSX
	AzWPj2H5FfhOq/tVzTfmtSLu10m4MLtXq4g4xJTPjKVkiFhomdSDzUr2lC54lbks3PBb
	JvyPJV/FTKFGFVJuVFyEUbrcBKUASXmyeDzd/wFw5j7aw1K1fJDxsaUGSCh9/JVKQq3D
	q/Jg==
X-Gm-Message-State: AIVw112xYi1oOTGX3yE0BBXrCYwl8XS/widhtg0mUfSvBr17CYmV4lDj
	bXyyYrkAq/MKlg==
X-Received: by 10.237.34.39 with SMTP id n36mr4114191qtc.258.1501123408496;
	Wed, 26 Jul 2017 19:43:28 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
	Greg Kurz <groug@kaod.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:22 -0300
Message-Id: <20170727024224.22900-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 18/20] 9pfs: avoid sign
 conversion error simplifying the code
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:35 -0000

(note this is how other functions also handle the errors).

hw/9pfs/9p.c:948:18: warning: Loss of sign in implicit conversion
        offset = err;
                 ^~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/9pfs/9p.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 333dbb6f8e..0a37c8bd13 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -945,7 +945,6 @@ static void coroutine_fn v9fs_version(void *opaque)
     v9fs_string_init(&version);
     err = pdu_unmarshal(pdu, offset, "ds", &s->msize, &version);
     if (err < 0) {
-        offset = err;
         goto out;
     }
     trace_v9fs_version(pdu->tag, pdu->id, s->msize, version.data);
@@ -962,13 +961,12 @@ static void coroutine_fn v9fs_version(void *opaque)
 
     err = pdu_marshal(pdu, offset, "ds", s->msize, &version);
     if (err < 0) {
-        offset = err;
         goto out;
     }
-    offset += err;
+    err += offset;
     trace_v9fs_version_return(pdu->tag, pdu->id, s->msize, version.data);
 out:
-    pdu_complete(pdu, offset);
+    pdu_complete(pdu, err);
     v9fs_string_free(&version);
 }
 
-- 
2.13.3


