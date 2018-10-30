Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8R-0001Lp-KK
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8L-0001IF-RP
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8K-00029U-BG
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:29 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39953)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8E-00020s-Fe; Tue, 30 Oct 2018 07:24:22 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MWRmF-1g2srR2WfT-00Xprt; Tue, 30 Oct 2018 12:23:46 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MWRmF-1g2srR2WfT-00Xprt; Tue, 30 Oct 2018 12:23:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org, Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>
Date: Tue, 30 Oct 2018 12:23:18 +0100
Message-Id: <20181030112337.17973-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b/w7jnw+xQS1YeEBcE70ncEpRJovYtV1+sIVuHxfe9l0XSPc9x0
	/0PzbNLbMR/lw3sSIKlarCSchPH7YlnG/mRMr1hPKxLcydqlXQPa1p95OnGeEdYcOILxNWq
	CTK/WSJVwga/Kty+ja1LfXgStGt3ypPOt3JS6MxdtckiX9aaS9J3A5S46HJ+PBOYRW0vv7x
	32V8nd4SqU7x7HIgezJtQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:TH/Q2sY14Bg=:yT7jHMpnaFZCZkw6rbfXIJ
	EcFF2Vca62jNEfwh5/UJtV2+b6ys6mKqLVT2ZwneVUWyTNBuT2/tkM3RX0lSmo5QxXoAMFnHN
	aMZMtwLhSgFOjs8Fc3XwbP3uDozsL0CyQFJL5y6jzni8uaz5kx1N3xyuLg6QPHYKA0DWRPVMM
	q1ktZqSpSh7f/QvdNzUc/2YRefp97Fit6Ds17sQ26sPxUM4XQ+JagO4IXEBRE3n//4l+yfacJ
	FIo6gC32TJDW7o26QkxsXvycNP7DQc373MwEslRGwBZ8xZ87n8ty0YE+6lAvZumMAuO7XD+17
	TGc++15N8oBfekxKk81ukhWYPDz28smKgfNd811oI4zaZhxCPbYprAB41gANMWjcGRm7LNPMp
	ntnxdJV24SshT9FNtazGTQS88IKf8VXkk/Yij8CnqyJ+7bye77plV7yJII+KgZulsnMui0sdt
	AckogIUghm5RKNI5Z7Rkqqn2u8NORlS4ABysCcO9U+5kfvMOck0Xs+x1c594mvX8I1s1PKdq4
	5grf0+bChZFBGxYdHYtn3gH+zIfW3H+HWZFproRs2Kwmx9+wdVzU1AlnKlYt01vgvUVJjHMoC
	ymmXaGN9jNWeLRqO3QQEcexiLcUmeft1SX/jrceMEx0/TSWCzTo7iJu/VGyrseWYnvcHMgltG
	6UOH5kgyAiG6mjC+NDnPK6hBeQxngXDGt2HvASy+wJw2DU8Mj5D13cnCzaGYfhuhuckwpRtcz
	OA8aDGBMuE4MmkL3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL v2 01/20] configs/alpha: Remove unused
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
X-List-Received-Date: Tue, 30 Oct 2018 11:24:33 -0000

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


