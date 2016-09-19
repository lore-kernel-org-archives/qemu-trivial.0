Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bm4iF-0003jw-4z
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 15:58:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bm4iD-0003hN-8U
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 15:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1bm4i7-0008TW-GO
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 15:58:44 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1bm4i7-0008TL-Ab; Mon, 19 Sep 2016 15:58:39 -0400
Received: by mail-wm0-f67.google.com with SMTP id w84so9550224wmg.0;
	Mon, 19 Sep 2016 12:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=gFJYPWAlYZlahFD2Hdd4ZI8zdj5lsT69+o5Cn0ncHLM=;
	b=Ye0JkP/UI8wmyd89AfXQDM2HaFDWdJtye1AFcQ22ToZiaC6Aim96ObsipTj4vyHRj0
	PIYLQvZj2aQ+YOhsbnSidJznnLR70RqSzOuZZPikvORS+taPxw3A74WV8fGn48TuoWk2
	sm5AXbs/NpgHnxB/ASEEeOq3UCEK3vS41Yd197W6QQx0i6OfOQ7Ls3+gpsuNMr+kc3VB
	oa1H96csljmpESFBVzuF+i0+H+IQ6zAh4Q2VXuEwMt9CIsfvD7CfZnjnVrHLKprp4uw4
	qzChPRhXYh/nrDxcdAZexL+5kHL9qkroTSRlnWLehIGhqZjJMx4+DWJ8TtAAXYD44BE9
	v3aw==
X-Gm-Message-State: AE9vXwMI1svejfN6FV8LUlsc+JSg8swl9OcdRYYzR4A/ZFIJwP7iD96HGJngxIkIubwClQ==
X-Received: by 10.28.207.193 with SMTP id f184mr11615124wmg.40.1474315118220; 
	Mon, 19 Sep 2016 12:58:38 -0700 (PDT)
Received: from [192.168.178.23] (p57AED73C.dip0.t-ipconnect.de.
	[87.174.215.60]) by smtp.gmail.com with ESMTPSA id
	f69sm12049345wmg.19.2016.09.19.12.58.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 12:58:37 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Fabien Chouteau <chouteau@adacore.com>
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
From: Thomas Huth <huth@tuxfamily.org>
Message-ID: <c1a178ce-1c5e-2c26-0f55-6a4fbfe21a83@tuxfamily.org>
Date: Mon, 19 Sep 2016 21:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: [Qemu-trivial] MAINTAINERS: Add some SPARC machine related files
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
X-List-Received-Date: Mon, 19 Sep 2016 19:58:46 -0000

And while we're at it, remove Blue Swirl from the list
of maintainers. Blue has apparently been inactive for
quite a while now, so I assume he's unfortunately
not available as maintainer anymore.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9fab46..c6297c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -650,22 +650,27 @@ F: hw/sh4/shix.c
 SPARC Machines
 --------------
 Sun4m
-M: Blue Swirl <blauwirbel@gmail.com>
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc/sun4m.c
+F: hw/dma/sparc32_dma.c
+F: hw/dma/sun4m_iommu.c
+F: include/hw/sparc/sparc32_dma.h
+F: include/hw/sparc/sun4m.h
+F: pc-bios/openbios-sparc32
 
 Sun4u
-M: Blue Swirl <blauwirbel@gmail.com>
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
+F: pc-bios/openbios-sparc64
 
 Leon3
 M: Fabien Chouteau <chouteau@adacore.com>
 S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
+F: include/hw/sparc/grlib.h
 
 S390 Machines
 -------------
-- 
1.8.3.1


