Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMWF0-0000ZB-K5
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:20:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWEw-0000Xc-Vm
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMWEw-0002M0-14
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:20:30 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:40855)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMWEt-0002Hb-JH; Fri, 03 May 2019 07:20:27 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M5wY1-1hPZAr1p9f-007XLN; Fri, 03 May 2019 13:20:14 +0200
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
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Fri,  3 May 2019 13:19:52 +0200
Message-Id: <20190503111958.30825-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503111958.30825-1-laurent@vivier.eu>
References: <20190503111958.30825-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5c8cLYEFEaCDa2jxSETb9VyU7iiN0xkqspb7BfYpEQy7Ya5mkLm
	zkjyVZB3ZGxwEbhwIumSoR7NurB6u/Bf/FMqQ4vXa84eex94kNDNhU/wDVzi2zVlJarrHwf
	8T2YBuIXgCegw07VIvxwW7jlwJ/7BT5TI/KkAQsm7PvUQOC9YsuuPJNFTDBSQNtj3Al1ECC
	XulYxwgxA1EUdHtchJTXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g0W8zismQL0=:pxkC4prXYU02nw5rSx6QwC
	j46GK6ArIz/WRVoPcSdATvxyF89Pvqf+eXpuEKp7MQIejRYJ0vdE17Ro/sF8YY3kpVkI2NrPB
	/E8TgKeJ2PsVzpEsTGIWb3QhH6k3tRmaPCF+vymnifewUZ1jwDskPnR6UlJCz0laxkMcyHn8h
	atQXW1aL4gfq4jhx6AKZfR+2XSvizRrbZ/HV6NU78ksTkGG2VbJJX23uxPWZRVrJxht4UMMGv
	29vZMveVyXU6GoAfdr8Do7FMAje2LcSIaK50qmQRXghFJAfnG3CSruhUzBLLbc3TauqUwt1N/
	mGdpDt7NMYKU6rhdVEVPpuT/Fz1lk7sOPX2whYPiEi57+dHin87ZghZsJwqWb2oXFkQsu2Zxu
	4+bLqEeGl4s23e9dshPm/o6pUc8E/UOMDcwyogPjIxYWxh5+cQ6bCOdy53x2zGHMGeYfAbRnI
	gH134i0BKvsOHNwBS1Dm1VeYl8+6EoAaczqvHIlFED3TTFa5xOI/xzFjaIJZ39mvlCscsLfa2
	75fZ7iIR1nsBlEsoA4CbGC0oZzwAsTWRUGIRvMbXbsJLNDqFLtFfNTpFdwC+d8CfEjoyfMVpH
	NDs4i6KTu0z14nFgD87qdWUNesHBHHdScOuNLmo8AY/UBgv5vrNMKvNMTgeW+qfv0PB8Oy1KY
	WcHkqI23sdw6uWJoZ39ksM8K4C+jjEk7/RdzSAMKo/Avi/4/u6nCVBEWXrCJ0mPHOSMo1Xi77
	UVi9cn96XZ/cTmllIW+F1JsiiihdK16qwOgu7ptU274fjA3EwCyvkOAj1W4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL v2 06/12] configure: fix pam test warning
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
X-List-Received-Date: Fri, 03 May 2019 11:20:33 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The pam test generates a warning on Fedora 29 with -O3 compilation
because the headers declare that the pam_conversation pointer to
pam_start must be non-NULL.  Change it to use the same 0 initialised
structure as we actually use in qauthz.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190404091725.20595-1-dgilbert@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 60719ddcc5b0..a2607afb3408 100755
--- a/configure
+++ b/configure
@@ -2940,9 +2940,9 @@ if test "$auth_pam" != "no"; then
 int main(void) {
    const char *service_name = "qemu";
    const char *user = "frank";
-   const struct pam_conv *pam_conv = NULL;
+   const struct pam_conv pam_conv = { 0 };
    pam_handle_t *pamh = NULL;
-   pam_start(service_name, user, pam_conv, &pamh);
+   pam_start(service_name, user, &pam_conv, &pamh);
    return 0;
 }
 EOF
-- 
2.20.1


