Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZIjZ-0003XM-06
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 09:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philipp.gesang@intra2net.com>) id 1cZFlI-0004CM-Tn
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 06:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philipp.gesang@intra2net.com>) id 1cZFlI-0007vu-0q
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 06:41:12 -0500
Received: from rp02.intra2net.com ([62.75.181.28]:55288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philipp.gesang@intra2net.com>)
	id 1cZFlD-0007pT-H7; Thu, 02 Feb 2017 06:41:07 -0500
Received: from intranator.m.i2n (unknown [172.17.128.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by rp02.intra2net.com (Postfix) with ESMTPS id A2B6810014C;
	Thu,  2 Feb 2017 12:41:04 +0100 (CET)
Received: from localhost (intranator.m.i2n [127.0.0.1])
	by localhost (Postfix) with ESMTP id 7B3B96E7;
	Thu,  2 Feb 2017 12:41:04 +0100 (CET)
X-Virus-Scanned: by Intra2net Mail Security (AVE=8.3.42.110,VDF=8.12.142.252)
Received: from drift.m.i2n (drift.m.i2n [172.16.1.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: smtp-auth-user)
	by intranator.m.i2n (Postfix) with ESMTPSA id CDF7E657;
	Thu,  2 Feb 2017 12:41:02 +0100 (CET)
From: Philipp Gesang <philipp.gesang@intra2net.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Philipp Gesang <philipp.gesang@intra2net.com>
Date: Thu,  2 Feb 2017 12:41:01 +0100
Message-Id: <20170202114101.2655-1-philipp.gesang@intra2net.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.75.181.28
X-Mailman-Approved-At: Thu, 02 Feb 2017 09:51:35 -0500
Subject: [Qemu-trivial] [PATCH] docs: update manpage for stderr->log rename
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
X-List-Received-Date: Thu, 02 Feb 2017 11:41:13 -0000

With commit ed7f5f1d8db06fc31352a5ef4f54985e630c575a the name of
this backend changed from =E2=80=9Cstderr=E2=80=9D to =E2=80=9Clog=E2=80=9D=
.

Signed-off-by: Philipp Gesang <philipp.gesang@intra2net.com>
---
 qemu-option-trace.texi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-option-trace.texi b/qemu-option-trace.texi
index 693ab5a3e1..4166d5cdc2 100644
--- a/qemu-option-trace.texi
+++ b/qemu-option-trace.texi
@@ -5,7 +5,7 @@ Specify tracing options.
 Immediately enable events matching @var{pattern}.
 The file must contain one event name (as listed in the @file{trace-event=
s-all}
 file) per line; globbing patterns are accepted too.  This option is only
-available if QEMU has been compiled with the @var{simple}, @var{stderr}
+available if QEMU has been compiled with the @var{simple}, @var{log}
 or @var{ftrace} tracing backend.  To specify multiple events or patterns=
,
 specify the @option{-trace} option multiple times.
=20
@@ -15,7 +15,7 @@ Use @code{-trace help} to print a list of names of trac=
e points.
 Immediately enable events listed in @var{file}.
 The file must contain one event name (as listed in the @file{trace-event=
s-all}
 file) per line; globbing patterns are accepted too.  This option is only
-available if QEMU has been compiled with the @var{simple}, @var{stderr} =
or
+available if QEMU has been compiled with the @var{simple}, @var{log} or
 @var{ftrace} tracing backend.
=20
 @item file=3D@var{file}
--=20
2.11.0


