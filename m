Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ5-0002Zs-NU
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYy-0002RS-9M
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYv-00030e-H7
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:16 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:39937)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002LY-PJ; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MRC3Y-1gfsX40CwO-00N7gY; Thu, 14 Feb 2019 11:47:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, libvir-list@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>
Date: Thu, 14 Feb 2019 11:47:04 +0100
Message-Id: <20190214104717.3543-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ADes+TtlmAqBmdFM1Uz6oQLrqd8W0xOgUiFL4z6HhSg57lFgcP
	fw2kSmR+EyiN1io3Ub4+PmnalH9eRqiRcONE2nbAgIHbXEsL9aXVIpdnQHu/iGO2s+h1I/O
	pnfwylKkoAz+jUws/IDC/jDRVYS2qXWKjaO8knpboV5I1Efspjc9DrFh096Xu9txVzrnQ2o
	yPS1L4z3UJqjVAWzc1Okg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+G4vGsQSh2A=:z0NjIXQm4yKPXDPBMdEhQw
	T5KTRSzTnZE5XuNB6V7Jv6MZuGkFDzeml3pUablhtvj1eG7hVbtLSz5IJptxHTw20sUlWAQ2p
	csElDh9T5PZomSzuI/p/q4AI1XsSeCHmbtyScL4Y3LZqhoBXsMWKrB4V52nUDarlYIS+SMye/
	GksxD7wizxgscDjUigAW1eF3dgFmsAOfMT0IAbzSrC/dF/zGh6ITP8yR48GYHZYlJyV3daigG
	x30HOdpMzXkhWIxdK5ki/Yk1HLlnjCtO/9gvO8uUxWG2JkOZ2lh3kDQWDXnn9liBkOHq0Zbb4
	IBBsJDQBuXAJcQ2jT94lTtJYCxAk6j66UH65ELd2w5SNwZeEZqKWJpOI/7Tl0fm8LG2hQcUaP
	sw9HDvPAONi+bWHkFwQ7XtNTUo5WEKafvmkzxH63FGoedcOz3AbeG8i004h0GRabmcyRNWaz3
	HK6i9KWcNUbxvRPToEx7aHoa6JeqWHgKQ4jmIBtaFCUwsd655w5UPx1mbW1qtaotYJdvtfNAl
	jVg+/o56Bfnps6GVTD47rVW80xBPjA1DvopRRf31KVFlrXngROblrc38IT+/54OP3qqK31onv
	CVhJPY9f1JMZNzAJFQ1f8+QsAO4X1ffrz3v50n/dfYXpTcyLrkzukdtk8oP1X7cGfPXsu9PBh
	3n4HG+gbVWB/uKtMKI5lBI6LziD3ZD9Ff7hdDt9og/Gtua7fyKXTlGoLwyj0tSD+0iYbXVtec
	JHVhywGPBs6bhW9V57ONF1cuEh6lrg1m9U3oog==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 01/14] qapi: Fix qcow2 encryption doc typo
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:17 -0000

From: Eric Blake <eblake@redhat.com>

Present since commit b25b387f (2.10).

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190206202848.16999-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qapi/block-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0f349d460336..ee1ab7a8a259 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2998,7 +2998,7 @@
 
 ##
 # @BlockdevQcow2EncryptionFormat:
-# @aes: AES-CBC with plain64 initialization venctors
+# @aes: AES-CBC with plain64 initialization vectors
 #
 # Since: 2.10
 ##
-- 
2.20.1


