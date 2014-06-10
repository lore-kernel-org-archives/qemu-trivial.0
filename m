Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOAy-0006Sp-Q9
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 11:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOAr-0006Hz-4I
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 11:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOAl-0003yo-6r
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 11:41:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOAX-0003q2-DP; Tue, 10 Jun 2014 11:41:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 047F6412A5;
	Tue, 10 Jun 2014 19:40:55 +0400 (MSK)
Message-ID: <53972707.1020909@msgid.tls.msk.ru>
Date: Tue, 10 Jun 2014 19:40:55 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: mischief <mischief@offblast.org>, qemu-devel@nongnu.org
References: <20140609051917.GA17110@iota.offblast.org>
In-Reply-To: <20140609051917.GA17110@iota.offblast.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: vmware_vga: don't return cursorx
 when the driver asks for cursory register
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
X-List-Received-Date: Tue, 10 Jun 2014 15:41:27 -0000

09.06.2014 09:19, mischief wrote:
> hello qemu-*@nongnu.org, this is my first contribution. apologies if
> something is incorrect.
> 
> this patch fixes vmware_vga.c so that it actually returns the cursory
> register when asked for, instead of cursorx.

That's a good one.  Thank you, applied to -trivial.

/mjt

