Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4J9-0004jF-4k
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:45:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4J3-00041v-RR
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG47K-0005dP-I9
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:46 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39581)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46t-0005Og-H1; Fri, 26 Oct 2018 11:33:15 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N4eOd-1fYW2A0gTv-011lKe; Fri, 26 Oct 2018 17:32:17 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N4eOd-1fYW2A0gTv-011lKe; Fri, 26 Oct 2018 17:32:17 +0200
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
Date: Fri, 26 Oct 2018 17:31:23 +0200
Message-Id: <20181026153125.24738-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7uzmE3hXAIS81p8gYH56fkh6UHOHziydz3GRt0kqKk+9lI6V8tO
	ymcxVNd2k3nNh5OSk2Pk/jxynYGCbtG21Hh/1CgAkkVIWi48rsrCDSx+W4i0sR1XGlWK5kC
	NFLNOXod/A5Ns+fCSGK2nX6J9jQuXZ1bP7IV0vckAO2dQYDS8esPHcMSEKZ+oges4O0L4eH
	Ro/pTH0X+jX3PNs37yFqQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:sMp6R0Un3T8=:UOJ0GTL/xFzLMW0oWfWIC2
	Wb/tFPUw5Dh4J/s5cNR5yAwXQDeWxdwkapc7bVXyEB7qk8b5KLPc6g6zbjOrT0HQ64QjHADx3
	Jy/eAX7Ibk1C3TV0pHnvhXGjf+ALK7PvjZZr6zkh604AcvqGmjNrrLAt605XHBvD1gocDXbMc
	KmgLzntqdGbaJGd5Rj3FZ2YInkY6Z7kjuvfWw3/alimzMA4osUNiXO2MK43tk9gCcThE2DZbx
	2fhGim5AgG9W4uOj0WJNef8Q+mzVEXdb8kdMAqDnRuiZfedp/GvojmlgPZnSn2TQ07vrz3UiC
	6XpBYFAyTaBQ7EWq5F9gK6Bx6nqzFCXrVQeq7KJcjBoutxxntMLX97AVILrCuzgb0cRrS6OcJ
	bLr1tHAhuUb9PpMInWchc417uZgHQrlvfi67OdLltNOW3z1UGSvS1QvDzeAzaOLnYammOejmQ
	/SZ4DFuo/vtcO/ObBniPTq7K39xFuXE/feMgl8RrMxNDSJSVmsiVnlmtQ9v0hwyTjQFoXxyB2
	QO993deYXeBHkKavB1yq98L+sUDD6ylz3m1MIr/hivJaZnHZ89YUApJ9IKC2kvIeIBjx1GkQ8
	h6JdeXvBuzHAdU7bAceIG9aVfoDHfXwJ+f6q9VlbJWtNQPf1Pg2U0PqQv8WgOV4O5VMJjC56z
	hbhvur6+k1acJnD2K45fVbP9dNiRZlWtB30XVCjH6qmiKZZw1t9e48srm2CnaKE7k73kGGdxW
	ngmAYwqy4WUPDYeW
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 18/20] hw/intc/gicv3: Remove useless
 parenthesis around DIV_ROUND_UP macro
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
X-List-Received-Date: Fri, 26 Oct 2018 15:45:53 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-8-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.17.2


