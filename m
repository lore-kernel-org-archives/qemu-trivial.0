Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGU0g-00084c-DE
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 09:54:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0Y-0007oM-5D
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YGU0X-0006Iz-C8
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 09:54:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YGU0P-0006GZ-00; Wed, 28 Jan 2015 09:54:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0SEs7EQ021488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 09:54:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0SEs5J8028828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Jan 2015 09:54:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E8526303F83B; Wed, 28 Jan 2015 15:54:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Jan 2015 15:54:00 +0100
Message-Id: <1422456844-13043-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/4] Pair g_malloc() with g_free(), not free()
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
X-List-Received-Date: Wed, 28 Jan 2015 14:54:24 -0000

I'm routing these patches through qemu-trivial, even though some of
them touch actively maintained code, and could go through the
respective tree instead:

* PATCH 3 sPAPR (Alex)

* PATCH 4 USB (Gerd)

If you want me to reroute any of them, let me know.

Markus Armbruster (4):
  qemu-option: Replace pointless use of g_malloc0() by g_malloc()
  qemu-option: Pair g_malloc() with g_free(), not free()
  spapr_vio: Pair g_malloc() with g_free(), not free()
  usb: Pair g_malloc() with g_free(), not free()

 hw/ppc/spapr_vio.c | 2 +-
 hw/usb/desc-msos.c | 2 +-
 util/qemu-option.c | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.3


