Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0X4C-0006Yg-NF
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2018 14:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f0X4A-0006WR-3n
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 14:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f0X48-0002Do-Ql
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 14:41:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45756 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f0X44-0002B3-36; Mon, 26 Mar 2018 14:41:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A039EBFF4;
	Mon, 26 Mar 2018 18:41:51 +0000 (UTC)
Received: from red.redhat.com (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41711D7E02;
	Mon, 26 Mar 2018 18:41:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Date: Mon, 26 Mar 2018 13:41:47 -0500
Message-Id: <20180326184147.1565719-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 26 Mar 2018 18:41:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 26 Mar 2018 18:41:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH for-2.12] maint: Add .mailmap entries for
 patches claiming list authorship
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
X-List-Received-Date: Mon, 26 Mar 2018 18:41:59 -0000

The list did not author any patches, but it does rewrite the
'From:' header of messages sent from any domain with restrictive
SPF policies that would otherwise prevent the message from reaching
all list recipients.  If a maintainer is not careful to undo the
list header rewrite, and the author did not include a manual
'From:' line in the body to fix the munged header, then 'git am'
happily attributes the patch to the list.  Add some mailmap
entries to correct the few that have escaped our attention; while
we also work on improving the tooling to catch the problem in
the future before a merge is even made.

Also improve the comments occurring in the file, including line
length improvements.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Probably worth inclusion in 2.12-rc1, since it makes statistics
about the release easier to follow.

 .mailmap | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index cf689b9ec99..b02c357e9a1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1,6 +1,7 @@
-# This mailmap just translates the weird addresses from the original imp=
ort into git
-# into proper addresses so that they are counted properly in git shortlo=
g output.
-#
+# This mailmap fixes up author names/addresses.
+
+# The first section translates weird addresses from the original git imp=
ort
+# into proper addresses so that they are counted properly by git shortlo=
g.
 Andrzej Zaborowski <balrogg@gmail.com> balrog <balrog@c046a42c-6fe2-441c=
-8c8c-71466251a162>
 Anthony Liguori <anthony@codemonkey.ws> aliguori <aliguori@c046a42c-6fe2=
-441c-8c8c-71466251a162>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm=
.com>
@@ -15,10 +16,19 @@ Paul Burton <paul.burton@mips.com> <paul.burton@imgte=
c.com>
 Paul Burton <paul.burton@mips.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-714662=
51a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-#
+
+# Next, translate a few commits where mailman rewrote the From: line due
+# to strict SPF, although we prefer to avoid adding more entries like th=
at.
+Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qemu-devel <qemu-de=
vel@nongnu.org>
+Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-deve=
l@nongnu.org>
+Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-deve=
l@nongnu.org>
+Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-dev=
el <qemu-devel@nongnu.org>
+
+
 # Also list preferred name forms where people have changed their
 # git author config
 Daniel P. Berrang=C3=A9 <berrange@redhat.com>
--=20
2.14.3


