Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1Sf6-0000f7-3X
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sf4-0000dw-H0
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:16:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1Sf3-0006r2-KX
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:16:26 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:42645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1Sf3-0006QR-5u; Wed, 06 Mar 2019 04:16:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1M277h-1gyycB0xTN-002YM8; Wed, 06 Mar 2019 10:15:50 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Juan Quintela <quintela@redhat.com>,
	qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1551457277-884-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3b4ca6e3-f1dc-e99c-c0f9-866608e5da3b@vivier.eu>
Date: Wed, 6 Mar 2019 10:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1551457277-884-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nzXgV6hjKM25DnZMhdC1OkKd2ufwvBlsJmOB1jPloLBUFyoIHFQ
	BHaCnS93xI+q8AiQiwL2/c5NLB1CnNKd0QgUs6Yu6fkVOu0So8LZu5wGwo+n+5u9a+4faMB
	+oPTJllEoE2DwtZccH/IJwYqYUfvoh1Qpe6L2wJV4M9Ai8teHKgZSUgbuwKIfwf0cPkuKcr
	Sl7IHawwP5iBXgla4uYNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JEvYPG0d1Zw=:mlBRatQxun0a4PHVOz3+KU
	J2ARcFj+7X2ZQL4OlD2ITH6Sx+itZsFhqV0iDiWwT1o1rMbhC85L8ekKX2ZtUXGzLE1aLZaXF
	T/LJiADjWAtlCu/gMy6ch2epvVTWTcpr88ULfl0QmJHFSxmZsDC/ljJvkO/COgjfNRr/dR+KX
	YIRJp9C7eoKerkxu4HJWvgcv+mxyHX87MPBDGd13I/izmi1JvzNyUx0VfT/41cZDqoNdAqYKb
	FMPfr5jaMxPaaqHJ/eMZt5nAKtNygRxAK+Vs4cgBlbJWNiKSfmdwcEY0NJKOYr3IzQkOWRWrG
	AQFS0tjBIb7HlIN92PLdwPK8e5Y8LjJKK091PDdlli9UCn7Y91TXOt6cnuVQrQs1rNyafxTDO
	K5Cwg5SXzhjPCoN0SOTii0MrRx1/WRBSs3OxxihItD6JUN4BWn7ztiabCHnQ+UDf0V2TZP0Qy
	ZkZbcm3DBwZbXot+1T6Y8Yu+lB/qB4ccQxIaCQO2uPIPQepJtu9HF0FOhHxG7+681UZn41FwK
	+WCV7rcLVbHcuJrxLebQU7rnToQV+hALSWjsdt4QAtWeKkqSf3XNt1mrYNHDeXuxv+7kDrz9Z
	oIFrNl8UwAQYTx45poDgPecpCKvDlSdu40H0degO3CA8SpOanSbc+Uk7sxnsIp686/7cqsNQS
	taaFqxuMadhQpYtc17fOWXJQC8DJApCBFXXCykwnOBFnttsdrdCkfMFzGDMwC/PlldUdwKMj5
	stDigSJDdm7yVEujaMDV4aveHhvO9v+yK/Qa485oRoxkUp5RpfLP/u3Wm1I=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] tests: Do not use "\n" in
 g_test_message() strings
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
X-List-Received-Date: Wed, 06 Mar 2019 09:16:27 -0000

On 01/03/2019 17:21, Thomas Huth wrote:
> g_test_message() takes care of the newline on its own, so we
> should not use \n in the strings here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/ivshmem-test.c         |  4 ++--
>  tests/m48t59-test.c          |  4 ++--
>  tests/migration-test.c       |  4 ++--
>  tests/rtc-test.c             |  4 ++--
>  tests/rtl8139-test.c         |  6 +++---
>  tests/test-aio-multithread.c |  8 ++++----
>  tests/test-coroutine.c       | 10 ++++------
>  tests/vhost-user-test.c      | 14 +++++++-------
>  8 files changed, 26 insertions(+), 28 deletions(-)

The tests/vhost-user-test.c part doesn't apply cleanly on top of master.
Could you resend?

Thanks,
Laurent


