Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMGvq-0003o5-7R
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2019 14:59:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvo-0003lK-1n
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMGvm-00035u-2V
	for qemu-trivial@nongnu.org; Thu, 02 May 2019 14:59:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60361)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMGvk-00034c-34; Thu, 02 May 2019 14:59:41 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M27ep-1hJmsj1MmP-002Zci; Thu, 02 May 2019 20:58:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu,  2 May 2019 20:58:29 +0200
Message-Id: <20190502185835.15185-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502185835.15185-1-laurent@vivier.eu>
References: <20190502185835.15185-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H2H9MCyc2DmTRCDkaDfCsZnR9i4GjOwsHzexMHM4iJ4N79E0Nrz
	z7VLPeXiOB609DA8DfrC4ik8IZKVf5d0MSqPEVo8crqjMwQtJ2dLc7KJ4uzbNzIeUxEHYIT
	aAHqXjt5T1S3dbTLuarmRJGDIhGzLC3tnP9d03slfkvQiN9iO0VHNRy/Dp2ppNvbsxwNH5g
	lZDDJJAUOP3QsDr/bl+kQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RDClypQPHAo=:nkd5Cm1c8uUMu35oJ6Scbl
	qJa7kaujlR7g86WeB4W+yFqLlJaZryPcQi1BWS+UmUXFfkqQehSwzMkrod8cwu/13TqeFPg1l
	GIFyhRttLWCOV3lVuKu5bunRWXw9HrtnQn68cdqa2Iq6XCrNkDFRLPNYQTHn6uRVl/OyZEqbb
	zOaIHQ2kL8Ac7cDkNg3GAIrakAsVsWDtmlDD5l3XcFv24fTIY90G+68qopEwHsXCixjqSOnNS
	b8no5/NLsV8ylr+2REYvuN7x9wNT9LYoA2bRaXT2Fyl9gVAfmGOECDyNA6FPG5h3P+k8aThFr
	+MWV/cSs9u5P68jOTO5M5KMIek76PyCLvR6GKzYAswksPAqM3ufCjTWGHBU2PjK6vehTY+FJt
	4w0QqHIwxVaeY3PnqfQA/C4N6ciyo2T//TLhtQ3W9zLQB5X/GMFJyPHbKaD0Jdrd5g3UqgUAq
	TVWSsznG8kqaETVBsMI7e2jj0uOguqQjC2mkLTOeMSQT19YDs/WBC7cZpzGGb/A9YiZcZP+MA
	7G1SseI2/Ek/0+QBEP5ousAehPmAuggCof4C6x3eKYvnsKsAmsBonV7SG5kDSt3beQJtPldOB
	3Q5HkUmXCbBFYvcydFaTB9KX/KsS7eEogR5WVlCK10dSBFKjlp65aZbFNKkosJyEOTQ/Diqaj
	JgpZowm8HLLBMisbJ0wLVmZXrNTq9PC+gASNUXVjCx4K7p8+zDVBqJNgikmFG/oQ315vCoXCn
	ZwbZGN+SHB6yLzxNg6yzHMxNNqOVN2hXYNh7Hvi1PZMttsXbjTlyZ1XEauw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 07/13] configure: fix pam test warning
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
X-List-Received-Date: Thu, 02 May 2019 18:59:45 -0000

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


