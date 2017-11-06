Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBmj4-0004Nh-Ae
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 14:06:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmj1-0004MC-W8
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 14:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmiy-0002L9-1s
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 14:06:23 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:54832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eBmix-0002Kt-U9; Mon, 06 Nov 2017 14:06:19 -0500
Received: by mail-qk0-x242.google.com with SMTP id n5so12262845qke.11;
	Mon, 06 Nov 2017 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zDYMkiOa0AmEJS/iNxr/I7LVc/oezcxrGShEsv0HhBY=;
	b=qCFdiyOcReprokX6KxVNiYSotjDQsbW9GUBhxm7/fPCkBjhkFEWMJD3Mc4hlBo4sub
	ieuf/B/pKbOu2O52CtNmWv0kVG5P03zlHy93AXcsAKfRV6CEp4t47gh/Sf9+s8H0ZVqI
	2hzhTLj5DMOvXRbBBFHUg2imoHfvwDtN0w7BeJcoALKpcF1S3oXOiZysKw5mry+kIfRZ
	bWM+nmm6AqQSboY9ejQmzIz8788sH17kmLXQai75yreDDLT6cljLHoIBldcKTOia1w+D
	bKr6JVCvWEYEoMSe6Kc7mWYM6AR13JM2IZ0fIyemd4CoI/zKpIdGp0N13I+kPoYfkdJ9
	544A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zDYMkiOa0AmEJS/iNxr/I7LVc/oezcxrGShEsv0HhBY=;
	b=JaOFipskDYZsy1XLv3MaKMJ0qhkpggDMu3opuxTtic1/FdKU0IOMQmAlLweAp35koO
	uZpjspyvjtNQQWezU2IkldWWwyIIigzlsLMfjqe5PLZFTjSKFkvYge0mvoe1uGcH3We7
	UP+6Bum1KlH5F5UG04h1wd4FVVVm4hjHWXvO8KJSPXT5au69rzY7UMP1u5sDeXAkdmkd
	W9PMiG1cLbanqegLmzTHqxX0fIrbwA8fXCWh6s9PFy6coJ3wNZQGZFzV6wQf+gagSCpj
	Z/pML0Urkg2INR9vlngINLUz4XesB7fBdd6ch2pR1787InM7XWX9dN4FPd3FCEamx48K
	fMhQ==
X-Gm-Message-State: AJaThX6KVhzsiTEe3KYFMXEux+My+C1V0TpmyI/d2AjUP9ljeAPZQ3kv
	ZjBiMekUpJniTeg7JuWPlo429w5z
X-Google-Smtp-Source: ABhQp+RcvGGYrremI+O5qJk6rEWjvXxkTTVd82lDTug3bPbU9WixVtOWt/O3/UL6McrSIrJz8fzd7w==
X-Received: by 10.55.27.70 with SMTP id b67mr10191283qkb.356.1509995179224;
	Mon, 06 Nov 2017 11:06:19 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id s27sm9251393qtj.3.2017.11.06.11.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 11:06:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	Kamil Rytarowski <kamil@netbsd.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-64-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d09209e7-5221-5b1e-dc17-1db05b84c614@amsat.org>
Date: Mon, 6 Nov 2017 16:06:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-64-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [PATCH 63/88] bsd-user/syscall: fix a memory
 leak on EFAULT, use g_new()
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
X-List-Received-Date: Mon, 06 Nov 2017 19:06:25 -0000

Hi Michael,

Since there is no bsd-user maintainers, can you take this single patch
for 2.11? It fixes a memory leak.

Regards,

Phil.

On 10/06/2017 08:49 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Kamil are you interested in maintaining bsd-user? :)
>  
>  bsd-user/syscall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 66492aaf5d..9120cea61e 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -227,7 +227,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
>      void *hnamep, *holdp, *hnewp = NULL;
>      size_t holdlen;
>      abi_ulong oldlen = 0;
> -    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
> +    int32_t *snamep, *p, *q, i;
>      uint32_t kind = 0;
>  
>      if (oldlenp)
> @@ -239,6 +239,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
>      if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0)))
>          return -TARGET_EFAULT;
>      holdlen = oldlen;
> +    snamep = g_new(int32_t, namelen);
>      for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
>         *q++ = tswap32(*p);
>      oidfmt(snamep, namelen, NULL, &kind);
> 

