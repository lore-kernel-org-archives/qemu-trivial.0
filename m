Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fMCbq-0003fy-3F
	for mharc-qemu-trivial@gnu.org; Fri, 25 May 2018 09:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fMCbm-0003en-J3
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 09:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fMCbh-0004xU-Uo
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 09:18:14 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:37386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fMCbW-0004tE-Me; Fri, 25 May 2018 09:17:58 -0400
Received: by mail-pl0-x243.google.com with SMTP id w19-v6so3160751plq.4;
	Fri, 25 May 2018 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rgNPR3rCfHRWKAB5bm24HNCQlcL0PG3w6cOkY5Nlovk=;
	b=cSB9XAghLOnz5khcBB5w8OtRVMFYGdt2B/lzs9O/z5x5Sq4701KsdPbOk7bX5OuAob
	4BI99qHKvKpZ6i9qQTI6/LhKd9ASPEo9OSqwPD5n1zwVl4A4eS8t8naN0Iu2xPtRn7qc
	LaQVOnetdm3rB/LqhR0Vi0FEiSgyPQdPz6Y3pUm0hoVGEgC3AlVOXxFSjWzWytVCIOg8
	BA36RXBvWN7/Rv8qKlP00zIsKIoLu9wvDRiKMhX0X8WhEEBSba/SoyHDRx3pSbGsIkvL
	XDTzzRhSYfUncpb7ni8+ZUEE9kohlOAH5sdQSkU9IcbcFrrEtyIfnOa/i930N3sh7+J6
	BE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rgNPR3rCfHRWKAB5bm24HNCQlcL0PG3w6cOkY5Nlovk=;
	b=uhkmzxIb5iQ3GqegFX55YJ/aM1gVkLD+TU/6s9Nax7M/8Ow+vcg9ruvbHptNwY7vk6
	7y6hODgTw/HL8qiXvAK1JwbxoozNXLnNKu/DuxrVjNJxyLcoBepB81kaoB+L+B6lOAHz
	IJX5iDvKyQao5wF7+xer8rqnVRb2n37gv4lbu80Ozx4ZpER31c39KTLaDCe9jWWsT+of
	m8/XEx30WKZIBqkvDnTSlw7vlPDfj0aJSNR2RUFj9mBwSutZcRpwhVnZOAditk3nAYmW
	Nq0dQDpPTqsff7MIYpGU9dtNZGDgmZikboPK1YNQMvkvTq77OiCVevzLtYgglTHuTKp6
	GuPw==
X-Gm-Message-State: ALKqPwcUQWh7syT+DdJ8ibcktG2jteIhuZ5tvevSzcfgwsP/9md2PwAY
	m1LnX++MdFmzLiF7mzoz2/E=
X-Google-Smtp-Source: AB8JxZpiWsfc8VmGaZJ/+nriiw4hYJYAePj/Q1ZFkfk675bo4JNvveI9qCJZcOfVW4+RWvC5Ncy+dQ==
X-Received: by 2002:a17:902:6b45:: with SMTP id
	g5-v6mr2647349plt.67.1527254277667; 
	Fri, 25 May 2018 06:17:57 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.42.51])
	by smtp.googlemail.com with ESMTPSA id
	r5-v6sm31224092pgp.81.2018.05.25.06.17.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 May 2018 06:17:56 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Michael Clark <mjc@sifive.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@groups.riscv.org
References: <1527229488-49822-1-git-send-email-mjc@sifive.com>
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
Message-ID: <83728e91-de69-c376-a768-0aad501ff64e@twiddle.net>
Date: Fri, 25 May 2018 06:17:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1527229488-49822-1-git-send-email-mjc@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-trivial] [PATCH] RISC-V: Correct typo in RV32 perf
 counters
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
X-List-Received-Date: Fri, 25 May 2018 13:18:15 -0000

On 05/24/2018 11:24 PM, Michael Clark wrote:
> This patch enables mhpmcounter3h through mhpmcounter31h on RV32.
> Previously the RV32 h versions (high 32-bits of 64-bit counters)
> of these counters would trap with an illegal instruction instead
> of returning 0 as intended.
> 
> Reported-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  target/riscv/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: Coverity CID 1390849
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

