Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etaMa-0007yb-7N
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 09:48:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaMY-0007wY-2x
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaMT-0007kk-50
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:48:14 -0500
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1etaMS-0007kB-UK
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:48:09 -0500
Received: by mail-wr0-f196.google.com with SMTP id k9so2426679wre.9
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2018 06:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JLZn9m2hKmdhRckTcW50zgN2jA8gLe4G9VzkClTrkkg=;
	b=NKAGJ3t1Qf1b+XFRWeH19ooauP9AOFzE2vf2sQppWv50XagZIvHJPVAIkFzfyTO/kC
	suZ9bFpm6ZwR7LsJNuSx2Pp4+VFa986mgfZppCplmclXdJpmVMssjibLQAqdKIPo0tBX
	YyWF4hI8L9up1b9WV62h2vWoWA03RJTlY8b/5UdYNA/K0rWWr1AtMfQ4AYZIa4i+1lzM
	JlRN3hWNM9pp+E8bsnroo6eUNxOQgWjwD5mCwVtWf2V5C1QVcTjr6xRl31XjB61WFWml
	Lb6xc1yrjY0zV/z0FGbOAHX5IDIv+HZsX1owPaWVzHB93BioTLu2FDAG9CEhwu0G0E59
	dfqQ==
X-Gm-Message-State: APf1xPDs2ZH5x7r7EVWwGoWtB9ewUjlQK5qRec+cAKg9kyerlM8ICy8g
	GtkYKmhu1+4bj52fgaMcVK11KA==
X-Google-Smtp-Source: AG47ELuTpl+yShF1YjKD7nXlr2sOJ/xJPG4tyBk208FAgjEwsAzeb8sc7ktbmnEEOeqi+YyDky3wiA==
X-Received: by 10.223.184.26 with SMTP id h26mr20836666wrf.65.1520434087752;
	Wed, 07 Mar 2018 06:48:07 -0800 (PST)
Received: from [192.168.10.165] (94-36-191-219.adsl-ull.clienti.tiscali.it.
	[94.36.191.219]) by smtp.gmail.com with ESMTPSA id
	55sm25196300wrw.87.2018.03.07.06.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 06:48:07 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20180222215838.18223-1-eblake@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <441a9060-6216-088b-82b6-71f0ad88ceb9@redhat.com>
Date: Wed, 7 Mar 2018 15:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180222215838.18223-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.196
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] checkpatch: Exempt long URLs
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
X-List-Received-Date: Wed, 07 Mar 2018 14:48:15 -0000

On 22/02/2018 22:58, Eric Blake wrote:
> Sometimes, we want to refer to really long URLs, but checkpatch
> balks, and we have to manually bypass the check.  URL shorterners
> may be nice at reducing long links, but it's hard to guarantee the
> shortened link will live as long as the real target, and it is
> also nice to see the original target without having to load the
> shortened URL through a browser.  So exempt a line containing
> only a URL from the long-line syntax check.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  scripts/checkpatch.pl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 1b4b812e28f..0d3f753c665 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1447,9 +1447,10 @@ sub process {
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /$SrcFile/);
> 
> -#90 column limit
> +#90 column limit; exempt URLs, if no other words on line
>  		if ($line =~ /^\+/ &&
>  		    !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
> +		    !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
>  		    $length > 80)
>  		{
>  			if ($length > 90) {
> 

Queued, thanks.

Paolo

