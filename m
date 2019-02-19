Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwAYL-0002Pr-K9
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 13:55:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwAYJ-0002OM-EN
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 13:55:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwAYI-0008Mj-QE
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 13:55:35 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gwAYI-0008ML-K4
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 13:55:34 -0500
Received: by mail-wr1-f65.google.com with SMTP id l5so22077852wrw.6
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 10:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=K1wOLINBQ1xKNOEotQ3RweNYiqU6CPGpjrMEUuJmD0w=;
	b=s0s1w8CBuZlyWB3pFC7JXeBKqvPgXDc6l7WbM5GTqr7ajORMnrcu4gWymIwi3y2W4V
	M0giO+m3OFBH/5drKiPygMi52RNKYTiosMAnOdnwYqPKejf2BAcZU8Khb5y9KkaQLRcg
	w+bWtIvCgXRjcgMFOT5Ik9aTFu+KLKKaujpWtzHYSHFxfORU08eCMw4bxe1lxPKg8KT5
	8ZbLcKscEwJE3EfDxgyAxf3v6tmwx+hvjnBP0k26PXUvD3KxtjS0ltKxjcw6HzuShBZ8
	jvZj+ic25IeTnRxkNnaX/C/D3+c8O8m8dTgXcL7/o6muXcz0N890KlkZXO8GreVf34FX
	FB5g==
X-Gm-Message-State: AHQUAubdjz50JVHNV/vQ9Nm+fiCaBtLdG2WdpuiXocLtom4zQOmX1In/
	k27A6m4AfpYPAnqOeVImWWWGFw==
X-Google-Smtp-Source: AHgI3IazZrQnStWOksoNSKcADCmcJKVrD2ri62wQ4UUMUgi1RMvgBoP8ic4b4CcPitL4eSZYS/+BHw==
X-Received: by 2002:a5d:5544:: with SMTP id g4mr21352431wrw.269.1550602533162; 
	Tue, 19 Feb 2019 10:55:33 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	y1sm17650605wrh.65.2019.02.19.10.55.31
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 10:55:32 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
	<ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
	<77cf32b1-6a4a-33c5-4b3c-8ba3245a4b23@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2e584c55-5b40-4a29-b0ae-e53039e38a7d@redhat.com>
Date: Tue, 19 Feb 2019 19:55:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <77cf32b1-6a4a-33c5-4b3c-8ba3245a4b23@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 18:55:36 -0000

On 2/19/19 6:56 PM, Eric Blake wrote:
> On 2/19/19 11:38 AM, Philippe Mathieu-Daudé wrote:
> 
>>> +    if (a == 1) {
>>> +        /* Reads like: "If a equals 1" */
>>
>> I guess you found a bug in the documentation :)
>>
>> Since 8c06fbdf36bf4d the style asked is:
>>
>>     We now require Linux-kernel-style multiline comments:
>>         /*
>>          * line one
>>          * line two
>>          */
>>
>>> +        do_something();
> 
> We only require winged multiline comments when the comment is actually
> multiline.  In this case, the comment is a one-liner, and is just fine
> as written.

Hmm I have a series where I moved code and changed from /* one line */
to the multi-line style, I wonder why and remember checkpatch errors.
Maybe a side-effect from what b94e809d3e fixed.

Anyway, Wei do you mind adding a multi-line example here too?

With/without multi-line example:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks!

Phil.

