Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aEO7R-00037S-K9
	for mharc-qemu-trivial@gnu.org; Wed, 30 Dec 2015 16:17:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMsi-0007nZ-29
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:58:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMsf-0005Pt-4l
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:57:59 -0500
Received: from nm29-vm2.bullet.mail.gq1.yahoo.com ([98.136.216.177]:33458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMse-0005PZ-S6
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1451505473; bh=cGpf0Z2HABm4mu5KoHG5OK4UEMA8xi/zUJ2Ez3V8Rj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
	b=KmxGcxz/E7NnXnTFeKENr2ZHb1tlSbQpsgJg2MiDI7IfKK1qEbfPaJAeoPDtJI8loI7N11DokJ+op5YKZKbKuIOn4209057GnZkT3D+hss81WC1PPOOnZBAjyjtwAZ0L1jjZIV8D6rOi6HRuovkb61efkxChWGlqdBGlXhUC21v+CjQHW7MtfwLNyIdcJaOqbZQXAGsb+/3fuJt72M115JWpdzgiHjkcwtP3ECSm5tnR1xJZECJm9HSeKPFCgaN0UvKp79qzz33rIqTeN7D45whHJkkSwyFnRlFpPE+bNOvIhktlpqdc5hadf/FM3ttXsnuXwkIpaVrpsKPaeUhLag==
Received: from [216.39.60.180] by nm29.bullet.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:57:53 -0000
Received: from [98.136.164.68] by tm16.bullet.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:57:53 -0000
Received: from [127.0.0.1] by smtp230.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:57:53 -0000
X-Yahoo-Newman-Id: 129210.2191.bm@smtp230.mail.gq1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: 1YGGzHEVM1le9Y9Qe6IWUKdAduoxGB5ZC5Tj4CYGVWQy2AN
	582_YJr2W6DcCXe9k.TEH34G9TuMtJZawXf7h8DnKklP7aCXMdGqE7TawhvM
	3Tup7AWF8pZkA6niNvPR4LzHmUUENQO1h1lLqGTjyAVUbj_wHpdYbG32xXc6
	d2BaKleX39C7mm.r3EFlt_D_SQpvj7yCaiw3mP410KojxXS0aHG1YzMxjyR2
	_M4_wxg.U7JPLfl96LtRvD17XYLKC0JhrE0_UDxV2EwD7txO7dxBo4vvovGg
	w4SYC8kyJbTX1eZkmxOCHcQpWtISNhOG.r1qlRnjcZenGN.4pufUOfFAGT0P
	M1GWsoNWiys4r2jghgC8Wb22V.VOc2exC7.LuYaELnQFGbCzWy2pA7m3YwDb
	jMQvZAmCVLDEE3aZ7GqCJh_.wrqqVqd7WfcC4k0akbHhQhB8ZPLaADn4z8tT
	P4TMrh8Vq8HpCxlv4d0xytTeStB6NwlG1ObRUs8cD50ouVtZxlc0PZS6OS4Z
	fCmvKhN39UsoI1gE3i5gfTiUkQgH6Oe2lUlyoQo_LoQ--
X-Yahoo-SMTP: mEA9emqswBDufi8V3X8MBXZonFM-
Date: Wed, 30 Dec 2015 19:57:44 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Message-ID: <20151230195744.GA26893@sucs.org>
References: <20151230195338.GA25149@sucs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151230195338.GA25149@sucs.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.136.216.177
X-Mailman-Approved-At: Wed, 30 Dec 2015 16:17:16 -0500
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/2] qemu-nbd: Minor texi updates
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
X-List-Received-Date: Wed, 30 Dec 2015 19:58:01 -0000

- Change some spacing.
- Remove duplicate entry for --format.
- Reword --discard documentation.
- Add --detect-zeroes documentation.

Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
---
 qemu-nbd.texi | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 26cc985..ac4e613 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -1,6 +1,6 @@
 @example
 @c man begin SYNOPSIS
-usage: qemu-nbd [OPTION]...  @var{filename}
+usage: qemu-nbd [OPTION]... @var{filename}
 @c man end
 @end example
 
@@ -22,8 +22,9 @@ offset into the image
 interface to bind to (default @samp{0.0.0.0})
 @item -k, --socket=@var{path}
 Use a unix socket with path @var{path}
-@item -f, --format=@var{format}
-Set image format as @var{format}
+@item -f, --format=@var{fmt}
+force the use of the block driver for format @var{fmt} instead of
+auto-detecting
 @item -r, --read-only
 export read-only
 @item -P, --partition=@var{num}
@@ -44,17 +45,22 @@ the emulator's @code{-drive cache=...} option for allowed values.
 choose asynchronous I/O mode between @samp{threads} (the default)
 and @samp{native} (Linux only).
 @item --discard=@var{discard}
-toggles whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
-requests are ignored or passed to the filesystem.  The default is no
-(@samp{--discard=ignore}).
+controls whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
+requests are ignored or passed to the filesystem.  @var{discard} is one of
+@samp{ignore} (or @samp{off}), @samp{unmap} (or @samp{on}).  The default is
+@samp{ignore}.
+@item --detect-zeroes=@var{detect-zeroes}
+enables the automatic conversion of plain zero writes by the OS to driver
+specific optimized zero write commands.  @var{detect-zeroes} is one of
+@samp{off}, @samp{on} or @samp{unmap}.  @samp{unmap}
+converts a zero write to an unmap operation and can only be used if
+@var{discard} is set to @samp{unmap}.  The default is @samp{off}.
 @item -c, --connect=@var{dev}
 connect @var{filename} to NBD device @var{dev}
 @item -d, --disconnect
 disconnect the specified device
 @item -e, --shared=@var{num}
 device can be shared by @var{num} clients (default @samp{1})
-@item -f, --format=@var{fmt}
-force block driver for format @var{fmt} instead of auto-detecting
 @item -t, --persistent
 don't exit on the last connection
 @item -v, --verbose
-- 
2.4.3

-- 
Sitsofe | http://sucs.org/~sits/

