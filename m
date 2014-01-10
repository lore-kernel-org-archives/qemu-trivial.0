Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1sva-0001Dq-Su
	for mharc-qemu-trivial@gnu.org; Sat, 11 Jan 2014 02:24:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1W1k05-0001L7-PE
	for qemu-trivial@nongnu.org; Fri, 10 Jan 2014 16:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1W1k00-0002S8-7g
	for qemu-trivial@nongnu.org; Fri, 10 Jan 2014 16:52:21 -0500
Received: from mail-qa0-x236.google.com ([2607:f8b0:400d:c00::236]:54864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1W1jzm-0002O2-SW; Fri, 10 Jan 2014 16:52:02 -0500
Received: by mail-qa0-f54.google.com with SMTP id j7so4681108qaq.27
	for <multiple recipients>; Fri, 10 Jan 2014 13:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8QTj3w8NOfWnXUsK1+hM0mdnMzmz0FfOtuphPUC23FM=;
	b=vF66o0h0USlqc43CsxYPvQRzUbhLpA/4fZbzy3f+Zafrs9IEl4j4U0QqVatsd0kuXj
	eOP/c/HO6U0MIK4VquOn9sBJWSZYHH7t4dtIloyG7BA/J9UXTwxnvZvd6Q1KXM+2tz7N
	pmFLRgFUT8lsfMFaq4YYc8seYeCZLgUYJeaoYkkXA1HACQONdz3Gt11HJ31fH6okERmg
	Xmr/F8tJCaKP9m8K2fQyBe4l1cwzTNaoJIGkq2ET1DVbruU5uMzJwR0OCKKG28/nUthh
	j99tIbHtS5rReLHwTUlwHOMm2owzPFrQ79Nr69GLY2PZlJiChfQq3DIUd4WGd1Z8/3e5
	mRcw==
X-Received: by 10.224.172.9 with SMTP id j9mr4983078qaz.96.1389390721951;
	Fri, 10 Jan 2014 13:52:01 -0800 (PST)
Received: from ERROL.INI.CMU.EDU (ERROL.INI.CMU.EDU. [128.2.16.43])
	by mx.google.com with ESMTPSA id o5sm15041020qeg.2.2014.01.10.13.52.01
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 10 Jan 2014 13:52:01 -0800 (PST)
Date: Fri, 10 Jan 2014 16:51:49 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20140110215148.GE1276@ERROL.INI.CMU.EDU>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::236
X-Mailman-Approved-At: Sat, 11 Jan 2014 02:24:18 -0500
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Include bios-256k.bin blob during "make
	install"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 21:52:27 -0000

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bdff4e4..807054b 100644
--- a/Makefile
+++ b/Makefile
@@ -290,7 +290,7 @@ common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
 bepo    cz
 
 ifdef INSTALL_BLOBS
-BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
+BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin \
 acpi-dsdt.aml q35-acpi-dsdt.aml \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin \
-- 
1.8.1.4


