Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccJYE-0003IS-5Q
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 17:20:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccJYC-0003IL-Gd
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 17:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccJYB-0002zQ-Bv
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 17:20:20 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ccJYB-0002zE-72; Fri, 10 Feb 2017 17:20:19 -0500
Received: by mail-oi0-x242.google.com with SMTP id j15so3452968oih.0;
	Fri, 10 Feb 2017 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=L8ucb3lucA4S5GVG7jCItHHSsHd7vxgbgCA1v1K7RLg=;
	b=SxzpfO7QrRPO5VyH8Bd/kplAr9Mlh8nxZH5Jj0BUJe0Arp1g9sz0dGjiI9JsnEB3oU
	bt5Tfa9snf6nzCE2tdxJKhG2hTzw/oog4F1mu0HWzN11xoxIKfSB+zIdWpXcMVjKF32f
	be8b2ofEO+9NlggUaH6ULXnoQ5YTl0yt931xvmPY1XARxN3q+HIhB6UJrtosnmufe4JU
	oFs+cg6zksWxgYJFkxkSXqPRzi4WnwIwF1hy3xOYEQKHBnCpXKkytXYmCtqG/FC9Ede+
	sA4ugHdvxxQgeFC+6A3LA3GCAaWjmHOuh97Y/pYyJLM27iEE3h2yTnVVUv/q+c5ltDUR
	mEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=L8ucb3lucA4S5GVG7jCItHHSsHd7vxgbgCA1v1K7RLg=;
	b=dD57SzQ+cMKYAieorxm9/WacHxcOAIUQgnJpsV/tP0CzJKxeF6mhL2al3ECXngARjl
	QiSMS9T5iNrKm8FxoK4P1H3hV4PaiO0BZevL8XjikZQv9U1Du3PRuk2dMjFpenCJKFd9
	j6Ge5OeJ9MRpuJRJ1sNe4kAxOfDv/aqkVXsdwBt+rtn+4y5QPnUw7UUDqbjenPBQjNkU
	GtPTJi7aXmDq4NqqN5ANewuqtcqMhvUi921nIswPpQf0UjkE5W+vvzxR4/weoQgRcBQ4
	VMfz7ApgJ8XUcTqXn+p8R4HarnrxqzxY98dBaDB/fqK+zztehkQ1kFtnsmGBGovJD3gH
	33vg==
X-Gm-Message-State: AMke39k8B3XI4/wGoIQSKz/jn7tX/yqjJdeoAs5cUcMMhO+ycJ1ZQT2j3zZtD4wzTZ4qiZCvA6ZRevAaHAUYdw==
X-Received: by 10.202.236.11 with SMTP id k11mr5521582oih.166.1486765217027;
	Fri, 10 Feb 2017 14:20:17 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.183.26.67 with HTTP; Fri, 10 Feb 2017 14:19:46 -0800 (PST)
In-Reply-To: <20170206233931.14921-3-f4bug@amsat.org>
References: <20170206233931.14921-1-f4bug@amsat.org>
	<20170206233931.14921-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Feb 2017 14:19:46 -0800
X-Google-Sender-Auth: VOAjJNV5K8gY_StHRrWaU4qlYTg
Message-ID: <CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>, 
	Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] register: fix incorrect
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
X-List-Received-Date: Fri, 10 Feb 2017 22:20:21 -0000

On Mon, Feb 6, 2017 at 3:39 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> The register_read() function expects a bitmask argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The functionality of these two patches looks good to me.

I think it's weird that we convert the write function in one patch
(when we add the function) and the read in another.

I think both patches should just be squashed together. It's a pretty
small change.

Thanks,

Alistair

> ---
>  hw/core/register.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 12f4c1e62d..482e3f827a 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -213,6 +213,7 @@ uint64_t register_read_memory(void *opaque, hwaddr ad=
dr,
>      RegisterInfoArray *reg_array =3D opaque;
>      RegisterInfo *reg =3D NULL;
>      uint64_t read_val;
> +    uint64_t re;
>      int i;
>
>      for (i =3D 0; i < reg_array->num_elements; i++) {
> @@ -228,7 +229,10 @@ uint64_t register_read_memory(void *opaque, hwaddr a=
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

