Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8s-0001mo-7f
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8n-0001gr-IU
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8l-0002p1-3y
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:24:57 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60509)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8R-0002FL-0z; Tue, 30 Oct 2018 07:24:35 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N6KpF-1fTHCB0FFR-016ceh; Tue, 30 Oct 2018 12:23:50 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N6KpF-1fTHCB0FFR-016ceh; Tue, 30 Oct 2018 12:23:50 +0100
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
	Michael Walle <michael@walle.cc>, Markus Armbruster <armbru@redhat.com>,
	yuchenlin <yuchenlin@synology.com>
Date: Tue, 30 Oct 2018 12:23:19 +0100
Message-Id: <20181030112337.17973-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VdGPgtjUAK2VHmCK3f2ylcttjAeYbvGsyLbGr9yPbuJqMU1q2ZU
	pD66VUqYbTpjNKd/AXShpQsmE+2txaznUMX9R1cxelhdGolGa6WVdYyPTHRLI/1Vs8qNIvF
	I/w8nDmAsuH+PpBozNOGwq44jLIFsU+Nm7/GgcqBCOqZ1UBteQ0b1axHCUeGKnW4kHHn+m4
	+ZZgGiR40E+T6L1NV56vA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Erk1HJDdJHg=:F/r/ZCIZlvIXgbC4fd1bF6
	3Vxwu/R8hiCysIvrSSu76BqL9kmzhaSVZAovKsGS8zRr+Vk8haasgSPT6GrGLDdVwM1eyyAkn
	7dmbHTaoAb6qNezywtGZkwRQEHq8XCfN6eXAK8Ds5GUq5H2VGrnK0BQ+9b0amcR8GzF4tyEE8
	zm3TWDuscDfb2CFis8D3g6hLsO4+jsu6PTP6hZ766hqaRcqwbqISedCk6qOJWdGTIt3T7hIyU
	6xME1bHMItSdH027YI4lduSnPN7Hj67K3e+S1dN6yA+gm6TUlIsf9q75NpeX4Fj7IE8w/XLFr
	GdOrZJ50fsLoiNIe2TBvF950a6cfT8d4N0DZ/IPLCHNb8rr8p+Cdzd8wjbYwkVqYmBK5NMwZD
	9HeJiT+sePiA9yagv07IYZLvtKEdCfaLF192QiFWazmOfk175etYOMwJSzgHszO0iOzAyn7T2
	CLc8xbMF0WScbeID7MYRdDgJeVfEy1DlS8B/QGIpwKo3D4QO9bClktVsWfWx1LKN2dX2ImR5u
	U08kN6WOcOORq4jQN/Uiy/OPWdHcFtU9gD1CV9JF1thaPAi62xRvW6Z8gxNXeFFiwcET65TIU
	Ukvpb/S4ea7yxu1VdxLleksJQsqyFQ5a5NlIKMQsHuii7P31ogsy5OEdTsMJ/cyf+NnLQZrad
	245Pj1EIt3o96jtfvz/Cop3kRHqKk5BeAM3cHhE+HwfLExrqD7JV9sG3rGEuQUgfjxOHjT4vx
	CsQuvedFqMBV01Wr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL v2 02/20] vga_int: remove unused function
 protype
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:00 -0000

From: yuchenlin <yuchenlin@synology.com>

Signed-off-by: yuchenlin <yuchenlin@synology.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181022080053.9379-1-yuchenlin@synology.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/vga_int.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 6e4fa48a79..55c418eab5 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -166,7 +166,6 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
                           const MemoryRegionPortio **vbe_ports);
 void vga_common_reset(VGACommonState *s);
 
-void vga_sync_dirty_bitmap(VGACommonState *s);
 void vga_dirty_log_start(VGACommonState *s);
 void vga_dirty_log_stop(VGACommonState *s);
 
-- 
2.17.2


