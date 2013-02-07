Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3YVh-0002Rq-Ts
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2013 15:55:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YVf-0002R1-9f
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:55:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YVd-0007x7-Pl
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:55:54 -0500
Received: from e32.co.us.ibm.com ([32.97.110.150]:35272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@linux.vnet.ibm.com>) id 1U3YPw-0006a0-SZ
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2013 15:50:01 -0500
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <jlarrew@linux.vnet.ibm.com>;
	Thu, 7 Feb 2013 13:49:57 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 7 Feb 2013 13:49:54 -0700
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 60A8219D803E;
	Thu,  7 Feb 2013 13:49:52 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r17Knagv128946; Thu, 7 Feb 2013 13:49:37 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r17KnWpJ014209; Thu, 7 Feb 2013 13:49:33 -0700
Received: from jlarrew.austin.ibm.com (jlarrew.austin.ibm.com [9.41.149.99])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r17KnWEi014183; Thu, 7 Feb 2013 13:49:32 -0700
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Feb 2013 14:49:25 -0600
Message-Id: <1360270167-15385-1-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.11.7
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13020720-5406-0000-0000-0000050AD35F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.150
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com
Subject: [Qemu-trivial] [PATCH 0/2] virtio-net config_size cleanups
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
X-List-Received-Date: Thu, 07 Feb 2013 20:55:56 -0000

This patch set includes some minor cleanups requested by the community for
the virtio-net config size solution.

[PATCH 1/2] hw/virtio-net: use existing macros to implement endof
[PATCH 2/2] hw/virtio-net: fix config_size data type


