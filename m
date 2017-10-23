Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6d6f-0002it-5v
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 09:49:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6a-0002g3-6B
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 09:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6U-0000rC-Tj
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 09:49:24 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:52020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6d6G-0000lN-UK; Mon, 23 Oct 2017 09:49:05 -0400
Received: by mail-qk0-x242.google.com with SMTP id 17so21944415qkq.8;
	Mon, 23 Oct 2017 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JeEXtnQj1FHd00thyanoQBIJv2/hDOeaXKiuoid3jWQ=;
	b=XHmACoNnUYIPOKk5V97thcXYGj9wGAk6Qqy8zUo9RXc23Vg2l7vs5qH2KM0Cjsbq5E
	s+hCjb92WYgjmj0eDa/mIlIpHKyXsDcLecvMp6InQLXJ1SFqxwWPlfTKcNZtCvrxDM5e
	E/6uSAB2CAd6tjgHV6UefrU6QAPHUcSpfxYIzC+0rngd/ZMhrLLf6hSS9IRPBSGLEqRH
	4cY+x74AAvxVuONwj05BYhXtNNUJmp11QAAgvlADm2tohj9T/D3GzS0PFR4aWoeO6xzv
	/t84RUpU+KeR9GP0sEsraDk74RrccMaqomKFrVKJozXUvr2RoTxVPFQRKzP0lTl4pMki
	Rruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JeEXtnQj1FHd00thyanoQBIJv2/hDOeaXKiuoid3jWQ=;
	b=eBfqQMv/VLhtRFmrUSffX2tILKj5U0/NbYJwt5Ttbcysvjr4K37l92Pk+SsGTgVQQa
	hk0C5kTUiFGs8MxTtRz7LREbIRD309bCwzuoWkWE47gt9v9RY1vrGn92HVCJItIwGqX7
	ngKeiGb7Uvt8FhhzALFzp2tCwfMuKkkcroDoWNNbJEWhu4uWJBtZrPdIiIjP02Tp+rVN
	FM1mNzbufEk1yLogGNgghcXSM/75WlrZ/7tdjG75zit0hHFDgT4MW/jta6Y4hN/hnX2b
	txxmhEQdxOTjHfTmkmZg3dR+AeaLYOGrTEx0MIGb2bpTO0aH6lhYG0F61wWc27pY/2bB
	pSZg==
X-Gm-Message-State: AMCzsaV6/Qk6vKGQOKqjOx1scBflkcOAOq2bJy/3MvWd7tSuyELo1a6X
	0p8Dwkqwxl6f3owMdYZXV3DPmvfh
X-Google-Smtp-Source: ABhQp+Ql153tT9/VP9enC7CDmbVbHWEpi/YL37SZUC8GOjmIO9XhTL+7oJy/o+m37xwKR0daqlg0Pw==
X-Received: by 10.55.125.66 with SMTP id y63mr20041794qkc.101.1508766544119;
	Mon, 23 Oct 2017 06:49:04 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g8sm3220237qtg.23.2017.10.23.06.49.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 06:49:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
Date: Mon, 23 Oct 2017 10:48:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial
 ports
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
X-List-Received-Date: Mon, 23 Oct 2017 13:49:28 -0000

Hi Peter,

On 10/23/2017 10:11 AM, Peter Maydell wrote:
> This is really the documentation being wrong -- that is actually
> a PC specific thing. In QEMU generally, -serial can be used
> for as many serial ports as the machine model provides, up
> to a maximum of four.

FYI I'm still working on not having QEMU so tied to his PC origins.
I won't make it before soft freeze although :(

Regards,

Phil.

