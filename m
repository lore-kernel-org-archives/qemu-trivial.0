Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpvo-0005Ya-TJ
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 15:05:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grpvm-0005YG-GC
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 15:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grpvl-0006B0-CL
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 15:05:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50681)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grpvi-00067m-LD; Thu, 07 Feb 2019 15:05:51 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MvbJw-1h8oHL1c0s-00sbNg; Thu, 07 Feb 2019 21:05:33 +0100
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
	<20190207193605.25676-2-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <77fbc9cf-8587-66b3-b50d-3a1a9b8c0122@vivier.eu>
Date: Thu, 7 Feb 2019 21:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190207193605.25676-2-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:i27/C8t66ej/eSEMfxxDxHnlSjKRwWQGVgX3jkj+tkJ5g8lH+AH
	/aXX8459IiumIAc1F3584IOWWttySKLrObuTp/VQbbRZk2iRQ0dOhx0lqtw9knNeCe/fig9
	bsH49ntk7j4uXT5pU4ox8gEfN6LesLn/a1LAZX3xTWaglPLjUG1iRBlS4f1CedqUKoMpfU3
	VWedHljGC1ogcBeOpe/cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ta47jFVGIo=:O95+3WXTvPVkwzlAZp9nPd
	CKNka+nXYvd8rkNKermXyqPppfHgH6ix3Nr0YJdSbcQhHoLmnw3AwoazJe+16kmmT9sgPO1VZ
	3GJn8wuJ+suI/BckFTfdUu7Q/nbesE4SU6lUEat/HWgTNldBwunMEX+o/2yRKhmbiJLiPdIdf
	QgyyMbXaqN7vA5EdNY/lskQlmk6EZ8D8NunEh4ZrKyim+viT1t1FFjdQMjqyCwdbKwkHoVJ1g
	ULKaNLfS9ijRQmnlnso2mvr336n73y0b4io3lsDXUFQC0/QjxiG08o3wNgsOSlP9sxAlnxCxc
	EyITJ1KGl/hlJtSMMt7+itPy+6yQ75zjMgqfFpFZBVfGTiPMqU1z5RP4jFiUe7MZY0r8iDCPT
	aytPa8EmN53lT8boxrOyyJKwOMCGzeSrsvYmiucxmHutqR0wOK53KOq5D8wLox998maJc2eqb
	SwgIXE634jaDSrq0zoG+jKQ9kNVwTDpm4FdsIBkMpSQTwLURl88nJeSU87cEpVZU0rNntRs5h
	RfFw1zegF72AQV4Bt+uIDhbiD3eL0Oqv7Nra24iB7cbMznfpmdBA9rNCuPfzVTSg+PzHuKuYM
	ZC+VhR56sw2FA+GN13NmkPbs+zzT6F1alFhTyRN8ycQaTrRV3jAPdgV8t8coONBEBuY9+cThr
	Q3GGcVVF76DAYAi3Z+Bnm4MuDRBw83+P5U/7e2kPBqWW4LREkOJlzgZxqIE+ySXiyEC4SJMrc
	TlQdzMi4sIOUJh0QLKTJGwFrNXSJXzIs3CvDL0dKuxwpnOFwXcocmdfrPH0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH 1/4] configure: remove handling of "wav"
 audio driver
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
X-List-Received-Date: Thu, 07 Feb 2019 20:05:55 -0000

On 07/02/2019 20:36, Cleber Rosa wrote:
> This looks like a leftover that was never implemented.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/configure b/configure
> index fbd0825488..ff55e2273e 100755
> --- a/configure
> +++ b/configure
> @@ -3350,10 +3350,6 @@ for drv in $audio_drv_list; do
>        oss_libs="$oss_lib"
>      ;;
>  
> -    wav)
> -    # XXX: Probes for CoreAudio, DirectSound
> -    ;;
> -
>      *)
>      echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
>          error_exit "Unknown driver '$drv' selected" \
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


