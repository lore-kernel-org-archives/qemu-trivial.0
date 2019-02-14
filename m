Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDb3-0007H3-Id
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:46:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDb0-0007DC-Jv
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:46:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDaz-0006vH-JH
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:46:18 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36319)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDaz-0006tR-8S; Thu, 14 Feb 2019 04:46:17 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mgf4k-1hZ1zs2hX2-00h8fB; Thu, 14 Feb 2019 10:46:12 +0100
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <22e847da-14c5-f88b-19bc-a034d0eecf9e@vivier.eu>
Date: Thu, 14 Feb 2019 10:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-1-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:yMbrVSoF3efqPl48jT2x7syLoUxQuaE1RPRthPWo62kdfCZtGPp
	nJ8oSAkHZqbzdkXHDlybi1cpXAeVj+JSohSjF+Pwb6eXOT3bPytS/CaXeligakDorcGIAeo
	9t23HPDJoVHmj91O1VON+BVQBdx1ewDLdEFDJzPI2A+hPNzqYBmg3g+woLZlLTT8GPccnVe
	ZATAlCpQtX5whvpqgXmwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UUp+KrydIoM=:MQC5LRmBr6MLHJp5+aV1LK
	ZkLjVMAlfYET0/maR32YgjB4IgIDVda+9x+tuuPK6DZukpktpQFYeeBsZQsO6DdrQrRrv4Pir
	9mAMjqqZXafkabhREaUbfZwT4+Yu8k6imWWqHlqMv3GP+ttJPD7Vu0cQtRqnYsFbGV7XzBCFg
	yT2eTT3k/YtVa9Fdvrxw9UPrrI87bdV1kVwtWjVeTDT4hjaWOaM6Ilw+ZS7nXp+ojUb+RY94B
	0XtTuz7dFCflhbYnm3izmbQM10LxOGbekXEInG+1MBmqaLyUtfqAM0j3yXI3d7IVFS/z54cLG
	AvwHzahCP5E28oA4NNlHURHleG6fhPp1cOsUA4Ks3yTtEvPqSKUyF/dJwksQZR79lt7AcVn0f
	yQh9/Vggq2V4lyMEbqODLU0G5bkUB11B26RIbSrtTlX4jJg2RsKjKtADxNWH/Q7cQ84i2XHqg
	7PXQYqmKSkQrtQ9o+1JqrO0CqUgXxOPeeCA1g896f+lZgqqu5OSme2B7rfVcLFplFhKxqLo49
	/7XAHOe4AMEgD/NJowDHmuO0zHHPy9znnpKwpq8AXH4FQcCL+z8rgVOsfcqgSocSAdjM3o6IU
	0JNyEElsQgTsuQuibFVc9NYSaNgtrSiUScdUg45YealtHt9PBFjvhwcoIortazRB6Rr7zWRKV
	qcLeVRUuqXo6KRa1x26LGbKbf7GFowBRKOxVrNPKvWF8av+OvkuXQcrG6+rKRhQ3Y11Lp+79K
	4OF2xxg306ULyiO68ajOuM3yaRgZ+W7QGdnS5WyeN4B94B1f8KXzFShII14=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH 0/4] Trivial fixes for configure and
 Python scripts
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
X-List-Received-Date: Thu, 14 Feb 2019 09:46:19 -0000

On 07/02/2019 20:36, Cleber Rosa wrote:
> This is just a small collection of trivial fixes for configure
> and some Python scripts (missing/unused import statements).
> 
> Cleber Rosa (4):
>   configure: remove handling of "wav" audio driver
>   configure: fix qemu-img name
>   scripts/render_block_graph.py: add a missing import
>   tests/migration/guestperf/engine.py: remove unused import
> 
>  configure                           | 6 +-----
>  scripts/render_block_graph.py       | 1 +
>  tests/migration/guestperf/engine.py | 1 -
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 

I've applied to my trivial-patches branchi patches 1 and 2, but not 3
and 4 as I don't know python and no one has reviewed them.

Thanks,
Laurent

