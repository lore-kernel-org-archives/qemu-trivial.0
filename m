Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esoHt-0003iY-RI
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 06:28:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHq-0003dX-BB
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHn-00077J-Hj
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 06:28:10 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:39000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHn-00076c-Bp; Mon, 05 Mar 2018 06:28:07 -0500
Received: by mail-wr0-x243.google.com with SMTP id w77so16872768wrc.6;
	Mon, 05 Mar 2018 03:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0QNy2RcPca3wjrlYWHTpOi4Xaw+U9brJjl7Us4JjlEI=;
	b=WL2Mo1H9008tAcS4YYjyCqp1ryd0c4WsmMMl7bfL0JjfPjXbo7gyheyp5UUHfI3atI
	/TKVWi1/NgD2I1GaAYRGrngWgBBOhz87QlUEOC3IAXwe/1JDokUwItpUvAXq2THBhumx
	cKjwzhDd8HOk+GzE0jcBEcdIIRTNeTT3EILGLwqHsws9XUNQ1mLShc7iRWMAee1/nmXF
	4qCb6Aodzo8LBiwlQwe4/lBKTvXg9p56ihlyVM3oIZZrfSz+vxLnQk45aCU7RRS8fken
	xeZ8RaoDW/YY//UXBZ/aHDwCQc2NtCcuNLp3zFv5I4k+ieAMBvnHY+OUO6TqwUHCR9CT
	tQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0QNy2RcPca3wjrlYWHTpOi4Xaw+U9brJjl7Us4JjlEI=;
	b=QIwOtCfbnWtmCd9GGMRpkgQKUnbZee2s75kFQvF6z8Jfk+NQpRny5ARgDLnUk1XtSK
	jXvvnnIky62G/PXuhIBu2nX04EcJO7R0rGpjWpgSFD1KIuKdLSk3wrxD/FbctivJ97Mk
	BnhOzvv6L8z9lSjGIG9dRakUnIxDYaKt2fANFgKpfl/4h3coI2GP5TGsDA+eQXKfdLc1
	aCEhJPQFBWlNAP0zeEnu8VlRZvOGsd+NvMVRBLCpilY7QTyw/UayTxsvKwpjq/4/9sLw
	hdL16qYAMEYRgIXr6V+kOuXlTMVAc/8WdYjpcdLH7rONcEoNiwGHyyRzQpR8Hkne25lu
	nG0A==
X-Gm-Message-State: APf1xPCqR/VIzUOY15crRmDRpQgVmI0Su/gKMoYlVrLtp1c8R1e7gwFV
	+v9fWGZsw1BNXEMQNiJ1V6xpDkZd
X-Google-Smtp-Source: AG47ELsbuGExTkRpTvCPdY+n+t743yKP4vMmKF/9SVJtFwcK1qO0fmeQWtm3U+p36IeUEa3nk+4dtw==
X-Received: by 10.223.196.129 with SMTP id m1mr11859762wrf.213.1520249286247; 
	Mon, 05 Mar 2018 03:28:06 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:05 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon,  5 Mar 2018 08:27:22 -0300
Message-Id: <20180305112732.26471-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: [Qemu-trivial] [PATCH v2 20/30] hw/cris: use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 05 Mar 2018 11:28:11 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cris/axis_dev88.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 9ccc4350a5..1dea3c594c 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -243,7 +243,7 @@ static const MemoryRegionOps gpio_ops = {
     },
 };
 
-#define INTMEM_SIZE (128 * 1024)
+#define INTMEM_SIZE (128 * K_BYTE)
 
 static struct cris_load_info li;
 
-- 
2.16.2


