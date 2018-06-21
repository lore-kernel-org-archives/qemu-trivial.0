Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW394-0004jm-GV
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 13:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW392-0004hR-8f
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW391-00023U-Bc
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 13:13:16 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW38z-00021p-Ag; Thu, 21 Jun 2018 13:13:13 -0400
Received: by mail-qt0-x242.google.com with SMTP id d3-v6so3541622qto.1;
	Thu, 21 Jun 2018 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=luxfPRZPwwIX8S+QPut9IENRfIQfTr5YFYCr53Sj+KU=;
	b=VTHfYD+QYRisBAs6BxguNLiWjNRla9LIcy7NcQ1yG10e8VeFLaQQ6KC+8G2V9BKLzE
	oiKiFmS3X2Afta/K6Gbb/5dMrkJ+qGW8agqgT2LvY3u1GwEoISLpAG2ZCJwTxgbObOoH
	Nnora3XzISwY3YYYzvIh1pk29g3YQmNb4ZoeXWBJ43MSFZdblxivlV8PLIkvINDmpjja
	1bxVBrwg92oXlKWjRL6EIop2Uy2+mBZ73XhtTb+wLt/jE6CoWHg3x+65DbOf4fnPeXHl
	gIy451mD8lVBBBpZv36uBIWv/RqazwycunEL3mTbidizTWQaIN/BaGegde9XjoArcKU1
	57rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=luxfPRZPwwIX8S+QPut9IENRfIQfTr5YFYCr53Sj+KU=;
	b=tz44b//yDSI+LXcBpi+sIHSkf+hwBJVH5G5RshPswccTTDLTkctskMKNSK8+hv0miq
	o59EeBMkQon+03JjsmbhRSjAKNdIRG1l4lV64Xn9RjNGu6Vnf9ektKYnJ6665YAQaqZV
	R+lUa01PEkSIp3f7ZGLkQAelftElFKqhkrehH0ubh6wJQJZSUpr1J+s8llwAZ1gOOQt6
	MkY89VCNutYGrfYDrw9JyF4uMLBcXJz1q7Djbzm5wbYnsiSGueeOJ6cBr3g6VV2SYIOj
	CAYpMmGx4B8tdhI73Go9PL2w5aVK4Z2PcRv4UvDS5+aLHlw50cs/a53JwM0FN6+Dzgif
	x6WA==
X-Gm-Message-State: APt69E2Y1v0Hf/15VWDk+gj7CtLJLZl4YFClDORIJffZMBg8bhlzyJV4
	rjODtTZMxN6bQIks0zyWxq4=
X-Google-Smtp-Source: ADUXVKL9WLz6lE5xDYL3+coGpZIML/AtbvlXVJ5hixqjhcIwfYZGflE5skWiA5niRgR0gDzlbtUaCw==
X-Received: by 2002:ac8:3115:: with SMTP id
	g21-v6mr23710883qtb.230.1529601192652; 
	Thu, 21 Jun 2018 10:13:12 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	t14-v6sm3166159qtp.65.2018.06.21.10.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 10:13:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 21 Jun 2018 14:12:48 -0300
Message-Id: <20180621171257.14897-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621171257.14897-1-f4bug@amsat.org>
References: <20180621171257.14897-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 02/11] sdcard: Reduce sdcard_set_blocklen()
 trace digits
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
X-List-Received-Date: Thu, 21 Jun 2018 17:13:17 -0000

Per the Physical Layer Simplified Spec. "5.3 CSD Register":

  "The maximum block length might therefore be in the range 512...2048 bytes"

Therefore 3 hexdigits are enough to report the block length.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index bfd1d62efc..d7880bcea5 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -37,7 +37,7 @@ sdcard_powerup(void) ""
 sdcard_inquiry_cmd41(void) ""
 sdcard_set_enable(bool current_state, bool new_state) "%u -> %u"
 sdcard_reset(void) ""
-sdcard_set_blocklen(uint16_t length) "0x%04x"
+sdcard_set_blocklen(uint16_t length) "0x%03x"
 sdcard_inserted(bool readonly) "read_only: %u"
 sdcard_ejected(void) ""
 sdcard_erase(void) ""
-- 
2.18.0.rc2


