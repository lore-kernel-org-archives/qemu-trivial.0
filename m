Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpT5-0002Oj-Tf
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpT4-0002My-04
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpT3-0007Ve-7R
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1grpT1-0007U2-Ih; Thu, 07 Feb 2019 14:36:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCF07C01DE10;
	Thu,  7 Feb 2019 19:36:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-41.rdu2.redhat.com
	[10.10.120.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 745695C2E0;
	Thu,  7 Feb 2019 19:36:08 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu,  7 Feb 2019 14:36:02 -0500
Message-Id: <20190207193605.25676-2-crosa@redhat.com>
In-Reply-To: <20190207193605.25676-1-crosa@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 07 Feb 2019 19:36:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/4] configure: remove handling of "wav"
 audio driver
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
X-List-Received-Date: Thu, 07 Feb 2019 19:36:14 -0000

This looks like a leftover that was never implemented.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index fbd0825488..ff55e2273e 100755
--- a/configure
+++ b/configure
@@ -3350,10 +3350,6 @@ for drv in $audio_drv_list; do
       oss_libs=3D"$oss_lib"
     ;;
=20
-    wav)
-    # XXX: Probes for CoreAudio, DirectSound
-    ;;
-
     *)
     echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
         error_exit "Unknown driver '$drv' selected" \
--=20
2.20.1


