Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOdm-0006aL-2D
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOdj-0006YD-6c
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOdi-0007lP-BQ
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:57:27 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45703)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOdg-0007j4-8s; Wed, 06 Feb 2019 09:57:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MmkjY-1hZlkG0W0c-00jqlD; Wed, 06 Feb 2019 15:57:18 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrzej Zaborowski <balrogg@gmail.com>
References: <20190204204517.23698-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3448f4d1-da76-ef9c-bc87-dfab59a5415b@vivier.eu>
Date: Wed, 6 Feb 2019 15:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BJN9v8qb0SYSLwyiIptj8SMggLtViFnuQH25pBc9l/e1Ncvc0HI
	3UadxJscLVEQknKmd+BLfqcdfJk0lQRFscAu4x/D5uHi8k7CWcEygNz1do5SMIkvOD/ProY
	0LTzV/CIeRV7bZrW0bvM3FQ9uLL7/8kjmbZGjM5YuwlD1fYukOe+tMwmSv49LIfANE3r3XI
	6KkpQx8dTmSh0yPjRYbFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNoMlBwY4EU=:r1uLej0U62vpeJxbCWMeSQ
	qr5SvkDA2tSKpUJr9d8SXhXorXxs9o9OdQXdGBDmlGUvbPuY+b5viD5YKm27JyzE10i9FRgET
	IPlw4cqMFUCprdWcAxs9ULM3t6sdNPuBTRdNTp0hQ4AsVeUEZpjQ1UI/4Oe/AWbTk59zbffKJ
	P7kFOyaaLs9o/CdmoCDXvTnlRXtGq1VEpVPi8uC8SmNCSanz0E7Sg6WlcaM75a3dWFZ8DuYl+
	Kz07cKG4vryvwTYUMFvHrKfABuG44u8lLWeunXd7JOAeE8hTIx4RiKdqNcKyMh8fwkIiWk8LZ
	sKcsYnd8qdDhKOosxzI9h0eem1ke4C0zGDDXTCC5iwSg1OavOydBWhq37pzdxsjCu5cYADNOL
	EPKaTrjgv7j+ckB23S2MXirZYCv+uHjtZaOdAA3RK3MXgx4j/mIcLVdWxSSA7UT9hFMUj2cdW
	8kMIR2Cm79MXdlzgaOJEl2CNvl4vg1MDoCkgzTo6XFTfrA+DZvgM5q9crMfB84adkwYHtWRui
	o/pj7XUmaNeScb2Ke7KtPin8DjuBVjl0Mt1ooktxUJ3GFnON7aT2WOyfvy35QEUYNUUZ2k7ne
	Ing0GmKmpcg6+l2epsG1ZzoSoOd+uO5+mHnrFwjMUqziYAtd420SDmklQ6/NvO/KBUFRd5qH9
	Elm18jFLVCcKe+169ZwGuI/jTSyioQ5WMtEsrEof/1QF7stij5TMF2RIjraqsgkopXR1p9DA0
	gOnUjV7Q7JTEsAVjgtsTowq1/6gQt3xTARIEmvoYXlIkGUYujw3Vx/i3ruE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: Re: [Qemu-trivial] [PATCH] hw/input/tsc210x: Fix building with no
 verbosity
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
X-List-Received-Date: Wed, 06 Feb 2019 14:57:28 -0000

On 04/02/2019 21:45, Philippe Mathieu-Daudé wrote:
> When building with TSC_VERBOSE not defined, we get:
>       CC      arm-softmmu/hw/input/tsc210x.o
>     hw/input/tsc210x.c: In function ‘tsc2102_data_register_write’:
>     hw/input/tsc210x.c:554:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_control_register_write’:
>     hw/input/tsc210x.c:638:5: error: label at end of compound statement
>          bad_reg:
>          ^~~~~~~
>     hw/input/tsc210x.c: In function ‘tsc2102_audio_register_write’:
>     hw/input/tsc210x.c:766:5: error: label at end of compound statement
>          default:
>          ^~~~~~~
>     make[1]: *** [rules.mak:69: hw/input/tsc210x.o] Error 1
> 
> Fix this by replacing the culprit fprintf(stderr) calls by a more
> recent API: qemu_log_mask(LOG_GUEST_ERROR). Other fprintf() calls
> are left untouched.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/tsc210x.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
> index ded0db9351..2eb3cb9518 100644
> --- a/hw/input/tsc210x.c
> +++ b/hw/input/tsc210x.c
> @@ -552,10 +552,8 @@ static void tsc2102_data_register_write(
>          return;
>  
>      default:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_data_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_data_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> @@ -636,10 +634,8 @@ static void tsc2102_control_register_write(
>  
>      default:
>      bad_reg:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_control_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_control_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> @@ -764,10 +760,8 @@ static void tsc2102_audio_register_write(
>          return;
>  
>      default:
> -#ifdef TSC_VERBOSE
> -        fprintf(stderr, "tsc2102_audio_register_write: "
> -                        "no such register: 0x%02x\n", reg);
> -#endif
> +        qemu_log_mask(LOG_GUEST_ERROR, "tsc2102_audio_register_write: "
> +                                       "no such register: 0x%02x\n", reg);
>      }
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

