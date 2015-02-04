Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAM-00083A-JY
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAH-0007tH-L1
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxAG-0003bE-SY
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIxAE-0003aK-Mp; Wed, 04 Feb 2015 05:26:30 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQAdW002641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:10 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQ8Ix019693
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D81FA3040D2D; Wed,  4 Feb 2015 11:26:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:01 +0100
Message-Id: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 0/6] Trivial cleanups around g_malloc()
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:37 -0000

I'm routing these patches through qemu-trivial, even though some of
them touch actively maintained code, and could go through the
respective tree instead:

* PATCH 1 block (Kevin, Stefan)

* PATCH 3 KVM (Paolo)

* PATCH 4 migration (Juan, Amit)

* PATCH 5 VNC (Gerd)

If you want me to reroute any of them, let me know.

v2:
* Trivially rebased, R-bys retained

Markus Armbruster (6):
  onenand: g_malloc() can't fail, bury dead error handling
  rtl8139: g_malloc() can't fail, bury dead error handling
  kvm: g_malloc() can't fail, bury dead error handling
  rdma: g_malloc0() can't fail, bury dead error handling
  vnc: g_realloc() can't fail, bury dead error handling
  translate-all: Use g_try_malloc() for dynamic translator buffer

 hw/block/onenand.c |  8 +-------
 hw/net/rtl8139.c   | 14 --------------
 kvm-all.c          |  4 ----
 migration/rdma.c   |  3 ---
 translate-all.c    |  2 +-
 ui/vnc.c           |  4 ----
 6 files changed, 2 insertions(+), 33 deletions(-)

-- 
1.9.3


