Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRJIL-0002Lt-0F
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 10:59:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJII-0002Lk-Vt
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 10:59:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gRJIH-0007he-RR
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 10:59:30 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gRJIH-0007gk-K0; Mon, 26 Nov 2018 10:59:29 -0500
Received: by mail-lj1-x242.google.com with SMTP id u6-v6so17078283ljd.1;
	Mon, 26 Nov 2018 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VT7gIq5j/tYnkWC7p5jfalCkxSsEQwgp5lWucxCm9Fw=;
	b=BdYGe815RI46AMvp/cqmvWwbszP7Ds0ipML+HkfaNY8LQ/g3alMHJD3wvE6V86LDJk
	AUcVlShMM+zTP0ifZk4+T5b2eW3hHj/7MnBweOn+TARdCa5Zg609uYG+5oHH8kGhcJrJ
	q59VH7GQ4t3rNTX+EhlGLKmSeTAIe5usnXXPXcutvlKHRj2wsVOO2+FeOp7CjdP5/AYM
	ck/08bBYgY+hyde21ojxbdVW9/pcmw5DB3eQrahNJtPrZSJ84tGsz0o4VnVLKohBxPhW
	hSYmOm9II4LwEiNC5yEp4QwHkpw6LYczTYzK3zgXQB77SAuaFVAph4njCfF7vBrvSasv
	1LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VT7gIq5j/tYnkWC7p5jfalCkxSsEQwgp5lWucxCm9Fw=;
	b=jfOfW5nsq8VryMpLslKZywyz8WJDJz28GfIARdT4aZ9rfapykmQGQ40fwkz0lAnEjT
	RBNCFUaCzkAjuog8c1T6znxMHst4XKEZkBMOjMNmWgwQZYR7hm9mIUqEKi/pmre8OJpx
	jGIbBaGqN1UmKCwqSImAdeck3gR89sMtWVr9QalcWP6mCYXifHRjSPoQ9mdAAGBbb+WP
	FZBGq8kbRJ+IlMizEb7JsSKHS91nYu5dUFZ/ZAfjZ3YoaoQHayfpxgIquazgOTebZikS
	l9c4JniXKQJO+hplOolb31/K0RobYVtjFH5BFgv+OY1z1E1radxytQ9LdVUN3xxiBuX7
	BvcQ==
X-Gm-Message-State: AA+aEWZBB/o9+B/DMP3JxZGBTjj8D789XJBTZJSGnaAUdUfKr3njAVDA
	VlpdEAn4XkiJufXDjOSIW65jlzQgunsCmvGUpww=
X-Google-Smtp-Source: AFSGD/UeQPTOr6NwYAOEDySQ4i1PqI/BYizAZgePaCgCLvxlNZInblrd25d3j4DCAREWT4LbNMloT+RhaLutQhZWhUA=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr17248237lja.58.1543247966528; 
	Mon, 26 Nov 2018 07:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-5-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-5-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Nov 2018 07:58:58 -0800
Message-ID: <CAKmqyKPzxsj4oATNH4k5C23ShG4RUTWpFHHbq4+4GDo5wXNa=g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Edgar Iglesias <edgar.iglesias@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 04/25] MAINTAINERS:
 Add missing entries for the Xilinx ZynqMP machine
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
X-List-Received-Date: Mon, 26 Nov 2018 15:59:31 -0000

On Sun, Nov 25, 2018 at 12:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b9996ab2c..007f89f126 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -711,6 +711,9 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/xlnx*.c
>  F: include/hw/*/xlnx*.h
> +F: include/hw/ssi/xilinx_spips.h
> +F: hw/display/dpcd.c
> +F: include/hw/display/dpcd.h
>
>  ARM ACPI Subsystem
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
> --
> 2.17.2
>
>

