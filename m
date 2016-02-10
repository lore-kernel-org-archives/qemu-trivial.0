Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTTHo-000681-DL
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 06:50:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTTHm-00065J-Gy
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:50:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTTHb-0005Dl-VQ
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:50:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTTGS-0004Wd-Pe; Wed, 10 Feb 2016 06:48:56 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 82F9E40FB7;
	Wed, 10 Feb 2016 14:48:55 +0300 (MSK)
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
References: <1455102397-14425-1-git-send-email-mjt@msgid.tls.msk.ru>
	<56BB2086.2040001@de.ibm.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
X-Enigmail-Draft-Status: N1110
Organization: Telecom Service, JSC
Message-ID: <56BB23A6.10200@msgid.tls.msk.ru>
Date: Wed, 10 Feb 2016 14:48:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56BB2086.2040001@de.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Pierre Morel <pmorel@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] s390x: remove s390-zipl.rom
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
X-List-Received-Date: Wed, 10 Feb 2016 11:50:19 -0000

10.02.2016 14:35, Christian Borntraeger wrote:
> On 02/10/2016 12:06 PM, Michael Tokarev wrote:
>> This is an s390 boot rom which was used in s390-virtio machine.
>> but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
>> "s390x: remove s390-virtio machine", this file isn't used.
>> The only place it is referenced in the code is an unused
>> which I'm modifying too, to refer to s390-ccw.rom instead.
>>
>> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> a minor nit below, otherwise 
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

Fixed in git, that one and the commit comment (sent a v2).

Thanks,

/mjt

