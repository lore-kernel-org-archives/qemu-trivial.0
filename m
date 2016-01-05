Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGM7o-00086A-NB
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 02:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7j-0007wF-Os
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7i-0007fr-K9
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:43 -0500
Received: from silver.sucs.swan.ac.uk ([137.44.10.1]:56286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>)
	id 1aGM7g-0007cD-Bm; Tue, 05 Jan 2016 02:33:40 -0500
Received: from sits by silver.sucs.swan.ac.uk with local (Exim 4.80)
	(envelope-from <sits@sucs.org>)
	id 1aGM7Y-0006eu-Tz; Tue, 05 Jan 2016 07:33:32 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Jan 2016 07:33:32 +0000
Message-Id: <1451979212-25479-4-git-send-email-sitsofe@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.44.10.1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 3/3] qemu-nbd: Fix texi sentence
	capitalisation
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

Capitalise the first letter of sentences (and reword for grammar) the
options section of qemu-nbd.texi.

Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
---
 qemu-nbd.texi | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 5331d69..0027841 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -19,60 +19,60 @@ Export a QEMU disk image using the NBD protocol.
 
 @table @option
 @item -p, --port=@var{port}
-port to listen on (default @samp{10809})
+The TCP port to listen on (default @samp{10809})
 @item -o, --offset=@var{offset}
-offset into the image
+The offset into the image
 @item -b, --bind=@var{iface}
-interface to bind to (default @samp{0.0.0.0})
+The interface to bind to (default @samp{0.0.0.0})
 @item -k, --socket=@var{path}
 Use a unix socket with path @var{path}
 @item -f, --format=@var{fmt}
-force the use of the block driver for format @var{fmt} instead of
+Force the use of the block driver for format @var{fmt} instead of
 auto-detecting
 @item -r, --read-only
-export read-only
+Export the disk as read-only
 @item -P, --partition=@var{num}
-only expose partition @var{num}
+Only expose partition @var{num}
 @item -s, --snapshot
-use @var{filename} as an external snapshot, create a temporary
+Use @var{filename} as an external snapshot, create a temporary
 file with backing_file=@var{filename}, redirect the write to
 the temporary one
 @item -l, --load-snapshot=@var{snapshot_param}
-load an internal snapshot inside @var{filename} and export it
+Load an internal snapshot inside @var{filename} and export it
 as an read-only device, @var{snapshot_param} format is
 'snapshot.id=[ID],snapshot.name=[NAME]' or '[ID_OR_NAME]'
 @item -n, --nocache
 @itemx --cache=@var{cache}
-set cache mode to be used with the file.  See the documentation of
+The cache mode to be used with the file.  See the documentation of
 the emulator's @code{-drive cache=...} option for allowed values.
 @item --aio=@var{aio}
-choose asynchronous I/O mode between @samp{threads} (the default)
+Set the asynchronous I/O mode between @samp{threads} (the default)
 and @samp{native} (Linux only).
 @item --discard=@var{discard}
-controls whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
+Control whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap})
 requests are ignored or passed to the filesystem.  @var{discard} is one of
 @samp{ignore} (or @samp{off}), @samp{unmap} (or @samp{on}).  The default is
 @samp{ignore}.
 @item --detect-zeroes=@var{detect-zeroes}
-enables the automatic conversion of plain zero writes by the OS to
+Control the automatic conversion of plain zero writes by the OS to
 driver-specific optimized zero write commands.  @var{detect-zeroes} is one of
 @samp{off}, @samp{on} or @samp{unmap}.  @samp{unmap}
 converts a zero write to an unmap operation and can only be used if
 @var{discard} is set to @samp{unmap}.  The default is @samp{off}.
 @item -c, --connect=@var{dev}
-connect @var{filename} to NBD device @var{dev}
+Connect @var{filename} to NBD device @var{dev}
 @item -d, --disconnect
-disconnect the specified device
+Disconnect the device @var{dev}
 @item -e, --shared=@var{num}
-device can be shared by @var{num} clients (default @samp{1})
+Allow up to @var{num} clients to share the device (default @samp{1})
 @item -t, --persistent
-don't exit on the last connection
+Don't exit on the last connection
 @item -v, --verbose
-display extra debugging information
+Display extra debugging information
 @item -h, --help
-display this help and exit
+Display this help and exit
 @item -V, --version
-output version information and exit
+Display version information and exit
 @end table
 
 @c man end
-- 
2.4.3


