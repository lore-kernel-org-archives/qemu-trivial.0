Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTVuh-0004RG-9e
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 09:01:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVuY-0004Dv-ER
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTVuS-0001jt-Ah
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 09:01:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XTVuC-0001fM-3G; Mon, 15 Sep 2014 09:01:20 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5860B441EB;
	Mon, 15 Sep 2014 17:01:19 +0400 (MSK)
Message-ID: <5416E31E.60104@msgid.tls.msk.ru>
Date: Mon, 15 Sep 2014 17:01:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, 
 stefano.stabellini@eu.citrix.com
References: <5408780E.70607@gmail.com>
In-Reply-To: <5408780E.70607@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] xen-hvm.c: Always return -1 when
 failure occurs in xen_hvm_init()
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
X-List-Received-Date: Mon, 15 Sep 2014 13:01:50 -0000

Applied to -trivial, after fixing the commit message to be
just a bit more english-like.  Thank you!

/mjt

