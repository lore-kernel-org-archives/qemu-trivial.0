Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSO1c-0003dF-Di
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2013 05:19:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSO1V-0003Um-VO
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSO1R-0004SX-2u
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:19:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSO1G-0004Qa-UG; Sat, 05 Oct 2013 05:19:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4BC8840AC6;
	Sat,  5 Oct 2013 13:19:26 +0400 (MSK)
Message-ID: <524FD99E.8020205@msgid.tls.msk.ru>
Date: Sat, 05 Oct 2013 13:19:26 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de> <524C6DD0.9070605@msgid.tls.msk.ru>
	<524C80ED.3020507@weilnetz.de> <524D2745.8060906@redhat.com>
	<524FD8B2.9090201@msgid.tls.msk.ru>
In-Reply-To: <524FD8B2.9090201@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Sat, 05 Oct 2013 09:19:46 -0000

05.10.2013 13:15, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Okay.  This takes just too long and too many people
> are affected.  I'll just set the variable in question
> (caps) to NULL at entry for now, -- it is not a critical
> path and the current code is correct anyway.  This is
> becoming ridiculous, when there are so many different
> opinions about such a trivial thing, with the result
> being that nothing is fixed.  Setting it to NULL at
> least will let a buildbot to be fixed for now.

Forgot the patch itself.  It is the shortest from all
already proposed ;)

Author: Michael Tokarev <mjt@tls.msk.ru>
Date:   Sat Oct 5 13:18:28 2013 +0400

     migration: Fix compiler warning ('caps' may be used uninitialized)

     Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/migration.c b/migration.c
index b4f8462..2b1ab20 100644
--- a/migration.c
+++ b/migration.c
@@ -150,6 +150,7 @@ MigrationCapabilityStatusList *qmp_query_migrate_capa=
bilitie
      MigrationState *s =3D migrate_get_current();
      int i;

+    caps =3D NULL; /* silence compiler warning */
      for (i =3D 0; i < MIGRATION_CAPABILITY_MAX; i++) {
          if (head =3D=3D NULL) {
              head =3D g_malloc0(sizeof(*caps));


Thanks,

/mjt


