Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHS8x-0001q4-Hz
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 07:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8s-0001mt-AG
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gHS8n-0002sm-92
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 07:25:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57849)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gHS8c-0002M0-In; Tue, 30 Oct 2018 07:24:48 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqsL3-1fn0zx1rWb-00msqh; Tue, 30 Oct 2018 12:24:08 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqsL3-1fn0zx1rWb-00msqh; Tue, 30 Oct 2018 12:24:08 +0100
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
	Li Qiang <liq3ea@gmail.com>
Date: Tue, 30 Oct 2018 12:23:28 +0100
Message-Id: <20181030112337.17973-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:Yjf2ebhyBBOqqgfJyr+mzJqt5S8tkY4j56FZpmecQpTDZ/v4uOU
	faHtWIUMSDvWVYzOvNMV2egasm5Nv/Sw86QCJGPHvRHZetzWLbGZLwewTg1GN5UCCMix8Jo
	2Hc6CFJ9FGlaIpdH5QdtN9CSvoHAfCACXeilSysUSbI5v9quFdAc7IvB9U0JMUqXumqcrWc
	MVgQ5/EvTTQjlLI0YXZyA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:+LC4JChDFpQ=:9My5E99dnArsVIYlhHsbIJ
	xKWIRA2JWFSl805LKNHOY1RAxyIY+ZYTJ5K6DqhsBEIQ4ajsStioOlZb6tKb++8xKxB/8LzWY
	nPlFMX5w6CJDNQJxGRR82urgKZe9kdl2n1lT8gK/Aj2H99P4hB8onnq8UM5f0lL4lNy3CyiHR
	Xe1uqk72xRUZYQXHBxB3q3YgGA2+CILp51r54byEq7p6rMz9jt4++jmVG2QYG+ghzKhOPitDa
	8Bn0Q4i6d8kAf2fmjLMgUwr0YkxhlaJ+BPApJsb/5iYsk5K6sf+ADyjNgAEFRs+UzDZWG44FT
	G0XWc4RXKnXYNWBaQffU1G87MSrhpgHKnlTMgnLEZVqFwQagiD8CmWgZfVI89Jxz8xNqF5A+B
	dSni8uFfc+b3ZFWdjsxynYkKT3QIqD/b53JcLstaSkWrnpCmGw0dkN4MohmDtzGjBLdIeOGLd
	U8nN3HmZAlj6QyGXzQJwOG1RkTo8dDomSh+k0JVIT58cxodTQdOMEAmlIhd+P2/Dr5nBrOUeh
	HUpKr2NZfCTOTIVIwlggRkqWAqZGMdIijZE3f4C1rLcFGUvxc+cGvERszEBBjNxHZrlmzS+D1
	nwe341NK7vXSt230PYaSv+YX0Z5xsmWgxplU36y6npeIB8hugIV8iN3ig4ttKz81VTfwNu35I
	i/YFCCaTYbQnnqOfRkMJKwo9McooJXQc4tDF43rwWo9V3IH2ftmEFFlfw1qZM2ZUHJYE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL v2 11/20] cpu.h: fix a typo in comment
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
X-List-Received-Date: Tue, 30 Oct 2018 11:25:06 -0000

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


