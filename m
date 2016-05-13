Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b179V-0008Mx-0a
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 03:04:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179S-0008HY-DN
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1b179Q-0003RL-PO
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 03:04:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1b179J-0003OA-9B; Fri, 13 May 2016 03:04:37 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F78463322;
	Fri, 13 May 2016 07:04:35 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-225.ams2.redhat.com [10.36.7.225])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4D74XkW010464; Fri, 13 May 2016 03:04:34 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Fri, 13 May 2016 09:04:28 +0200
Message-Id: <1463123072-30603-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 13 May 2016 07:04:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/4] slirp: Spring-cleaning
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
X-List-Received-Date: Fri, 13 May 2016 07:04:47 -0000

QEMU 2.6.0 has been released ... time for some spring-cleaning
in the slirp code: These patches remove some old and unused
code, and clean up osdep.h related header inclusions.

Thomas Huth (4):
  slirp: Clean up slirp_config.h
  slirp: Remove obsolete backward-compatibility cruft
  slirp: Remove some unused code from slirp.h
  slirp: Clean up osdep.h related header inclusions

 slirp/ip6_icmp.c     |  1 -
 slirp/ip_input.c     |  1 -
 slirp/misc.c         | 21 -----------
 slirp/slirp.h        | 50 --------------------------
 slirp/slirp_config.h | 99 ----------------------------------------------------
 slirp/udp6.c         |  1 -
 6 files changed, 173 deletions(-)

-- 
1.8.3.1


