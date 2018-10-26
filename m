Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4JM-0004vb-CG
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4JA-0003tV-Mq
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46u-0005RD-68
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:17 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38743)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46b-00050Q-3E; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MlsWZ-1fowSp3FMh-00izzc; Fri, 26 Oct 2018 17:31:45 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MlsWZ-1fowSp3FMh-00izzc; Fri, 26 Oct 2018 17:31:45 +0200
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
	Eduardo Habkost <ehabkost@redhat.com>, yuchenlin <yuchenlin@synology.com>
Date: Fri, 26 Oct 2018 17:31:07 +0200
Message-Id: <20181026153125.24738-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zBjl53BXLDe83XDR0nGwZqpIXJTfSYzSSQLcc1Ra1jlaNe34CWR
	KOkhU7t9XI7rx/kTUZ6JQIGoHDEUYDO/crW3v6gOJOTdRkiq0sf3t1QVk+pyDhuX6hfVfR4
	kHS4Xb0mY/mbilVRTy3F0UJ9pYANfzYsgWyMJsqZm+jGoBpyOuSF87ktwatxSgMuRbckFWz
	HXJU8o0zIXuiqbQwn1XlQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:R69yLWdoEGY=:/6fuZA9vUDYa94U80yL7Re
	BTxE+68DjkiHBvTqKlI0jY1909EIV4woPaDZmHy5MuFOXIrBjJnzuWjcboP4ubrXU8okMPYzq
	UQTx+nRaKB3KKS8pqZZfYy0SU6pPBdfjK87EFi6iRWrFW94NBbhvvMLD2njSEulDDlrdT+RKw
	513MvxTFnfEquqWka5ORcrEbkTN4DyrODfT0OoDO0QJdGVldNjcsiC3gtaulQ6q1DYUT3kBhU
	ZstMW6xCehFfo2/g0NXPs1KFT3FtZFenLgNai9kK1ZPynGt3unahHqTgA0zCpvBXnqUI8fTx1
	D+lM+TZo1/13GZfV3H3b0N5CRb70UoBP0NeIV07euKhFqLHVDeAJYHhFz01/v5XLHgw1G/ypm
	zFi0rQmGckhn6xpkMoTI8K6CfYY70EXft1Y7Y5UAySW23pAbQ6miILtz7W/Q+YuBJdngzhLib
	d/oWJMsnezo+SAL5/RiD3hXXm5tsUmY6nPgdjj9aKoPLOnPK2ocXOHt7C5RkT3BPhEB6bFirO
	sZeQGCNX2DkaGNIy0te5gub4ztYiLUfkWfQvP6nPv4iC7dAz1Q2n7/0zPUSK/WCq9QReRT7lz
	CbPBK0YyJ9DkZZ5ckykzaZcMsYJSGWPgKJlgyFQ/p2HSAe4pG5rrrTR0y//VkeO6wc8CEFIN+
	TbBnsetVUjD8+TVrD+RQxkBm4nh8thOK6yqJP+0d6JbcJzNNHVRnrOFWLZkLTZFS0naQWG2+5
	Z7Ywxyj4PChWLkZt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 02/20] vga_int: remove unused function protype
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:03 -0000

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


