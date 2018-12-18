Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGNA-0000s1-RM
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN7-0000oI-IR
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN3-0000ua-AZ
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:21 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:40763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZGN2-0000th-V8; Tue, 18 Dec 2018 09:29:17 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N9MlI-1hVoUx3v0e-015Gt3; Tue, 18 Dec 2018 15:29:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Collin Walling <walling@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>
Date: Tue, 18 Dec 2018 15:28:48 +0100
Message-Id: <20181218142851.9477-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181218142851.9477-1-laurent@vivier.eu>
References: <20181218142851.9477-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zyTwx9I95ECyY3vLXCCHFRjIPjvJ6M4+GhOr9BUJjsY4Xr/N5yr
	GnFUdS3DsHfuvjwTWtF768Wj5QT5CEKqxJkjdRWsqCHfb0k1ou/h8cho+E9y+DbIeXPo4k0
	LxOj5YyCimwfMux8Ywus6rrp9x/okXkeifc25jAIFcp7Uu3eWAic5NdjJiqDBWVSOLxWNPj
	vdTDfqODlE63hiBB7g/QA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VZB82eZAQ0A=:BfQ1Rx/QMXxIXFzpkoq74e
	qP7gtPTGQbH9aKCgL2hdsg03ExKaqRyep2PXK0EE7RvZfPh/QEvEUoz1zld6ba83O8RFZCFQS
	ieQCuugtJzN+tGu/hFfE430TozSsk6Pa0pAFvOe2ybST6qQwt+1sbNbaA/M8RqllCChOam1wo
	lvSw/kV9vt6OQevBtjFzQVJFlWxILwHmRJMigqGkNALXg8JYGljoUxqtV1+8wVxqSBCi8WlLF
	R0OdhuA/+sfEY9TEN5sB3VzoyQgsp+EVTF/DIqbCGebCVvEyY/J9HPPaJnSQFUUSKD1KLsqYS
	bSpDi+usZT1DmhA6G1RY/evQwTgEcEuDg7rDiBhaxEwvaiYhZhd6HRCDEVb76xE09akPKqMF9
	2mrzShArl9eJ1Fb1/klYHnkX/SUgIfuTfxNSwcAluTOI2zUpcCUe8HGi8kNKfoPF0BmGToEXz
	rDXOZZs859nMbe47F0zmgqdPmuwPdtexY2J6voy258VAKiKRi6N2WHDAOD4TijDTokTfSxieC
	EbPdmJW0yDGdQLZDh5m0wQ6GptOh2LTAEoXbFbrK3IPF203Uu1jHkWqACWJ/ey1ZAEYtVRNJr
	zJO7MbE/xiEVQ/okCIiIigtj+Vc/ENlWjLmc5xFL/Yh/On0ffZD0pCgaTzTBA4ClaVF+GV7jn
	ZGZEgL5bj0gO+C1JKbW/H5jjyqf0OlSyVUamQXjTgKzjkNddcWtS5CjqVQ7Njgt/r9SRQr2rc
	cI7kzCD4Cwk6OnbXNB19vifw5O9yEjovT5E8iZs5j27i/9P2Y3gag2J9SXU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 1/4] docs/devel/build-system: fix 'softmu' typo
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
X-List-Received-Date: Tue, 18 Dec 2018 14:29:23 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181128153423.11916-1-cota@braap.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/build-system.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/build-system.txt b/docs/devel/build-system.txt
index 52501f2ad9..f9fd27fab0 100644
--- a/docs/devel/build-system.txt
+++ b/docs/devel/build-system.txt
@@ -393,7 +393,7 @@ all use $(obj) as a prefix to the target, e.g.
 This file provides the entry point used to build each individual system
 or userspace emulator target. Each enabled target has its own
 subdirectory. For example if configure is run with the argument
-'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmu'
+'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmmu'
 will be created, containing a 'Makefile' which symlinks back to
 Makefile.target
 
-- 
2.19.2


