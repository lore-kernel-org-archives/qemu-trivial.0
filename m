Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFgC9-0002ZE-4D
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 10:01:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgC1-0002Sv-Vx
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 10:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFgBw-0002CN-KZ
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 10:00:57 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53713)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFgBw-0001pe-7C; Thu, 25 Oct 2018 10:00:52 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MNwXA-1fvouF1Pb6-00OIUO; Thu, 25 Oct 2018 15:59:51 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MNwXA-1fvouF1Pb6-00OIUO; Thu, 25 Oct 2018 15:59:51 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-8-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <34917edc-d40f-e4f7-0093-acd892815642@vivier.eu>
Date: Thu, 25 Oct 2018 14:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-8-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:QAZAXY1V+4iagCQDYkH8oGHhr0cj4cf8cpTYThhvAcBHFlv2DKl
	gE2fLd/GGPZAs78xPHS4T09cPBwwA9RFwfSqXDOnASgdn/BoznE3sce5pMYUgqAuhPvuEFZ
	dnRU/b9l5N+EeXMA2pOp0zlWRXLmxWcNhnR3GPcFUf4tRTbZEsClTEUCemzhSOuc0r87wkm
	mSrmjNCtnYSo8DnsS/Uuw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:jFCS0V6g0cw=:PGSacd5H9ATZ1Q9xvhuIQy
	WdYAPgEVxCdYfEyJYf0SWTvtR4lndkSiC9xYywtwvu+O4JkKYPZqBkQ95q/PAWQOfo/slpMrl
	vHhscV4gxXnK6jpm9euw6Qy5nCVuCfjeHmvmvANxuc6kuwXfBfEMu19yezc0qMj/F/FTBpY56
	oICj0qHxHBJ32zBNogHyApYoQVaFR/xOtp8MXtiZ6dqXTILnaN+JVHQiKRA1rRsCONwOD9tGL
	dhOBwWtHNpl8ay/eXMnYJR8+IQB1TUkVxYuTip/nJ3/waCpcdilgq/KKdb46CyO0lx9zYFCRZ
	sIcYANZvVIQmVAytC1GkqyM4339kAXp73E2CdpshrZRBaeQHXX1iQC2t4Q58eBRtfRK2rHVow
	GwKISWg8VDoQodGdKzrtg/5OGFHIvLIqVBE1eav4ycf0zDVCPsdPXIqtExTitmi+VkwMwqeCr
	eRL280YU23gt66VteuTpjnLIxF2BJ6ebNmKZ8PYMfjRDoob40rLVvHuhxfSi9l5cTW0f0Xtxk
	l/S393geu+1UzweSdpMkeviYQ9RDsVgEAqoHxqitOrNIu+tN9SO1nLo55FeS1OYDmIU3qn8tM
	d7EbRRNYKo1a5fALoZvxkYk+IaScjnAEA6/Q5KbgfgIh58XvwSOAr15oqUnpZ4GPlYiNEzrfL
	6/oW7AcERMKIwzX5lqTnIsbCOLSu5liDGIr+7XtgL+ES0k6S2wIOwcqwmMVtOUm4BlatIEWpQ
	E9ikBi1My/ulxLi3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH 07/10] scripts/decodetree.py: remove
 unused imports
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
X-List-Received-Date: Thu, 25 Oct 2018 14:01:03 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/decodetree.py | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 277f9a9bba..457cffea90 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -149,12 +149,10 @@
>  #   trans_addl_i(ctx, &arg_opi, insn)
>  #
>  
> -import io
>  import os
>  import re
>  import sys
>  import getopt
> -import pdb
>  
>  insnwidth = 32
>  insnmask = 0xffffffff
> 

Applied

Thanks,
Laurent

