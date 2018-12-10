Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWRRs-0002T2-1f
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2018 14:42:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gWRRp-0002Sc-HP
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 14:42:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gWRRm-0007H8-6Q
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2018 14:42:33 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gWRRl-0007Fa-Uf; Mon, 10 Dec 2018 14:42:30 -0500
Received: by mail-ot1-x341.google.com with SMTP id e12so11613773otl.5;
	Mon, 10 Dec 2018 11:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P/353iNkxpWU5bgKtkmkwwjzRNNA2ncIKayH4ROT/xk=;
	b=Qt2xDtsYOb6vdbu9Ok/FasH0dctZplwyzVGsWuLjnLmnzsOVrPqw8SRqDWfKXHrlUJ
	gxx98/Sb4wKtbNjdhcpHvdSty1Gr/vZcbIITw0rhUyuiIP8YPKtQDLD+JKrrTEcc7MRA
	eP3m7Vb9qL+OuMchVzR6GgHW2Uws0Cj+/CXN7EYbpYPIj65M7KGkXYEyT8mGarSz1Ioe
	0pUIM3xHItuE1W4DMZOQhxVWcr5Wba3VWi2L9QsTVWd2/UGrgmmIGsjXvUlQ6WRQvz7K
	yWKQmRlbFBpYg2MJPYxeG04v54MHArrzKxgQ0YdCEvMMCXH81Wb2XHEAn3jdks9Uorm0
	7YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=P/353iNkxpWU5bgKtkmkwwjzRNNA2ncIKayH4ROT/xk=;
	b=nGCbXnsQDlVpnEkSVD4fVTzoB7NLaEifLu7Y7oo9bVenSk+gsR8YdQ8HycXCZ/K6yP
	oBTia3R5TW+5fefbK5xJZqyc9boGAKYlxW6TEHdtaxNbYO9aP9qwik+4ksM2yb14EMs2
	KnUf7Ybu0hSRgXE5jZOivo/YzGOf3U76R/Z83Izze3RBMslKGSfTOqbUarVbqyu5s3lU
	VbPvj8A0Cr9jsdl9GS0parzx50ZFHFgpVTKwiTEOqWjvOoI50n3qWUQUSfr+jbNb5hD/
	Xkf06tdoRqAcI/Uc1pqib4jnvmAWfPdyACXpor4xabKMa0U69vxW/rFqPScNAtOk7OnB
	MisQ==
X-Gm-Message-State: AA+aEWaudJS6OZNTUsgjX9ivOjj7gSlox/rqoT7UBelK5YM19arYLFgl
	TbcYtpk5QDz39LXhkpQFTS4=
X-Google-Smtp-Source: AFSGD/WdxfaOQyzH7Mv7dcQDJC/OvKHZXruvz64iUM+2xRWA+k8pXIu8PXOL0oRmkoayVLxkC1scxg==
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr9869701otn.214.1544470948894; 
	Mon, 10 Dec 2018 11:42:28 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.googlemail.com with ESMTPSA id
	k13sm12882193otj.19.2018.12.10.11.42.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 11:42:27 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	fabrice.desclaux@cea.fr, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
	Laurent Vivier <laurent@vivier.eu>, camille.mougey@cea.fr
References: <03506cf0-a204-f619-8ee4-4990a5e69af5@cea.fr>
	<CAAdtpL5BdqUvHpVTpKuJ6R+yEHGi7U6T9rUK2PbL3nwC7F_3jA@mail.gmail.com>
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
Message-ID: <271fd922-943a-f092-d714-697320e9ea21@twiddle.net>
Date: Mon, 10 Dec 2018 13:42:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL5BdqUvHpVTpKuJ6R+yEHGi7U6T9rUK2PbL3nwC7F_3jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] Fixes i386 xchgq test
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
X-List-Received-Date: Mon, 10 Dec 2018 19:42:34 -0000

On 12/10/18 1:26 PM, Philippe Mathieu-Daudé wrote:
> Hi Fabrice,
> 
> On Fri, Dec 7, 2018 at 5:06 PM <fabrice.desclaux@cea.fr> wrote:
>>
>> As "xchg" reads and writes both operands, the "+m" is required to avoid
>> undefined behavior on -O2 compilation.
>>
>> Signed-off-by: Fabrice Desclaux <fabrice.desclaux@cea.fr>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


>> ---
>>   tests/tcg/i386/test-i386.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
>> index a29b41e764..18d5609665 100644
>> --- a/tests/tcg/i386/test-i386.c
>> +++ b/tests/tcg/i386/test-i386.c
>> @@ -1137,7 +1137,7 @@ void test_xchg(void)
>>       TEST_XCHG(xchgb, "b", "+q");
>>
>>   #if defined(__x86_64__)
>> -    TEST_XCHG(xchgq, "", "=m");
>> +    TEST_XCHG(xchgq, "", "+m");
>>   #endif
>>       TEST_XCHG(xchgl, "k", "+m");
>>       TEST_XCHG(xchgw, "w", "+m");
>> --
>> 2.19.2
> 
> All QEMU patches has to go via the qemu-devel@nongnu.org list (you
> only sent it to the trivial list).
> I'm also Cc'ing the maintainers:

Thanks, Phil.


r~

