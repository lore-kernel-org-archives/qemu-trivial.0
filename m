Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPU-0000BL-GE
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPO-0008Uq-Ro
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPJ-0007fS-DF
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:26 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:41451)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmPA-0007S8-V9; Tue, 11 Dec 2018 13:05:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N94FT-1hYamb2o9H-0165Dm; Tue, 11 Dec 2018 19:04:18 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:43 +0100
Message-Id: <20181211180352.19644-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:j8VAWUlhlcIx2VQuUQQQrf1Cacao8wu7BcE6imKyPJ2n031Ag4z
	BbGZiXUyhqUrwBKSrT1ZduuY5MV4ScHItXTZ27RoiyV6d4ynRGaxQyh4HUoDJaKS8LO+6cF
	En9/cu3wpWQcDhT7MHrohSjLGZFpTC8PN5xGM6zeEVECEQpNbpdI5WmonH0hrGoAxhW4vPO
	u3tu+nf/8Mbq6KwlNw4sQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YgSi3g/SmZE=:VV4oPVBRiIIgnb4jncSsbs
	xsY/RjMhP+md5xUoguTUVWbkEGr/apvKg+pph7oZ6fWe70xbXLuAeweyjM5OzKp2zwEEmkGbh
	moJi2tL//bKkxmTNS9/75AVqbFs1RUbgZLBTdmCyBqbgu4DfwCHWYt011H8fpF4U8OqyulcUl
	/NAlbFaJUBzh7CafCMq9LIx73jF6iq+PIkbTZZaG/q5060zbz8pGT27KVtn8OllhtvU+5aug7
	TF3r/aYp2iCrJZC534q5XvsLtfPHPmVmJcBg4p9VubG2SbeGLtXvj6M2HfnOkvpcs9TS7fXb9
	enOjI6L4x53gtVNbnEOlp9qHsQTSP5UblojfP8ChsZWEcn/CVDl50yMhydZdPpR8MKmBwxGEA
	l4ATJysZIcn6r1gRy00B+KbzddN6M3EsBg3yfBCl4e4nBPRTx/ZNzu1g54KNnyLDpl7MGRXFn
	8Cz0K7rnq/8xdkpMBgyEVhk/hCI29ZVZa/s/XnHaLSHPnKBvbz6o+GxjcRugMcwXVl4AJ7VSk
	LMx4uIRUIf2GbXFVK91QfCwmO/cH814g9f/DuBq6GPpInsjGQc+m7dpraxG0HIeNslaJ8HdlR
	5Kq5Ju0JnsyqnX1Q5XZxEVBy1qAF2MC9lbo0PKsXlkfv0VlIGylQ2jHts2wpxP0AVGE2hmvEf
	LBLEGvHLb59W4ztNLe2VxTB/ya7DdX1JUWCuUO4ZO4Tn0ZtSF7HqjaZGL6vkt+RU8txDGOKJP
	EJ1lbFGboS42Go0w1tLaVRq9m/jgozwLLlpp45tEJp7z5rnODcgZ8d1CwWY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 21/30] MAINTAINERS: Add a missing entry to
 SPICE
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:29 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20181125205000.10324-18-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b325a5af87..20096dad05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1772,6 +1772,7 @@ F: ui/spice-*.c
 F: audio/spiceaudio.c
 F: hw/display/qxl*
 F: qapi/ui.json
+F: docs/spice-port-fqdn.txt
 
 Graphics
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.19.2


