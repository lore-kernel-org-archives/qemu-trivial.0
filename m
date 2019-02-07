Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grjWU-0004Pn-R5
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 08:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWS-0004MQ-2o
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1grjWQ-00084Y-7W
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 08:15:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1grjWJ-0007h8-IZ; Thu, 07 Feb 2019 08:15:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C53F2AB403;
	Thu,  7 Feb 2019 13:15:10 +0000 (UTC)
Received: from thuth.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E8157C82B;
	Thu,  7 Feb 2019 13:15:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu,  7 Feb 2019 14:14:56 +0100
Message-Id: <1549545296-18903-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1549545296-18903-1-git-send-email-thuth@redhat.com>
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 07 Feb 2019 13:15:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] qemu-options: Remove deprecated option
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
X-List-Received-Date: Thu, 07 Feb 2019 13:15:21 -0000

The option is only a dummy since a long time. We've finally deprecated
it in QEMU v3.0, so it's time to remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-deprecated.texi | 5 -----
 qemu-options.hx      | 3 ---
 vl.c                 | 6 ------
 3 files changed, 14 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 90e5860..fe90555 100644
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
index 06ef1a7..77bd98e 100644
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
index 9e4dba7..90ff233 100644
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
1.8.3.1


