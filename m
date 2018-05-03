Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fEN9v-0001R5-QC
	for mharc-qemu-trivial@gnu.org; Thu, 03 May 2018 18:57:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9t-0001NQ-GR
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fEN9s-0005wD-JE
	for qemu-trivial@nongnu.org; Thu, 03 May 2018 18:57:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40120 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1fEN9m-0005ms-Ge; Thu, 03 May 2018 18:56:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E028406C780;
	Thu,  3 May 2018 22:56:58 +0000 (UTC)
Received: from probe.redhat.com (ovpn-126-131.rdu2.redhat.com [10.10.126.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 756836F9E3;
	Thu,  3 May 2018 22:56:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Cc: qemu-trivial@nongnu.org,
	John Snow <jsnow@redhat.com>
Date: Thu,  3 May 2018 18:56:48 -0400
Message-Id: <20180503225648.13153-6-jsnow@redhat.com>
In-Reply-To: <20180503225648.13153-1-jsnow@redhat.com>
References: <20180503225648.13153-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 03 May 2018 22:56:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 03 May 2018 22:56:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jsnow@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 5/5] qemu-img-cmds.hx: add passive-aggressive
 note
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
X-List-Received-Date: Thu, 03 May 2018 22:57:06 -0000

I'm kidding. It's very easy to forget there are per-command sections
in the texi, and insane that we don't autogenerate those, too.

Until then, leave a little post-it note in this .hx file until I
find a way to delete it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-img-cmds.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 84deb858af..3d2f7b26eb 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -6,6 +6,9 @@ HXCOMM DEF(command, callback, arg_string) is used to construct
 HXCOMM command structures and help message.
 HXCOMM HXCOMM can be used for comments, discarded from both texi and C
 
+HXCOMM When amending the TEXI sections, please remember to copy the usage
+HXCOMM over to the per-command sections in qemu-img.texi.
+
 STEXI
 @table @option
 ETEXI
-- 
2.14.3


