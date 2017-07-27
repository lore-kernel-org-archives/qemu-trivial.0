Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlt-0005wx-0U
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlr-0005uc-1j
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlq-0008GO-9k
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:27 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYll-0008Cr-TF; Wed, 26 Jul 2017 22:43:21 -0400
Received: by mail-qt0-x244.google.com with SMTP id t37so5778092qtg.2;
	Wed, 26 Jul 2017 19:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZHNiRv57HAyRSdS1g+42AUFKWODTKfUiPQtl4GYrrwo=;
	b=nOeL33TMipAsqmJBdStbVJqyoOHSS0mvUygja7QVO5kfu8xiGhyqJLHVE6Fp8rjzJU
	piqR9q9TMojZCwFN92wu3TCGVO//wFKr5XoSYyHzKbAQvr+FNc3tzgMsN613KOK1PjA4
	RF3QwIBngEB9r1SI2qDhsX8zbClsANyASydqYneXhph70b3fr8xO0Kn6NsfAi6z8P9If
	kONbbJcXDUJlF44BP4dFTaSwcn8I2mn9BYG2+TcL8g+WIOzVDFmLIoy6aasXAxj9Fbpi
	FSp4vx8F+sCUPx+72HhoVR9XmfsczlpFSSRCOVk9Csdx8bple1LiZUw96fKfn9pseP6z
	JoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZHNiRv57HAyRSdS1g+42AUFKWODTKfUiPQtl4GYrrwo=;
	b=lX3A3MZ8+dTLzCkRA3/PzaSn+bnMck+NO//iFmMxFglb3HsJbBnba3pW392MgGZjXZ
	RRtV1MQC/VOog7QxIW04xN8f3Mf40B4A9cBXYnvHKqxs++bDBd39ZblZm3r0mpvVLyjq
	FFKj44iZc+mMHiARDx6SAVLgHnTxnmlQZ6WepFdKweLot4lk/AqaYoqHwknut+vRgSuw
	LmBK05KiuToK+BBu2BUA1PU2nN7reo1l+w32UKoxe6yf+mn/NCNXmuj/UWNdjXcnY4GH
	X/dH2yXKvdIFo+uZa1A+oCy6jJRiBlTzWSui5yk/tD2chiXL4wwg3hQFa2yTxJlDunDO
	VNGg==
X-Gm-Message-State: AIVw113l/otKmNmNGTmDjFKAPXoGrbMscHtKR2RXhEGK5Il8khjgIEQE
	aMTRTxig/Folyg==
X-Received: by 10.200.50.53 with SMTP id x50mr4039899qta.135.1501123401303;
	Wed, 26 Jul 2017 19:43:21 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:20 -0300
Message-Id: <20170727024224.22900-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 15/20] thunk: assert nb_fields is
 valid
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:28 -0000

thunk.c:91:32: warning: Call to 'malloc' has an allocation size of 0 bytes
        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 thunk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index 2dac36666d..d5d8645cd4 100644
--- a/thunk.c
+++ b/thunk.c
@@ -67,7 +67,6 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     int nb_fields, offset, max_align, align, size, i, j;
 
     assert(id < max_struct_entries);
-    se = struct_entries + id;
 
     /* first we count the number of fields */
     type_ptr = types;
@@ -76,6 +75,8 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
         type_ptr = thunk_type_next(type_ptr);
         nb_fields++;
     }
+    assert(nb_fields > 0);
+    se = struct_entries + id;
     se->field_types = types;
     se->nb_fields = nb_fields;
     se->name = name;
-- 
2.13.3


