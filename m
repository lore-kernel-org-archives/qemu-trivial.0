Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAShB-0001qv-5N
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 17:03:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh8-0001p8-9S
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh6-00062Y-Kx
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SASh2-000604-5x; Wed, 21 Mar 2012 17:03:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LL3bia012447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 17:03:38 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LL3bdK024568; Wed, 21 Mar 2012 17:03:37 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 17:02:43 -0400
Message-Id: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/4] More whitespace and coding style clean
	ups ahead of future changes
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
X-List-Received-Date: Wed, 21 Mar 2012 21:03:48 -0000

Hi Folks,

Please forgive me if you find these changes are annoying, as I am trying to
learn the ropes of patch submission with git ahead of making a real patch.

While working on the code, I found that scripts/checkpatch.pl will flag lines
that I am changing as not adhereing to the codeing standard due to
pre-existing coding violations. So I figured I could learn a bit about how to
submit patches by fixing these files I will be touching before submitting the
code changes.

I also figure this might benefit others working on the code base a bit.

Thanks,

-peter


