Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um9x9-0006wW-3P
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 17:48:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um9x5-0006rH-Oh
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um9x4-00019j-VX
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:48:35 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:38919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1Um9x4-00019X-Qg
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 17:48:34 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Mon, 10 Jun 2013 17:48:34 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 10 Jun 2013 17:48:22 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 82BD96E806B;
	Mon, 10 Jun 2013 17:48:11 -0400 (EDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r5ALmEhb332358; Mon, 10 Jun 2013 17:48:15 -0400
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r5ALmEf5007772; Mon, 10 Jun 2013 15:48:14 -0600
Received: from localhost6.localdomain6 (sig-9-65-97-46.mts.ibm.com
	[9.65.97.46])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r5ALmCTf007600; Mon, 10 Jun 2013 15:48:13 -0600
Message-Id: <201306102148.r5ALmCTf007600@d03av02.boulder.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1370186269-24353-1-git-send-email-peter.maydell@linaro.org>
Date: Mon, 10 Jun 2013 21:48:12 -0000
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13061021-7182-0000-0000-000007400D18
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] softfloat: Fix shift128Right for shift
	counts 64..127
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
X-List-Received-Date: Mon, 10 Jun 2013 21:48:37 -0000

Applied.  Thanks.

Regards,

Anthony Liguori


