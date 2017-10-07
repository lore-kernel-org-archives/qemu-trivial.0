Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0g05-0006gq-QY
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 23:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0g03-0006gb-6E
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 23:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0g00-0004mE-3Q
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 23:42:03 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0fzz-0004m1-UZ; Fri, 06 Oct 2017 23:42:00 -0400
Received: by mail-qk0-x241.google.com with SMTP id 17so6107893qkq.5;
	Fri, 06 Oct 2017 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g/YJINVOSyBn3HLT7CnaaKx/Pd/4FWz0wYPB6GaAwBk=;
	b=oQnQGglw0eQyKdMPM/M7OBTOxncbs3ILI7UMy8sAow+dKf0K5AOTVvtq3uoMBPTFmX
	tOzgQIvob2tR+Ts8BulNAUkp2mu5tLJJqcSeuOzVXhBb/9CF9oz7GLUu+PvsGMGu/NfI
	LVmQ+FsX7aWBjU+8AwrPmTfDPbNet7ICQtwJsveqUCT+RdCuRa8843o80C9h9rK3XrHM
	jysZZIxx8sDqj6RHo2nPnJrrV872Cg+z8qW/q41nEwR0Yg2Pr1u7VX0VssaN3KJ4OPcV
	gVOZS8Y6oBrDROHjF+rI1A93FoY/omuoOuzHkMzkqDkvqYc979aH1dmsqH4sQTsWrQcg
	CS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=g/YJINVOSyBn3HLT7CnaaKx/Pd/4FWz0wYPB6GaAwBk=;
	b=odoj2oa0hXHTLSyGErQeecMomUTQSs6kubeIf+iSuoaujgCsMvKbVIybka5SiN/0CU
	JbztrvbmzPtD714vl/CvQot1P5Xb5nGNtJWIvHcw5fhW8dJGsdKsq/vztsu84BXKemzy
	jpa/6Czm3q7G73oas0fQxPAxPWFYNjouH+ODmYWiUUL1iA/YuDDi0GSKftOSyLXOiKLU
	uwRF9sJpPvBUYsPmDbWkVfSHiNPPGOy2Fqwrr8oMqa4SHrWfgbbhP5z/XzK4m0diaPcc
	RD/fXGSB51/rCmegsdI5gP5KCJQ5Lwj6FawbRIR8WIvwnvdQG+SBFKpQ8wLUFkmIOGVH
	HT3Q==
X-Gm-Message-State: AMCzsaXU2s+FJLpVSaie1cfu2X94sDDsBL1IM4Ozw2J5Gsnv4OvkjmzM
	girKUTJuQ+D0o2zCuBHZI94LyIy+AjY=
X-Google-Smtp-Source: AOwi7QAWqAyHqamVedNgdb4/6gYGvcdCR3OrVZlY/joNf1xwgrzefKXv6FE8VWk3QqYt5Hub4MkmLA==
X-Received: by 10.55.134.68 with SMTP id i65mr1234851qkd.192.1507347718988;
	Fri, 06 Oct 2017 20:41:58 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w68sm1851389qkc.62.2017.10.06.20.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 20:41:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <edb74504-2b3f-9b31-1801-a01e35d0e838@amsat.org>
Date: Sat, 7 Oct 2017 00:41:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH 04/88] cocci: avoid use of g_new0()
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
X-List-Received-Date: Sat, 07 Oct 2017 03:42:04 -0000

On 10/06/2017 08:48 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  scripts/coccinelle/g_new.cocci | 46 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
> index 368f0c5651..9643ce3f23 100644
> --- a/scripts/coccinelle/g_new.cocci
> +++ b/scripts/coccinelle/g_new.cocci
> @@ -127,6 +127,52 @@ T **m;
>  - *m = g_malloc0(sizeof(**m));
>  + *m = g_new0(T *, 1);
>  
> +////////////////////////////////////////
> +//
> +// no point in zeroing the allocation
> +//
> +
> +// the loop right afterwards fully initializes the memory
> +@@
> +type T;
> +identifier a, i;
> +expression c, e;
> +@@
> +(
> +-a = g_new0(T, c);
> +    ... when != a, c
> ++a = g_new(T, c);
> +    for (i = 0; i < c; i++) {
> +        a[i] = e;
> +    }
> +|
> +-a = g_try_new0(T, c);
> +    ... when != a, c
> ++a = g_try_new(T, c);
> +    for (i = 0; i < c; i++) {
> +        a[i] = e;
> +    }
> +)
> +
> +// compound literals
> +@@
> +type T;
> +identifier p;
> +expression s, e;
> +@@
> +(
> +- p = g_malloc0(s);
> ++ p = g_malloc(s);
> +|
> +- p = g_try_malloc0(s);
> ++ p = g_try_malloc(s);
> +|
> +- p = g_new0(T, 1);
> ++ p = g_new(T, 1);
> +)
> +  ... when != p
> +  *p = e;

It seems I misunderstood compound literals, I somehow believed this
would imply uninitialized fields would be zeroed.
So this transformation leads to incorrect code.

> +
>  ////////////////////////////////////////
>  //
>  // last transformations: cleanups
> 

