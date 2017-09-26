Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwinr-0000U4-4Q
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 01:53:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dwinp-0000Tw-KM
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 01:53:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dwinm-0001Kp-Ig
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 01:53:05 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:64827)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dwinm-0001KI-9F; Tue, 26 Sep 2017 01:53:02 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue001 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LrVkb-1dD6WU3Mi5-013OQW; Tue, 26 Sep 2017 07:52:51 +0200
To: =?UTF-8?Q?Carlo_Marcelo_Arenas_Bel=c3=b3n?= <carenas@gmail.com>,
	qemu-devel@nongnu.org
Cc: riku.voipio@iki.fi, qemu-trivial@nongnu.org
References: <20170926041420.32673-1-carenas@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a0c73f93-14a7-1685-92bb-6f1a2c7f9dea@vivier.eu>
Date: Tue, 26 Sep 2017 07:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926041420.32673-1-carenas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:3m6B6oVzthCTBvKtS+ob1L+3DzPc2+nyMIdTchABrlZ0rpozITU
	lOWLyz4MuiJXoclPN0IGvEGurwNtmACjjYu8tCuyQFfOKk8a9NPECkG2KTtGISZT6pRpZ6T
	ZZ2Woaxi8heESjjA5esHvjiYGtQdvod93TdgYxNW0W6DJb6Bc07gMczTznwQdKBWFfMuK3J
	MIEsQsT+4UqyAUZ0NrsIw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Tn3CU9igDkM=:OVdYnRNbpoGPs7rd6B6m+I
	X4aTqWSczqLWY9rqg/SohpVRbfbf4gEesBhD2Lu0evsJ2jmzT3NTbnbQkdwm60hi0P5WLeiCz
	woCxURQw53kdTbtR4EICtvURvLJlebDneIRqmXfJCzCA3g+GHjSvJ24mfUQ0nKw+HezxZaPWR
	p0WgaN0KnT2KYSVlFUmRjmOfG8Fhywljxp5MkzKkkvCvp2KBLPNgnE5pvdsyZcAg3YWZnUDAR
	6v06rdE9cE7a9PsjwMbDxX2av3b7pwwAJ3taW12LJ7k2ELjEHmM7Q583wzFKHejTxlqlTibW5
	CU+4XjiwOrZ1qzcnWA6Da6oUqSGPKHsYxF877aLu61dvqi4JQfRB0mvJm0VSRrhpb09VfnGrA
	Nkm1JsCCfCJ0LlSCdMML3cntLKzfPvgNwouFmemYPxXDmd9Vkokjoxa/wjxQBAKlfARNAKTiN
	KBxcCaqCS29yy4UDwcbU2OeB21vH7pSfSf+5toXHW4tGNBFb2o8xlCvSC7ZdNaQi9TSz2jANV
	f2dg9rX/eqCZgP/qLnxhMq4ODzUf1s9pj+plXoZ46fApoD1nsQc+AzAC/LBbO+e8DACDeeQog
	DKZet7nsk1kBP247MKKd5jOaAogkcb+H2tEYwsiKUqeG9odHvzzNWRjxUaIPVWKps3ZTvKkYx
	s03L0b3BbC3S2nqfY2rAkeHl2vr3OrMMAjELADAVXTCkIuoF1Q8aYYfOHhtdRzPPjKmQIjWfk
	TY36O1C5BMecd7LZ3KPhUxADTOH8U5O9EKc+4GxAz5vphYqWxxzNlhv21Hk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] linux-user: remove duplicate break in
 syscall
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
X-List-Received-Date: Tue, 26 Sep 2017 05:53:06 -0000

Le 26/09/2017 à 06:14, Carlo Marcelo Arenas Belón a écrit :
> likely introduced in 3532fa7402cda16f7b95261b0339c58630051f0b
> 
> Signed-off-by: Carlo Marcelo Arenas Belón <carenas@gmail.com>
> ---
>  linux-user/syscall.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9b6364a266..3ef4d1c568 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3131,7 +3131,6 @@ set_timeout:
>          case TARGET_SO_RCVLOWAT:
>  		optname = SO_RCVLOWAT;
>  		break;
> -            break;
>          default:
>              goto unimplemented;
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


