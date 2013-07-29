Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3tzj-0003Mo-L2
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2013 16:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V3tzW-0002xb-Cp
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 16:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V3tzM-0005ny-TJ
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 16:24:26 -0400
Received: from e37.co.us.ibm.com ([32.97.110.158]:34060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1V3tzM-0005mE-Lj
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 16:24:16 -0400
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Mon, 29 Jul 2013 14:24:15 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 29 Jul 2013 14:24:04 -0600
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id C8DD119D8043;
	Mon, 29 Jul 2013 14:23:51 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r6TKO0VK153994; Mon, 29 Jul 2013 14:24:01 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r6TKO0p0008490; Mon, 29 Jul 2013 14:24:00 -0600
Received: from localhost6.localdomain6 (sig-9-65-227-166.mts.ibm.com
	[9.65.227.166])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r6TKNwEM008351; Mon, 29 Jul 2013 14:23:59 -0600
Message-Id: <201307292023.r6TKNwEM008351@d03av01.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
In-Reply-To: <1375073319-17488-1-git-send-email-aik@ozlabs.ru>
Date: Mon, 29 Jul 2013 20:23:57 -0000
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13072920-7408-0000-0000-000012705313
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.158
Cc: Anthony Liguori <aliguori@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alexander Graf <agraf@suse.de>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] spapr-vscsi: fix SOLNT bit in SRP_RSP
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
X-List-Received-Date: Mon, 29 Jul 2013 20:24:37 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


