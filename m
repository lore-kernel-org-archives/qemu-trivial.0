Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS237-0000cv-Gz
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2018 10:46:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS232-0000bj-9e
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 10:46:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS22x-0004Xz-Es
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 10:46:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gS22x-0004XM-8b
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 10:46:39 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so26794565wrt.7
	for <qemu-trivial@nongnu.org>; Wed, 28 Nov 2018 07:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zC2q1kPUrb2Ok/s7H31/zORxzBM6VI56D7aLHFdNyfQ=;
	b=ei6J38Hv1GYu6kDJ2TFI8LsgZHl1tpAMjBOO+/aIAX2MBpVmkZ3ZdeNCuu8Za1cAKf
	nH2s5NPOtk44tjvaODIdZHT3zxvgIv2WofnZ609Q14iKykJu8zX/8yq7iTkxuycpxs1G
	exNB7H6b9jxGh4nO9Ixv10Es4ZNRoOtONujHegzVWoQanZOLgyFZdlbm1fOaO/UXdgUj
	Nzc7Lihc5xveZ9c/rNGDG2+o7uqkEOAqqLChPXpTElPjoFGKFIUvdO7uB44bDXifeJSq
	nR0sdtZIWSgEQ5AM1+PH94hSE3LKUkmmshcU/u6HFTjmJkBpdTwn+6aBipgfVN4sJX5b
	rB0Q==
X-Gm-Message-State: AA+aEWbZJcyxYsHA68IYYkChRCgC+4lfDlESEYuBkR2wGdtNNBtrWoEw
	S6IzVJJiq/38WAMXZExRMT4dRsjmwIn8Fg==
X-Google-Smtp-Source: AFSGD/WrIQO3vqM/xwAredoG9+Ot304eX3D1hpQZVmM+KGjOT5mWiFIqvIVBjwAN5tlw45tRCTT7xQ==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr17840006wrj.91.1543419998224; 
	Wed, 28 Nov 2018 07:46:38 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
	([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
	by smtp.gmail.com with ESMTPSA id 5sm2905622wmr.37.2018.11.28.07.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 07:46:37 -0800 (PST)
To: "Emilio G. Cota" <cota@braap.org>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20181128153423.11916-1-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d8019aa1-dfef-f437-5d4e-a1d7eeeed0bd@redhat.com>
Date: Wed, 28 Nov 2018 16:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181128153423.11916-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial]
 docs/devel/build-system: fix 'softmu' typo
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
X-List-Received-Date: Wed, 28 Nov 2018 15:46:48 -0000

On 28/11/18 16:34, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  docs/devel/build-system.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/build-system.txt b/docs/devel/build-system.txt
> index 52501f2ad9..f9fd27fab0 100644
> --- a/docs/devel/build-system.txt
> +++ b/docs/devel/build-system.txt
> @@ -393,7 +393,7 @@ all use $(obj) as a prefix to the target, e.g.
>  This file provides the entry point used to build each individual system
>  or userspace emulator target. Each enabled target has its own
>  subdirectory. For example if configure is run with the argument
> -'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmu'
> +'--target-list=x86_64-softmmu', then a sub-directory 'x86_64-softmmu'
>  will be created, containing a 'Makefile' which symlinks back to
>  Makefile.target
>  
> 

