Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDU9-0001BE-3P
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:39:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDU6-00018k-HH
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:39:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDU5-0008Mw-73
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:39:10 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:56153)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDU4-00077f-QD; Thu, 14 Feb 2019 04:39:09 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MxUjv-1hIKxi1RIP-00xoN3; Thu, 14 Feb 2019 10:38:39 +0100
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, armbru@redhat.com,
	mreitz@redhat.com
References: <20190206202848.16999-1-eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bd64bbe7-68c3-146d-4a5d-04a3107c9efb@vivier.eu>
Date: Thu, 14 Feb 2019 10:38:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190206202848.16999-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:93ANABBJwlFNIKm2NaDb3cNeUScBSYdNlmcj0aOFhB4ktogtOU7
	aGaTOKffQNjkt3u3XjnJmDHesdfzZS0cM6/L/qV2oKGtzi7VkUz7LQT7Vi+qbq3dvfX5+LW
	uqiGd7+5zq0B4HN8p8mWk50tjPSNY6AUQHQYnGFlNwaAuulDPcQVnUHOX9x/kZDDtgHbrDa
	OK+EV0XGHZ/OB3jjWKOAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bsk6Bquf29c=:imDf1u/twqp8COpKqojMNI
	VcgXUfjnPT/O16OEpe/WOiOcnC0cdEFQCyYYOsT58BxjTASaroFc3UurHKhiw8pW33CiXo/jp
	stiZj4jkWmXsYp3aaH/QC6H/Rl7jWFkGr2VzYAqdzET8t4SYMGqFf9xjFqbbfkNks7ScZyJOu
	Jx6HjA3HcIlXpoLTYFFENofyvRwprCnJerV53gOGE+mWOMfjSXiqxOPyTRn+monGQHhO2MzYJ
	eiQImiq4L2GR2Ox3EGnlzUARSuxx1ulcUYGGL7xpzzdBDG4JKJDwY+/rSu8x6xa+yz+RMRwha
	iXta4/YM0l+u2z2lVGNshDQ64781TRhE9n48ZNlD6EokrYXodbJyi201VkDEeI2goPSJRsaRt
	NHeH030DLvXUVsY5Ich3+qr+mA13GTUcns77GnuLCA2EKK+GTx+tUIZPupePTJzu15+PSnTbr
	jnPLUdXqoCd3cIS/UTtnGOt1kUvwUMd/xhn1meHwlYMV7+FRS5X7ZJt3a8mWtUsjsPDKN2FNi
	ueJWciRWHVYEM83ck/vx47/mx5xaUShtjSWWGJ2os/ea+iCxEIk6p0YtPqZ44ddRXdeihWhdZ
	aZN9n5PanaSGkKxT97AE8lA+LdRbEstrQgg+3p3aRfGR2m53Y0FxrIbox44FmvZrMgM/sJHpg
	7LQGKHFBkFMeu4qfSbUCgJobOuhNI/7iLpbn/aPLjkN/B8uJ1U0gfHR/wwLWfZiWNOIvOdNjA
	CO6T7pZsIPEDlk99YamZM08Q2wASESd7obXYh/zPnqz53z3AR9g5g81uf9k=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH] qapi: Fix qcow2 encryption doc typo
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
X-List-Received-Date: Thu, 14 Feb 2019 09:39:11 -0000

On 06/02/2019 21:28, Eric Blake wrote:
> Present since commit b25b387f (2.10).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  qapi/block-core.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 0f349d46033..ee1ab7a8a25 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2998,7 +2998,7 @@
> 
>  ##
>  # @BlockdevQcow2EncryptionFormat:
> -# @aes: AES-CBC with plain64 initialization venctors
> +# @aes: AES-CBC with plain64 initialization vectors
>  #
>  # Since: 2.10
>  ##
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

