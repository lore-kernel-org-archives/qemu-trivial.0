Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPU-0000An-6X
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPM-0008P1-6Z
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0007db-IT
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:35215)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPB-0007Lr-0q; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqZE0-1hIzJ33XgO-00mdSf; Tue, 11 Dec 2018 19:04:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:42 +0100
Message-Id: <20181211180352.19644-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eLc55pFj4cTiJFsK6l3OyIGLzN1dOZUMVxnE14h3RuyS1ea8byj
	uGEQXD45E6er92rKU+Db5Mw0ncozvH3Mh3Pgsft2JkCaJIlbI9pB+xmFDn58wRkdKFDYLiG
	3DUzvg7VVvNK1YwjnjlB6j0G3twCdHH/1wtAUKrmBO8NoG132qt2e38TcirqknvufE4qvg2
	cTDCjVD3GhdkdKOJrQapA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DJ/IKdbQWjg=:wFErucXGqEes26AkYA0Yay
	OlOoambSUMJG/SvrqPwAvlugYb8MFhB/mTSPpQygmKPLIHVkHxjYqf6N+y7NqP/2YCTrnIQ/l
	/0TUX1jBGwtj8STNss26RKouOTZQDeWBQ6WrRuvJB0r0QZRWUwwz0q0JtWwBoNlBf3CBvCuOK
	uWcRlPw+fKJF8V2Q3G1YyPp52Him0JFFT1eYcLlUdBPntEnyWY8PmU8gEehWtYZmdlKdJxuG/
	NgmKRsMDjBVYpJPtUQROP9l3Kxwhzie51G/cCSdZkEZCG6qPUxlHb0QeOqXgN5wBz1yzzJRaA
	cS9PJG3CWt6AFb5KAWpbVSDSNbuUuV6MAsZIfAvhHUmyGoauCKF8ZJFO/hQYNRaDKMAPgujcB
	VsriwHMtsY+rYhNm5XPqQaYilul8Ah6bnBYzZNGQI82Ipn6HXdRdE6HpPqSvG4FZGDdpTg/lr
	dDYEnzmEWBtARFTsPa5hILqhYslzCzDGqaoYFvIfXmxK6f9kec3848ukh/Wk4kv06kT+MaqVs
	Fi1i16LZkIFgxlq7ar5hYsHsDEFahJJDqV4jQU/nxvSVCjUypiOX+VCKJ55BsP+Fef9L5Xhx7
	u5BlaQSp6tV6INKcjRy8y9xuWaMq+cTGGE4Q8/hrr01wNLLyP9yJjhHGLdo9GXQ1sHvrcrIyZ
	rfojY2RjmJLoKqyLcTGGoCvmFCiGGWjGvbCGxWovG3WcEyGAzchk3OYs0PFJW1U89XhLIsfmJ
	nLh7NeBKZyIULn5pA6Kxi8SR6UPsmD/pPxE5DRVeo4bLiPY75t4V4Xlkf5U=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 20/30] MAINTAINERS: Add missing entries for
 the MPS2 machine
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:28 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Missed in de343bb632a.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20181125205000.10324-17-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68ff5ee413..b325a5af87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -612,6 +612,8 @@ F: hw/misc/mps2-*.c
 F: include/hw/misc/mps2-*.h
 F: hw/arm/iotkit.c
 F: include/hw/arm/iotkit.h
+F: hw/misc/iotkit-secctl.c
+F: include/hw/misc/iotkit-secctl.h
 F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
 F: hw/misc/iotkit-sysinfo.c
-- 
2.19.2


