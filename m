Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guEYw-0002PJ-MP
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:48:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYo-0002K0-Fo
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guEYj-0002kx-Sj
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:48:06 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:45183)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guEYj-0002NG-Gm; Thu, 14 Feb 2019 05:48:01 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N8oKc-1h6ztO2ZhG-015q5Y; Thu, 14 Feb 2019 11:47:36 +0100
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
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Thu, 14 Feb 2019 11:47:06 +0100
Message-Id: <20190214104717.3543-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
References: <20190214104717.3543-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fMwuivj6jPM8UmCbOAxnZ1XR2DAKcmfvzhgrnENFDYUX+WECKpy
	x0ME08tbSnHY2cImztqK5mgqmGc/a6cgwKlVFQz6jRRV6TdAsQwnt0e7rLDMCMwOArDbaDc
	XCK+P4ySVc9pbRGCCqYEVwoWcOMRzOI4TE9aCHxma7tTYN2GluWJaSneFd2ZfJmKNZVTMZP
	sTbmwGGmmkp3W4EitMM3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DAaAO76alPE=:dDxvoNLHCe6T1BVvN48Iqt
	qLcy3g/RjwHuzMczBDtOqONVslL68uDtmfadqp5mw31/v/Wpd3DNk5WJ4vYsOnBVaWdLHLnqj
	vGx1a0msd47ykLrc5gF3SaSK5o6MRTq0CxVk6oqlQ3qspkU+471/RunjMoei+0IdXKOWSIrbV
	oxAD7PuxeoyCi1YFotoVayU7WNfvqxlLHl+0d+Ynba8SzF7k7EbMLmVKtXHY7XC6oHuJxOq3l
	dW3KbZGdfEl8wFoiVENGReROeaPLlsFboOQHiLR6MyfelfvOMTfoF6L2TjngOUfcwsB6BsQkK
	YiHxilH+CYQRGTfxQxsKDIpD6emCzjt676IbBAMKctZBaiPduLNTfIbT3C/TBqHJTYtYokaWG
	STtI29J4YBljH3RAGelQjVwx4sxnTLCaX5phaFbu8k3L3CPVU1r2fPfBOg3xt4zP9N9epRDoo
	x5ZNHBt/jqlGc6PyV1MoAKXl8/DJB6AkRvFVApbOcQVTSXbAnYPzyG5RelkQtY8nfV/E6v9rA
	/ws2MuNQ2nBwEqiGL8EYPfo1R5a8tC3PBDf5UX7eVNhTvAfQV10doXRwWkTemC29IQRzG7OXs
	E5QnZsoiUC3ty4BqGC37AJ0w8PxX6K8x2bvvua2dmizIe67qsidgKeJxOZ2/1dQKcx/WkrcAX
	ds+tZpQYGIhzwiLNEzg9a31y83Up097PhbC8AYVpmCkrJT2Mi0OgXuOQh5NbkHhffbHcOnit0
	nKNB1eJcr0NrnGkAKLjn6Qj1kp11Y0zPPxqPBmWCfHruCDborGK1ErHRpbI=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 03/14] qemu-options: Remove deprecated option
 -clock
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

From: Thomas Huth <thuth@redhat.com>

The option is only a dummy since a long time. We've finally deprecated
it in QEMU v3.0, so it's time to remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1549545296-18903-3-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-deprecated.texi | 5 -----
 qemu-options.hx      | 3 ---
 vl.c                 | 6 ------
 3 files changed, 14 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 90e5860fd1a6..fe905551c598 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -37,11 +37,6 @@ would automatically enable USB support on the machine type.
 If using the new syntax, USB support must be explicitly
 enabled via the ``-machine usb=on'' argument.
 
-@subsection -clock (since 3.0.0)
-
-The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
-replacement since it is not needed anymore.
-
 @subsection -drive file=json:@{...@{'driver':'file'@}@} (since 3.0)
 
 The 'file' driver for drives is no longer appropriate for character or host
diff --git a/qemu-options.hx b/qemu-options.hx
index 06ef1a7c5c72..77bd98e20b14 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3444,9 +3444,6 @@ Load the contents of @var{file} as an option ROM.
 This option is useful to load things like EtherBoot.
 ETEXI
 
-HXCOMM Silently ignored for compatibility
-DEF("clock", HAS_ARG, QEMU_OPTION_clock, "", QEMU_ARCH_ALL)
-
 DEF("rtc", HAS_ARG, QEMU_OPTION_rtc, \
     "-rtc [base=utc|localtime|<datetime>][,clock=host|rt|vm][,driftfix=none|slew]\n" \
     "                set the RTC base and clock, enable drift fix for clock ticks (x86 only)\n",
diff --git a/vl.c b/vl.c
index 9e4dba7f92f2..90ff23333dd9 100644
--- a/vl.c
+++ b/vl.c
@@ -3735,12 +3735,6 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_old_param:
                 old_param = 1;
                 break;
-            case QEMU_OPTION_clock:
-                /* Clock options no longer exist.  Keep this option for
-                 * backward compatibility.
-                 */
-                warn_report("This option is ignored and will be removed soon");
-                break;
             case QEMU_OPTION_rtc:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("rtc"), optarg,
                                                false);
-- 
2.20.1


