Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg8j-00075q-KO
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg8d-0006wv-TQ
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg8O-00080Z-MU
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:57:22 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46873)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg8C-0007qh-2Z; Thu, 25 Oct 2018 09:57:00 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MnaTt-1fq0MM3jvx-00jcno; Thu, 25 Oct 2018 15:56:47 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MnaTt-1fq0MM3jvx-00jcno; Thu, 25 Oct 2018 15:56:47 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-5-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ba91dc41-3378-459f-48a7-d77534922ded@vivier.eu>
Date: Thu, 25 Oct 2018 14:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-5-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CcGa1d9/YwYCOWOmG7I8buQVeGKyz2HIGXnGhEoGKtHsWsmBhwl
	/wOlSNT3j5DBIVT5+uoY4GQOvz16tzAiR3v0cUNe/qhBoDPkhYoJU18RKOi+OCgJl3ChiG+
	YZM1lQUJ6+LtmGYyoum+NJ/iNud4tNf3wGax8Pf5E8ujLX9XWBRhd+BbYXmtCNpd4Uz5C6e
	1/VxzmIYMmpgxPfFUPgjw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:z8vt9w6YUJ8=:/SCfNrBieX75iftxAxa2+N
	GTU57XyGMarG6fS1sD6eMr0U0hi0GkhNUnrI9lU//r9UOkFrMOQa8edlEU8u/g5TOKl/2ejV5
	QakokSDVblZkCslLO2rb1wbOA1tgdh5tRPB4xyx3OFTSooUaZ8ysHW/7dBuKBIzh7z5tvVe89
	ljALPSYd3bv8tv50vz7onmE4+Jw1BHHbpwg91Yi87QLXz2ylcruSfw6UANr7SLbfswL+c0VWl
	NlbtgPVzLK5ZpW/C1MOFJkZsSULqLnfS9Wssp+EOt+U3gqf9Ay86cGBxLgV6oWr2adwqn7ib1
	VMOww040HyCgb54EO4UcdkPrFm+myA7vN7Zz1wU4drtGDAUU/MVGyCezf3MeB/kyp1QzBycKg
	z/sQmQcK8AX2ADTGRpX7BN0XsF9SIRW3Aa5aq84iBFGQ1vrw+BzzPSeFyCFF41fNPSrxNRs5v
	xd0njJ68C//Rz2/09h7TWpopmszjcEvVIViygb4wLgF/wTRNNhzg0bVhZ9yEoP6HRvz7N5vEU
	oGuAPoxqclcgXrnYjQWYQinig2BgextuZXgaJsJt/b3dUYscYz5jaAgz4I6ZzrJ7DRNmRHn6o
	wIY+9JQ0dFb43UYxSUp+DFQy03yOHJG9Z93ZfcUU4kbeyGZCvU9ITy8f0LnBxPsVcTUurFUUc
	cJmq5LFaYk//a5ODePC5oYY61tejeTOasNk1bA8iD+Wd5v7+yw/zUyj0G0OSpT6jLdClG4kdo
	0Hy9ceJ5meoKsrrT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH 04/10] qemu-iotests: fix filename
 containing checks
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
X-List-Received-Date: Thu, 25 Oct 2018 13:57:33 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> Commit cce293a2945 moved some functions from common.config to
> common.rc, but the error messages still reference the old file
> location.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/qemu-iotests/common.rc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied

Thanks,
Laurent


