Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOSl-0000ah-2r
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:46:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOSj-0000Zm-ET
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOST-000070-Jd
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:45:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58639)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOST-0008Ti-8n; Wed, 06 Feb 2019 09:45:49 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MLR5h-1gZRpW2d2x-00IWjd; Wed, 06 Feb 2019 15:45:33 +0100
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190201173655.4567-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0c4d4eab-ef3e-3490-f9d3-dee31f5d3be6@vivier.eu>
Date: Wed, 6 Feb 2019 15:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190201173655.4567-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RlDNWy1eNv+kmeF4dZEECX+ew+RHgtOmabs7w7JgBo0iITJqt2E
	dYJlF2gdqUG5GQzgK6m7oLIgdmUaJoP6LJl+GsDUYUPQNFGmOdOZ0CdeEYB1Qjof4GoVefF
	B24+vtIBUsmGgLazcTNZbSUJ/NIv2KQUz2/MTMZhJHkLR5gGCZQTXZRvFr/Ng8dnRpIBQsl
	JHe9Q8LzX/P7xiQCvU6nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RYXIRtH3Fpc=:4r1ALOWFFwnWYyLwup22qw
	Mc8jNdxqSs/+m3586khtnRx8tTYU0jcJ1ZfKvuBeGAtzKY4RZtcGq6DLO5XaskPZbtvWQVwdK
	jVkYnnHU1f+EeKnSOd6J1nU17+39i/R1T/woMXbQJy2FNSq0vSJI6BJ9v5dxYAftHDyFWg4Os
	J62y7Wos1nFe/YBjaIK7tw3WgIuff16FZ0n0jlf+hjxjV/tDDp5+2o0+/TdV9rA7R5+a7+moW
	zYgjutx13rnqcCAn0UrYGdv7/3VJyE2Ca843k0JEk1T/N+UnPmeuK3TckoOqQNe1hpm4mq3Xv
	dF19Sqgb62XXep08MP/iPdMgl7SD51VELWtrkdzihM6lCwgY9Fv+KDQZHNFLvCeZEoYai0Bz8
	neX2Q2TdrIhghBOwphewKSKKiE3lGMKww2n2/gOHfiByt5fircAo/oGeH3SIbsZClRIMu8lCx
	druLkwIlKdrngbthphEmjtqfkTX2OL0b6BTNclN6XgHWpHZAGvKWsZV5xNQujg1C3nmHTIcIh
	KJUBNThjPUphZIfGFEuyuqT/4jiKC71t28Q2RMxwPpzJW5tRZ9Jjq7NeyA4glalChIPXr/TAB
	/MZUJxBNOlE1Du5fcDGBlXUJhg/Q1zmfNmuPhOTNFBawfgmlAlTwJb0WtXZNZw2dmR53GkFEw
	UJyYK8K8iG5tQD35BoorYUm7+GdZyWtRsgqb7mqO84TmhmQdPgAsJgOONVzbYAlyfNaHJh31N
	kXf75CKRJjXz3gIZ8ZxpFZ3372WX0MrhTZarpbN8JvP355lChzPIK1xg8OM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [PATCH] qemu-common.h: Update copyright string
 for 2019
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
X-List-Received-Date: Wed, 06 Feb 2019 14:46:06 -0000

On 01/02/2019 18:36, Peter Maydell wrote:
> Update the copyright string we use in version/help output,
> since we're well into the new year now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Better than last year, where we didn't get round to doing
> the year bump until September :-)
> ---
>  include/qemu-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index ed60ba251d8..a1022455199 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -17,7 +17,7 @@
>  #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
>  
>  /* Copyright string for -version arguments, About dialogs, etc */
> -#define QEMU_COPYRIGHT "Copyright (c) 2003-2018 " \
> +#define QEMU_COPYRIGHT "Copyright (c) 2003-2019 " \
>      "Fabrice Bellard and the QEMU Project developers"
>  
>  /* Bug reporting information for --help arguments, About dialogs, etc */
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

