Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cilky-0004QB-IR
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 12:40:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cilku-0004IQ-2a
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 12:40:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cilkt-0005cj-Ae
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 12:40:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50770)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cilkr-0005b7-AP; Tue, 28 Feb 2017 12:40:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70BD0369C3;
	Tue, 28 Feb 2017 17:40:05 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-200.ams2.redhat.com
	[10.36.116.200])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1SHe1n4022735; Tue, 28 Feb 2017 12:40:02 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Laszlo Ersek <lersek@redhat.com>, 
	Eric Blake <eblake@redhat.com>
Date: Tue, 28 Feb 2017 18:40:01 +0100
Message-Id: <1488303601-23741-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 28 Feb 2017 17:40:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] docs: Add a note about mixing bootindex with
 "-boot order"
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
X-List-Received-Date: Tue, 28 Feb 2017 17:40:11 -0000

Occasionally the users try to mix the bootindex properties with the
"-boot order" parameter - and this likely does not give the expected
results. So let's add a proper statement that these two concepts
should not be used together.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/bootindex.txt | 9 +++++++++
 qemu-options.hx    | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/docs/bootindex.txt b/docs/bootindex.txt
index f84fac7..9e0ac07 100644
--- a/docs/bootindex.txt
+++ b/docs/bootindex.txt
@@ -41,3 +41,12 @@ has three bootable devices target1, target3, target5 connected to it,
 the option ROM will have a boot method for each of them, but it is not
 possible to map from boot method back to a specific target.  This is a
 shortcoming of the PC BIOS boot specification.
+
+== Mixing bootindex and boot order parameters ==
+
+Note that it does not make sense to use the bootindex property together
+with the "-boot order=..." (or "-boot once=...") parameter. The guest
+firmware implementations normally either support the one or the other,
+but not both parameters at the same time. Mixing them will result in
+undefined behavior, and thus the guest firmware will likely not boot
+from the expected devices.
diff --git a/qemu-options.hx b/qemu-options.hx
index bf458f8..aa11420 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -234,7 +234,10 @@ drive letters depend on the target architecture. The x86 PC uses: a, b
 (floppy 1 and 2), c (first hard disk), d (first CD-ROM), n-p (Etherboot
 from network adapter 1-4), hard disk boot is the default. To apply a
 particular boot order only on the first startup, specify it via
-@option{once}.
+@option{once}. Note that the @option{order} or @option{once} parameter
+should not be used together with the @option{bootindex} property of
+devices, since the firmware implementations normally do not support both
+at the same time.
 
 Interactive boot menus/prompts can be enabled via @option{menu=on} as far
 as firmware/BIOS supports them. The default is non-interactive boot.
-- 
1.8.3.1


