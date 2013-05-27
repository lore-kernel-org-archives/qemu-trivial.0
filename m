Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgvmB-0007GF-9Z
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 07:39:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ugvm6-00078b-Qr
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 07:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ugvm1-0006Xe-He
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 07:39:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ugvly-0006WD-HE; Mon, 27 May 2013 07:39:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2F4B141C0E;
	Mon, 27 May 2013 15:39:22 +0400 (MSK)
Received: from wh.tls.msk.ru (wh.tls.msk.ru [192.168.177.7])
	by tsrv.corpit.ru (Postfix) with ESMTP id 00446491;
	Mon, 27 May 2013 15:39:22 +0400 (MSK)
Message-ID: <51A345E9.50104@msgid.tls.msk.ru>
Date: Mon, 27 May 2013 15:39:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: Lei Li <lilei@linux.vnet.ibm.com>
References: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
In-Reply-To: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
X-Enigmail-Version: 1.4.1
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] Trivial fixes for migration
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
X-List-Received-Date: Mon, 27 May 2013 11:39:41 -0000

27.05.2013 14:33, Lei Li wrote:
> This small series improves the document migration.txt
> and remove a duplicated setting of bandwidth_limit.

FWIW, please don't CC me directly, I'm subscribed to
qemu-trivial@ obviously (being the one behind trivial-
patches currently).

Thanks,

/mjt

