Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEZ1-0002VR-8L
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYt-0002MT-RN
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYp-0002sy-Ci
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:11 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40345)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYi-0002TQ-Nd; Thu, 14 Feb 2019 05:48:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MQ67s-1ggyzQ0KCO-00M1Dy; Thu, 14 Feb 2019 11:47:44 +0100
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:12 +0100
Message-Id: <20190214104717.3543-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oGbypwVScPHHEzj9ZvWC6uTpZ9QmKHA9ZweDcvFgFw4KlmgeF8J
	GfyBD//AVbHoQWFRz3qgJQZDYxqzpURK0p6SshkWcLpjcIZHqgZrE3FFOKLrzFqgEXo1z9N
	iBljts6IW9ZspTZA2yy23QX+NajCsJ1clua3S9BU+t89D/7og3oCA9zO+cBAWf8daDfgdZG
	QMNSNnOBEQ/re1PzApEVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dtU9daHTNIw=:GnukZdjyBffmVVs7hKGk4M
	CAco6FUK5YZH1oIr46EhswAghQ5H+YKJYg9zo5n7JTClJ6NwiBX7fvxOjfWdxT4U4GFhKZ+b6
	GeDRWaPQ36yJOnw9pILnnhMYwMZDSN9reCV0Gir5BsBng6hPNIGjHU9OkgZTlmZd/cgJzrM9d
	n8bWMCbfs9DBrV8TtTkI3rlUqYbGHIjAO+JlyjVmgFXBjM10Ixogw4HHGaVIKa/Y75a7GxBpd
	LTeVDp3ubc8yvy84gThS/FbZTrubgOcfnfJfwL08RG7XUIksp88mnJ/M1DcLcN4F0y3u34w69
	xJ8uUKnF1+fLsDZTnkqL+7W0MzPYR63gcClMzEfsn+8sdre02Vs3Onc1cwHAj2R6vGYQxxJeL
	+WJ0VEIw2NjXVjB/1LY3tFLW7aVlJ8T4UuhzrOhXhrwWn9WjyXJupeOyjJMjjlOE1AMk/5EWh
	67dqBM0ZKSh63R3yjWCsGfr6OTWOCYJzr2uaMxgAZriq89sz0nP0J4FG2kaNy68FC6hX9P5sL
	Ew0RoIbiGYSXXzrdHHpdrTqwCWYoqTOc73R61daSYih2f/WZh+gtrcI0qiipeW6gJ5ty+3XDm
	74cCl6hLgiFKPXeHgFshleFR2jHTAZb0avIkuWzRSvuSlNDJ95EwIz40rfG2MNmeRfxTleRDn
	K86kUpA7RVrt0DS/bWZqAa2ERITToUW2ypO7/2a12oS6nIR6hceN0E9AyNtx2qOahthZ5th74
	6jDKX5OwSaapcgdG0gbcOkT4j1nh1AdzYeBaZNMN0ylURpFqeLJuX2QcU+c=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 09/14] HMP: Prepend errors with 'Error:'
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
X-List-Received-Date: Thu, 14 Feb 2019 10:48:15 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Always make error messages start with 'Error:' as a fallback
to make sure that anything parsing them can tell it failed.

Note: Some places don't use hmp_handle_error

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20190212134758.10514-3-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hmp.c b/hmp.c
index b2a2b1f84e33..4d14718fea4a 100644
--- a/hmp.c
+++ b/hmp.c
@@ -62,7 +62,7 @@ static void hmp_handle_error(Monitor *mon, Error **errp)
 {
     assert(errp);
     if (*errp) {
-        error_report_err(*errp);
+        error_reportf_err(*errp, "Error: ");
     }
 }
 
-- 
2.20.1


