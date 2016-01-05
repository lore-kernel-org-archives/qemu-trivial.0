Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGM7m-00081d-Ib
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 02:33:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7j-0007wO-VU
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7i-0007g3-TS
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:43 -0500
Received: from silver.sucs.swan.ac.uk ([137.44.10.1]:56284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>)
	id 1aGM7g-0007cB-Bn; Tue, 05 Jan 2016 02:33:40 -0500
Received: from sits by silver.sucs.swan.ac.uk with local (Exim 4.80)
	(envelope-from <sits@sucs.org>)
	id 1aGM7Y-0006el-LN; Tue, 05 Jan 2016 07:33:32 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Jan 2016 07:33:30 +0000
Message-Id: <1451979212-25479-2-git-send-email-sitsofe@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.44.10.1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 1/3] qemu-nbd: Fix unintended texi
	verbatim formatting
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
X-List-Received-Date: Tue, 05 Jan 2016 07:33:45 -0000

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


