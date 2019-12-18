Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihYxA-00024L-Vi
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 08:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihYx6-0001xc-2t
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihYx3-0007vl-S2
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 08:01:19 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34643)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ihYx3-0007q8-GG; Wed, 18 Dec 2019 08:01:17 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8XkP-1he1yD1VAH-014TUZ; Wed, 18 Dec 2019 14:01:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 7/7] qemu-doc: Remove the unused "Guest Agent" node
Date: Wed, 18 Dec 2019 14:01:05 +0100
Message-Id: <20191218130105.125981-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218130105.125981-1-laurent@vivier.eu>
References: <20191218130105.125981-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OoM52WcD+7hA490CeupEbe9AmoiALHAO381+nS6jDBKFFoONge9
 /+O3m2dnz2Wu5rNh8VFk8DA0bGrT1kHMOBZYAeShApYc2IZb93M93EYLbmwStUfV6LUOmAF
 nRAr2MJAJvNdnFXQhDxkm1gaDyA2H0QyarUsRDcN3+uSSjE8xk5jWohK1zHNsrOVt/qo7aY
 hyo/MWORXiCSbitVfSduw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RwNdeAo+slw=:X9sff6sd/GVtZmjfFHA4Gv
 O3lvZhI+1dqamncpLlJDCqRH3LjVIw5iKn4WAYtHOWLf3z+t+Asw9hallyunccZEBMEMYNED/
 yXWnFwrQ9rRlnAxIlEapS+ZeXK1moeg/nemQhvZ0Ou8mfPBMjaOdp6lYr6pSsX9IAGvuLPNf9
 ybux64lubRNjjzhUcfrUHk+ufhuqWKTdHAfsJ9wi2Lxjw+2GXDJTW+++i1olgmtlIKT2AyhYp
 PLiU1MTk8VjgwRadhwUiyx+1hRxGxQgieCumb07r0olpdBJVHwPUsw9gsKuKlrn7DGLaOyBVE
 bUZOTahdjclf7IPxVrYEFllknDLGPTYWnkzc/C+hYXuhOlcQ3BiVvD0kGW2y0VwS/gs9UOjap
 +osgE2Y6fV6MA5ALzHaBWX6Lu9FfFZ2ie50E9xX5L1HgkRyXsYziN1rUScjuKvGSwkMwbR8su
 WNGr+wCYAkcohtVPbrIj8SMaNFS1ZyOXkwooAqJHxLa/+Ei2SK7xBSSbp7VBFIjGXYMZhoMUF
 DEY41xvd5RVXXAdfletNDFU2L7yJ6BQb6KI7Jf6UZkQVARB56lJJ3wVtfVnZyzBRAt+TLSKVM
 J4M9/9grPmtZFSylnHTc9zRmwTLKwKo830LL4tJCdm7aUMlxoCh/vvBqTWpLS9DpEguFKYdaD
 UeImpaUtw16KEI43evUwHTGzV6ufBBsCN9Pc3lFQjM2xLvE/mXXT0pUoWOGGTpALYhHY0MSsL
 +3ZFY1TiTKf/E/08BcgBsvHHjH84D0XAeDeK7vxIb04IHmlC3ekeGKdq1mE9GZwcyRErRYT1L
 7LfSl0UbRQ7psL1mzXVZ+YfkWV8/Y3gWlwyF6OIulGDri1Jzpe95QvW+x8WO4hYcRhrLLvkWK
 lFBeSoT3NIAIGISDY8UQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 13:01:22 -0000

From: Thomas Huth <thuth@redhat.com>

The node has been removed from the texi file some months ago, so we
should remove it from the menu section, too.

Fixes: 27a296fce982 ("qemu-ga: Convert invocation documentation to rST")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191216132941.25729-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-doc.texi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index eea91a2d1efd..39f950471f28 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -38,7 +38,6 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
-* QEMU Guest Agent::
 * QEMU User space emulator::
 * System requirements::
 * Security::
-- 
2.24.1


