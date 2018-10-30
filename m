Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS9h-0002cp-0k
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9Z-0002WD-6V
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS9Q-0004Dh-G2
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:38 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38725)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS91-0003J8-Vm; Tue, 30 Oct 2018 07:25:13 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mwfn8-1fKmk429BS-00y8DA; Tue, 30 Oct 2018 12:24:18 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mwfn8-1fKmk429BS-00y8DA; Tue, 30 Oct 2018 12:24:18 +0100
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
Date: Tue, 30 Oct 2018 12:23:33 +0100
Message-Id: <20181030112337.17973-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EpruMGy6kLNFKcNKdwgN4oApQRq9Ua5ve0hSsyZevrvuEOLxFc4
	2Nqf2j/9dU3TPz80iNgSeRKlsezndeqcHywks0NFYU5MkfQSa4sYTUpO/MEKiUyCsPZZ5Wy
	ahYNkw12j6L2RNMPjMH9Riw9mYkn7mmgZXv7jcyT/X5+Yl1P/sBQZMCMIhSRAC9FDrELnp9
	SMnt99y5KYywok5bdaeJg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9FQOfexKcM0=:NtcgCNiX0Z1re1GuN9rjrK
	+Di5n16IIA+qeSi26hI9XVjofW9P/dCUhBO7DsvG/fdHUxTD2pOyMebghEF4UhekctkDaUmzq
	7QUcDibk6QiRZ36TFULl7tHGdci3upYSRzi9nrWP9VdZ4WBuHImiFO4ehdw//o/kreCTL37jz
	Vi6NDclDy5CuekGaukehwTk7y1YWpz3CjI8bKjvuaFE6LrRW/Kp5YIFSVOxqlSVve/KaRekFi
	Utr0fl73GbrFGnTouKhcN1H4WWPseKJMsSXYEAoO26pVncs6vjoT1Z37A2WEfYCfS8n1bMFeE
	J5mN89PQZe9H8K/hbVQXDDYse5DVfu9oeePxuhvnEMD6nJ+L8NHMEzGHixevWc/yYqTeqADDm
	g54olO2wS0GXbfFA/Dh2vzRq8M8CYkZCy1Y1haneAnPThvJKgdMFXj1ONODYPoddgnDM3nEpl
	Qa8GcRNBN7vkb1G+NWGsmuJTc6ZhDGbtI3myru+jReYiSq3WvXSkOSRJc2U6fTXy227elrX6z
	CM8McIC1BIOIJCsCu9p9YSGMq//du/1U7EPen5aKOItr/hUxEGu+UGlw16ASuw9S/tdDuyUr8
	5MLWvf+SVoTKXpgT2TjmJBGj3tbbKKWh5eQXWYtHGal1mjzxzkrCSUZWcxfMr/Pf3zeLQtlaC
	a+dCer0bz6h9g8Y8ODaYLfm2nbpsh2wpimVhjC0y37wc1Gs6rw61kbAKFpRlfYvC2PnqDmgFx
	ButyD5EUhHUfybJQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL v2 16/20] tests/bios-tables-test: Remove an
 useless cast
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:50 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/typecast.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-5-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index af4b1fb6bd..02e77ec811 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -319,7 +319,7 @@ static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
     ret = g_spawn_command_line_sync(command_line->str, &out, &out_err, NULL, &error);
     g_assert_no_error(error);
     if (ret) {
-        ret = g_file_get_contents(sdt->asl_file, (gchar **)&sdt->asl,
+        ret = g_file_get_contents(sdt->asl_file, &sdt->asl,
                                   &sdt->asl_len, &error);
         g_assert(ret);
         g_assert_no_error(error);
-- 
2.17.2


