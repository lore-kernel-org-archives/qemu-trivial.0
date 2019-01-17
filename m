Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkBew-00062X-Ps
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 12:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBet-0005zT-Gs
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBes-0004B6-DP
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:40:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:48021)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gkBes-0003fs-2Y; Thu, 17 Jan 2019 12:40:50 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N8GdE-1hErj61ft2-014Dqw; Thu, 17 Jan 2019 18:40:32 +0100
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-trivial@nongnu.org
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20190117153338.11820-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d24afd45-2f2c-8401-a70b-6e78ceff8dcf@vivier.eu>
Date: Thu, 17 Jan 2019 18:40:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190117153338.11820-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kGS/fZSWjlzqzHqNZfEkR3zGc8RBeRmyesHE6HFNXovFNB9gdJd
	pfNa0nM9iraVLeeFy8s2jmVqw2XupXPCF5yLMROybxPFXy8Cdwdylf5+mMVK2LnMTEtn5+k
	lwJDPLC+qEGIesyxu3JjmiCtNgXWW0K2yquX5+BBds6XGELxACfpCmTF2mm2nmXceydbcT6
	S61l1znH7dVSSEgYrzEgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yeLtw/+vRIQ=:TsHs7Zl244AbuHkNaboQPd
	QE6LDsOphx6qKmll15dySGt1Exyo6gaRDpX5jZog+E6omKbaxtceXV9Oz+BJ6MALkTeGgktm7
	Wgi65R29CTzMT1OtdQjMhRVGLic5b04rClbMVw7Ovc52oScpFNBqg0AJXh9h7dx5D17qFdcDG
	mjCP2VyE3pvzySC1zQLEhzFhWYUZoY0mbg1iuK52OaHry6G5MISF3gqGvHjC52OehOWvbFNbl
	ok4B77n2PpmjdBVxcipyldw6EM0VN0hu7qEm0qVLjbBJktTL966X3xNomaK41UZJEQ2fh1Cr8
	A0ucmMMhQ5dWo5saCwI2vLfz63IWGDOQgesmmeBY4SIUbfC9UnhZgiha76R7WgQ9QNeSgASzB
	FeeTonPVkuPCNvPfkwFeYF2p2pmcbV3i+jzgq4d0r5T7xKZFFCZPLD9xmVysrfDJ0jiuh5Vkg
	CQT+c9it02gAcJgxoTTKUhWLB5vjgmMf1kPPpZMEulwTxZrhzmWK3u4v6SWbDo61Q/uLyme5x
	zHPRttzx7SJI0RYQ6G6KG7bo7Xb38xCt/xdCRcdYBG3a/JM9eU8Qa6aN0OOpLs1yldC3WfEIG
	d9S2yG36IzgXgFmsQjWaXfhuATYGd9T8ajt2wOn6dfGwmpO10mXQcJRZ23ZZTUZKYmYNjBBnl
	s64skXQFwyNkefgS3DVs//r2zbEeK+L1WbErpP33WC6uwr9uerUyzPOybVQh56Rl3nB+p11cF
	uiFwVBM0MyGaz8jh4V9eIzh7qtg61LrenzgelspE2DaWFGnzL9W1ayol+c8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH] scripts/replay-dump.py: fix utf-8
 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 17:40:54 -0000

On 17/01/2019 16:33, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/replay-dump.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/replay-dump.py b/scripts/replay-dump.py
> index 5ae77c8a92..ee7fda2638 100755
> --- a/scripts/replay-dump.py
> +++ b/scripts/replay-dump.py
> @@ -3,7 +3,7 @@
>   #
>   # Dump the contents of a recorded execution stream
>   #
> -#  Copyright (c) 2017 Alex BennÃ©e <alex.bennee@linaro.org>
> +#  Copyright (c) 2017 Alex Bennée <alex.bennee@linaro.org>
>   #
>   # This library is free software; you can redistribute it and/or
>   # modify it under the terms of the GNU Lesser General Public
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

