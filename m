Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2w8i-0007xE-Q9
	for mharc-qemu-trivial@gnu.org; Sun, 10 Mar 2019 06:57:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w8g-0007w5-2g
	for qemu-trivial@nongnu.org; Sun, 10 Mar 2019 06:57:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w8e-0004lk-38
	for qemu-trivial@nongnu.org; Sun, 10 Mar 2019 06:57:05 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2w8d-0004lN-Pn; Sun, 10 Mar 2019 06:57:04 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MOiYD-1hQnRO1mNL-00QFaw; Sun, 10 Mar 2019 11:56:57 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org
References: <20190309181920.30553-1-philmd@redhat.com>
	<20190309181920.30553-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f5c474da-1a8c-6b8d-0027-cff9c7bf974f@vivier.eu>
Date: Sun, 10 Mar 2019 11:56:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190309181920.30553-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BmmpZcUsSug+pAGASCrBLUQLUDe1i64NwfZrl5fK/jh3Yfwg5I0
	kLA7T6riym/6p8lwWI3WbhzKSlgljeZOBIjo7M9Yzl+wjMzRExtm7CSBN61QUSfg1pGFYEq
	r5krPbaL4/sBI7EvtWEBL0Ck7askxT+XkREN+nt0yXvwwNgC/Vp5uw0EGOpZab39PR+gPs4
	8HGH7WACVhhaARDojXTJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V0fPkH8KMjQ=:P7VyK5OFd7Ih80nPw6rWt8
	bmAjx23170nCPIFfY1qcCIWOnNmS7QA+RMlBXagB+Jfme6S5uqXm5JSNKSSjEsSPmj0h9+5CD
	ezAjiig8aoNwU/aHbpE25XvdD68ySSDBXXia6JmlMiV88Y+FyrFY/tuCq7LtIhBAvRRlP7bBJ
	Pr2nTVRQ3AK7nRtSPTMaNiLsVLqOrVoHS7AJsLyVHNefriVdFIP1mC4pJ3UAjKOWZkDjW5dVe
	j6Y8j0FhIqR5NdVj0N7s/NE9qRWVOUGKZRABakHXLhySDsEPRwGEdfvDnaPqyxMff1JIbJvUk
	+KsGQmhiOfcQVI0Kf71E8VCt58beFwZpIRbhH0CD4tf+Lv51tqoEdwwVlIjJPxSBWAIMX5v9y
	2APu4l6S1PI57pzVllYjieJIpQIpbw8USphxYYdJtJJu2L0swQQsruEbQguK3IQ247h5kOwmi
	IP293VOdRqfoiUckFo579d9XeYDkRF/aIQgZ4te7sC3aUZOV7VApGnj4Nbv+I43ZIoa0tAUkM
	ZmQBGoizGdC8gXBt9NZ7/mgpyOXnrOLqhG473vvwHTQKyhJf9hgeupbVO5sr/7zDWzc2jglaL
	nECSTSMv+t0cMVZE/LIJpRzvsAPxe66MmJwgIINGooTdnvbTJVVZQW1Aeg5fwmirjjgoxrhBX
	v2Qqtm1vXvgscinBU8DUDTJTYpojoy+1HYQKgDgVDhBBEbECe3+iA03MTdwEQM0XOE8MB0F0y
	nv+wwAAamczA0QHR4+YLlnB4qyqslH71YgaDLxPEi1j69q6naa8qsg8rC7Q=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH v3 2/2] hw/nvram/fw_cfg: Use the ldst API
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
X-List-Received-Date: Sun, 10 Mar 2019 10:57:07 -0000

On 09/03/2019 19:19, Philippe Mathieu-Daudé wrote:
> The load/store API eases code review.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 7fdf04adc9..3d8859e333 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
>      }
>  
>      /* check magic ID */
> -    filehead = ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
> +    filehead = lduw_le_p(content);
>      if (filehead == 0xd8ff) {
>          file_type = JPG_FILE;
>      } else if (filehead == 0x4d42) {
> @@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
>  
>      /* check BMP bpp */
>      if (file_type == BMP_FILE) {
> -        bmp_bpp = (content[28] + (content[29] << 8)) & 0xffff;
> +        bmp_bpp = lduw_le_p(&content[28]);
>          if (bmp_bpp != 24) {
>              goto error;
>          }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

