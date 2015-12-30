Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aEO7R-00036n-Be
	for mharc-qemu-trivial@gnu.org; Wed, 30 Dec 2015 16:17:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMpC-0007TS-Ka
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:54:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMp9-0003fw-IA
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:54:22 -0500
Received: from nm5-vm10.bullet.mail.gq1.yahoo.com ([98.136.218.185]:54546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aEMp9-0003fW-A7
	for qemu-trivial@nongnu.org; Wed, 30 Dec 2015 14:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1451505257; bh=m1bTJ+pWqUh0doNnEYHwoF3MdWphzTGa5RwnNuRGJQQ=;
	h=Date:From:To:Cc:Subject:From:Subject;
	b=ILpIyTHQgWrImhwSTvKfKFzH0UppjXTHae0BjvHhKY1/iVSCxYge318TlTNiWAwjEvCRSf3ju9Eu+ESWkrBw248VA2u4tm04W41xKir4yLdN/farF6WV65irR6AWHt4aIc7NIh3mDqDF4++qkoqvD1C6f7BUVoc8FLGDG7rrM180VvB3sg9LQ71tjotmQw8p1VPOxK2NTPOQCerfw/uTvlRJXEtLANPUNx5G+rx3Utn5HrbxthihPbx2v22D5tMs9crKuUIdz4Qx0N3OKCrAGoip76Miv8efyWtPiuiVjZP/h9/A0aroD8CFGbPWQs2e7Dw4dd3Pzhuy2f/T/vrUsw==
Received: from [98.137.12.61] by nm5.bullet.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:54:17 -0000
Received: from [208.71.42.191] by tm6.bullet.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:54:17 -0000
Received: from [127.0.0.1] by smtp202.mail.gq1.yahoo.com with NNFMP;
	30 Dec 2015 19:54:17 -0000
X-Yahoo-Newman-Id: 801062.84701.bm@smtp202.mail.gq1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: ZxknlY4VM1lAXn1tvFJv5mRuUm9NjeDYLDzObRvtDJP9BGY
	q_97Irb47_Ud_ONayVRsYjxMNVJuSbiTTBhI14CEyEyfFxaQ9TTcmsCTACBD
	BDNK5YLL_hPvwb3cFcWR0iMZe3BDPBcDwBsjl0v4L1Z0CE0pzzPmU_k34y3A
	tApRxS0d3JGbKfj.mkjFOFoE8.JTRFtcn9W9r3JMuDVh4Eet9M94KPAZ1q_r
	YvzKIXOcq5_f_BAVPHUQBxPt9sabuHo8SGGJSe9.hc1QHYHKz75U1HNJqMX2
	GHjSb7YrQbxBWHaEGBFeRia1STDffqrPTJDrimzelcVO_WYGcJUXRn8ab5ae
	Hivy7vpvPYcCr0.qn.iYY1OnyvabnOZZNWrPwIVnE7.nX3KUFmbznUTxIJmr
	WL3kveNFkzwssoqYb55MQicx.Lj0.VevNBZaZ4DO8Vp71Yi9PC9x.VRdiPiE
	VQ2a9ob0rjsxVMqdyUu93IFKeIwLLnU8kmn9KBBX82FE04GpinGWHC5u0kyW
	nzS199Wj1VdlZMe34SW6dkgiXvdzF.GGK2rMo
X-Yahoo-SMTP: mEA9emqswBDufi8V3X8MBXZonFM-
Date: Wed, 30 Dec 2015 19:54:06 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Message-ID: <20151230195338.GA25149@sucs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.136.218.185
X-Mailman-Approved-At: Wed, 30 Dec 2015 16:17:16 -0500
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/2] qemu-nbd: Fix unintended texi verbatim
	formatting
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
X-List-Received-Date: Wed, 30 Dec 2015 19:54:24 -0000

Indented lines in the texi meant the perlpod produced interpreted the
paragraph as being verbatim (thus formatting codes were not
interpreted). Fix this by un-indenting problem lines.

Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
---
 qemu-nbd.texi | 58 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 46fd483..26cc985 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -13,56 +13,56 @@ Export QEMU disk image using NBD protocol.
 @c man begin OPTIONS
 @table @option
 @item @var{filename}
- is a disk image filename
+is a disk image filename
 @item -p, --port=@var{port}
-  port to listen on (default @samp{10809})
+port to listen on (default @samp{10809})
 @item -o, --offset=@var{offset}
-  offset into the image
+offset into the image
 @item -b, --bind=@var{iface}
-  interface to bind to (default @samp{0.0.0.0})
+interface to bind to (default @samp{0.0.0.0})
 @item -k, --socket=@var{path}
-  Use a unix socket with path @var{path}
+Use a unix socket with path @var{path}
 @item -f, --format=@var{format}
-  Set image format as @var{format}
+Set image format as @var{format}
 @item -r, --read-only
-  export read-only
+export read-only
 @item -P, --partition=@var{num}
-  only expose partition @var{num}
+only expose partition @var{num}
 @item -s, --snapshot
-  use @var{filename} as an external snapshot, create a temporary
-  file with backing_file=@var{filename}, redirect the write to
-  the temporary one
+use @var{filename} as an external snapshot, create a temporary
+file with backing_file=@var{filename}, redirect the write to
+the temporary one
 @item -l, --load-snapshot=@var{snapshot_param}
-  load an internal snapshot inside @var{filename} and export it
-  as an read-only device, @var{snapshot_param} format is
-  'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'
+load an internal snapshot inside @var{filename} and export it
+as an read-only device, @var{snapshot_param} format is
+'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'
 @item -n, --nocache
 @itemx --cache=@var{cache}
-  set cache mode to be used with the file.  See the documentation of
-  the emulator's @code{-drive cache=...} option for allowed values.
+set cache mode to be used with the file.  See the documentation of
+the emulator's @code{-drive cache=...} option for allowed values.
 @item --aio=@var{aio}
-  choose asynchronous I/O mode between @samp{threads} (the default)
-  and @samp{native} (Linux only).
+choose asynchronous I/O mode between @samp{threads} (the default)
+and @samp{native} (Linux only).
 @item --discard=@var{discard}
-  toggles whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
-  requests are ignored or passed to the filesystem.  The default is no
-  (@samp{--discard=ignore}).
+toggles whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
+requests are ignored or passed to the filesystem.  The default is no
+(@samp{--discard=ignore}).
 @item -c, --connect=@var{dev}
-  connect @var{filename} to NBD device @var{dev}
+connect @var{filename} to NBD device @var{dev}
 @item -d, --disconnect
-  disconnect the specified device
+disconnect the specified device
 @item -e, --shared=@var{num}
-  device can be shared by @var{num} clients (default @samp{1})
+device can be shared by @var{num} clients (default @samp{1})
 @item -f, --format=@var{fmt}
-  force block driver for format @var{fmt} instead of auto-detecting
+force block driver for format @var{fmt} instead of auto-detecting
 @item -t, --persistent
-  don't exit on the last connection
+don't exit on the last connection
 @item -v, --verbose
-  display extra debugging information
+display extra debugging information
 @item -h, --help
-  display this help and exit
+display this help and exit
 @item -V, --version
-  output version information and exit
+output version information and exit
 @end table
 
 @c man end
-- 
2.4.3


-- 
Sitsofe | http://sucs.org/~sits/

