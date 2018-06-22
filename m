Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWS4I-0003Db-GA
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 15:50:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fWS4G-0003DP-Lf
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 15:50:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fWS4F-0003lG-Ug
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 15:50:00 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fWS4F-0003lB-N5; Fri, 22 Jun 2018 15:49:59 -0400
Received: by mail-lj1-x243.google.com with SMTP id t7-v6so272542ljj.6;
	Fri, 22 Jun 2018 12:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Fd6QyC1DKCzDybvzJTjXyJC3CBHLFiiNioaLIJg9ANQ=;
	b=VFA7J9VIYrgyqCEUe3rb7ApDsVgspu5bMwh8PUw34+S+wR+GDR1OC0Zb0MLc/AJ2Ml
	b3UhHWS/bT3eHmMDzXkYBx5D1+E2R7U/p3TJeDMdbn3hzRVWpiuNivcNBv0JerYCcHEL
	4oOMg5JrqyqiWaPCP3cJ9g1S27p8TASt4lNlnBfBsoGXjHGQ7SWbwZoyccQQ68mHa0Ge
	2wcdqC+kCA7J8UwWWnF3hQ020GBhBZ0mXA94N56srNRWDY/TZRQAaquN44jfg6lZMeLH
	5AoiGASGhLrkGvwgjSd0Oue199hFhD87CWVYGqul9yMvPgHckSENqGFOs5fQ6I+h1ZsH
	dbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fd6QyC1DKCzDybvzJTjXyJC3CBHLFiiNioaLIJg9ANQ=;
	b=N9YvzzhO+/u4v0GGmkwUxrgjexrKpkK4mCU+TO/bDfdZ8z5LoeFcglZj2Se2OjuIpk
	XKOIVDSaTwb7Ukb8oY3MD3c03bVRA4YQ3uT8fr7r8tzqrkIfXFsIDjL2fMje7KfKXjcC
	tBKJ8Ew3w1QxHHYMHERi0mfjrSMexalcl8/tJHT2BlUgYBu2QGOuFsp4LjWcWC5/j2Eg
	YvRZpwWrFcG9niiZagT8NINEhRz1f9qn+MuP24XYfCpv4NVp+ct3Ox68FchCK39Wqju9
	6vWnwD0bNTtZyTbdYpLKFDwIa+PcxfOz00MJceUfElqfsq/zJBmPqfXTykFZ4b+Re/Nr
	BDBw==
X-Gm-Message-State: APt69E0XfhhVSV0G69QbPHGkApWQbBZRVsBdDXXpakMhHq9mqobBwmQo
	sy4ywJiQLVvA/P3kThXFoNHKJ1BRV/zsy0YmCEw=
X-Google-Smtp-Source: ADUXVKJOKl/nno1PTLXOBPir2Z4HKcc1sBWokVxKOelvyw1P8I2AhbO8NYWffqPEMd8/WyhkYvxACauWCuPHUw+S9ws=
X-Received: by 2002:a2e:9187:: with SMTP id f7-v6mr2087029ljg.98.1529696998000;
	Fri, 22 Jun 2018 12:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:4242:0:0:0:0:0 with HTTP; Fri, 22 Jun 2018 12:49:27
	-0700 (PDT)
In-Reply-To: <20180622124716.9179-1-f4bug@amsat.org>
References: <20180622124716.9179-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Jun 2018 12:49:27 -0700
Message-ID: <CAKmqyKMp8-ZAaTU2nxaMCqoR0JsbXoogR6t6Nq7UwU3B3o1AKw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/register: Log
 unimplemented access via the 'unimp' debug level
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
X-List-Received-Date: Fri, 22 Jun 2018 19:50:01 -0000

On Fri, Jun 22, 2018 at 5:47 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/register.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index d2d1636250..8ed7c6b927 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -203,7 +203,7 @@ void register_write_memory(void *opaque, hwaddr addr,
>      }
>
>      if (!reg) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented regis=
ter " \
> +        qemu_log_mask(LOG_UNIMP, "%s: write to unimplemented register " =
\
>                        "at address: %#" PRIx64 "\n", reg_array->prefix, a=
ddr);
>          return;
>      }
> @@ -232,7 +232,7 @@ uint64_t register_read_memory(void *opaque, hwaddr ad=
dr,
>      }
>
>      if (!reg) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented regis=
ter " \
> +        qemu_log_mask(LOG_UNIMP, "%s:  read to unimplemented register " =
\
>                        "at address: %#" PRIx64 "\n", reg_array->prefix, a=
ddr);

I'm not sure this is correct. These can be unimplemented because there
are gaps in the register memory map, so it is a guest error.

Alistair

>          return 0;
>      }
> --
> 2.18.0.rc2
>
>

