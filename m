Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQYNh-0003p6-Vl
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 03:59:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQYNa-0003fe-Bm
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 03:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQYNU-0006nq-Cv
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 03:58:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQYNH-0006lV-Hl; Mon, 30 Sep 2013 03:58:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EDD5042A39;
	Mon, 30 Sep 2013 11:58:33 +0400 (MSK)
Message-ID: <52492F29.2010305@msgid.tls.msk.ru>
Date: Mon, 30 Sep 2013 11:58:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <CA+K+NcStLJod1P3MhWqPJ=jhfMwMuV_cxuivi-QXduwnT2uwqg@mail.gmail.com>
	<52488A79.8010803@msgid.tls.msk.ru>
	<1380522773.3922.15.camel@nilsson.home.kraxel.org>
In-Reply-To: <1380522773.3922.15.camel@nilsson.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: =?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>,
	QEMU <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pci-ohci: Add missing 'break' in
	ohci_service_td
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
X-List-Received-Date: Mon, 30 Sep 2013 07:59:00 -0000

30.09.2013 10:32, Gerd Hoffmann wrote:
>    Hi,
>
>> While the actual interesting change (adding break) looks
>> correct, and the whole thing is trivial indeed, this area
>> has a maintainer, -- Cc'ing Gerd for this.  If he's okay
>> I'll pick it up.
>
> Patch is fine.

No, I didn't ask whenever the patch is fine, I wanted to
ensure you wont blame me for accepting a trivial patch
for an area which has an active maintainer... ;)

Thanks, queued up for trivial-patches!

/mjt

