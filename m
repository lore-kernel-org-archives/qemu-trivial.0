Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFyNj-0004Zc-4y
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 21:22:15 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <juan@logician.com>) id 1RFyNf-0004MF-9z
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 21:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <juan@logician.com>) id 1RFyNe-0002pX-Dy
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 21:22:11 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:63511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <juan@logician.com>)
	id 1RFyNc-0002oe-Gf; Mon, 17 Oct 2011 21:22:08 -0400
Received: by iakl21 with SMTP id l21so113719iak.4
	for <multiple recipients>; Mon, 17 Oct 2011 18:22:07 -0700 (PDT)
Received: by 10.231.67.80 with SMTP id q16mr71091ibi.86.1318900927014;
	Mon, 17 Oct 2011 18:22:07 -0700 (PDT)
Received: from [192.108.229.223] (208-90-212-34.PUBLIC.monkeybrains.net.
	[208.90.212.34])
	by mx.google.com with ESMTPS id g16sm931629ibs.8.2011.10.17.18.22.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 18:22:06 -0700 (PDT)
From: Juan Pineda <juan@logician.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Oct 2011 18:22:03 -0700
Message-Id: <DE9DD0B1-B0C7-4ECC-889E-2B84EE2F287E@logician.com>
To: aliguori@us.ibm.com,
 qemu-devel@nongnu.org
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] Patch for ui/cocoa.m
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
X-List-Received-Date: Tue, 18 Oct 2011 01:22:12 -0000

Hello,

This is my first time submitting a patch, so please let me know if I'm =
not following the correct protocol.

Under OSX Lion the boot volume dialog is not closed and it permanently =
obscures the emulator window since under Lion the dialog cannot be =
repositioned. The fix adds only to add a single line to close the =
dialog.

Signed-off-by: Juan Pineda <juan@logician.com>

Thanks!
-Juan


> git diff ui/cocoa.m
diff --git a/ui/cocoa.m b/ui/cocoa.m
index d9e4e3d..4b42462 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -811,6 +811,8 @@ QemuCocoaView *cocoaView;
=20
         char **argv =3D (char**)malloc( sizeof(char*)*3 );
=20
+       [sheet close];
+
         asprintf(&argv[0], "%s", bin);
         asprintf(&argv[1], "-hda");
         asprintf(&argv[2], "%s", img);


