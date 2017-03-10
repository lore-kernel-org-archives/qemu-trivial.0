Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmMsq-00037u-PJ
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 10:55:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cmMso-000369-Ka
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 10:55:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <herbie.robinson@stratus.com>) id 1cmMsj-00056s-Ox
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 10:55:10 -0500
Received: from us-smtp-delivery-131.mimecast.com ([63.128.21.131]:44607)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <herbie.robinson@stratus.com>)
	id 1cmMsj-00056L-L0
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 10:55:05 -0500
Received: from mailhub5.stratus.com (mailhub.stratus.com [134.111.1.18]) by
	us-smtp-1.mimecast.com with ESMTP id us-mta-52-ZVwQbzxKOGahDYZB4l2Fmw-1;
	Fri, 10 Mar 2017 10:55:02 -0500
Received: from vostest4.mno.stratus.com (vostest4.mno.stratus.com
	[134.111.85.134])
	by mailhub5.stratus.com (8.12.11/8.12.11) with ESMTP id v2AFt0NH010588; 
	Fri, 10 Mar 2017 10:55:01 -0500
Received: by vostest4.mno.stratus.com (Postfix, from userid 0)
	id 3A56240827DB; Fri, 10 Mar 2017 10:55:00 -0500 (EST)
From: Herbie Robinson <Herbie.Robinson@stratus.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com,
	Herbie Robinson <Herbie.Robinson@stratus.com>
Date: Fri, 10 Mar 2017 10:54:55 -0500
Message-Id: <1489161295-23864-1-git-send-email-Herbie.Robinson@stratus.com>
X-Mailer: git-send-email 1.8.3.1
X-MC-Unique: ZVwQbzxKOGahDYZB4l2Fmw-1
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 63.128.21.131
Subject: [Qemu-trivial] [PATCH v3] SGABIOS: fix wrong video attrs for int
 10h, ah==13h
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
X-List-Received-Date: Fri, 10 Mar 2017 15:55:11 -0000

Fix Bug #1670509: wrong video attrs for int 10h, ah=3D=3D13h
The subroutine set_cursor_position is trashing %bx.
Unfortunately, %bl contains the video attribute for write_string.

The fix saves %bx in the function prolog and restores it in
the epilog.=20

Signed-off-by: Herbie Robinson <Herbie.Robinson@stratus.com>
---
Removed incorrect code deletions from set_current_cursor.
Removed explanation of same from the commit message.

BTW, I didn't see any test cases for this code, but if they exist
and somebody points me at them, I should be able to generate a=20
very small qcow2 file that demonstrates the problem.

 sgabios.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sgabios.S b/sgabios.S
index 275d063..96c4e23 100644
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
--=20
1.8.3.1


