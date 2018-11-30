Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gShUZ-0007vU-Pd
	for mharc-qemu-trivial@gnu.org; Fri, 30 Nov 2018 07:01:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gShUX-0007vB-4Z
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 07:01:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gShUQ-00032o-8i
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 07:01:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gShUP-00031b-6x
	for qemu-trivial@nongnu.org; Fri, 30 Nov 2018 07:01:45 -0500
Received: by mail-wm1-f66.google.com with SMTP id y139so5495179wmc.5
	for <qemu-trivial@nongnu.org>; Fri, 30 Nov 2018 04:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Puf9qRycfjx6jeiZ/pHnzIKNs293RARpZyZmUKVvKIQ=;
	b=T1ENKLAdPeX+mPOzEbHf31vTrWripxrT7J+Cnd4iUrj6iXuzuuzccjp5wJZMUJc29f
	VrgSJYwEUzpALLW2s/aPCCmgycM+RNqu+u3IZJx/hVJqfXzvJwi2UDA1J8yNdO4sRz15
	Pekh0uI2iwr0iJRB9D9j2UilBanCfRAi4qee29M9dG7Jh2EbRKm7mseDm1hdIsITJpRh
	PB20yuRDJrd8tp2vKOomzkWdDUlAUitgnpL+78EfTG31uxDUDmH4RjXbDwtvWa5Sbl8o
	p0I3j3rWd8LfpvRXiLHcxrseCaXe4xsJhHP1ckkOF/vyg3KyIvMza/FjesqGMb3NPmQE
	ZrAA==
X-Gm-Message-State: AA+aEWZAszmD7Jkn3L5z6/DrjwtSnstCttmUOAPObpaZhStJeoyOgNkn
	CxTG0/DDvm1c8+C0xUKr073rEVebUZI=
X-Google-Smtp-Source: AFSGD/VW8sJIrbCN140GDAOTi8B0XB+9z5/NEQDs+Sj+DrVy5Xbh1vwD0kASMFEYpYJoraUMxDo69Q==
X-Received: by 2002:a7b:c044:: with SMTP id u4mr5200392wmc.50.1543579302641;
	Fri, 30 Nov 2018 04:01:42 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
	([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
	by smtp.gmail.com with ESMTPSA id
	c77sm6397705wmh.12.2018.11.30.04.01.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 04:01:41 -0800 (PST)
To: Li Qiang <liq3ea@gmail.com>, laurent@vivier.eu
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <16fc13de-778b-430e-d734-bbc802d25ba8@redhat.com>
Date: Fri, 30 Nov 2018 13:01:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543571638-2892-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [PATCH] util: vfio-helpers: use ARRAY_SIZE in
 qemu_vfio_init_pci()
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
X-List-Received-Date: Fri, 30 Nov 2018 12:01:54 -0000

On 30/11/18 10:53, Li Qiang wrote:
> Cc: qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  util/vfio-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index cccc9cd42e..342d4a2285 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -348,7 +348,7 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
>          goto fail;
>      }
>  
> -    for (i = 0; i < 6; i++) {
> +    for (i = 0; i < ARRAY_SIZE(s->bar_region_info); i++) {
>          ret = qemu_vfio_pci_init_bar(s, i, errp);
>          if (ret) {
>              goto fail;
> 

