Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh3R2-0004JJ-0V
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 15:50:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3Qv-0004AF-30
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:50:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh3Ql-0001Pt-KX
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 15:50:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uh3QX-00018U-Lf; Mon, 27 May 2013 15:49:53 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C9B0541D10;
	Mon, 27 May 2013 23:49:52 +0400 (MSK)
Message-ID: <51A3B8DF.2040004@msgid.tls.msk.ru>
Date: Mon, 27 May 2013 23:49:51 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Lei Li <lilei@linux.vnet.ibm.com>
References: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
In-Reply-To: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, quintela@redhat.com
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
X-List-Received-Date: Mon, 27 May 2013 19:50:22 -0000

27.05.2013 14:33, Lei Li wrote:
> This small series improves the document migration.txt
> and remove a duplicated setting of bandwidth_limit.

Thanks, both applied to the trivial patch queue.

/mjt

