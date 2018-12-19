Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZX97-0007hD-At
	for mharc-qemu-trivial@gnu.org; Wed, 19 Dec 2018 03:24:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZX94-0007gX-Ua
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2018 03:23:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZX94-0002ww-Ab
	for qemu-trivial@nongnu.org; Wed, 19 Dec 2018 03:23:58 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:50359)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZX90-0002ub-3A; Wed, 19 Dec 2018 03:23:54 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1Mxlio-1hKWHy0f0w-00zJeH; Wed, 19 Dec 2018 09:23:48 +0100
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
References: <20181115211752.1295571-1-eblake@redhat.com>
	<20181115211752.1295571-2-eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <79cb1a33-0237-c321-d5f7-1b7586363613@vivier.eu>
Date: Wed, 19 Dec 2018 09:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181115211752.1295571-2-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:K+uTlAO5gcsa3ojll1BThPG+y2Dex9+qAt3JQ8vLdMzmWfzuC2f
	qBl5/MViehxGyH/bo9Bl2aSZpBi23zctGu2lxZxOIRJKXr1NoFJxiAWHfUQsWrGwy4B5hwt
	qAWhvizaus/wv46VCejSBMXXua5yET/3svsyLBur/B1kygPHDk5H3X8JpBkLef7HC7G066H
	cZoAvon+9K4V3qY9xiYwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1+sEP7htbs=:wP+OTFkvRivN3GIyISaFyz
	9y9ug9qvsnl1B7za2W4fPsOhriGECh68GhaOTttzU4TgVlB6yRiBqy9bIhKD5lISnuBWIlQes
	4izub4PYZWZaMq3HjuVc5vai+IM1pHPq1SCm+/piu+uTdZaBQorjo1pPTwNmxFqpr2ekpoB3/
	5amOCoo5kN5kzTyFmuHSXCh0KJic7GfrVQ3PAhkBAZKzAUHOBXvWbl8HLw2BuCOWxr47gBJ7H
	HzfIEKBsRo9RgVDwtGVCA4u9XZtAa85XeSmC/9OQUYRTreHh2oaw9iYV/cjHc3wFj3PjOBjp3
	oX6ejs5LSOhvNzP31D7ET6ckpW2sYG1rFxiYlFStbDNlouLj9lIaidp9HFaVpBEpT/R7fITWR
	oRxnIsVV9kmUKTWa0he35nKWkDsUn5t6gwpwZktrIdRzWRqCI+vG327zegZteq+gmPtl+upte
	Xz5BqiEpPOPwOOzDUZd67YzUygR+ArPs+eG5E3CT3XbCxgrKODrIOoMF2nr35Fe6vV5SG9tMl
	o925Y2Ndpj4A+LjiSPjwZ6uLaPie1hM1UuNLENLrsEfPGcNBoh7u8dAXm3aHQzQDWBhiSIo/k
	PIXwfCRF528W681rtDLwayw9kctcLElcLOkFMATSImxM+crEvOCJDgjFxkJFNrBwYM9ygAQA1
	nhMMNn+35KS2UT0wyglvnInRBO1IokiBQwLALUCgXQczGVhlkfEehkTI2R1O+BBgO73JuJX/D
	x9FX2dacntnfppkHCTLFUiHlxrbuviu/JAo6dEtM7r6Xt7JPuoG91xAFPfY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH 1/2] typedefs: (Re-)sort entries
 alphabetically
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
X-List-Received-Date: Wed, 19 Dec 2018 08:23:59 -0000

On 15/11/2018 22:17, Eric Blake wrote:
> Since the last time we sorted things (2988cbeaf), we've had a
> few relapses that were inserted out of order.  Also, we had more
> entries that were sorted case-insensitively than not, so let's
> document that convention and stick to it.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qemu/typedefs.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


