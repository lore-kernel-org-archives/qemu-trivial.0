Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jv-0005UQ-Tl
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jm-0003tV-M8
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46B-0004oo-OZ
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:32:38 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:48635)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG45y-0004Xg-PV; Fri, 26 Oct 2018 11:32:19 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mpkwn-1foOEz3MAH-00qAjm; Fri, 26 Oct 2018 17:31:41 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mpkwn-1foOEz3MAH-00qAjm; Fri, 26 Oct 2018 17:31:41 +0200
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
Date: Fri, 26 Oct 2018 17:31:06 +0200
Message-Id: <20181026153125.24738-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:He25IKfwYFFVyHEil/j6dKpPeRhUiROgBqc5BJx27k1B1AKKmXO
	qa8n5M3ZE4MoK5dD72n7rLGWNdhQKeKRZLiQb20zepMpYZIyPxxa/tDYamLBUAHqHzeE9CF
	4uCMn0kDcpBEdHiNAh7bfjj9WrnhhbuPeQVYcTLldb4t988sA3gQv3vSBVpdNk+cPIfGu1l
	uaiFLEWI12qDiH0aJW4rA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:6TtGxG1Ucd0=:lLo9Hj/tctiwpnmBpNrNBf
	hyV45z8dHa9qmM3TGPdSvl+k3jr2G3LmZyn1W2g6oPRBE4XSpcdrG9E3WkE9EK/+NU9pYypq5
	EG1tJYW0zhr7tWDypkjZVvxTM4AnQ8LSrBSCLMmVEundB430Pn/Z+1hpz7c3Jbk/ML36ztSnF
	r2PQDbtJR9H8fv8whKhxUdngZRSswtekR7ly4CSAosseCZsNWblwX+msGI9fdiBkxw4yFihe9
	TrYitG1AqLDCAxyU6U0uFoXRUuVHtM+OnvVw3Ik2WZ9nmNcG3g0kF8eLz27DfTLSgOMs0Lb10
	TIsp27Wpt2WvLCDwHG0jrngTLHsDEupVkpCt0XdH9C31XlexChk2z19Zroi6F4IW3X6vCY3Fo
	i5D4ka0H8luKFMjeFLq3osLzPt0a527TmjHipahqnOP4m87vr5JYN/yqzTMs7w/Z8Sf0CNqrD
	c9zizvtI5YPlgL6EvpLuh1F7jwZurUunqwdPI7daHhCDhuBLOP99lBLNz7ZZ0H6cqCKqqxfX6
	cIaAAdzF4vUaYZlHOuT667ktqwSWxbVgXC0GH263SGWxLZLChuATuTbjX+j+Va95ZfT+u/YcH
	kQKgwANzVb9V23a++4YwkdxnsIa/nkatt00ZcTBC1F/gmxBmLKbY2wsZMUHNbagGfXDO4flHz
	NgINbg49DOFmqEeyHssKEWbG7mX4BaFDU1kdvbw4Qr2+QyTUwGxCHBPFkjc1WHUI/i8hoWGjY
	NN1m4AMuT7+XV11O
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 01/20] configs/alpha: Remove unused
 CONFIG_PARALLEL_ISA switch
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:35 -0000

From: Thomas Huth <thuth@redhat.com>

We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
is just a dead config option which can be removed.

Fixes: a4cb773928e047b137c6998209cf2eec857fac6b
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/alpha-softmmu.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
index eb58b40254..4d654eaa0b 100644
--- a/default-configs/alpha-softmmu.mak
+++ b/default-configs/alpha-softmmu.mak
@@ -8,7 +8,6 @@ CONFIG_I82374=y
 CONFIG_I8254=y
 CONFIG_I8257=y
 CONFIG_PARALLEL=y
-CONFIG_PARALLEL_ISA=y
 CONFIG_FDC=y
 CONFIG_PCKBD=y
 CONFIG_VGA_CIRRUS=y
-- 
2.17.2


