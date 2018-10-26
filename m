Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jh-0005Gf-Mj
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JZ-0003tV-TV
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46f-0005DH-DA
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46021)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46a-0004nF-I7; Fri, 26 Oct 2018 11:32:56 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N0Ip5-1fLKm73INL-00xLUq; Fri, 26 Oct 2018 17:31:53 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N0Ip5-1fLKm73INL-00xLUq; Fri, 26 Oct 2018 17:31:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:11 +0200
Message-Id: <20181026153125.24738-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:2+1lzwmIIdattnKA+t5WqCfOHMufIsowG/DvIeGG3ALda4ts/4l
	vg/56BnLUH4llLRRRXwxyQHqDIY8mXRkjp058XeF2z6YiLzJlxY8PSM/JDoY84qU1I5yp+X
	R/QG7DOWUGBWRE8Jys9SPwbpJeLtrrrCKcNhnK/tppJoFHsNUmrh+C7gQ4MNFSjDYteJOTs
	2+WczfZcTVkfhI4HDIEHA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:PKURthrx+Nw=:JmorG/7/AkZafoiTBWgSxi
	Sy7o0uJeBRLST8ZpLbIBjLALNpXZTH7HKZVGnt5OXwuz9kcax+XcdRtKIS/N5ZJNtWu2kr0LL
	3jfLMx4xhQgj+66H3WT7rrISJxDtZnnBFq2DKOiME2Fg2K6gIKccWtjI9zOnhcxq9yvJnHG5i
	GEuZwrA6XojC49Eb4RiHwrHA0y2DDpLS/ni4ens9A3naoHSFqFZ3dtP86qAnwXZ/YelNa3JfB
	gJQQcVxsqM1z9Y+0+ylx6H7Jb1Uw2YTveK0vWBNy7GNjpoSF+K85hNh3mOpLtkGVd9KU/i7it
	XuPRiJTN/qA1hnDCc0L3BVaXTDtwt+V/WcQQDGCnc04kpxo1Elg1MHi4lpvFyueJBbMgm22Hn
	EK78WDk+UvL0OLBPwaPrDfm1jGLJu3sUbedRgNhzvbOD8mSx2nj39k5QEOzPYnbjGtKks7AOu
	WqFZq+P1yYlrArloVDaVfPFMsCvqK3RARRLWP7XYinmWzuhNVcJOJgoiQRjyJJkUfwkqJihNv
	+5QYwQhXmbd0PxplIIW6hHL1hFOLdsVVgGp2zZ8biKpwCIx99SzYtIbmCQP2654M0eCfbfMl2
	jiY8iONR9fvq7UtTYJSEFQwvSDIEpy4KUAV8f6lbpjpF6td+o8XVmWQOeHgV1jiJrB0/JV4SY
	3FbNWdvqpgjMf0UzrcTlExxTQVJkcoNtnGUSBQEG0cc7ILZO/kld5t3JIS3mAmvyfT+c=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 06/20] docs/devel/testing.rst: add missing
 newlines after code block
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:25 -0000

From: Cleber Rosa <crosa@redhat.com>

The line immediate following a ".. code::" block is considered
to contains arguments to the "code directive".  The lack of a
new line gives me during at parse time:

   testing.rst:63: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-unit V=1

   testing.rst:120: (ERROR/3) Error in "code" directive:
   maximum 1 argument(s) allowed, 3 supplied.

   .. code::
     make check-qtest V=1

Let's add the missing newlines, both for consistency and to
avoid the parsing errors.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20181004161852.11673-6-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/testing.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fcfad87614..a227754f86 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -59,6 +59,7 @@ variable (which affects memory reclamation and catches invalid pointers better)
 and gtester options. If necessary, you can run
 
 .. code::
+
   make check-unit V=1
 
 and copy the actual command line which executes the unit test, then run
@@ -116,6 +117,7 @@ and using gdb on the test is still simple to do: find out the actual command
 from the output of
 
 .. code::
+
   make check-qtest V=1
 
 which you can run manually.
-- 
2.17.2


