Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JA-0004lg-Vq
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4J7-00041v-9R
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG47G-0005ZE-3K
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:42 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:55681)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG479-0005Tj-EK; Fri, 26 Oct 2018 11:33:34 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Xvv-1fXPaQ0kwV-010fOy; Fri, 26 Oct 2018 17:32:13 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N3Xvv-1fXPaQ0kwV-010fOy; Fri, 26 Oct 2018 17:32:13 +0200
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
Date: Fri, 26 Oct 2018 17:31:21 +0200
Message-Id: <20181026153125.24738-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jyFUglwv22ZGvQhGYHhC9I79VIt+cGsDI6GkuGxaHtotGw1i812
	NY5fhRWppxfts+BIGYlT9+CFsQBIi9YOPobjRk6yGrv7p3XJtUaiEHuzfaYcPre/54W/5fz
	u+S8zriEuPn4ob6AJ5IVDCUEInX/eLQckyi5EMhYDLS/1YeouXlhmUe3diKxFl3lxdGxA/W
	xShGMcOi94+N8+L+g0tIw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:/1PXSljl2Y4=:6Kj16mcRkzvlI6uvICand2
	KhQJ/ZKwV0E9ydZSHLRwpUakacRHwHVnnDwsXo2rD+OB3WdN2lTW9g41qOJxLJ3ruvMsnIYyH
	UhMABuBkQ0R6UaAgFnGLVmR96kOE2UF+D4CTaq9XoZCL/DIqnbcOmHcU7U4f9EZkzSwUWRsNE
	b70rVKHVbX9+A+ZyJePcd+cIBKnqCc/ezrK6opSjT0oIfGYPVQu3vlshpJdg/j+vkM6KzPbsC
	GApHIJoeGcjbHhIoPc6XV9O7SluYMnJ09IgTvvs/27VLnkpEQqMvAXIwGswtgjdthNlTHsw+4
	f/Vyt40YleKh8d+S1h8wMkUfCezJ5c6NIKE8RbqTR1y55RbctbQXuKYnD1cmPW8LdwLTiWhVQ
	KNZsB+isGvHRkpyZ/1Fk+1smheBVN2znegsKs0sjW+LIkHviJXrf3elt538yMByqqzd8potmR
	K9JpltaDes3yfdUNrdvjDek6UsB6r6UPvmb7p+GEltz0FgSBjeAB8TCKKRjscsbLgUyi8MJGz
	fhBGs2KIyfrwTLVHP/sy3ybI6edLQ703zdKLELxQMzmS0V5o8RzMKPJcRNpvmgEMPtfXiCd0d
	fFa5sYi4VDRmHmjElP8sckOhb1YQ7V4q+Z2ijW4r1vrWGYqaEMVbCZScObm8dmTFFtr1Nn08S
	SI1u73UPQkoljvXGXeVoV4yphSbfEplPwl2fv2YE0eszq1iboFiNVrwdf8QZmJNgk/Ysu82C1
	HNHEZ3Ts7yqxZHSV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 16/20] tests/bios-tables-test: Remove an
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
X-List-Received-Date: Fri, 26 Oct 2018 15:45:54 -0000

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


