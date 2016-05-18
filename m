Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30tz-0007pf-DT
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30tu-0007mD-33
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:48:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30ts-000453-2t
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:48:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30tn-0003xd-GF; Wed, 18 May 2016 08:48:27 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 99F7241788;
	Wed, 18 May 2016 15:48:22 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B4074ADA;
	Wed, 18 May 2016 15:48:21 +0300 (MSK)
Received: (nullmailer pid 21048 invoked by uid 1000);
	Wed, 18 May 2016 12:48:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:48:20 +0300
Message-Id: <1463575700-21007-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH trivial] docs: "specify" spell fix
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
X-List-Received-Date: Wed, 18 May 2016 12:48:38 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qapi-code-gen.txt | 2 +-
 qemu-options.hx        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index d7d6987..eff2075 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -322,7 +322,7 @@ enum.  The value for each branch can be of any type.
 
 A flat union definition avoids nesting on the wire, and specifies a
 set of common members that occur in all variants of the union.  The
-'base' key must specifiy either a type name (the type must be a
+'base' key must specify either a type name (the type must be a
 struct, not a union), or a dictionary representing an anonymous type.
 All branches of the union must be complex types, and the top-level
 members of the union dictionary on the wire will be combination of
diff --git a/qemu-options.hx b/qemu-options.hx
index 6106520..068f8cd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -569,7 +569,7 @@ These options have the same definition as they have in @option{-hdachs}.
 @var{discard} is one of "ignore" (or "off") or "unmap" (or "on") and controls whether @dfn{discard} (also known as @dfn{trim} or @dfn{unmap}) requests are ignored or passed to the filesystem.  Some machine types may not support discard requests.
 @item format=@var{format}
 Specify which disk @var{format} will be used rather than detecting
-the format.  Can be used to specifiy format=raw to avoid interpreting
+the format.  Can be used to specify format=raw to avoid interpreting
 an untrusted format header.
 @item serial=@var{serial}
 This option specifies the serial number to assign to the device.
@@ -894,7 +894,7 @@ mouse. Also overrides the PS/2 mouse emulation when activated.
 
 @item disk:[format=@var{format}]:@var{file}
 Mass storage device based on file. The optional @var{format} argument
-will be used rather than detecting the format. Can be used to specifiy
+will be used rather than detecting the format. Can be used to specify
 @code{format=raw} to avoid interpreting an untrusted format header.
 
 @item host:@var{bus}.@var{addr}
-- 
2.1.4


