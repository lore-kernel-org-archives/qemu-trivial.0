Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WBnPZ-00010N-Mq
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2014 10:32:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WBnPT-0000rV-CQ
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 10:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WBnPN-0000Hy-RD
	for qemu-trivial@nongnu.org; Fri, 07 Feb 2014 10:32:07 -0500
Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232]:45598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1WBnPC-00006H-Jz; Fri, 07 Feb 2014 10:31:50 -0500
Received: by mail-qa0-f50.google.com with SMTP id cm18so5376964qab.23
	for <multiple recipients>; Fri, 07 Feb 2014 07:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=KSyO477MCRpuyxg5Q5zq/09ZEZzbmLYvcJ1NU/xnHm0=;
	b=gbZF0J+d8UZUAliYm8Eatwromh/srgVeFg5+TrAKvsz+qHVnKyxtr/sGL67I50/Wps
	P/6DmTcVweRNjkHv7C1LINRtHdxwBIMY5Ge+L4wC+oCZfs3BJi6iZMhT3KqGozmjngnj
	skTQ6lPOb75gjMpA1EpWGm5PPUeKwdqsa9Z3lbWAYSAr3awbYXj+O7vDBUipVsH0MLgF
	etHnpFZhDezzCbC2HWfFDF6kVLMklvBxmfudDwwU9aprmcJB6skkEtovnZPaqXmlu2ta
	oK7zBx8M6Gnj9Jd733ObkToxkjm7T0oMfsIiehvqhcpSNQq0SNJJFthUXByvIdrn81vZ
	ht5g==
X-Received: by 10.140.86.116 with SMTP id o107mr21468062qgd.67.1391787109836; 
	Fri, 07 Feb 2014 07:31:49 -0800 (PST)
Received: from ERROL.INI.CMU.EDU (ERROL.INI.CMU.EDU. [128.2.16.43])
	by mx.google.com with ESMTPSA id v3sm14308711qap.4.2014.02.07.07.31.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 07 Feb 2014 07:31:49 -0800 (PST)
Date: Fri, 7 Feb 2014 10:30:40 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: qemu-devel@nongnu.org
Message-ID: <20140207153039.GZ29329@ERROL.INI.CMU.EDU>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::232
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] ACPI: Remove commented-out code from
	HPET._CRS
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
X-List-Received-Date: Fri, 07 Feb 2014 15:32:13 -0000

IRQNoFlags on HPET._CRS crashes WinXP because it causes the HPET
to conflict with the system timer and/or the RTC. It only occurs
on Apple hardware, and even there it is exposed fully only when
OS X is detected (via _OSI). Recent OS X versions work on QEMU
without this statement, so at this time there is no need to find
a better way to conditionally include the statement. This patch
removes the commented out (and wrong, should have been {0, 8})
statement from HPET._CRS.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 hw/i386/acpi-dsdt-hpet.dsl | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i386/acpi-dsdt-hpet.dsl b/hw/i386/acpi-dsdt-hpet.dsl
index dfde174..44961b8 100644
--- a/hw/i386/acpi-dsdt-hpet.dsl
+++ b/hw/i386/acpi-dsdt-hpet.dsl
@@ -39,9 +39,6 @@ Scope(\_SB) {
             Return (0x0F)
         }
         Name(_CRS, ResourceTemplate() {
-#if 0       /* This makes WinXP BSOD for not yet figured reasons. */
-            IRQNoFlags() {2, 8}
-#endif
             Memory32Fixed(ReadOnly,
                 0xFED00000,         // Address Base
                 0x00000400,         // Address Length
-- 
1.8.1.4


