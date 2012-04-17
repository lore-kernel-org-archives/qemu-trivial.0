Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKCfr-000388-Oq
	for mharc-qemu-trivial@gnu.org; Tue, 17 Apr 2012 13:58:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKCfj-0002kG-Ux
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:58:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SKCfe-0006Ek-Vo
	for qemu-trivial@nongnu.org; Tue, 17 Apr 2012 13:58:35 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:47854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SKCfV-0006AY-9n; Tue, 17 Apr 2012 13:58:21 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2A6A672800B3; Tue, 17 Apr 2012 19:58:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id M4XQJt3Tb0qy; Tue, 17 Apr 2012 19:58:14 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6E81872800B5; Tue, 17 Apr 2012 19:58:14 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue, 17 Apr 2012 19:58:13 +0200
Message-Id: <1334685493-6867-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Paul Brook <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] arm-dis: Fix spelling in comments (iff -> if)
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
X-List-Received-Date: Tue, 17 Apr 2012 17:58:42 -0000

The spelling 'iff' is sometimes used for 'if and only if'.
Even if that meaning could be applied here, it is not used
consistently. It is also quite unusual to use 'if and only if'
in technical documentation. Therefore a simple 'if' should be
preferred here.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 arm-dis.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arm-dis.c b/arm-dis.c
index 6bc4d71..db15eca 100644
--- a/arm-dis.c
+++ b/arm-dis.c
@@ -130,8 +130,8 @@ struct opcode16
    %z<code>		print a double precision VFP reg
 			  Codes: 0=>Dm, 1=>Dd, 2=>Dn, 3=>multi-list
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order
 
    %L			print as an iWMMXt N/M width field.
@@ -522,8 +522,8 @@ static const struct opcode32 coprocessor_opcodes[] =
    %<bitfield>Tn	print short scaled width limited by n
    %<bitfield>Un	print long scaled width limited by n
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order  */
 
 static const struct opcode32 neon_opcodes[] =
@@ -787,8 +787,8 @@ static const struct opcode32 neon_opcodes[] =
    %c			print condition code (always bits 28-31)
    %m			print register mask for ldm/stm instruction
    %o			print operand2 (immediate or register + shift)
-   %p			print 'p' iff bits 12-15 are 15
-   %t			print 't' iff bit 21 set and bit 24 clear
+   %p			print 'p' if bits 12-15 are 15
+   %t			print 't' if bit 21 set and bit 24 clear
    %B			print arm BLX(1) destination
    %C			print the PSR sub type.
    %U			print barrier type.
@@ -800,8 +800,8 @@ static const struct opcode32 neon_opcodes[] =
    %<bitfield>x		print the bitfield in hex
    %<bitfield>X		print the bitfield as 1 hex digit without leading "0x"
 
-   %<bitfield>'c	print specified char iff bitfield is all ones
-   %<bitfield>`c	print specified char iff bitfield is all zeroes
+   %<bitfield>'c	print specified char if bitfield is all ones
+   %<bitfield>`c	print specified char if bitfield is all zeroes
    %<bitfield>?ab...    select from array of values in big endian order
 
    %e                   print arm SMI operand (bits 0..7,8..19).
@@ -1090,7 +1090,7 @@ static const struct opcode32 arm_opcodes[] =
    %<bitfield>a         print (bitfield * 4) as a pc-rel offset + decoded symbol
    %<bitfield>B         print Thumb branch destination (signed displacement)
    %<bitfield>c         print bitfield as a condition code
-   %<bitnum>'c		print specified char iff bit is one
+   %<bitnum>'c		print specified char if bit is one
    %<bitnum>?ab		print a if bit is one else print b.  */
 
 static const struct opcode16 thumb_opcodes[] =
@@ -1248,8 +1248,8 @@ static const struct opcode16 thumb_opcodes[] =
        %<bitfield>r	print bitfield as an ARM register
        %<bitfield>c	print bitfield as a condition code
 
-       %<bitfield>'c	print specified char iff bitfield is all ones
-       %<bitfield>`c	print specified char iff bitfield is all zeroes
+       %<bitfield>'c	print specified char if bitfield is all ones
+       %<bitfield>`c	print specified char if bitfield is all zeroes
        %<bitfield>?ab... select from array of values in big endian order
 
    With one exception at the bottom (done because BL and BLX(1) need
-- 
1.7.9


