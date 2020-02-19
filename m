Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ8-00049B-8r
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPl-0003dQ-J6
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPk-0005FW-Dz
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:09 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:48735)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPY-0004wJ-KJ; Wed, 19 Feb 2020 05:16:57 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MA844-1jBX864Afq-00BZbZ; Wed, 19 Feb 2020 11:16:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 qemu-block@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 03/17] scripts/checkpatch.pl: Detect superfluous semicolon in C
 code
Date: Wed, 19 Feb 2020 11:15:58 +0100
Message-Id: <20200219101612.1033925-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IXjQSl0/la5Z164rm+NUocD7xxaoxaSU6n1TNuuHRPZySrnB6ZK
 ERe9mV2ShoYfilQNcB/XWW26hyR3PLF4xK4+AmGpRcGl3/5CD9liea+WM0dbL9DOi+qkCeP
 QuR2bJN3cFWKOsZNa6YfHyJndq8+/GWKYzTDzP5C74KkPHePbTCmVZg4fwhAC7USJnIHXFj
 bF47FrPpZzFc5ljlKUGag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AkDA87X+Y5E=:6ksXsQXRv/pp0BO0P6vdkL
 o/cUtpoes6GpFbmnioboLNgjaKlV4Dhc7/87lXiP++/TDvJGwn5TySJ3ZoJM69bl67Uh0L4S7
 jALtHU25lPO1+uif/yuHJBLir6mDnfGbLhezdXcuHLwhv7m4sTS2PWIWA3A9burkzV0jGmMC+
 OvAQumCZj8zS1BuLtg8cQFGFb6tB4qiMXbtACVYcMIo5t7lKDLgirJOrZ2GXpg/6To6V6GCwF
 //Gs7Tp0epABuZsTCsxeQJNIT/qJjsiMq2MSpvHIATR+mTIXkPYIfHLQjWliyKmGHhAS5g3ca
 Jj/Xh0A3fl1J0myDlkrFjVXprYc5IfWmYhS7AmRnDtzclQI07atDTXK6YE6njQVBwPgA2geLK
 zFi+sZgY2L4uEo17kUiNm2dIDEVRWTDQMEeg9UQd3hzictBTULpxJdYGpMhIY34AQ9s12AHx9
 dgqfVWxZ0AGDHeOPn+P9LEaQ0CleOfpuIBsvPElMrw4IMKQHAr1/HKx7cm/SjOlxf2smfsDbR
 4s7qJQPn/vvxXvJSVacsEJTUoCp+3e036hYnbqNVlKfi4WkhU3puasGfDAk0K/1sdsmm3cHVE
 xdz7EdAhPu2HxPg9px1WILlj5xJ+pRFKhxYE9Rf30RkFDxdTw9u1SaXt0sg+dbQD5fErstm6B
 s4UEzPDCssKhyJyvhJfYAvLgvuZi1C6DChw1wk8ZjtKIW1C5agBWBcnKXk2nIHwW4LdwgqJYv
 oUniudlqOJq5RndusmdFVoHV7eGkkfZb83gISD1duhCvAxvXycl/OXK3DYnbC/cIe+awVbCt2
 ixwyqBRUOydiBRtsVzi6p/iMLnqGZ0FzObvMiR2E1DbfNcJkGXVSIVOF1xqOebA0tj8uUrj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2020 10:17:15 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Display error when a commit contains superfluous semicolon:

  $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
  ERROR: superfluous trailing semicolon
  #276: FILE: block/io_uring.c:186:
  +                ret = -ENOSPC;;
  total: 1 errors, 1 warnings, 485 lines checked

Reported-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Message-Id: <20200218094402.26625-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ce43a306f867..11512a8a09b8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1830,6 +1830,11 @@ sub process {
 			ERROR("suspicious ; after while (0)\n" . $herecurr);
 		}
 
+# Check superfluous trailing ';'
+		if ($line =~ /;;$/) {
+			ERROR("superfluous trailing semicolon\n" . $herecurr);
+		}
+
 # Check relative indent for conditionals and blocks.
 		if ($line =~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\s*#/ && $line !~ /\}\s*while\s*/) {
 			my ($s, $c) = ($stat, $cond);
-- 
2.24.1


