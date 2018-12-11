Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPQ-00006M-Ol
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPH-0008Gg-GK
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0007bm-6u
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:19 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57131)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmP7-0007M4-23; Tue, 11 Dec 2018 13:05:11 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MOm9H-1goYeP2GPX-00QAtu; Tue, 11 Dec 2018 19:04:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:38 +0100
Message-Id: <20181211180352.19644-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K3XqoJcby2N9xNzHHThf6UTu1paE1akst/0mjwJDzATf/y/DrTN
	zBVm/guGrpL1fuo2d1nHm87Gf1NlDPe2eu1Ivj4bc5yr1DTRleHf0oKbwP6klZ+Bct6V7+m
	Zqh9xhEnqmsLGXCzDCtufk84R4EdsRA/mCK+9HL7LfhTT9VdY+0kqyAKk87/a1+XFpaEfu7
	A2JMMCWGmbL0R3Ec6PLMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xqj2+nf7NhE=:I+ydXzb67kzCqIyvRux65Q
	0gbuWidUtsvjdyDsfT16vuvRZVIi4TBMm9U43pWpKqZZfLrx6xbzWkT4froNcbNhIgABa5uQL
	nTv8exV1Sj+M4APd5yimljb7yxz2a/Zkxim670vn5jvCIVz5MKiFkvkwlbaSOBXMQ/MwNdPU8
	fUHWUDnbiaFhKqHCZ/+EkQiZvrtdqOF0Xm6W9rRHtblnRf1gI6xvax/TsRgT3FXYjNkdwDDMS
	VdjmgHe9mznq/hz4ipctM0ITt/6Akfvu+U0DA7ZeBzbVqPZzqwoKTXeevq85jIwrgxixfRkfq
	53DoYPwh0yd5suxbbvJWmo38hiMhEM6cgvI9xdcCpRqjuPFcqAGD7tXgFkcma9up6K29SLogZ
	J8w6cwQM3XHzch6Dm/YU9RrI5Du/0nMVr5gInFP8CMsNYw6mN60Wa3JIa7KlLDMTmVj1f1dJr
	CkogrO0wEkJpfV8FuB11ZolCUOGMgs5QAEHhO67dewT991+OpdUiAJstiz/2SOIGbScK9jzRf
	dW/n9i/QZawF0qzmw+dTwW3gmzYojSSph+TC5z69miQ+uiHq5J26faMaDMSFQhLskRWONNXTi
	2DEEhzL8qfjxoUJl7rJO23bHI0g6GWOBh/EzOiIJvldSWjKUVdPQJ8dY1Vm6+1ENsGjyTTlfZ
	IZ9MMZ8EKTIBrI5zQEHk2tN4/uIF3t5FcoltjKKkTD2Ut4Q/cULuNlO/z00gdhcomK5Y91tri
	/2dfgSLLs1q0RxfFjlH3Cme0CKPUKmLvMqOuPsZOqagswfdoC1kZYF6aFOI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 16/30] MAINTAINERS: Add a missing entry for
 the sun4m machines
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:20 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20181125205000.10324-10-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 581832b257..bfd4ddd93b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1044,6 +1044,7 @@ F: hw/misc/eccmemctl.c
 F: hw/misc/slavio_misc.c
 F: include/hw/sparc/sparc32_dma.h
 F: pc-bios/openbios-sparc32
+F: include/hw/sparc/sun4m_iommu.h
 
 Sun4u
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
2.19.2


