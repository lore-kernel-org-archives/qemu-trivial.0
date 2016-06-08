Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAa2b-0003iT-3N
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 05:44:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAa2Z-0003g8-K5
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 05:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bAa2X-0007mm-PM
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 05:44:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bAa2S-0007iR-9l; Wed, 08 Jun 2016 05:44:40 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7C80540CC9;
	Wed,  8 Jun 2016 12:44:36 +0300 (MSK)
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
	<ce94e108e049ac2b51ef197fa15b1dcf6600c9ca.1465112552.git.mjt@msgid.tls.msk.ru>
	<w51eg8812e1.fsf@maestria.local.igalia.com>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5757E903.7020308@msgid.tls.msk.ru>
Date: Wed, 8 Jun 2016 12:44:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <w51eg8812e1.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PULL 24/52] docs: Fix a couple of typos in
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
X-List-Received-Date: Wed, 08 Jun 2016 09:44:48 -0000

08.06.2016 12:00, Alberto Garcia wrote:
> On Sun 05 Jun 2016 09:43:01 AM CEST, Michael Tokarev wrote:
> 
>>    - Water leaks from the bucket at a rate of 100 IOPS.
>>    - Water can be added to the bucket at a rate of 2000 IOPS.
>>    - The size of the bucket is 2000 x 60 = 120000
>> -  - If 'iops-total-max-length' is unset then the bucket size is 100.
>> +  - If 'iops-total-max' is unset then the bucket size is 100 x 60.
> 
> Sorry, I should have noticed this here in the pull request, but this is
> wrong.

This has been discussed before, and it looks like the original
version which I applied was actually right... :)

I can just drop this patch from the pull request, since it hasn't
been applied yet.  Esp. since the subject line is now wrong too :)

Thanks,

/mjt

