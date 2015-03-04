Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT9Rr-0007vt-OT
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 08:34:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT9Rq-0007v1-9S
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:34:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT9Rp-00036C-Bu
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:34:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YT9Rj-00034q-Ek; Wed, 04 Mar 2015 08:34:43 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 77E564083D;
	Wed,  4 Mar 2015 16:34:41 +0300 (MSK)
Message-ID: <54F709F1.7050107@msgid.tls.msk.ru>
Date: Wed, 04 Mar 2015 16:34:41 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1424073025-13262-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20150304121654.GC2530@work-vm> <54F6F919.9060905@msgid.tls.msk.ru>
	<20150304133232.GH2530@work-vm>
In-Reply-To: <20150304133232.GH2530@work-vm>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Amit Shah <amit.shah@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] migration/rdma: clean up
	qemu_rdma_dest_init a bit
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
X-List-Received-Date: Wed, 04 Mar 2015 13:34:51 -0000

04.03.2015 16:32, Dr. David Alan Gilbert wrote:
> * Michael Tokarev (mjt@tls.msk.ru) wrote:
[]
>> I think it's okay to merge it using the -trivial tree, I'm about to
>> send a pull request today.
> 
> Yes, OK, although I'd generally prefer the RDMA stuff to go
> through migration unless it's really trivial.

I've no prob with either of these.  It is just that I'm preparing
a pull request for -trivial tree now... ;)  I can drop the patch
from there.

Thanks,

/mjt

