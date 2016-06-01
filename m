Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8169-0002tK-BX
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 04:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b8162-0002r2-EA
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 04:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b815w-0002xP-Gd
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 04:01:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b815o-0002sm-1e; Wed, 01 Jun 2016 04:01:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 10F95402BF;
	Wed,  1 Jun 2016 11:01:20 +0300 (MSK)
To: Alberto Garcia <berto@igalia.com>,
	Changlong Xie <xiecl.fnst@cn.fujitsu.com>, Eric Blake <eblake@redhat.com>, 
	qemu-devel@nongnu.org
References: <1464091153-11057-1-git-send-email-berto@igalia.com>
	<5744DFA3.1070806@redhat.com> <574BE26E.9020106@cn.fujitsu.com>
	<w51k2ib50ih.fsf@maestria.local.igalia.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574E964F.90000@msgid.tls.msk.ru>
Date: Wed, 1 Jun 2016 11:01:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <w51k2ib50ih.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix a couple of typos in
 throttle.txt
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
X-List-Received-Date: Wed, 01 Jun 2016 08:01:52 -0000

30.05.2016 13:00, Alberto Garcia wrote:
> On Mon 30 May 2016 08:49:18 AM CEST, Changlong Xie wrote:
>>>>     - Water leaks from the bucket at a rate of 100 IOPS.
>>>>     - Water can be added to the bucket at a rate of 2000 IOPS.
>>>>     - The size of the bucket is 2000 x 60 = 120000
>>>> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
>>>> +  - If 'iops-total-max' is unset then the bucket size is 100.
>>
>> Sorry to brother, why the bucket size is 100 rather than 100 x 60?
> 
> Oh, that's because 'iops-total-max-length' can only be set if
> 'iops-total-max' is set as well. It's explained earlier in the document,
> maybe I should make it clear there as well.
> 
> Michael, shall I send a new patch on top of my previous one or can the
> previous one be replaced?

I fixed it in the original commit, thanks!

/mjt

