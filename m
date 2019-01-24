Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeS8-0000wb-H0
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeS5-0000vc-HV
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeS1-0000rr-OS
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41331)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeRx-0000o7-Qm; Thu, 24 Jan 2019 07:49:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MgNtR-1hPHFL0Y4V-00hzAk; Thu, 24 Jan 2019 13:49:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 13:49:05 +0100
Message-Id: <20190124124906.16653-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190124124906.16653-1-laurent@vivier.eu>
References: <20190124124906.16653-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:julBC4/+TFXATzX3lq5v2+98NjeCQIDgA9Q+SF+8aijzhWPZe7L
	Qt07eUNV+2VlK5Ua4Muuv9VJvVPUuq0Ewyk4MLZwJGKAZdgRmmeGUAENmI1v9BQhMcbnZqe
	NsZwR8ngvr0QoWa/LF6osCeJzRF9Q0n6laC9y9pz7cEtwiX5xeP3cfhxgAnTR9aJfJDUl88
	dbthvjRdvs2cXLPI+swFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2enUguMNbxM=:fFDh+NgofHKAo/C5is2IZQ
	aeGuW9qbXWkmOTLMZJqE6a/dX80O/e4S0MtIWKoh3JpdodnjxPikQ80plnRCT9CMintV65vGR
	hVLjtTtiUQMeD9rxcZsmF9c3q5gSYAL3Fv4zr5y2Z4wvrWLWa//hpxnVBIJwLccG4/URbHJRj
	k5XAvHU4EnF7Vlrm37BEuGxAMl6kguKkcbfd0zYjTU6Ptx+QCIy3bknf4YtYyVUv7gjOZ/n2k
	gwHiC0ynAD3syKhs6OqoHxqf4sdZypU+jS9vtoE39jaoWyzCAnaBbv82GVjBBsHS9iVw96r8j
	WRXFqoNkM//El8ZmeZo9I51WOTaCPAxwBvb5fhTEDlDEQ0/sUNLjiXG34rsxjuzirFY5WnDH0
	MQP0dacSXfZTTMPcDPENzkU86WfCtbocb7lvySETCmKoy5fh2RJ64YWMtRxUSbJsEgMRBp9G1
	AaC3Lk3GKwH9XgTCsbpN+ggQgo+tLf0CEbfb9Owr4HdQb7AumU2GjJXDU8e6ornyiXCveMq0O
	Rv3rVXi/xhabvWpK3532XNsn6TJwH/+y3cUANOZlPAMigXqpdlujrhIH4AO0+vXknSPqPzVFD
	dXJWT/szl86cRSyaCfflI/FYHo+AywycjnnSDL+bBpQcUt9A89acy8Ne5ECXUVoMv/SPhsXoN
	CUxNlCvb10wqCce8KwrCK33v9+PVZvamrpPaqWEgAIR1pjIFGlsQ5iKyK93Tz/YHkB2ir8FUD
	11ijPgtzPS6fHrekX80vcJFCdUOpm6pPXPm4FA3qb5n7HAqjvhZ/VUHAbgs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 4/5] virtio-net: Fix a typo
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
X-List-Received-Date: Thu, 24 Jan 2019 12:49:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 2974e916df8
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20190121181335.3326-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/virtio/virtio-net.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index bd662752d2..a1a0be3bea 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -94,7 +94,7 @@ typedef struct VirtioNetRscUnit {
     uint16_t payload;       /* pure payload without virtio/eth/ip/tcp */
 } VirtioNetRscUnit;
 
-/* Coalesced segmant */
+/* Coalesced segment */
 typedef struct VirtioNetRscSeg {
     QTAILQ_ENTRY(VirtioNetRscSeg) next;
     void *buf;
-- 
2.20.1


