Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYx-0002Qv-RB
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYl-0002I5-LY
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002jG-Bu
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:03 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:45785)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002Qs-U4; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MFKbB-1gromo0Tur-00FnyB; Thu, 14 Feb 2019 11:47:39 +0100
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
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:08 +0100
Message-Id: <20190214104717.3543-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G6beaHq4Do7Rtym5Ov/cf+L4w+QN4pQnn2pIgj9nDQn1zg4P+wY
	w0ruR2VNdDJMhogsglfXcw/WQb+/ha0CT7aQmef5A9SuD3F19Ci9RbgYsKuMvyzpqGYEEZf
	nbdBmAsVDJe4ZPemZ7lKnUKmA66FW47JsM8iapRovkIqQC8xN91AkojLs82VOYrfcrxWFWT
	L9Ow5zBL93473bGKifvng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ixSXCtuTd7w=:8QtMcCXviHZiZk0qLhO0UQ
	QcsMtdr0EN5ygskIUlAYgPQ0Cjrwl53Hn7xWHupsBZgMyxfWmT/Iaeyl3gDhXuNUUB9jV70f7
	tz1j6vVASG3Y+1HUXBf136Re04nvqrr47KKmFEMR/yJa5apZazk4/+VB14gYNqZiYwcw8L+1I
	CppXea22FshDoCucdGkLz5iaaY8MuNCWncBeNvLRXcLeRc/9T2dn1PYUVJdrozSp95SiP4Eru
	KaUhBZtO2s6u33r0kmAr6+wfGTIGWDAO9JCIu6hFNcn2P6M/lqxl7GhUSBdMAbjLeH/87fPIL
	ch26m1VHoUF7KutqSjmScW8fW08cyiRajcKQV36zI2xu/vtRvs1cDC0UTHVqLqERlkISzzXCJ
	nl4lJquwp1vbJiGFjGj89CHzHk8RhfL0ipGJ9qpaaSszBJuXcixOHoL9dhus4KSO7XgX6OXgc
	O/HO7vegU6Gib3fb8C19cw6UoOixY8rXR7ILajlV0rNWoIkQHzwhg4b7Hds5bMPlvoxYCg3s1
	c0R+VResVtvHtBEbB6fQJr3AM/sqNMIl9RaragWGju3iWYXtWgDxwjqHA2cG31uSoRj0HMals
	610B/I9sGFQyC1Oq7pn94O/HyT5AInN8STpHcpVwtKQ5cyWUh4R/7qotuqw4uVee96T3MEHA+
	5ohzOj4bbmoSAdmFjnQ68TJdXLfK5uyh20ZDwBlE6cfwJpQ1uVnJS5RL2ciuFwi/GbJY/wX9F
	Qg9AYlhvve3XA4o+CHc1uRyeNnoJhgf1BmR3bB8ZOSPOTc8jgvCDtdvlOC8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 05/14] configure: fix qemu-img name
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:11 -0000

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190207193605.25676-3-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index ff55e2273e9a..c8fc1647fe69 100755
--- a/configure
+++ b/configure
@@ -1768,7 +1768,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
-  tools           build qemu-io, qemu-nbd and qemu-image tools
+  tools           build qemu-io, qemu-nbd and qemu-img tools
   vxhs            Veritas HyperScale vDisk backend support
   bochs           bochs image format support
   cloop           cloop image format support
-- 
2.20.1


