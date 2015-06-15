Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z4Tcb-0003Iw-UD
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2015 08:36:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z4TcY-0003Bq-0H
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 08:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Z4TcX-0002Us-0Y
	for qemu-trivial@nongnu.org; Mon, 15 Jun 2015 08:36:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Z4TcR-0002Sl-5X; Mon, 15 Jun 2015 08:36:03 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id E73D119F201;
	Mon, 15 Jun 2015 12:36:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5FCa0wZ032673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Jun 2015 08:36:01 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B36683043025; Mon, 15 Jun 2015 14:35:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jun 2015 14:35:58 +0200
Message-Id: <1434371759-29592-2-git-send-email-armbru@redhat.com>
In-Reply-To: <1434371759-29592-1-git-send-email-armbru@redhat.com>
References: <1434371759-29592-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 1/2] qemu-options: Improve -global
	documentation
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
X-List-Received-Date: Mon, 15 Jun 2015 12:36:11 -0000

Recent commit 3751d7c "vl: allow full-blown QemuOpts syntax for
-global" overloaded its existing argument syntax DRIVER.PROP=VALUE
with QemuOpts syntax.  Unambigious as long as no DRIVER contains '='.

Its documentation claims that "the two syntaxes are equivalent."
Improve it to spell out how exactly the old syntax gets desugared into
the new one.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-options.hx | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 1d281f6..b7afec5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -189,8 +189,9 @@ In particular, you can use this to set driver properties for devices which are
 created automatically by the machine model. To create a device which is not 
 created automatically and set properties on it, use -@option{device}.
 
-The two syntaxes are equivalent.  The longer one works for drivers whose name
-contains a dot.
+-global @var{driver}.@var{prop}=@var{value} is shorthand for -global
+driver=@var{driver},property=@var{prop},value=@var{value}.  The
+longhand syntax works even when @var{driver} contains a dot.
 ETEXI
 
 DEF("boot", HAS_ARG, QEMU_OPTION_boot,
-- 
1.9.3


