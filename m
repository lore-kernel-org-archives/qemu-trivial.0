Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzNjg-0006Iw-0Y
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 10:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzNje-0006H7-76
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:36:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1gzNjc-0004GS-5Z
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 10:36:34 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1gzNjX-0003vN-6O; Thu, 28 Feb 2019 10:36:27 -0500
Received: by mail-pl1-x643.google.com with SMTP id k2so9917573plt.3;
	Thu, 28 Feb 2019 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=m8QU2qgvZYKWNn0/nfxETF2/rZZaQQwi717B8AzlesE=;
	b=qaXVpsJuzX8A6N4C4i4L9hSmAylNGTkhoxWhsy/powrS8z9zGtMDc++axVIXeysoHx
	bBJO2FQfBcgKRmXGOqLdN2S0dpDvu4BaUtrpy6hg1Mj99JKP3RjJQelykraz9V+vLHWF
	AL6+moqdl+mj/wW/G79iU8mlbIu2zT45YoQn3Cjn6tc2NCAb/r+8fag3nQUpFX9nj6Hw
	MFue/4ipumDtjEA7ZozbNKaNGGeD9/mkK4YPLz8ie5AVzQy/sEFZErGzi0KluIVCEhga
	Z+qO9CQtlKKKQ9S8s3IJ+2XQ1QFUPJKSejiP6L3s7OxXTOQ5KucUXooYtdkbjqpxLx6H
	8XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=m8QU2qgvZYKWNn0/nfxETF2/rZZaQQwi717B8AzlesE=;
	b=lvcFXhWfauiEZ3qXLpVk9DHAq/8Modfkln9MCU6znvktQ5JzfmAWqiMnFcdiVnj36+
	kc6L4rZB0HIIG8BR8i0R3ysFnUXSrhp7KBYDFx2OYMAUdOscoacZvxPDjRre4XP94/fC
	M3lKV+PUp0D7LiVzzr8shcyXf6hju3/Ncxyf7rk3GIl9f51nBkzLZVNwfaPm7DUE4nKc
	OUngMe7K15C1dqvgAv2/YuzToUeAdf/GX0cPIxz5FQhVfPcoaq+3KBd75793boFJICDf
	UGfeSfuXBraLSsr5kzkT3jBJy95fdS09IyW03oJ4uD1/3zgw6aWBlQYe80IRlTySxVCS
	RNHg==
X-Gm-Message-State: AHQUAuY56p+MRncL6JZe9yGR/T42Ljaz0ZGnettL/3Hx8pZTrkEScaCI
	cP74QI/ce6YsxH18MfGydsUg/RrdrhQ=
X-Google-Smtp-Source: AHgI3IapOkWlHZf3HylMmNlf1Cjs7m5qpU4/0WT+h9R7aeuNGmkudi/7Ma9WDQXaFfI34oxoHKwHCg==
X-Received: by 2002:a17:902:854b:: with SMTP id
	d11mr8322305plo.224.1551368147912; 
	Thu, 28 Feb 2019 07:35:47 -0800 (PST)
Received: from am-swift ([136.233.9.103]) by smtp.gmail.com with ESMTPSA id
	195sm30612063pfc.50.2019.02.28.07.35.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 07:35:46 -0800 (PST)
Message-ID: <60952760a82dc603b836ca41fd0f9b1325cad635.camel@gmail.com>
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>, Julia
	Suvorova <jusual@mail.ru>
Date: Thu, 28 Feb 2019 21:05:41 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-trivial] [PATCH v2] trivial fix of malloc to g_new in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 15:36:35 -0000


Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
Note that since thunking occurs throughout the lifetime of the QEMU instance, 
there is no matching 'free' to correct
It might be valuable to edit the BiteSizedTasks to reflect that g_new is favoured over g_malloc

 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index d5d8645cd4..17f3d320bb 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_new(int, nb_fields);
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.17.1
Regards
Aarushi Mehta




