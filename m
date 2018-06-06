Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQajT-0002qr-MD
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:52:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajJ-0002n4-M2
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajE-0005S5-NG
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:52:06 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:45722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fQajE-0005RA-FS; Wed, 06 Jun 2018 11:52:04 -0400
Received: by mail-lf0-x242.google.com with SMTP id n3-v6so9858523lfe.12;
	Wed, 06 Jun 2018 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=djtq03BYDUnp0FbuehN8KxCo94JB77KVpo98vpFuo8k=;
	b=Tj6tTi6OHWOW2sdPRNsEGnNr6BgaKeeRjvNMIarl5PowjT1E0Vu+nvz+cUmy2YA0FN
	F0zPL17bz/T+9w5BPOtvMntcpFDMM/fimTK73NJa+3o+j42Kb94D8UXR1UjDc9RaBBmj
	YrQ//XUyLdQlMzkTQK8NF/PQDoIuzKIo6j5tLuw6JPs+2+ro8iDBUb61yJnE7QIH5wvL
	T5Ss8cyCUa94HCv5mNGWmxshSrzQK16YMBMFzCZrLDeK3xGAg15f5+tu40URwSsLOszk
	9XPvNS/iUSc3cf6mOW4ncS+wqCQZmWxx4xubb7FUgBIKy5hqsHiDcyllVEm/B6UKWiZ1
	xo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=djtq03BYDUnp0FbuehN8KxCo94JB77KVpo98vpFuo8k=;
	b=OpiaXc5E0/U2X57lzu0MXlmKK2dN66QEHHO+URyd0wGmpJi1pVdky4nZTmFTia1r1E
	/LZHuInfCuGtmNJRPOBOf5hiPKj1gaIXRS/pkUgKwu77RRzrZ6xSseCGYXZvscrZLpcj
	9+wd+92bTcJINmEhuRXxd3QVpbEYQr4/sgl67vpmes1+66QFuK2LBHcpIqzBkBDJQY8P
	giqi1aupa9wxQWMIG9qtk5lHfM5+hlzj+ao1UWBwNiTebViRrGTDiiiGnFgYjNZt6cOg
	uQgnoGc0gW2nIjVT9tBhFPtr1XYf/fmDcW38AINUHqb5WBArtW12aXzbpKQ1q3o1qvPS
	do4w==
X-Gm-Message-State: APt69E1pWYSms10ajpSVgunAIp6zxe5nZjSMuAI91bP5RhVAsPTEYRH+
	bRTtZIfUQ5zvVp9VqA8QZ9yEC/UPGU61iaDUV7A=
X-Google-Smtp-Source: ADUXVKKopew1O4qngPGel8p+mFA1V22G3df/4j4Lp0chb6IrW44OraNe8z96PsHEx4wyfhWkMvcO2BREqtmOliALSE8=
X-Received: by 2002:a19:5011:: with SMTP id
	e17-v6mr2212067lfb.71.1528300322697; 
	Wed, 06 Jun 2018 08:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:20e2:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 08:51:32 -0700 (PDT)
In-Reply-To: <20180606152128.449-4-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Jun 2018 08:51:32 -0700
Message-ID: <CAKmqyKNXV3bTx3nJq5=7daUZP5_eF5ePDazv=-B5poN5JnX0iA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/11] xilinx-dp: Add
 trailing '\n' to qemu_log() call
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
X-List-Received-Date: Wed, 06 Jun 2018 15:52:15 -0000

On Wed, Jun 6, 2018 at 8:21 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 6715b9cc2b..c32ab083f8 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1074,7 +1074,9 @@ static void xlnx_dp_avbufm_write(void *opaque, hwad=
dr offset, uint64_t value,
>      case AV_BUF_STC_SNAPSHOT1:
>      case AV_BUF_HCOUNT_VCOUNT_INT0:
>      case AV_BUF_HCOUNT_VCOUNT_INT1:
> -        qemu_log_mask(LOG_UNIMP, "avbufm: unimplmented");
> +        qemu_log_mask(LOG_UNIMP, "avbufm: unimplemented register 0x%04"
> +                                 PRIx64 "\n",
> +                      offset << 2);
>          break;
>      default:
>          s->avbufm_registers[offset] =3D value;
> --
> 2.17.1
>
>

