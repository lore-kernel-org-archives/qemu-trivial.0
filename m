Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDWl-0003TM-Gk
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDWj-0003Rb-F3
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDWe-0005oR-7O
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:41:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:56817)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDWR-0004kU-3X; Thu, 14 Feb 2019 04:41:35 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MQ5jC-1gh4NT3EsS-00M0dX; Thu, 14 Feb 2019 10:41:11 +0100
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
	<1549545296-18903-3-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <df1068a1-8b57-84bc-0e7a-b3bc06ea4be4@vivier.eu>
Date: Thu, 14 Feb 2019 10:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1549545296-18903-3-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cY98EG8XJm2CNn8X3JFmVa9U/tIACJ3/+y6PQtxcL53PJBVKqcL
	wfnaaTp9Y3GAL7ZS6R9Dvms4/0FK0MpAFIjiyrgnOLb5wtTs9P99pXPyqUQvPu1G2DvLV2S
	+ILy2FTnxCaZWgRnDxwAz46kJP4k0eqvYtSCLYExd/2pl8kOEe+MwWJKNCS/yVp7Ek+o4zJ
	XX2BkXEppX0JIwn5lbv6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UUTpWJnv6YA=:JmiljTQR3am1CQB92ZJNug
	tgv8B0Ly1ZaOapbHLNwFOQ6GOUIpddBuE1111Wwg3+HPkeLp6LfIWOYA1iQNLQ0QdKl9Evo+o
	8/o/nsdKZ9iqKidPcT6kW+TWzJYn8lXcrGnKnh0ITBLKED6a17r2LOlyK2NEdrzOW6imeckdY
	OcFWy2s/bp5Mc98+bpM9rGs0r4m8T1pd6YFAq5DL08++VmVNEIfHls0FeZcvw0PEJlJJZ4QmL
	rDBQBiEKByguw+fD+iGtubncBx6CJ+uiUHctWi65sP0C/f+nEF6SWSvQYCvgJ+K4aYIcLNfVB
	iPTFZKq6n0wO4GGZ8htUL2wtl5pZUYmGEyTrkx/z2z4JNMgi6LHYL4qmxeVFEAkMfr5nOebzL
	rkcm97vvMXFBNPEUR2xEYbwhd/Xvd2vpkqVAX0ThWkJyqII5zV6t2b2/d/t+l6Uj5kpcrNvV2
	xnAU38qG9PS6upKVvKci6VFgCknlO6yUE0nNq+vY0YxsMJR/zATE80Fsx5r/C4ENatz6maoYv
	1644EQr3ghnzcpdEqdZUbKshCljfrZ+LyFIYLz4e6WZG1kvl0244vn1X5JmnagocLTE7+4eN5
	cFFkg8geIhUg5RzyrK3HVXvP/96o9+RJA5dxedUiCQF7UQMvQbgt6Nsidk/M6pfRWPGWPVqrm
	xji7liIQjKlAJJ4aJIsCxPbHUXqfTuZrIEvSB7fWTQ/wAXDXV1OnP8RicJDrrqAPyR1G7nqnl
	XJJ8HEImV9I9MQJhwboYAJ6HsxaQERGEYqI71AhQn+paJyzuxPdTqb0ZNcY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-options: Remove deprecated
 option -clock
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
X-List-Received-Date: Thu, 14 Feb 2019 09:41:54 -0000

On 07/02/2019 14:14, Thomas Huth wrote:
> The option is only a dummy since a long time. We've finally deprecated
> it in QEMU v3.0, so it's time to remove it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-deprecated.texi | 5 -----
>  qemu-options.hx      | 3 ---
>  vl.c                 | 6 ------
>  3 files changed, 14 deletions(-)
> 
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 90e5860..fe90555 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -37,11 +37,6 @@ would automatically enable USB support on the machine type.
>  If using the new syntax, USB support must be explicitly
>  enabled via the ``-machine usb=on'' argument.
>  
> -@subsection -clock (since 3.0.0)
> -
> -The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
> -replacement since it is not needed anymore.
> -
>  @subsection -drive file=json:@{...@{'driver':'file'@}@} (since 3.0)
>  
>  The 'file' driver for drives is no longer appropriate for character or host
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 06ef1a7..77bd98e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3444,9 +3444,6 @@ Load the contents of @var{file} as an option ROM.
>  This option is useful to load things like EtherBoot.
>  ETEXI
>  
> -HXCOMM Silently ignored for compatibility
> -DEF("clock", HAS_ARG, QEMU_OPTION_clock, "", QEMU_ARCH_ALL)
> -
>  DEF("rtc", HAS_ARG, QEMU_OPTION_rtc, \
>      "-rtc [base=utc|localtime|<datetime>][,clock=host|rt|vm][,driftfix=none|slew]\n" \
>      "                set the RTC base and clock, enable drift fix for clock ticks (x86 only)\n",
> diff --git a/vl.c b/vl.c
> index 9e4dba7..90ff233 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3735,12 +3735,6 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_old_param:
>                  old_param = 1;
>                  break;
> -            case QEMU_OPTION_clock:
> -                /* Clock options no longer exist.  Keep this option for
> -                 * backward compatibility.
> -                 */
> -                warn_report("This option is ignored and will be removed soon");
> -                break;
>              case QEMU_OPTION_rtc:
>                  opts = qemu_opts_parse_noisily(qemu_find_opts("rtc"), optarg,
>                                                 false);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

