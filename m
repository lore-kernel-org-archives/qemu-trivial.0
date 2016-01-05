Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aGM7m-00080n-9v
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2016 02:33:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7j-0007wE-Oo
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sits@sucs.org>) id 1aGM7i-0007fw-KQ
	for qemu-trivial@nongnu.org; Tue, 05 Jan 2016 02:33:43 -0500
Received: from silver.sucs.swan.ac.uk ([137.44.10.1]:56283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sits@sucs.org>)
	id 1aGM7c-0007cA-9L; Tue, 05 Jan 2016 02:33:36 -0500
Received: from sits by silver.sucs.swan.ac.uk with local (Exim 4.80)
	(envelope-from <sits@sucs.org>)
	id 1aGM7Y-0006eq-Ph; Tue, 05 Jan 2016 07:33:32 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Jan 2016 07:33:31 +0000
Message-Id: <1451979212-25479-3-git-send-email-sitsofe@yahoo.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 137.44.10.1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 2/3] qemu-nbd: Minor texi updates
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

- Change some spacing.
- Add disconnect usage to synopsis.
- Highlight the command and its options in the synopsis.
- Fix up the grammar in the description.
- Move filename variable description out of the option table.
- Add a description of the dev variable.
- Remove duplicate entry for --format.
- Reword --discard documentation.
- Add --detect-zeroes documentation.
- Add reference to qemu man page to see also section.

Signed-off-by: Sitsofe Wheeler <sitsofe@yahoo.com>
---
 qemu-nbd.texi | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 26cc985..5331d69 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -1,19 +1,23 @@
 @example
 @c man begin SYNOPSIS
-usage: qemu-nbd [OPTION]...  @var{filename}
+@command{qemu-nbd} [OPTION]... @var{filename}
+
+@command{qemu-nbd} @option{-d} @var{dev}
 @c man end
 @end example
 
 @c man begin DESCRIPTION
 
-Export QEMU disk image using NBD protocol.
+Export a QEMU disk image using the NBD protocol.
 
 @c man end
 
 @c man begin OPTIONS
+@var{filename} is a disk image filename.
+
+@var{dev} is an NBD device.
+
 @table @option
-@item @var{filename}
-is a disk image filename
 @item -p, --port=@var{port}
 port to listen on (default @samp{10809})
 @item -o, --offset=@var{offset}
@@ -22,8 +26,9 @@ offset into the image
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
@@ -44,17 +49,22 @@ the emulator's @code{-drive cache=...} option for allowed values.
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
+enables the automatic conversion of plain zero writes by the OS to
+driver-specific optimized zero write commands.  @var{detect-zeroes} is one of
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
@@ -79,7 +89,7 @@ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 @c man end
 
 @c man begin SEEALSO
-qemu-img(1)
+qemu(1), qemu-img(1)
 @c man end
 
 @end ignore
-- 
2.4.3


