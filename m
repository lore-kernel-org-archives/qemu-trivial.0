Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jl-0005L8-El
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jh-0004sw-BG
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG46b-00054B-7y
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:33:01 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:56805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG46a-00050H-Rx; Fri, 26 Oct 2018 11:32:57 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTw02-1g6kOk3SfS-00R3T7; Fri, 26 Oct 2018 17:31:49 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MTw02-1g6kOk3SfS-00R3T7; Fri, 26 Oct 2018 17:31:49 +0200
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
Date: Fri, 26 Oct 2018 17:31:09 +0200
Message-Id: <20181026153125.24738-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EqrCcCCeryytj/EJt3z+yvPaYKZmo+zIeqXRDhM4eiT4LD5VtWt
	XJDWHA9dqlGUPNVoPTS5vrGwQtX7WRjb8KrjCiNro3nhuJhF9tAhaXk2PnCjcguW/qfVlEW
	OXUG9066WSidDiXc2d7fW+koK6xO0INnTgOhGeeMcB+nGnnIitXMwXifNYqDGXM+hes1xKb
	JwztgEokHeIxqwQlDmNWQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:gxbSjhlq8I4=:STMEumJ8Sz+ty5IwIg/FB1
	AFtEOP+h3oIIQS0T2rUik2u5roQibFBgBavr3G74H5678wEF1W6GIVceCw31+o6XwfwR1RMBf
	m0Gq2NPhBPIu1EiFvk9aaLY4HRL5OpQTsKR/d+MPJOx2lHOhMwqN4jnXHCRjcdGV+/4MLaqdd
	oGgvompMUsypet3dwP+I0j3wM8uoXPSi6+KbsFIEZUuX2uCHNyhuA/g5otXnT8BinLS2i2/78
	ZoUrARLrUSv1WAqLuSyoqeTvxVy71vbDt2m6lfHkqPO/gKX1eUcd/s9iN1nEC2xLAy3fJskos
	EphgktAY9EZuZ+Y+acHy/jzs/DBj3Eh0N/VkWAs33Ve8ikh+Gbyrf8ctfdCecMkoT6LhVzfkN
	OAI7ncLVqkwcbUUtI14Kbg5cl+gTv35P7LA43TLoskJLTxQE2STzluxM5pg0Zb5q7ZLjLPm6g
	XaFq4ixfhpIpLYBIouGRl6Piitgyz41IFDoEW84LjrSvZ17K1doclJjApwqWCUqtNjdbe5Vv2
	c+4MlcbufO4v4zH6spt8tP6wOuZZsbt7GEjl3FcrydCbKQ6YLVlyQ0QUUPONulC6GL69hUMQk
	n11mJlqmL1T6mg0J8qvu9Cm7e/IF6B6HpNYT6iQpN3Ho491EMByJcpJsc2rJBSAM5kxUo5fzt
	H6knrHll5RdgQZ0UI0eszuIU4yCkAEgAMRA5pC+qjckUGWdLC6zdiRD72ntZ5a0mkZqn8JFbt
	Fjt0gjbxRq8iiOHF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 04/20] tests/tcg/README: fix location for lm32
 tests
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:32 -0000

From: Cleber Rosa <crosa@redhat.com>

Point to the right and obvious location for lm32 tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20181004161852.11673-3-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/README b/tests/tcg/README
index a5643d33e7..2a58f9a058 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -10,6 +10,6 @@ with "make test-cris".
 
 LM32
 ====
-The testsuite for LM32 is in tests/tcg/cris.  You can run it
+The testsuite for LM32 is in tests/tcg/lm32.  You can run it
 with "make test-lm32".
 
-- 
2.17.2


