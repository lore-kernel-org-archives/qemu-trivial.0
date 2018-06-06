Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGB-0004tX-E4
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG5-0004fu-BO
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG4-0003g5-8u
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:57 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG1-0003e9-Ds; Wed, 06 Jun 2018 11:21:53 -0400
Received: by mail-qk0-x243.google.com with SMTP id a195-v6so4182758qkg.3;
	Wed, 06 Jun 2018 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AtZG2JGOCcKDXJiyXoRFODCv13mHpmvh7UKdLJsRLsw=;
	b=pdOm9X37MyObsmmi8/jVCODydiY1LgiH075wwttD6zBZIyG1CfNNo0JbE8icLR/1LL
	WYOQIzI3iryR5kqmHlExAl/+3KxmGsbkiOu+J2wzYeSg8va01n22IBSPv0D6IBpHuiIN
	LJGMoNr18nNXyVnAsbMBJImuZVSgfRJomwf7XXRTnsnBqHECMFZNHgUV8MZBsBgRpLoD
	oVyU2A9bo5KylVVArsWQfWnOo0xk/iH/3Z7PPvN/AEQddLlBWXMRPxl7zoJBMZW1ZzQ1
	LoXqGVV8H0RTOX8hSUeBq6zuPczfXWuuybN2dO4365MPSTsdOztyYqtiOh7/trhu/zxS
	jMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AtZG2JGOCcKDXJiyXoRFODCv13mHpmvh7UKdLJsRLsw=;
	b=PRbB6ZxVyIM20dx80BPdDAoZWQEoNNBWetkojng3Wd/odnyu1pOqjJpNXIqhCrueN8
	V1co1rwR+GuRLzttEsDjRwcyiUqYIc4Yk68JkbHEP391UK6WywJu5vkRAm4rk/5EX+Hl
	+SrHGGgdHVY9PHWMv//38S9B4HIkTbXl9dibzeakOTxLXFVoT1KX9G08DkcSJQbdHlX/
	eyN3+M4Sa1sJLtFL3tFLhtPJRXgJyy2DJBTLLh0FKPRhWfbvePo1+snDwDsgQYvUHYJR
	Bh3vw/U8bfxAUTU2NW0unK7VFCsQHSawLePbIeKVYqgPhQUAhmj8qRWsu0o7k9SdajnU
	CiKw==
X-Gm-Message-State: APt69E3pOl+BeQc7ZniV30zcNIEcgDQbVd7eLLl/hziXthfs0ZQw4F98
	kbcx441mBG3zhQf/nirES+MWlCWo
X-Google-Smtp-Source: ADUXVKKgZxitdRNy5i89MnQex0DkChXuDF23t5i2ARzypiss28lHOeji/E0sNtdNIXINcCJZWZcauw==
X-Received: by 2002:a37:19e3:: with SMTP id
	96-v6mr2906226qkz.427.1528298512948; 
	Wed, 06 Jun 2018 08:21:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:22 -0300
Message-Id: <20180606152128.449-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 05/11] hw/core/register: Add trailing '\n' to
 qemu_log() call
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
X-List-Received-Date: Wed, 06 Jun 2018 15:21:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/register.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 0741a1af32..d2d1636250 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -96,7 +96,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
     if (test) {
         qemu_log_mask(LOG_UNIMP,
                       "%s:%s writing %#" PRIx64 " to unimplemented bits:" \
-                      " %#" PRIx64 "",
+                      " %#" PRIx64 "\n",
                       prefix, reg->access->name, val, ac->unimp);
     }
 
-- 
2.17.1


