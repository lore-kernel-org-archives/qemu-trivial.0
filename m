Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hkaZg-0002Qx-Vw
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jul 2019 16:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55537)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hkaZe-0002Op-Qc
 for qemu-trivial@nongnu.org; Mon, 08 Jul 2019 16:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hkaZd-0006L8-Pp
 for qemu-trivial@nongnu.org; Mon, 08 Jul 2019 16:49:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45108)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hkaZb-0006Ib-Jl; Mon, 08 Jul 2019 16:49:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE0F72E95A2;
 Mon,  8 Jul 2019 20:49:18 +0000 (UTC)
Received: from localhost (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56CBD57996;
 Mon,  8 Jul 2019 20:49:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue,  9 Jul 2019 00:49:09 +0400
Message-Id: <20190708204909.10891-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 08 Jul 2019 20:49:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] misc: fix naming scheme of compatiblity
 arrays
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2019 20:49:23 -0000

Since merge 31ed41889e6e13699871040fe089a2884dca46cb ("Merge
remote-tracking branch
'remotes/elmarco/tags/machine-props-pull-request' into staging"), the
compat arrays are in lowercase.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/migration.rst | 2 +-
 hw/i386/pc_piix.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 220059679a..f7668ae389 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -314,7 +314,7 @@ For example:
=20
    a) Add a new property using ``DEFINE_PROP_BOOL`` - e.g. support-foo a=
nd
       default it to true.
-   b) Add an entry to the ``HW_COMPAT_`` for the previous version that s=
ets
+   b) Add an entry to the ``hw_compat_`` for the previous version that s=
ets
       the property to false.
    c) Add a static bool  support_foo function that tests the property.
    d) Add a subsection with a .needed set to the support_foo function
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c2280c72ef..6a0e29de7c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -313,7 +313,7 @@ else {
  * pc_compat_*() functions that run on machine-init time and
  * change global QEMU state are deprecated. Please don't create
  * one, and implement any pc-*-2.4 (and newer) compat code in
- * HW_COMPAT_*, PC_COMPAT_*, or * pc_*_machine_options().
+ * hw_compat_*, pc_compat_*, or * pc_*_machine_options().
  */
=20
 static void pc_compat_2_3_fn(MachineState *machine)
--=20
2.22.0.214.g8dca754b1e


