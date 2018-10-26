Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JM-0004vz-MW
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JH-00041v-C6
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46t-0005Pe-GT
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:17 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34765)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46X-0004oS-Lo; Fri, 26 Oct 2018 11:32:55 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MN67J-1fzMYQ07k5-00J2rW; Fri, 26 Oct 2018 17:32:03 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MN67J-1fzMYQ07k5-00J2rW; Fri, 26 Oct 2018 17:32:03 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@gmail.com>
Date: Fri, 26 Oct 2018 17:31:16 +0200
Message-Id: <20181026153125.24738-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:Y9I56rcz2zqBUdx9sZmh5haNlZFYN90Tlg6dIVa2wH4bczZqV/I
	5dk3p8ZA0jjfSgIQr56tEVjM5iTNvvSsr0+f/UgDBHoajTSbJEZvjbzWNxn4VdEemIKmcSi
	zVJfYCRgPCdXZeD+qo7L27VnJMGH3J8WbPYuPT8Nj+UhBAUYlI5NXQUvZdZtMjHwc0qQBts
	irxmTF3hu/8A4/HDYnJpA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:q7UIvLoxIig=:77i3K5nCa2NQaxpkSEfQEp
	xmB/GpNuSkOERzAV4BOqw3CNL86mSNgKG42SwdgFHGxE4YMWN347JI1HdeVV+g04HkNNSh2Ez
	8bgTZ+opug7EmeSqSOnYFiwTX76J4wLBuC7tNFi56Lr4rxTqBFTrXocnBn2u15Q0oKkwybdab
	7VAPUWenQ6ZKPvDZFI+gauaRuNq3gz6hXPe5gX2iE8uf2lC27lPJq2J8N5Zzj90Regqh9tdP/
	T0AUtM2JzVbNriGVgUOJTA83qhquAiByqROcOsN2VS1jivMwhBHwGc2gorARqRnYw6BNTFvEH
	D6O6w6UHHXV2AyOJH0tU4twChDdN/C7Kdz8k//M3bF0e8W4PnPPfXn8n5yP3zoNC99ojL5vRx
	9L6GCQt5BqLQ+S9XQMlo2mu1gudRp7bno3NTusou4COu/S2sZbpagAiBWqxChxsw5nkHBWyT8
	wReFd1kGd53aL8YQA+sokWdblwlZ0gRudVfazWSf+g6M+Tvs3IiVk8lgBKDIAY8Wh1tSwjZhf
	cVojfiJZD8bN2TYTFKtUXr8S+Fi+j+Nbv96OhpC13+wIHxEAyDMmGYW6/CNFYXb1wEE1fttOD
	mEIQ+oXxWNZdVf1R79ELvlQxzgc0LfBenSWviPXo/eMCO8unq/q/jT2VBl+l1Pc/dQTV7Q2+t
	r8cZwqeB5DA+W14t+80pkMPedHC8IYA+q7aq5ory7oDdD0J549RsHt1XYDpPHZeNZLbM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 11/20] cpu.h: fix a typo in comment
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:04 -0000

From: Li Qiang <liq3ea@gmail.com>

Found by reading the code.

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <1536150548-2797-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qom/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 4e238b0d9f..def0c64308 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -852,7 +852,7 @@ extern CPUInterruptHandler cpu_interrupt_handler;
 /**
  * cpu_interrupt:
  * @cpu: The CPU to set an interrupt on.
- * @mask: The interupts to set.
+ * @mask: The interrupts to set.
  *
  * Invokes the interrupt handler.
  */
-- 
2.17.2


