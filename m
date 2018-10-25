Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFn9v-0008CD-F7
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 17:27:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFn9t-0008BM-Om
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 17:27:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFn9s-0007bV-SA
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 17:27:13 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37737)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFn9n-0007a9-UP; Thu, 25 Oct 2018 17:27:08 -0400
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1M5QAt-1gHA490XET-001Qxh; Thu, 25 Oct 2018 23:27:00 +0200
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1M5QAt-1gHA490XET-001Qxh; Thu, 25 Oct 2018 23:27:00 +0200
To: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <38b0df70-338e-c842-95bb-c1a5fbd54b7b@vivier.eu>
	<f0a16cde-5fbc-b3b2-f5c6-105855d356c8@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <39f0aaff-ba05-ffe9-8321-182f096c031e@vivier.eu>
Date: Thu, 25 Oct 2018 22:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f0a16cde-5fbc-b3b2-f5c6-105855d356c8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nzruJJw3dxAea81td+WBFI/Ft1VucdNIkcmUamn7Q4HclLNvYZp
	AjbKKPw87N2VhKkqpTZKV+Ekpj3bY6UKIIC8eAMdXthQN7+QP1i3OFob5KRT2VEderw8nWR
	OYFpv1jEpuHXKcde8AzBSWoIhTg+6O0yiHtfhLk3BCZ1Pz8t+FA438JbvGvzU2tTixEKPs4
	aYSHnb1kuOvGNj9uFOlyg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:5RyeLi4FG4A=:Y5Npk3BizrcxnXu8T+RqRi
	3rxVHEk+1eFJGTDXbpe+38BwygpTCn1Ia2Jnmuc6A23p87TpvB4eB5EhBk2ZJEVUCEhbF6miI
	mXPLSmHIOMChETu/Yw1oI3wX4jkETGNB9pBVNRT5aODnQ1ZaXQAKlP/008InNyL541sEoa4sS
	g7aZ76Mjl/NNOp3hndxCt41b1U7mF8R/65B/j0r14WQ5HX7QHq2oAoPhgsdJs6wKA1detd4k4
	JXhGc8E3M3kW/3hPiTeGjX1bVS8ti+LRAWiAJ+1vAkrgyD6j2PtFIUvuqC9Qld1kmm0qlMtIv
	mdjgspNR4JdEmik9qPtHHe5arI+INWFpLecw5ZVrs13YNQpDlBCKehSlsVJm3hr6TDjg0B2Sn
	4faoHGNqb/dDgVsojikdDdPXoCgRHoBS+DfeKRNp2hn0txZcGjTrDhJO6I2oYp/gmeVWiMNIp
	UrTPs5YtXoHzEC35Fm51pAkpdC5/pB3nBrwBweWaghau3kOUoMQRjKAf9Z1daPv6rF3imphEn
	3Ah+NcnaR8lFrcRey+EzXcjiG6AHeLjBSnPG6V8I/rk39KuhFBerHfa5P7FSPXQRN1NTg19FR
	4QDdFQ6YqqD2qzVShjOa+Lsu72cYBXdUU4O400M7MneXRtilU1fw30Y2EzEWkSk2UxCI/UwxK
	eyBs2NsxTBV/NOrN/DNl1YPIg+pS/U2oMqdplZperWb3CAYdHHn8CqCN35AyV7uQjTrzNMhQg
	mNFYTynXgYxXJYj+
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [Qemu-devel] Call for patches for the
 qemu-trivial pull request
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
X-List-Received-Date: Thu, 25 Oct 2018 21:27:14 -0000

On 25/10/2018 21:13, Thomas Huth wrote:
> On 2018-10-23 11:04, Laurent Vivier wrote:
>> Hi,
>>
>> I'm going to collect patches for the next pull request for the
>> qemu-trivial I'd like to do before the softfreeze.
>>
>> As we didn't have any pull request for more than 3 months and some of
>> the patches have been pushed through another maintainer branches, it's a
>> little bit difficult to collect correctly the patches to send.
>>
>> So, it would be helpful if any of you knowing that some patches have to
>> be added to the pull request send me their list.
> 
> For June to September, I'd like to suggest:
> 
>  cpu.h: fix a typo in comment
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-09/msg00021.html

applied

> 
>  linux-user: fix comment s/atomic_write/atomic_set
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-08/msg00017.html

applied

> 
>  tests: Fix typos in comments and help message (found by codespell)
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00039.html

applied

> 
>  configure: Support pkg-config for zlib
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00032.html
>  (this had a suggestion for dropping the fallback test, but I think
>  that could be done as an additional patch after the next release instead)
> 

applied

>  qobject: Catch another straggler for use of qdict_put_str()
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00006.html

applied

> 
>  xen: Use the PCI_DEVICE macro
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00008.html

applied

> 
>  tests/bios-tables-test: Remove an useless cast
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00009.html

applied

> 
>  hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00011.html
> 

applied

>  hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00012.html

applied

> 
>  dump: fix a typo
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00002.html

I don't find it in patchwork.

> 
>  milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of error_report
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-07/msg00001.html

applied

> 
>  Makefile: Remove qemu-version.h and qemu-options.def during 'make distclean'
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-06/msg00050.html
> 

doesn't apply cleanly. not applied.

>  ppc: move at24c to its own CONFIG_ symbol
>  https://lists.nongnu.org/archive/html/qemu-trivial/2018-05/msg00118.html

applied

> 
> Additionally you could also include the reviewed patches from the the
> "use qemu_log_mask instead of fprintf" series here:
> https://lists.nongnu.org/archive/html/qemu-trivial/2018-06/msg00276.html

I'll see later for these ones...

Thanks
Laurent

