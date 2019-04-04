Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBzHv-0000il-0m
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 06:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hBzHt-0000if-KE
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 06:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hBzHr-0003yj-Aa
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 06:08:01 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:32904)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1hBzHo-0003uq-9t; Thu, 04 Apr 2019 06:07:57 -0400
Received: by mail-wm1-x342.google.com with SMTP id z6so6931527wmi.0;
	Thu, 04 Apr 2019 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=27jKRY5m4mFRCr2ull9pfNtmwtd3gy7nbXKqVz+3JvA=;
	b=fEchgn90EDmHeqW03csoh+ZH9pnjI5waKRgjNjL6xRg4gUUDo/dluD/XWD+JJtMbDT
	tKlfhxs9QQ+Ml4znYZyJqxGvZQ3yAaKFqDvGPLVWDHn2itMVECsqLfe1VmDvSMRpmwVZ
	7if8w/Kf5wsX2Yf3Hl6QOO57krSrJFdoL/d5/o8f+GSPYn1q+1EzFLtIOYJjppfZHmkX
	BGbgO+sFLVQIoi2Q4gtV57sDCG6rYJ+ZcuDCX6WXQit9XUM5HZCZxP7qJuIPS4B/1EWv
	hGpZLQVuYrIrhUr+huBcaTpVqs8YkrQHEg/30CP4jd/zvqkrmsRkSe8zSAWDaXAnTcKJ
	A0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=27jKRY5m4mFRCr2ull9pfNtmwtd3gy7nbXKqVz+3JvA=;
	b=VRgee/7KGRKeHJ7Ak4BePgC/2fIPhOFwRSyWgc/7LcggNaB/7oIBXX0/iPeDjDVs8l
	ut79MfLAQVrwouNlcnzy+fguzHScKLd3Ht/CHO9ezFgkDSm/AqffZBpjG+06ht33FzbW
	JN5M+pw0TilVY/KAxTUY6VY7zJ1RMNW1nAhZOgxDu0eg7S8mDdwv+1Nd83R46mGMK2pb
	JOA8t+kY0OKNcyPKt+iwfkiW8wF6+PLCGhVA54qrCv4zlqX1+jZTxkPR5SjVuuVwivEe
	IT67ctibYH+ydiAvYMb7lgNOVOPgSHCIz4783o96jHjShxcIg3chTwksuOgrcop2E+uF
	bgmg==
X-Gm-Message-State: APjAAAURo0HxT5STpx1ZPxNMp/QzmP5KPfdd2yxFJb1KrpNYcNa2UQtd
	uuDBIuxPwIu/FPL0Y8datx3UOUNx
X-Google-Smtp-Source: APXvYqw6DOmiQHphIESbHFcfuYA5a+O2O/B7wWtcf0EqHGHE1D8C2Q5Z6JENGAYyLcy3wdwXL8kZdQ==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr3269500wmq.102.1554372471302; 
	Thu, 04 Apr 2019 03:07:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1174:50cc:f841:c413?
	([2001:b07:6468:f312:1174:50cc:f841:c413])
	by smtp.googlemail.com with ESMTPSA id
	a126sm25621694wmh.4.2019.04.04.03.07.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 03:07:50 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20190404071421.4891-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; keydata=
	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
	uUHgL9dKIfvpm+rNXRn9wAwGjk0X/A==
Message-ID: <298ccbd7-9af5-8303-e42b-33dd1cb94b9e@redhat.com>
Date: Thu, 4 Apr 2019 12:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190404071421.4891-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH] hw/input/pckbd: The i8042 device should
 not be user_creatable
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
X-List-Received-Date: Thu, 04 Apr 2019 10:08:02 -0000

On 04/04/19 09:14, Thomas Huth wrote:
> The i8042 PS/2 controller is part of the chipset on the motherboard.
> It is instantiated by the machine init code, and it does not make sense
> to allow the user to plug an additional i8042 in any of the free ISA slots.
> Thus let's mark the device with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/input/pckbd.c | 2 ++
>  1 file changed, 2 insertions(+)

user_creatable is not for devices that are not pluggable in real life;
it is for devices that crash QEMU (!) or always fail if plugged by the user.

So the question to ask is: would it make sense, and especially work, to
add an i8042 to machines that do have an ISA bridge (for example the Alpha?)

Paolo


> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 47a606f5e3..af393818fc 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -568,6 +568,8 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>      dc->realize = i8042_realizefn;
>      dc->vmsd = &vmstate_kbd_isa;
>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
> +    /* i8042 is a device on the motherboard, and not pluggable by the user */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo i8042_info = {
> 


