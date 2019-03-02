Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0DHF-0004DO-BK
	for mharc-qemu-trivial@gnu.org; Sat, 02 Mar 2019 17:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0DHC-0004Bc-Pi
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 17:38:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0DHC-0005Sc-24
	for qemu-trivial@nongnu.org; Sat, 02 Mar 2019 17:38:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h0DHA-0005Os-IE; Sat, 02 Mar 2019 17:38:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B10B81440A0;
	Sat,  2 Mar 2019 22:38:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-70.brq.redhat.com [10.40.204.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E485D9C5;
	Sat,  2 Mar 2019 22:38:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Date: Sat,  2 Mar 2019 23:38:23 +0100
Message-Id: <20190302223825.11192-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 02 Mar 2019 22:38:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] util/error: Trivial cleanup
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
X-List-Received-Date: Sat, 02 Mar 2019 22:38:39 -0000

Trivial cleanups suggested by Daniel and Thomas.

Philippe Mathieu-Daud=C3=A9 (2):
  util/error: Remove an unnecessary NULL check
  util/error: Remove unnecessary saved_errno

 util/error.c | 7 -------
 1 file changed, 7 deletions(-)

--=20
2.20.1


