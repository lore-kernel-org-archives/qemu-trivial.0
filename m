Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOL-0007SQ-VG
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOG-0007P8-JC
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOE-0006v7-BN
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:16 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:37243)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOD-0006uJ-Vy; Tue, 11 Dec 2018 13:04:14 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MCoYS-1gfXpV3o1o-008srl; Tue, 11 Dec 2018 19:04:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Date: Tue, 11 Dec 2018 19:03:28 +0100
Message-Id: <20181211180352.19644-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z5bX8gz6MFEW6bVIxa6soa6jRXAFS+jC6z8khHFDqOmkzpdQhNa
	LIe4s4qN1KiId+xyvisKBVmFZvCFC7DxtaT622po6Nx9rymDerGbgHXpJhgzEFo4zwt4Fls
	SLVvIC1y6iAI7Cb9ZNMUIGz7yTWfdpyhSJz2JVGMgvbDB/VPh6IVb8wcOmsbA0nvpwm25mg
	l8pW51o1rfy/j3knlwrNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BileiT3Smeg=:MYgWv0e8mV1K13a1Kg0DFK
	kuMv7+tOeQ3a8glDoWcqVYt4Ee72kyG4NXU3mcvSJziVp83n/V0JUTsOs8r2dRNAf3IXZgtp0
	e80J1xmWuZ6U22iIigDa98iALFqOCaKZnQM8Q04VUPJpTKjowXE35zLIDD/V3C496H8H5Y+Oa
	xUaZGXJrGhRFdcmKg0ucUEP/1ERsvh+us/jhU+EkYn2qwJetbCTcvl/lrh7O46vK9hJyhC/HJ
	ZDDxSqiAm76Jj0D3N3hLIvfhIRJilB+QGzlHZVtvAMew1FMOY2PoKqVqWeBw//EfNl63ZPvdF
	a3R29HV8pJjr8hcu4SMM3qM1yPqT/t8ps7YDpItbmjCD1tSkZflPM6Mbwm3A8F7Dae6ef1bDc
	x1aH1D1ppSlM/FdhZQeoHaCDF6e71XjVqXEzdqR4kVztjIP5Cin73gIiqeSEr8SwU/wSs8g+w
	q3CzdjVeNI601m7ar//Uu4oS6A8gZZ+utu8AFGpjh3rtCnxt8H4DJdhWYQMG3tfwGHyjVX4B5
	g1EZupxPzEHfaRGvOZgb7XgA4mDElifqwAVhwWnZ86l4oupXMF8ylfoYVoaiSxdB2xEg3zFWR
	pvd/92kDAT5CxLUl+EJPF9kZSyO+nXloIQ6OkjndmqVZZIqYDm7vtdX0J2zlfdbCTxdGwSkxj
	eT+80rChtNCPk194qxwdnArkXrdxixRZAPO0RSxI/VK6PqpTxM1knOXgeEhihL9L57DF/ZYvP
	rNG7LEDzHlx0zWXwQBp0ML1RXFFDaJLcHTlwmfNuZcf2ZVkDh55gge1hWFA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 06/30] misc: Avoid UTF-8 in error messages
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:18 -0000

From: Eric Blake <eblake@redhat.com>

While most developers are now using UTF-8 environments, it's
harder to guarantee that error messages will be output to
a multibyte locale. Rather than risking error messages that
get corrupted into mojibake when the user runs qemu in a
non-multibyte locale, let's stick to straight ASCII error
messages, rather than assuming that our use of UTF-8 in source
code string constants will work unchanged in other locales.

Found with:
$ LC_ALL=C git grep -l $'".*[\x80-\xff].*"' origin -- '**/*.[ch]' | cat
origin:hw/misc/tmp105.c
origin:hw/misc/tmp421.c

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20181120203628.2367003-1-eblake@redhat.com>
[lv: added command line to find non ASCII characters]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/tmp105.c | 2 +-
 hw/misc/tmp421.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index 0918f3a6ea..f6d7163273 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -79,7 +79,7 @@ static void tmp105_set_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
     if (temp >= 128000 || temp < -128000) {
-        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of range",
                    temp / 1000, temp % 1000);
         return;
     }
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index c234044305..eeb11000f0 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -153,7 +153,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
     }
 
     if (temp >= maxs[ext_range] || temp < mins[ext_range]) {
-        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
+        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of range",
                    temp / 1000, temp % 1000);
         return;
     }
-- 
2.19.2


