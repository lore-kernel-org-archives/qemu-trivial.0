Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2gUL-0003Bm-Bx
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2017 12:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e2gUJ-0003Ar-Jf
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 12:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e2gUI-0005Sk-S3
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 12:37:35 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:45522)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e2gUG-0005Qk-Oj; Thu, 12 Oct 2017 12:37:32 -0400
Received: by mail-wm0-x243.google.com with SMTP id q124so14795977wmb.0;
	Thu, 12 Oct 2017 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=MZIA9Fo1x6Uzk+iTeV5gsm1gC/QSAl0MCt4LIDnor90=;
	b=KQOGhN02IdtvDbn0mx3zYVMys+FJEVfLxuNAN+K5Io0PGNvePrr2fsLkQ+lEQC61iL
	bxuecj6cDxU1en8q0F174Br48Ujvgk54itLxNQN9VashDM0bYk70WVjshwyXjXSvlr4V
	4NBWwDXqRR1mNTjo2qeaUZbrSUz6UyvCGdvz86CjBfzbAHm65Q8ERbqiFFIPEtWIUmYy
	ZBbZRCIDZ4rAIzpuUQbhLbkF6UKtXgBOQPixTfq01Gs3wHTNNH2skuAlpdJRRnK3ex6Q
	a1DDpwoeM9oJ9JmOBWpMUfFz+Hr9Wc03BpSb9CmCrziAY2z+t3tgmYYsvuI9F54sIF9H
	V/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=MZIA9Fo1x6Uzk+iTeV5gsm1gC/QSAl0MCt4LIDnor90=;
	b=IgRRNIECVQ9+WvxTOqqdFFJP+Wt8Vr8MLYagGDUHjpooTRQjYJhdgXuD3uMdZosFts
	LtYbDYR0HUYtyEcCg0vfCwPfT5T6UZsIxk+GBqP0DbEQZxdStBxwOt5fQRg0FIYfUgSg
	+HmH8xpCgssDEcnn7BNwBhOdbQhIKIbkb3g/P0kRu7BoGeEYQSef1pO86TCd/EcbLeB0
	+1bcV/nQ8KC+P6y0rzmEz9lrGJilQMcoC8I6Tpu1mYx6ozeBK8fdHU7fFxw/5z5VDope
	+LC0AIViwgU09YuVXDbJ3RJ64wyPLuhfbv74R6gaL7AudwvPuIxawxHqfQ4USvSqRzV0
	3i6w==
X-Gm-Message-State: AMCzsaVAtZ/4E1kkcCngsEgl4qkZ7LtNoiWGFFnEaTi82uuGxNXi9dUO
	0Jqjjx0CSUr5bhO0PoOgc0lKKVf/lU2zpSWSnDk=
X-Google-Smtp-Source: AOwi7QDlRwNWFw0Lgm23ZmrU5B7s+53S1eVTnGgj7htE8ITxWoWzhDTpInRuR8f7LdgCXuEm5bHKO5wk1iYVrkkfN9w=
X-Received: by 10.28.2.2 with SMTP id 2mr2616482wmc.128.1507826250320; Thu, 12
	Oct 2017 09:37:30 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.157.2 with HTTP; Thu, 12 Oct 2017 09:36:59 -0700 (PDT)
In-Reply-To: <1507814267-21400-1-git-send-email-peter.maydell@linaro.org>
References: <1507814267-21400-1-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 12 Oct 2017 09:36:59 -0700
X-Google-Sender-Auth: kzExxpo5DjndoCd0d3je9HO0BK0
Message-ID: <CAKmqyKN56URJjH06gyOJA3HS86N8ap4WkRCL97RHN7Y-P7bBXg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>,
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] include/hw/or-irq.h: Drop
 unused in_irqs field
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
X-List-Received-Date: Thu, 12 Oct 2017 16:37:36 -0000

On Thu, Oct 12, 2017 at 6:17 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The struct OrIRQState has an unused member field in_irqs.
> This is a legacy of earlier versions of the patch; the
> code that used it was dropped from the final version of
> the code that went into master, but we forgot to delete
> the no-longer-used struct field. Do so now.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Good catch.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  include/hw/or-irq.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
> index d400a81..fd900fc 100644
> --- a/include/hw/or-irq.h
> +++ b/include/hw/or-irq.h
> @@ -38,7 +38,6 @@ struct OrIRQState {
>      DeviceState parent_obj;
>
>      qemu_irq out_irq;
> -    qemu_irq *in_irqs;
>      bool levels[MAX_OR_LINES];
>      uint16_t num_lines;
>  };
> --
> 2.7.4
>
>

