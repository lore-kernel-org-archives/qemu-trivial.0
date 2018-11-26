Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gROVZ-0008FQ-Jg
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 16:33:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gROVY-0008FD-2r
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 16:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gROVT-0006kx-Q0
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 16:33:31 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gROVR-0006jh-Lp; Mon, 26 Nov 2018 16:33:26 -0500
Received: by mail-pg1-x543.google.com with SMTP id w6so6774911pgl.6;
	Mon, 26 Nov 2018 13:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=flfL2oSYjhfpQDL19DlQZxTGVVPVWPoqO0kCquoxS/c=;
	b=qV7PqDKqBRE79Im3bamfC69QqxyrAfl+0Un24+Rt1h1b/49+VYZH5Ry4Nk/bQH0B75
	/4ubgPuxQO4BsHEREh/a8xZoHydbXtBZXZe23DMNOEMZQeJgj8LOn6vyrEL6Myp/ES0O
	RTbCtHNSgG0UIiDrQHXGxhcTb5DDG8/4kiQT1HkDKWptpyUAnvg03q6BonUWWiAfxsw3
	+MSvfXgHVBY6PQ++U4diYeAxh2GicKJfes04wkqlGHijU9SG3fvIr/qaDJZacxPrbqsQ
	0uFYyFENlgzn8by7BSdsQAcPj5qxZLzwnMj8LJ5za5jbcd5xFi4SduyMxh7QXnyHzgtm
	sk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=flfL2oSYjhfpQDL19DlQZxTGVVPVWPoqO0kCquoxS/c=;
	b=TwyaE417jIBzsxKjMjVW3nUGtG2zxvnqAGGJmUBc8kwGtpK2rHxL4eyxRdz7qXO1if
	EY7TM77Rx/4ir4icp56tqustN8vKuHJmCAd6UY+epA3AWJBQsu/mnFVIC5TLz5I6SS1P
	E4I5j8jFKd+PJH9iw8uaFSRAs1qtUtt5RopLPu/V3BwAC3MGDbtJFw6CVcBrEF63eeA2
	92FFq9iuHkKpVWaEFusOY+4ocIgvBzYCa+UYSRqoTUHKf3cTL3oemOu0xlbbWD4YszDi
	kYhkNYHm8gesPKg8i+m2zvvpKzSbLeHXxZLcEQ3Qa2/3axOzhJtGpzv7qKUm385qyOmi
	RzqQ==
X-Gm-Message-State: AA+aEWYspz+wyWSMIvvlJBGOGi+f0rLbCy8kSXvkykG0XQZh1j2sLGsX
	WrLSwg0gX4odniyp17nfZRM=
X-Google-Smtp-Source: AFSGD/XwkqWaUTe13shjDJwiXS8dye97psnlyZUT88AybGg/sJWuZyT8sLwp07A3hexnMjjcW8FDUg==
X-Received: by 2002:a63:2054:: with SMTP id r20mr26513789pgm.328.1543268002190;
	Mon, 26 Nov 2018 13:33:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.googlemail.com with ESMTPSA id
	g70sm2946690pfg.98.2018.11.26.13.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 13:33:21 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Cc: ehabkost@redhat.com, qemu-trivial@nongnu.org, laurent@vivier.eu,
	pbonzini@redhat.com
References: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
	<87mupw3vm2.fsf@linaro.org>
	<733cd094-3775-ba2f-242d-e58bc7f2daaa@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <7b4d2a9a-a4ed-1f12-f1f6-e5db1d5bd704@twiddle.net>
Date: Mon, 26 Nov 2018 13:33:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <733cd094-3775-ba2f-242d-e58bc7f2daaa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: fix a typo
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
X-List-Received-Date: Mon, 26 Nov 2018 21:33:32 -0000

On 11/26/18 1:25 PM, Philippe Mathieu-Daudé wrote:
>>> -     * 1. The hax_tunnel is also destroied when vcpu destroy
>>> +     * 1. The hax_tunnel is also destroyed when vcpu destroy
> I'm not native english speaker. Isn't it:
> 
> 'The hax_tunnel is also destroyed at vcpu destroy'
> 
> or
> 
> 'The hax_tunnel is also destroyed when vcpu is destroyed'?

This second option is best, fwiw.


r~


