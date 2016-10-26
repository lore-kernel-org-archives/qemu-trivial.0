Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzT9S-0002zd-J2
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2016 14:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bzT9Q-0002yA-8H
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 14:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bzT9P-0002rq-HA
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2016 14:42:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bzT9O-0002r0-06; Wed, 26 Oct 2016 14:42:10 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9D884431FE;
	Wed, 26 Oct 2016 21:42:10 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 3769FB4E;
	Wed, 26 Oct 2016 21:42:09 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1476968226-15918-1-git-send-email-peter.maydell@linaro.org>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <9f53995d-02eb-0bf0-1b46-d41b82ba21f2@msgid.tls.msk.ru>
Date: Wed, 26 Oct 2016 21:42:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476968226-15918-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] s390: avoid always-true comparison in
 s390_pci_generate_fid()
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
X-List-Received-Date: Wed, 26 Oct 2016 18:42:13 -0000

Applied to -trivial, thanks!

/mjt

