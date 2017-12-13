Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOzRS-00006s-58
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 00:18:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRQ-00006L-Bv
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRP-0004YW-Gs
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:48 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:39327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRJ-0004Va-6z; Wed, 13 Dec 2017 00:18:41 -0500
Received: by mail-qk0-x242.google.com with SMTP id u184so583551qkd.6;
	Tue, 12 Dec 2017 21:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VdSzwMw2HudcEp3qmf0DiKQ4iEW57X6hLtyQStbBPec=;
	b=pV2CeWiiwP1OQLYsI2WJqOwXfaEORgHv3FWi8CB5zFnGZoIVMAQSJpb44RaCZE8bdg
	ySiHkisU1zZD82Y2/FiR2CkukqPCAoZTlWszV4TQWGrIvcSGuxzNL3T8jyHJ11tzTpAy
	icmisWuInUKv1R53kV798BOfGoIk0eq/gyGMLnWXS7QA7BDos+8TJaXg8EuWt/mFvL6E
	K3+K+RbM9v7TGHYzPzSAXoS/d8xfVyX5rFiPfaNZ9s8NKnjEluykFEq67O7gj1EyuIYV
	zPBJ5p8CrTp1/3Y/al5egncU4G35NetmAsXGKYkKosFt0NPeWgEu/mMl4ryrUhSaG1Z6
	TBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VdSzwMw2HudcEp3qmf0DiKQ4iEW57X6hLtyQStbBPec=;
	b=uF5RO4tUaWFdHRVsHk81GaSei6/paqLZEhxnlawPon84rtAXpvx6HISMdWcXlr8czE
	etGNRET5rBpCMTtxkEOmM605dDtunawot93j3k3pFjrFLOT1Zk8iGgWZ3RWr0tPcd/kR
	ZVaDxcsTBFL91QvSuzv0azMJATugG/Gs6Pu8vHCsUIO4eg+tGKSpS95Y6d14HhDXzAul
	SddpHaVPc9yADHhcDOPVdvQvXCLEatsTWC/HLfah29xHAlJmoVdY4g44YxtVIHM54Q7Q
	ZcQXYtxreN88rHaBRdMn+8HB5Ww9aa4/jhryWqb4PvRT3JvuqGJHSV1zsZN3e01KLjlC
	ZQeA==
X-Gm-Message-State: AKGB3mJYp0h+RoO37dx3qRHx52WDuuhEfqswBOWctEBjQlvJPu2kGce5
	blCqwK8PIKc+slyHdoNeOec=
X-Google-Smtp-Source: ACJfBotsC/cL3CZWyW+yapnLLHp4WBvYqKFXnRtWt8U6FX/Z40VK2hpFS0USP58r2+aDXyuBIYD4zg==
X-Received: by 10.55.113.129 with SMTP id m123mr9511387qkc.169.1513142320772; 
	Tue, 12 Dec 2017 21:18:40 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d15sm522318qkc.26.2017.12.12.21.18.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 21:18:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 13 Dec 2017 02:17:34 -0300
Message-Id: <20171213051736.17755-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 2/4] hw/registerfields: fix a typo in the
 FIELD() documentation
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
X-List-Received-Date: Wed, 13 Dec 2017 05:18:49 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/registerfields.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index af101d5ae6..ad9d7a82a3 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -22,7 +22,7 @@
 
 /* Define SHIFT, LENGTH and MASK constants for a field within a register */
 
-/* This macro will define FOO_BAR_MASK, FOO_BAR_SHIFT and FOO_BAR_LENGTH 
+/* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_LENGTH
  * constants for field BAR in register FOO.
  */
 #define FIELD(reg, field, shift, length)                                  \
-- 
2.15.1


