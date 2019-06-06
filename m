Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYoN3-0007CQ-Em
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 05:07:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYoN0-0007CJ-Ql
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 05:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hYoMy-0004DO-Ub
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 05:07:38 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:42847)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hYoMx-000491-CL
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 05:07:36 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1My3Ad-1gd7JE1dU7-00zYbs; Thu, 06 Jun 2019 11:07:31 +0200
To: Rami Rosen <ramirose@gmail.com>, qemu-trivial@nongnu.org
References: <20190507184102.4258-1-ramirose@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <760cf51e-22bd-f488-2274-02e65a29fbad@vivier.eu>
Date: Thu, 6 Jun 2019 11:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190507184102.4258-1-ramirose@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VuVl82UBb7Szbz106uaK+TKCwcrYF4JA3fKL65YB0SkYrRmcWWC
	QWgt2gBHOseXug26HBLxlhmow92dt+jFt2bDlUY1P3IqznCvWJU3FVgAZJNx0+vaVsLxj2c
	0GVpnRGVeUfGI+PNEgLPLWt5m2ZoLY2Adi8waIM8TW+I+2Oe0XRsyak9DBv5/R48u+v88c9
	fYOZPpoUMCGSwIeC75Y/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tm9cTVWzytk=:++H6YaQBGn1oLAs6dlAMkX
	0ixK0DQBbzn2vGbLgk9VOnrwHlFbaT8npBQ7myRvvtAepRY4SA0J5MlBPIYY5SszjpqUG8/VY
	2WqNcYvrK+va12Cvf+qkYB1bPi+i5BKwVRn6FJ8TFGhRetHA6iFlCcANgLJi8UU/MjBxVxhjA
	LDp6cyH86yU1aZh+wQBolaQxh2FlX4R5ODEqGqtUUJbRTwG18nrQMMQtcbiAcJnBMLLlTAt4l
	fjrTLj1gzDkCYnYLk9cbkx5p/W6vFQwgusnRuIX6FlonS+UWRNbrvS4y6PfUJyO1IspsVG/bJ
	42eKlSG/HdlD+2lAABPaEC65X08+CGib01t0HunbgN+0dK3MyBQEJYm5eqhinrNjJJHUxLKKh
	2pwwWL7l/98MCm3YJ+rvGovDOuqQNoCTryihDayl0ALqczys4roMeEUfm6xkd2F3k5NGck/09
	RFa9ooTKXmF8oRzl6zHX6c7Kpyeefd45Gu2G72fTERbPSyu8sVBrZDyBxAuc8X7RbzV50Y3YI
	EUpWnd/nbAF8/pnHOMqZX4jmepJ4mLl3q8TyMh6hvhhDO+jd0CwAadHU+7h6OswTJRrIblrRb
	bs4N6RCXra3u1Udg1rdMv8E4yEv2tzaghBHOxKF8wFv5YiFF5H7L0yegrXThJ6/rPuBLv5TAC
	UDqZXfYyNK1lJPCtSdhBPr/NtKpyeXlxTJyN244WIXvHn5CcjVSXHd7vGKnhqRf+LJeOlGX6I
	0+EXTu71TdeXEbFJuy9wjHLnRzw+qJZ1Pv7+UYMOyaTLdY+6g43H+IIZLJc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH] scripts/qmp: fix deleted link in
 qemu-ga-client script
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
X-List-Received-Date: Thu, 06 Jun 2019 09:07:40 -0000

Le 07/05/2019 à 20:41, Rami Rosen a écrit :
> This patch fixes a deleted link in qemu-ga-client script.
> According to the old link, the page moved to 
> https://wiki.qemu.org/Features/QAPI/GuestAgent.
> 
> Signed-off-by: Rami Rosen <ramirose@gmail.com>
> ---
>  scripts/qmp/qemu-ga-client | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
> index 30cf8a9..50efc21 100755
> --- a/scripts/qmp/qemu-ga-client
> +++ b/scripts/qmp/qemu-ga-client
> @@ -33,7 +33,7 @@
>  # $ qemu-ga-client fsfreeze freeze
>  # 2 filesystems frozen
>  #
> -# See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
> +# See also: https://wiki.qemu.org/Features/GuestAgent
>  #
>  
>  from __future__ import print_function
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

