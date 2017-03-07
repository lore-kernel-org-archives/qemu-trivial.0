Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cm1c6-0006bW-Um
	for mharc-qemu-trivial@gnu.org; Thu, 09 Mar 2017 12:12:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cm1Hm-0006eQ-2w
	for qemu-trivial@nongnu.org; Thu, 09 Mar 2017 11:51:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cm1Hh-0003v8-7Z
	for qemu-trivial@nongnu.org; Thu, 09 Mar 2017 11:51:30 -0500
Received: from us-smtp-delivery-131.mimecast.com ([63.128.21.131]:54488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <herbie.robinson@stratus.com>)
	id 1cm1Hh-0003tP-1q
	for qemu-trivial@nongnu.org; Thu, 09 Mar 2017 11:51:25 -0500
Received: from mailhub5.stratus.com (mailhub5.stratus.com [134.111.1.18]) by
	us-smtp-1.mimecast.com with ESMTP id
	us-mta-148-s_stmuTjNcmRAUCCFSwtFA-1; Thu, 09 Mar 2017 11:51:21 -0500
Received: from vostest4.mno.stratus.com (vostest4.mno.stratus.com
	[134.111.85.134])
	by mailhub5.stratus.com (8.12.11/8.12.11) with ESMTP id v29GpKQa002978; 
	Thu, 9 Mar 2017 11:51:20 -0500
Received: by vostest4.mno.stratus.com (Postfix, from userid 0)
	id 960B540827A6; Thu,  9 Mar 2017 11:51:20 -0500 (EST)
From: herbierobinson <Herbie.Robinson@stratus.com>
Date: Mon, 6 Mar 2017 20:30:49 -0500
Message-Id: <20170309165120.960B540827A6@vostest4.mno.stratus.com>
X-MC-Unique: s_stmuTjNcmRAUCCFSwtFA-1
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 63.128.21.131
X-Mailman-Approved-At: Thu, 09 Mar 2017 12:12:29 -0500
Subject: [Qemu-trivial] [PATCH] SGABIOS: fix wrong video attrs for int 10h,
 ah==13h
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
X-List-Received-Date: Thu, 09 Mar 2017 16:51:31 -0000

Fix Bug #1670509: wrong video attrs for int 10h, ah=3D=3D13h
The subroutine set_cursor_position is trashing %bx.
Unfortunately, %bl contains the video attribute for write_string.

The fix saves %bx in the function prolog and restores it in
the epilog.  Also, remove save and restore in set_current_cursor,
because set_cursor_position does it.

Signed-off-by: herbierobinson <Herbie.Robinson@stratus.com>
---
 sgabios.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sgabios.S b/sgabios.S
index 275d063..da5acc2 100644
--- a/sgabios.S
+++ b/sgabios.S
@@ -1728,6 +1728,7 @@ write_string_tail:
=20
 set_cursor_position:
   pushw %ax
+  pushw %bx
   pushw %ds
   pushw $BDA_SEG
   popw %ds                             /* ds =3D 0x40 */
@@ -1738,6 +1739,7 @@ set_cursor_position:
   movw %ax, %bx                        /* bx =3D cursor save offset */
   movw %dx, (%bx)                      /* save new cursor value */
   popw %ds
+  popw %bx
   popw %ax
   ret
=20
@@ -1752,12 +1754,10 @@ set_cursor_position:
=20
 set_current_cursor:
   pushw %ds
-  pushw %bx
   pushw $BDA_SEG
   popw %ds                             /* ds =3D 0x40 */
   movb BDA_ACTIVE_PAGE, %bh
   call set_cursor_position
-  popw %bx
   popw %ds
   ret
=20
--=20
1.8.3.1


