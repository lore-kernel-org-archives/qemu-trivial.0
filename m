Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xycys-0001FE-PX
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 03:50:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xycyl-00012T-2J
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xycye-0004nP-Rx
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 03:50:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XycyS-0004cW-55; Wed, 10 Dec 2014 03:50:20 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7399D419AF;
	Wed, 10 Dec 2014 11:50:19 +0300 (MSK)
Message-ID: <5488094B.5000708@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 11:50:19 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1418039561-5672-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1418039561-5672-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] fw_cfg: remove superfluous blank line
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
X-List-Received-Date: Wed, 10 Dec 2014 08:50:45 -0000

Applied to trivial.

However, I think this patch is too trivial even
for trivial-patches queue... ;)  As in, don't
bother fixing things like this unless there's
other code around being changed too.

Thanks,

/mjt

