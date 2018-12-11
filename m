Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOq-0007w4-19
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOn-0007s7-Rb
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOi-0007Ge-PK
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:46 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:51681)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOd-0007Cb-81; Tue, 11 Dec 2018 13:04:39 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MLRgp-1gnUKI40cl-00ITGw; Tue, 11 Dec 2018 19:04:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:33 +0100
Message-Id: <20181211180352.19644-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nxefInwEVUVRE49ZqSnE+oq3it+jTWvfO/kRRFhT4xikVE8prgD
	STuk+V0qCwDzo4iiWqulD/lYrohQIpSk1bMSmchUkObfvWq/sX6KJAGVJrxyzPgoYd0SAed
	c4CVzISxZsdmaaR+vJtlR21zkdZbPnAP8xk34GnC/tipWleG4XU/lWWROvihSioBqHXIlr0
	BABEJKXkpi0GH0WTDfkdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JEupHiyIYgc=:XeyU8bFNfswpdweSjJINJL
	4zCNZfi4C6oND8PdZUZvCQyuavgmLiYuZxdAKjG2u0EYt+y8wY2Fl7Kcn04ADx5URUbb+V1de
	k4MATWLV0B987iTtb7b4A/juwZMd+X0q8+CL75jqDvx9RR/RuP2WaFcuvlWw3iJTRAjIqM/yE
	vAVkosUX1o+fhLK1JPCJLzWNOSL2/XxtdcE1uRik/6aIv+NsxZr1TwzrPSJ6ljbXvBaO0RNYU
	ZSvJZg6sANoj4dJi+mmMfRpZ8Ue6p9xVA2dnrI5w5tgqkSfotgWZ76IBW8iQm/6ef+RaidHCt
	li+J0EwnYAQkdsjZyCdcikqDBjyZZrU0wY3+peLLu5+bH6q3RKrWYCiqb3kLpYfuTV0ldN5b8
	Z36MbPHaPDENEPwbMjp0LonQUn04hnGWHLcoVFZaqAEvvDbEE4UOlW0U4fHbSszrya61RsUmS
	7fFwhBg+xQImuPkscg5LWEGSnWR741EIvHADJtQpRoKky+vEpnNpFP06/junNJen0LBQqcYp0
	T7sIafQKM0y0lXqIuoV+Jh2PXDsEhTOLqelWaWCn5Q+twNUVlEwJKyTqYjMEOvHvqJzqFth9B
	0hkvUswoIRJeTkhFifs4Bm6c+NzbUD9Q0vHP2r1nFBUN53dm+EuVy3HW1SHe/Jgjo41fTwfce
	ZxQYlRCYaaUo67X8i3G8nocwkHa73CEv+n1UBmDAmrWD/gJcqTRZmrQIf/S1SSxz1NV8NrAVe
	pwqFTMEI+ThQi347XCnaiSQ1xIfQzd+TCg07vpvX9XTut9CgUWTLKz+Tk/0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 11/30] MAINTAINERS: Add a missing entry to the
 SPARC CPU
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20181125205000.10324-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 59233c2139..edc88164c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -291,6 +291,7 @@ S: Maintained
 F: target/sparc/
 F: hw/sparc/
 F: hw/sparc64/
+F: include/hw/sparc/sparc64.h
 F: disas/sparc.c
 
 UniCore32
-- 
2.19.2


