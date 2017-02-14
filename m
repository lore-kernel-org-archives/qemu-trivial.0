Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdRo9-00058e-Hd
	for mharc-qemu-trivial@gnu.org; Mon, 13 Feb 2017 20:21:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cdRo7-00058Y-2A
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 20:21:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cdRo5-0001HU-Qo
	for qemu-trivial@nongnu.org; Mon, 13 Feb 2017 20:21:27 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cdRo5-0001H0-Lq; Mon, 13 Feb 2017 20:21:25 -0500
Received: by mail-ot0-x243.google.com with SMTP id l26so723572ota.3;
	Mon, 13 Feb 2017 17:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SG4WEZviFkxJyCTgwnYnswY+nYpaBxW5GWNUrnAr/Ho=;
	b=LdWkd7CBZa6KcaDfXXz9fcktAFpbJ/P9XgC9pw6oER8+HnPWByI7dfaBzjyWjl7fkE
	/mI0tfRlWMQ7p8HnC21PJEnKoKfUmShxxa/Q2d4mFquzq2QjIGpII78kdqQjXWavC0ur
	jI7wA+RiY4YwoorNJUI9C17I4zGeSZW/0AgrnItoQpphWN0QkKIBY8qk7URur6xRkbj4
	ZlTeuOtXtMp8LA1olrPPOszjqnTPH7OKAa4qUTZ7HILpLW2LgUnrynV9EI3iKBcJpCFl
	BAgPDAu5S7AYQ9cGT3qRAHoe5coTggDcBpsGyXeGUoWn6wDetEr9S4tpB9tizlkm8UCo
	H+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SG4WEZviFkxJyCTgwnYnswY+nYpaBxW5GWNUrnAr/Ho=;
	b=Lh0sF5OdYygKOQMXWsqvXglsZYy8PN8yGtIVJUJUBMt8elz+rejiPB8j0hhEXIdDkd
	Pxg6sxeQk8VAmDaBbCB9g0XgMaH051t3T2/C8qy0ftT3Rm9cdabQ2x8DlYzKm4QiUh5Z
	T4sP9sT5+u1v6qXgdgI2TNYqZs1IGOKQYRfGu1QSLTT+e2PQAV3IHmGEO2bv3AL+h0Sf
	Vtx/72gLzzl1INxivbsq878GIbDWEJYbSPVbm+0NBbfyzxTLFBTkLLqXn7fvM9YAqJXr
	5nYhK7acDY9Jd+f9smqcn7z728ZoEk9o0A7qY7FqSSv6/5lnyarxpCVPIcMFjqLeSGtB
	WpMg==
X-Gm-Message-State: AMke39ne98sG7VjnS2rLXDbLJG5ASo/rMmZ/G3rWFMRvSRmkHhtiumH25fTLVgG++0bqlrirKoiLwyThovCkog==
X-Received: by 10.157.60.69 with SMTP id j5mr15762950ote.224.1487035284948;
	Mon, 13 Feb 2017 17:21:24 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.183.26.67 with HTTP; Mon, 13 Feb 2017 17:20:54 -0800 (PST)
In-Reply-To: <20170211034332.12498-1-f4bug@amsat.org>
References: <CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
	<20170211034332.12498-1-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 13 Feb 2017 17:20:54 -0800
X-Google-Sender-Auth: Ruhz2iyOapDXaUCxF-8x8jaDPgc
Message-ID: <CAKmqyKPcfAb-ZnnLVR+z72-LY4m1XvZf_kJ_t0974KCijzZDvA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] register: fix incorrect
 read mask
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
X-List-Received-Date: Tue, 14 Feb 2017 01:21:28 -0000

On Fri, Feb 10, 2017 at 7:43 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> The register_read() function expects a bitmask argument. To avoid duplica=
ted

The register_read() and register_write() functions

> code, a new inlined function register_enabled_mask() is introduced.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  v2: squashed together both previous commits as suggested by Francis Alis=
tair.
>
>  hw/core/register.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 4bfbc508de..482e3f827a 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -59,6 +59,15 @@ static inline uint64_t register_read_val(RegisterInfo =
*reg)
>      return 0; /* unreachable */
>  }
>
> +static inline uint64_t register_enabled_mask(int data_size, unsigned siz=
e)
> +{
> +    if (data_size < size) {
> +        size =3D data_size;
> +    }
> +
> +    return MAKE_64BIT_MASK(0, size * 8);
> +}
> +
>  void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
>                      const char *prefix, bool debug)
>  {
> @@ -192,11 +201,7 @@ void register_write_memory(void *opaque, hwaddr addr=
,
>      }
>
>      /* Generate appropriate write enable mask */
> -    if (reg->data_size < size) {
> -        we =3D MAKE_64BIT_MASK(0, reg->data_size * 8);
> -    } else {
> -        we =3D MAKE_64BIT_MASK(0, size * 8);
> -    }
> +    we =3D register_enabled_mask(reg->data_size, size);
>
>      register_write(reg, value, we, reg_array->prefix,
>                     reg_array->debug);
> @@ -208,6 +213,7 @@ uint64_t register_read_memory(void *opaque, hwaddr ad=
dr,
>      RegisterInfoArray *reg_array =3D opaque;
>      RegisterInfo *reg =3D NULL;
>      uint64_t read_val;
> +    uint64_t re;
>      int i;
>
>      for (i =3D 0; i < reg_array->num_elements; i++) {
> @@ -223,7 +229,10 @@ uint64_t register_read_memory(void *opaque, hwaddr a=
ddr,
>          return 0;
>      }
>
> -    read_val =3D register_read(reg, size * 8, reg_array->prefix,
> +    /* Generate appropriate read enable mask */
> +    re =3D register_enabled_mask(reg->data_size, size);
> +
> +    read_val =3D register_read(reg, re, reg_array->prefix,
>                               reg_array->debug);
>
>      return extract64(read_val, 0, size * 8);
> --
> 2.11.0
>
>

