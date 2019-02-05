Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqyPl-0006j4-Ne
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2019 05:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqyPj-0006hJ-Ib
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 05:57:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqyPb-0005Ph-HI
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 05:57:13 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gqyPZ-0005Nd-Sp
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2019 05:57:07 -0500
Received: by mail-ot1-x343.google.com with SMTP id a11so4879192otr.10
	for <qemu-trivial@nongnu.org>; Tue, 05 Feb 2019 02:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ELM5cQ+GydWY1A6D/Ro6CgGuWodud/1Xku0XNGIrzx4=;
	b=CMkEt3GR3TsQ8MHvk7O+46cZKNfGdGiZeialfyY7M5Vu15BaGDjG7ThuMZNgNZ//GD
	BBkt43zkyFgx259PhnhJhNVRoxcmXJipmLB4n4S8WbmA9nayUQYCpjuRLg6jC8zI5u7C
	R4LByA3oD7RCc/lI4BW4IVIiTgfKWnLC5lm7cNGWMt+IknjUlcZPKdRcyo6hvquYB+Dl
	2KSV8NUjVZ2dgK6qRXHBaIac0kvm+waiRju/Qf1RMP6Y6LAdQGmg7w9P6N6lkEP1mz4c
	OdIy4DpJe8tMGiEwwdCPtWdV+0gZwaTpibiV0WU58MSxIH+HBFQp8UjP+t1mdQd+su3d
	4YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ELM5cQ+GydWY1A6D/Ro6CgGuWodud/1Xku0XNGIrzx4=;
	b=o9OAjowm/D9Hbm2KzNtzXADShLomMttBpckS2W2s4oB9tIXLrYdqu/HQNe1JKy6/Gl
	ioRC3t1remRcKcTv8agXMwr2SZqn9iF3tB4u6gplk5ulCdJgYk1Nhc0lyCvy7fK/WCe9
	gvZZ3f8MpOKWCd5/xU0R9Aor51ahYS0RG4fRR3MOh1onLtNjEUvagrPPDPVXl9DZDplO
	+Kj4L/VsfTDrvNHAq6xXxMqZDSs7uI5E6oGYTzDAU03uaxS/KmF0XZHW6VpD19bchaOZ
	xiy9pk5K7xPlFf81FkQxYLZ6PaSqx4wJqAEd+kZR/8E/5LOxouGxeOJtCZuStwADWIFH
	qIUA==
X-Gm-Message-State: AHQUAuYYkDe5zW3gmMg2IioYRzugVRyg3gtARX3pgnCD3N6ZeR39R77z
	Q7Lxu/bbdy6dr+LTJvp/VRXcAFtQSJHa8MwyIpd+Bw==
X-Google-Smtp-Source: AHgI3IYSGXJSipC+qe0lnOaSjxfxzSRlRI2zoNqpBVtShQ1lFiJyJyIyJU30MymJs5JumMVeTcjuS4gRqgn64f36p+E=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr2133396otm.363.1549364223017; 
	Tue, 05 Feb 2019 02:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-4-philmd@redhat.com>
	<87a7jaag7q.fsf@dusky.pond.sub.org>
In-Reply-To: <87a7jaag7q.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 10:56:51 +0000
Message-ID: <CAFEAcA8-YDTnszv7Mk+F+OAxGJSmdu4yEio1j-E477HNbh-SOQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>, 
	qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 3/3] util/cutils: Move
 function documentations to the header
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
X-List-Received-Date: Tue, 05 Feb 2019 10:57:16 -0000

On Tue, 5 Feb 2019 at 06:44, Markus Armbruster <armbru@redhat.com> wrote:
> There are two justifiable function comment placement styles: (1) next to
> definition, and (2) next to declaration if it's in a header, else next
> to definition.
>
> The rationale for the latter is having the headers do double-duty as
> interface documentation.
>
> The rationale for the former is consistently placing the function
> comments close to the code gives them a fighting chance to actually
> match the code.
>
> I'm in the "next to definition" camp.  If you want concise interface
> specification, use something like Sphinx.

I'm in the "next to declaration" camp. I don't want to have
to wade into your implementation to find out what it does:
document it for me in the interface, please.

My standard for patches I review is "if this is adding a new
function prototype in a header file, add a doc comment".

thanks
-- PMM

