Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyN-0005GH-TW
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyI-0005CX-E6
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyH-0004hC-H3
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:58 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyC-0004Yd-6R; Fri, 28 Jul 2017 01:37:52 -0400
Received: by mail-qk0-x243.google.com with SMTP id v76so8644856qka.5;
	Thu, 27 Jul 2017 22:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=veQlm45P2a8zPULsvBTm9S6DyXbb57Ik+Thh2B6Nj/E=;
	b=DF+A4EP9ys9rXP0jFUl6iAo5LGd2rhW/hoZVVIOkzlTMx+9KGAZATuxx/H9E2PhVFU
	ETSCpG4o0jdNXGOa3jaU4gXIBosVLJcnsppkD5KXMKT3DEQdUzJKVoCAbbIyzKLI5fD2
	WfdhzBVaGRNcmK5oefvtalcQ5HYSGTg+i8tTfgeBZmIQ3psNuty8t4HJaRqaX54pTl4+
	Sz8VfhVAxFsDEnBt+nwTVcSMQ2OMnI1LT3QN/84qTf074KNFvkamRqa/kVD9tmX3Lgxk
	vheWNLbUmznye5dzua3qtqgATARfYz9FUv9+PDR7Y5Nt/pPa16vTuEjneSxOFb7f2BXw
	0XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=veQlm45P2a8zPULsvBTm9S6DyXbb57Ik+Thh2B6Nj/E=;
	b=RFZM8XgQWnzXCpjMgB3XUIToKCxp/GBMsz04Qn0FxP97pN6+rSNKYdahIzrkRagK6R
	1oyD3kgjVbLqWY1E+8SitLt1JsvqA5txou9YvfTAh4GFbxTQ7tmfPgT5xg2+ktQXPGn2
	SNFGH3J2PkgqksYJdTwbkp/siWxNkHll5+mgb5swofyc1Hl3Jarid51szCIMByiK2w89
	77zmpXyxlEzh4hzgoTKDPl703kKmcEN9dB74V21rpjqpMTGkIQcwzNaA/pUwj0CT2R6n
	SKZSG8haVug9AgV3WK5cF6r8TTiI+R3U9NguVidznNFmFOUyBmxqbVZNo5b8vr4X5zAw
	C8yg==
X-Gm-Message-State: AIVw111HqUrUyd7E/keEsCsDUXleWVYCBqTIc21YBPdLc6cppm45beYY
	K7IYcKycZtKnQA==
X-Received: by 10.55.162.214 with SMTP id l205mr8224631qke.265.1501220271703; 
	Thu, 27 Jul 2017 22:37:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Fam Zheng <famz@redhat.com>,
	John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 02:36:01 -0300
Message-Id: <20170728053610.15770-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 38/47] MAINTAINERS: update docs/interop/
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:59 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23de632424..54e35fdab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1283,7 +1283,7 @@ F: block/dirty-bitmap.c
 F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
-F: docs/bitmaps.md
+F: docs/interop/bitmaps.rst
 T: git git://github.com/famz/qemu.git bitmaps
 T: git git://github.com/jnsnow/qemu.git bitmaps
 
@@ -1852,7 +1852,7 @@ M: Denis V. Lunev <den@openvz.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-F: docs/specs/parallels.txt
+F: docs/interop/parallels.txt
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.13.3


