Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWE0-0008B7-2w
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:19:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWDx-00087z-CQ
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWDw-0001Cq-F8
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:19:29 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40219)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWDu-00019Q-8x; Fri, 03 May 2019 07:19:26 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M8C8J-1hRl140LeF-005LgM; Fri, 03 May 2019 13:19:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Wei Yang <richardw.yang@linux.intel.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Fri,  3 May 2019 13:18:23 +0200
Message-Id: <20190503111832.30316-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111832.30316-1-laurent@vivier.eu>
References: <20190503111832.30316-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:r+Vs6CZi8JNSFr8YokVIJ911RTcHv7fk6gLBqkk4BiIkk0vPIv/
	mYR7ejTgx0HvCDNHZ+QwH5uUenYpyzUk8DtnaewHB4MSr2V9IcoeHNtCUnOnpodFIDnpAcX
	NOErDHKNHS5kGTl7YcQc82uqj+P58pF5Ok4TfqQ1a2tom9fuNTAWuUZLA5AmWAV9CdiR6uJ
	OxjczUFGJFB7Nhd801n8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zM+h+jotzoA=:ajt76nf5ZJpNMR5fH3HiEy
	020n9ugWQ2TVITlQpm37Wy68gDZ1wsQ7fxxd7KgDKa7ocrXrlIkfrHT/CCZyJEWS8WrqoOx69
	DFGJRgmywtED+JfUaa4v3F7xOgRI6Ef+5RVesr1rhysfQKbG6IboI43m/oxjFiay4oheKxcA4
	3wZdYnVGrNj6ycAZFXBdK82eDXkV4A3tYQdBNTHOyoBQSPcDA0m0XWUxfGhUYTxDSVwfLTHE7
	nDVYYdcuEWsagw30aAMQwcbscq4TMm6JpRIClAtl+F1jvZdEMQc0640ra/7OqzeYQwLWIzr55
	zrcI5v3ILsRbomqOSD/aumnqbdjhwWeB7bGXbyikhqRgfDtMxqT+E6L0XyTV+oSxJAzhMBaZ9
	vRkYeEvBzq/1JKMN5na5DxLpAjS9x8H3mDpV7jrfwALJsQD8m9gG/Sys2Ct/QaxkBsbwbrtuA
	Y863va83QAHQt85IWBUpQQGPGjz1F5EhRWs5IkyUcB9R/pPn6s7BzqcqaWGlbOXJsTV4GWZUj
	Ou3Gx7ETeofKzgQNyAvJVmHm8rzju082XYxciHth/XAlzCC6TnK8uJPTSBiOFsGZYULXhxqBU
	Xs0tohtHA/ieXf4ck2xJ1zq6fqpBij9CTBGaktP9pANhnfOCNyl2lW0nfGmnTmvWPPxEO/1az
	A8zI9icavVfpq8awdrX8jaZEREbIUD8vorunmsE3palp0eqLi4ssYVT0fszRbi8sqtuqVGXkq
	U85BeS3qqR3kEDQxInraYa8sof3AOMyNsvr4+NqvbtFB2QPFVwJJIiP0OUQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL v2 03/12] CODING_STYLE: indent example code as
 all others
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
X-List-Received-Date: Fri, 03 May 2019 11:19:30 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

All the example code are indented with four spaces except this one.

Fix this by adding four spaces here.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190304071631.27567-3-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 CODING_STYLE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CODING_STYLE b/CODING_STYLE
index 90321e9c2821..cb8edcbb3692 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -147,10 +147,10 @@ block to a separate function altogether.
 When comparing a variable for (in)equality with a constant, list the
 constant on the right, as in:
 
-if (a == 1) {
-    /* Reads like: "If a equals 1" */
-    do_something();
-}
+    if (a == 1) {
+        /* Reads like: "If a equals 1" */
+        do_something();
+    }
 
 Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
 Besides, good compilers already warn users when '==' is mis-typed as '=',
-- 
2.20.1


