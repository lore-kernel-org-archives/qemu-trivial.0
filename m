Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyc-0005UY-D4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyY-0005SN-Qm
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyV-000502-G9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:14 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyT-0004wU-BN; Fri, 28 Jul 2017 01:38:09 -0400
Received: by mail-qk0-x244.google.com with SMTP id x77so5584969qka.4;
	Thu, 27 Jul 2017 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ns5K39Q1+rIyQkpPHf9B3a6wYDGo6kSTRh/JMpdTCLI=;
	b=DUxK7bHFo6Du35a+i+BAoFb1JRL2U4vJgQ7oKNLKRVPSn+Tlt4PM2KuxHH4TwBgR5M
	pDxVoGYSr3IE/+PMZ/R9Q7pnZHuWPzi255AfmcIGHL55UAj5b/nTSFGP9fBkH8oLGF4t
	SXYb5gS1Jh6Pe3Vb/i8VNkVZiZUxSjpCaLM9pX34iwVt6RcZI3ISBJs2IWuydgz5OdDj
	2wBLHE8fDt5qVgdy/jovrnDXKJUj2fRpe83ezgI0Hi63h68z/6GQuPuYI8SeP2oeFxZt
	Bf+QIGgtw1c+b1K+gFugxhBxoytmwzC3X7PIYLsNtJfdEUZ9Eo7JmjNs1QU4Q1hRhU/+
	34zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ns5K39Q1+rIyQkpPHf9B3a6wYDGo6kSTRh/JMpdTCLI=;
	b=moEOBEZQfKStbGrrDDnKHubqtKs751aQbXGJDGR99Dw0oAq54PgviIlHxFUrVszeWN
	NWfMUeIfV8P4XCy29NH9G8ex5+eD8xRxoWvB0YBXoyRxcHInRDCnW2lMkhDW1odiLbep
	ORQCbn7MWg1GCi7tVbRL0j/8KIvCpRWS4XhQ0J1s0hEd/v7TKC7ApDsda3QbXoB21nLQ
	TbIt8bUkAV33p8pGnLZCavRdnO9xSn6uvuItEVBRqA0xt91LFwR/LbiP3M2AW+Dhcgug
	TXUcJ5cxRnLltMuiPzfDdsN4QkMVCDx0KslQnb9RLxnyQCvID+UVn8PMIpNVezvljjpw
	U6aQ==
X-Gm-Message-State: AIVw113SLhiV62VA+/MwCCh66J5vrynICt4lnuHhPcVy76HJv5KPgoPU
	/G4dKp5bjWTb3w==
X-Received: by 10.55.177.133 with SMTP id a127mr8205108qkf.303.1501220288946; 
	Thu, 27 Jul 2017 22:38:08 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:38:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:08 -0300
Message-Id: <20170728053610.15770-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [RFC PATCH 45/47] MAINTAINERS: add missing entries
 for loader
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

RFC because I'm not sure 'loader' is the same goal than 'generic-loader'

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc1a69051c..224890643d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1196,6 +1196,8 @@ M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
+F: docs/generic-loader.txt
+F: hw/core/loader.c
 
 CHRP NVRAM
 M: Thomas Huth <thuth@redhat.com>
-- 
2.13.3


