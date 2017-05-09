Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sf7-0006cB-UG
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 20:05:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d7sf5-0006al-C5
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d7sf4-0004PM-8z
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:05:55 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1d7sf2-0004Oy-1A; Mon, 08 May 2017 20:05:52 -0400
Received: by mail-oi0-x241.google.com with SMTP id w138so11989495oiw.3;
	Mon, 08 May 2017 17:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=56hUT2czMr+kmtkjGZBCx2bu6QBIUxXC5gyvlWfp4jU=;
	b=KNTrd14GJ5MHTDguIDZZLNIcfhHtPNswZqnEo+sNZkdYF08EQLwxif73JgkOvj4KJ+
	cp8T0vrqJ5/iIlIFgWSoBaIGC09YcA/OGAlWdKreo2TG9Ium5FJnSWOJBOkoO+sIyyc2
	6ZfbDW1gpfs/To+66AlZQexZ7xwUY7KDb9FMInQNA14BeYiqPSz0v4kTkxNCaJG8PIxO
	r7kzMC5KOAd/yUqwYIGiklvRRxsHeWAcZs3Q+n599I8Kl6E8t2K12H5HArD74Da4iXHI
	Q/3KWPD5psjyqdityKFnJAvhENqAwP7FVTrbhZHiDEhKu0D7g8OeLYQ1spMFms7EUTQT
	AoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=56hUT2czMr+kmtkjGZBCx2bu6QBIUxXC5gyvlWfp4jU=;
	b=fPweUgBunTmawwUFHLHhjpe7doCqIF51S36j53xINX6X+U9kgRSaaq3ljUXX/T7+L1
	k6EYSRaYcjyEAaCqQ5eMHP2d083Op8dqduFVB5yTfX9Y/rLLHBg07Qk4AClxrJXQ5c7B
	MoY+L4cVKWrt4+epUg7gyp6VVMSsRQxrIzdx5JYpA1KYMl/BMnHDwSF+1p9gRXyM3nMl
	zFK5yvc/K/rlsB7UlNazjJgZsvfW35MJyD7yV9v1cEIjAnAV+IbOQzWRJlfmexlmFOgr
	oP5O/7Pfz+tC62Uce7LMRBNj5xvEBs9t53QTM8X9lYyZ5shOkxXY7yKTBQAFBVb0ffVj
	lrUQ==
X-Gm-Message-State: AN3rC/6lIf/GRV5G8lT/QF9Noo5MtSJLFz7XdXzJ4Em58zbcWQFUeVeB
	dRsHBOPZt/XnPgr+QExST6ycgjGL8g==
X-Received: by 10.202.76.138 with SMTP id z132mr17346929oia.149.1494288351040; 
	Mon, 08 May 2017 17:05:51 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.16.163 with HTTP; Mon, 8 May 2017 17:05:20 -0700 (PDT)
In-Reply-To: <20170508233918.9043-11-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-11-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 May 2017 17:05:20 -0700
X-Google-Sender-Auth: Rc034Mnm9YdyUnBfIXkJz9_tRDk
Message-ID: <CAKmqyKOtw76BeqnQ62-pwD8S1ZqnAaYXLAdeBu1xyJjRxWcmOA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/11] register: display
 register prefix (name) since it is available
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
X-List-Received-Date: Tue, 09 May 2017 00:05:56 -0000

On Mon, May 8, 2017 at 4:39 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/core/register.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index dc335a79a9..b5988c9cc3 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -195,8 +195,8 @@ void register_write_memory(void *opaque, hwaddr addr,
>      }
>
>      if (!reg) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Write to unimplemented register =
at " \
> -                      "address: %#" PRIx64 "\n", addr);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented regis=
ter " \
> +                      "at address: %#" PRIx64 "\n", reg_array->prefix, a=
ddr);
>          return;
>      }
>
> @@ -224,8 +224,8 @@ uint64_t register_read_memory(void *opaque, hwaddr ad=
dr,
>      }
>
>      if (!reg) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Read to unimplemented register a=
t " \
> -                      "address: %#" PRIx64 "\n", addr);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented regis=
ter " \
> +                      "at address: %#" PRIx64 "\n", reg_array->prefix, a=
ddr);
>          return 0;
>      }
>
> --
> 2.11.0
>
>

