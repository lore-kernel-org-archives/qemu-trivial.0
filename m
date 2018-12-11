Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmPP-0008VU-3q
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:05:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPG-0008EO-0B
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmPA-0007WB-RH
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:05:17 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOz-0007ME-Px; Tue, 11 Dec 2018 13:05:02 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MEUaQ-1ghAeQ0gR8-00G2X1; Tue, 11 Dec 2018 19:04:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:40 +0100
Message-Id: <20181211180352.19644-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lk2OrMG6TiULELtIVres0tCUTgZ6XTx41hqhTO0182a7TNxct2N
	8GxGD+Z3KWgxwFbjDxOVv7oDWkZhpu4U2CLltLJyvi2jKbClBSZyHk2TgxpohJqAIqKkp9Q
	BP9010+b1aZRo5XywBSGPhb/d7Eg7p3RLR2Ja4sFe8hCBqHhTDxB48dnjDklDet9nc+3eHB
	aZp4UmgUzq74aC3m7uSng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PjPyPKSSdqk=:0XAhs7nzqt+cjC+aRZ78Bb
	zevzD0Oewo+Lj3Y8GQtr/8lA0ODKdDs3QmEbSQbFdM25dzNVgjndGOKXORw86QVU/YeO7WEhM
	f5Hwb2ntMxo29uM2dYyfSqSmUOwCX0hBbQK2KvrurLag8IkRcys8MZjIl2PRfOxjzzlilUloD
	aOdI9p7OMa+1cwyxb2odPmHDe+1QDIj6IRnOxtakHwzqEh+7kuGFSoxOt8CjRkMfAELOE3kM5
	R0N4DRNCfBOnLXIlgPP9s6BzPRL9JOExpguhNzTmvIDi62rnNI+NwitzhcUCD00vHZwx3/yKI
	eOTwZqmppJKhNf/ainOqchFTq04smv8chNsZ5r0lUi5H7h6wLivxj4o5ySFMH5a0gWUyuA/YP
	tZIDeYROCZQAnkP7JmiyHCi57DdCBkC0kQmP0v70zXf0yHBjpxbOSbmHNJ6abyvUYY8V56C5z
	V9AM6dQKWNqbGAiRv3fdOu8iygc1Ee7Ul2zpV5DBMzJ+YmB0pk3H0F/ACRLEo52yTLqHpal+N
	3EwKoWo9r1WB8k4dgS/9AQNWZYkltYhlJ/Dglvy712KzxAUwXKn4mgmhXJw77yv8bOJ8BeQl+
	eXknWzjaSI20XJWx/l6Hcqn92ipjJwGVh5qQ/pAOwn5kjwtnkmtk/KJhwo24nYpWGqHsOHPwD
	AJZa5+38v/ybSiil5dZPdGxl02yrCHldoq2MZuzXTkNqsCH9U6wRRC81EzTJ9C6tzcO6S/mbl
	iovxqMfjyg/oxk7mYb3nD8Iit4UkiYJXmeOpJnydUPwl6ehB52jZEDFe7UQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 18/30] MAINTAINERS: Add missing entries to the
 vhost section
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
X-List-Received-Date: Tue, 11 Dec 2018 18:05:22 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181125205000.10324-15-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7bf9c42a9..381c39b6d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1382,6 +1382,7 @@ M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/*vhost*
 F: docs/interop/vhost-user.txt
+F: contrib/vhost-user-*/
 
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.19.2


