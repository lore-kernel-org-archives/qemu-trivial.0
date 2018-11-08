Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKiCo-00006H-Dh
	for mharc-qemu-trivial@gnu.org; Thu, 08 Nov 2018 06:10:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gKiCm-00004x-J5
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 06:10:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gKiCl-0005eH-Pm
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 06:10:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:37387)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gKiCe-0004sI-21; Thu, 08 Nov 2018 06:10:24 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MN5Nt-1g2MMM2JGf-00IzNv; Thu, 08 Nov 2018 12:09:43 +0100
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
References: <20181108105904.27980-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <0c6c5e77-92b7-e64e-c666-6f5c3bc10ca8@vivier.eu>
Date: Thu, 8 Nov 2018 12:09:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181108105904.27980-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:742XUyLNpdNxTGNN5MNHkdIG7Tb6EdkGGj5duveVlp059uhml0R
	V9FJ53eCH38RcXY8r2BXC8Y/PaSVuQYKZktiFxgIg00p7FpIfdpibZer+V9o/pOLVh6V8+Q
	NfVYUOqiORE433aJH3HE+PmooWmd18yj/EUoeJQDv+jLMhFRD+SVGGTCRgXGr9c8VChTdXP
	KdNHN8dtFZ9SxPvPl5Dvg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:nkNouuOl6gQ=:H0eq51BJfr4YcSy/Twf32N
	WLHr1tgpr/wa5nu3wyBay1az1do7MDLNgkTnFfxBQ2sSfLhNtSVJVFoDJ2IonWKce9JSFvGdl
	wVaQ6UbdsTXBjeqDJUwjuSTGLSNe+faMduBaQapch65U+JWMCc9JjfF7PenHUsuUhwbyFN9tD
	cx1MpipJ/qm9FEurjHaEItnEa9CYVTWJho0V8LtpQizxK5ZsZBC698Zx6pYEX7QzrBr9S467q
	AL4IH8oigS5aRFRCvQItS+JVGz+Gni1KXtqAi1BOcw1hRdT2Ju1M2/MvbMInUmsq0EdKe+bp7
	/WMJ6qlNS/F0Vug2ohGi2bIw0NeV/u6SU8Ln3Or8XDBpEULnS6mGya1ta3ziseqngeSAbVONM
	hiGpH8e7OW1h1EP9jhqz2lI0Si4ZRCtNQfGA+O7Phv+V+BIW5KKMhv3tlsIv6oIBrsyrPujXo
	gFR/AivDOunTlh0NarYtTufIjfBngssgx9wPsvybv6E22wDYIkDUqCT0XrRSMLhkQF/8MWuMy
	yE7qjBa/j4qUlY/lTgk576HZzT8sRjTAVGbH8x0PcSGQVOKXBVU685X6kHWlaRUlHNbPEzaD7
	+/kTeZqI5xodDybalexkbldAyiwsOloKy9oKV0d3g2E8bVQ9w9eBYik8JO4MmzXIHUehQDzU/
	GMm13p8jXWn31cVdycoqIUmx5UVBBpfO+QzEJT0+FnDkqZMZFcyBJIEiJ5DdFB6wuisxvvYXt
	DRjCy9kwMRwtwOlvJeA31ZhvvtQ4N4Rv/NVqFNoXMCr7dq5VX/9JhPlfqzaczIgzpv1+VQPOp
	wO+jPPuytbf+yjnSzEJkp3emXrDAw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [PATCH] linux-users/syscall: make do_ioctl_rt
 safer
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
X-List-Received-Date: Thu, 08 Nov 2018 11:10:33 -0000

On 08/11/2018 11:59, Alex Bennée wrote:
> host_rt_dev_ptr is set while looping through a control structure. The
> compiler can not know that all structures passed to do_ioctl_rt will
> trigger the if clause so rightly complains with an --enable-sanitizers
> build. To keep the compiler happy we default the host_rt_dev_ptr and
> check it has been set before attempting to follow it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> CC: qemu-trivial@nongnu.org
> ---
>  linux-user/syscall.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 810a58b704..3a942f1f4a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4669,7 +4669,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>      int target_size;
>      void *argptr;
>      abi_ulong *target_rt_dev_ptr;
> -    unsigned long *host_rt_dev_ptr;
> +    unsigned long *host_rt_dev_ptr = NULL;
>      abi_long ret;
>      int i;
>  
> @@ -4715,7 +4715,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>      unlock_user(argptr, arg, 0);
>  
>      ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
> -    if (*host_rt_dev_ptr != 0) {
> +    if (host_rt_dev_ptr && *host_rt_dev_ptr != 0) {

As host_rt_dev_ptr should be set in every case, I think an
"assert(host_rt_dev_ptr != NULL)" would be more meaningful.

Thanks,
Laurent


