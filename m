Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cX338-0006SN-0K
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2017 04:42:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cX336-0006Qh-1j
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 04:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cX335-0008QH-Bd
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 04:42:28 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:24203 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1cX330-0008OG-Th; Fri, 27 Jan 2017 04:42:23 -0500
IronPort-PHdr: =?us-ascii?q?9a23=3AUmc+VBcN4gkCqQHbrCrWsyxtlGMj4u6mDksu8pMi?=
	=?us-ascii?q?zoh2WeGdxcuyYh7h7PlgxGXEQZ/co6odzbGH7+a9BidYu96oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twXcu8sZjYd+NKo61wfErGZPd+?=
	=?us-ascii?q?lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2466svrtQLe?=
	=?us-ascii?q?TQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms86tnVBnlgz?=
	=?us-ascii?q?oBOjUk8m/Yl9Zwgbpbrhy/uhJxzY3aboaOOfZiYq/QZ88WSHBdUspNUSFKH4Oy?=
	=?us-ascii?q?b5EID+oEJetVs439qEAQohukGQmsA/7kxD5SiX/swaI60v4uGhzB0QM7Ad0Oqm?=
	=?us-ascii?q?jUrNLuOacTXuC61q3IzTTZYP9MxTj9743IfwknrPqRXrxwadLcxE0yGw/fk1mc?=
	=?us-ascii?q?tI7oMymR2+kJqWSX8uptWOK3h2I6rwx8rSKjytowhoXVnI4Yyk3I+T9nzIszON?=
	=?us-ascii?q?a2UlR0YcS+H5tVryyaMox2Td48TGxwoyY6z6EGuYa8fCgX1JQr3x7fZOKDc4iP?=
	=?us-ascii?q?+h/jWvyeITF5hXJkfrKwmQy+8UmvyuLmUsm00UxFojBZndnLs3ABzx3T6s6ZRf?=
	=?us-ascii?q?th5kqs3SuD2xrO5u1ZI004j67WJpo7zrItlpcesVzPHirsl0X3iK+WeF8k+u+t?=
	=?us-ascii?q?6+n/ebrpuIWcN5NzigzlM6QuldawAeA5MgcURWSU5eO81Lj78U3jXLpKluE2kr?=
	=?us-ascii?q?XesJ3CPMQUuKu5AxJM3ok+9Rm/ESmp0NADkHkBK1JFfh2Hj470O13UJ/D4F/i/?=
	=?us-ascii?q?iUy2kDh33/DGIqHhApLVI3jajrjheKt951dAyAopzNBf+ZNUBasFIP/oXE/xs9?=
	=?us-ascii?q?rYDhA/Mwyp2ernD8991oxNEV6IV7aUNb6XvVKW6+YHJe6Ka4kI/jHnJKsL/fnr?=
	=?us-ascii?q?2FY9k1IHYa7h8pINY3GxVqBsLl+FZlLtjd4FEG5MtQ07Gr+5wGaeWCJeMi7hF5?=
	=?us-ascii?q?k34Ss2Xdqr?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AtCADWFItY/5tjdVtdHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgwoBAQEBAR8ngUOeLwUBAQEBAQEFAYEaAZMjhBsahHiBEII2QxQ?=
	=?us-ascii?q?BAQEBAQEBAQEBAWEoQg4BgWIZgx1PTg0BJolUEQGvbopyMoYHiWZihHofBZtRk?=
	=?us-ascii?q?WwNijWGPQKSfjYhgRsTCBUVhCgBgk1zgRSHbAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2AtCADWFItY/5tjdVtdHAEBBAEBCgEBFwEBBAEBCgEBgwo?=
	=?us-ascii?q?BAQEBAR8ngUOeLwUBAQEBAQEFAYEaAZMjhBsahHiBEII2QxQBAQEBAQEBAQEBA?=
	=?us-ascii?q?WEoQg4BgWIZgx1PTg0BJolUEQGvbopyMoYHiWZihHofBZtRkWwNijWGPQKSfjY?=
	=?us-ascii?q?hgRsTCBUVhCgBgk1zgRSHbAEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,294,1477954800"; d="scan'208";a="103911220"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 27 Jan 2017 10:42:19 +0100
Received: from [194.100.51.2] (helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cX32v-00064t-OO; Fri, 27 Jan 2017 10:42:17 +0100
Received: from berto by perseus.local with local (Exim 4.88)
	(envelope-from <berto@igalia.com>)
	id 1cX32g-00059j-4v; Fri, 27 Jan 2017 11:42:02 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>
Date: Fri, 27 Jan 2017 11:41:54 +0200
Message-Id: <20170127094154.19778-1-berto@igalia.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: [Qemu-trivial] [PATCH] qemu-doc: Clarify that -vga std is now the
 default
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
X-List-Received-Date: Fri, 27 Jan 2017 09:42:29 -0000

The QEMU manual page states that Cirrus Logic is the default video
card if the user doesn't specify any. However this is not true since
QEMU 2.2.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 80df52651a..66ee562821 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1195,12 +1195,12 @@ Select type of VGA card to emulate. Valid values for @var{type} are
 Cirrus Logic GD5446 Video card. All Windows versions starting from
 Windows 95 should recognize and use this graphic card. For optimal
 performances, use 16 bit color depth in the guest and the host OS.
-(This one is the default)
+(This card was the default before QEMU 2.2)
 @item std
 Standard VGA card with Bochs VBE extensions.  If your guest OS
 supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want
 to use high resolution modes (>= 1280x1024x16) then you should use
-this option.
+this option. (This card is the default since QEMU 2.2)
 @item vmware
 VMWare SVGA-II compatible adapter. Use it if you have sufficiently
 recent XFree86/XOrg server or Windows guest with a driver for this
-- 
2.11.0


