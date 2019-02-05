Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqrEO-0007bJ-4d
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 22:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqrEM-0007a6-3S
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqr6L-0002c3-FD
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:08:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36532)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gqr6B-0002Wb-KX; Mon, 04 Feb 2019 22:08:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54ED73680B;
	Tue,  5 Feb 2019 03:08:33 +0000 (UTC)
Received: from thuth.com (ovpn-116-65.phx2.redhat.com [10.3.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DB5F60CCE;
	Tue,  5 Feb 2019 03:08:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>
Date: Tue,  5 Feb 2019 04:08:19 +0100
Message-Id: <1549336101-17623-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Feb 2019 03:08:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] Clean up the SDL audio code
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
X-List-Received-Date: Tue, 05 Feb 2019 03:17:02 -0000

Now that support for SDL 1.2 has been removed, we can clean up
the sdlaudio code a little bit, too.

Thomas Huth (2):
  audio/sdlaudio: Remove the semaphore code
  audio/sdlaudio: Simplify the sdl_callback function

 audio/sdlaudio.c | 188 +++++++------------------------------------------------
 1 file changed, 23 insertions(+), 165 deletions(-)

-- 
1.8.3.1


