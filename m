Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0vL1-0005an-4K
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2018 16:36:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0vKy-0005Y2-CG
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 16:36:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0vKt-0004bp-9f
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2018 16:36:56 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0vKt-0004bh-4w; Tue, 27 Mar 2018 16:36:51 -0400
Received: by mail-qk0-x242.google.com with SMTP id c188so245028qkg.2;
	Tue, 27 Mar 2018 13:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EKhk9KFFm0TykLrogVs8QnV6prMOhtKxVaYu5lAERJU=;
	b=N+Lw8gLZu8YCcm+TDtOyjopH9AY8n+VjY9+fijcqr5f5Kqbs5poqbyr6lV7pYQ14zA
	SgDRfeaZxBhYAdHGuvb7oW3MoDlCCTie4a9IK16imFGIpK4cEGdnNb7qWEPEdxJFzvGY
	eOfa6T2q3lNkRySanka7rmQ0/Q1PAR3FIsHwQ79s76xKO3JWeOT9IGW10NTJHWMQUofP
	eKxDAZ5yT69XYkgPhFfBJotEJ97ymYOHGmxhIZ6lZufGqBEXzkK5y4QSN/sYBc3r8J8B
	FcYnV4mdhu8JBmhY9fJeayf+4Mf5AOB/PLynG4U7d2//F7t5iZavskagpEz6v+LwvEI2
	gDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EKhk9KFFm0TykLrogVs8QnV6prMOhtKxVaYu5lAERJU=;
	b=iFZqSVbwtOh1DhX0CnAtzFkdtuvjDaaFCwSeHzw0ww6iB70c2CM9cBCOy0Sb9YNe13
	V6BxDfb0+SH6k4xgtVyzDyCKwBmX8zjdCo2RvlXfYMZtLpKH/PDJ/I9jVNBgRcPJgvC0
	KqL0HDZ1KuIpWp8Z7sG5Upk18ogZDcbd2roaozcqRvYdTSinGwzYT0IPU+77cjx+lypn
	sBwm6tAVDa2KUXtH1sx4Z4Z80jZyc4EitqeI2iUQRbMKHOE6Xf9EDojJxcu926wj8mLz
	9tIt4JSBNB06x/vb3/jwQ+C/M0yOetXZuEdI/4TQ7YD9wMEgG0lUG7Db0GrxpC9ZYcEh
	3zlQ==
X-Gm-Message-State: AElRT7FBRQcqydV9FpFF9KJW1yjgLCNS0vWSjiZm4vmDBex3df1yx+ZA
	/JKM0zMs9lFdRuDdEIpZpcg=
X-Google-Smtp-Source: AIpwx48onZxN0Bef1ElFopn00EDHS4mnuaE56quToUAlkXJ4ryOnLsZFm6rfTH712YE0idd9vd84+A==
X-Received: by 10.55.23.101 with SMTP id i98mr1304097qkh.91.1522183010513;
	Tue, 27 Mar 2018 13:36:50 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	m78sm1452356qke.70.2018.03.27.13.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Mar 2018 13:36:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>
References: <20180327202152.1799131-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3398457e-bd2a-8eaa-2157-a13c67b09c29@amsat.org>
Date: Tue, 27 Mar 2018 17:36:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180327202152.1799131-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] dump: Fix build
 with newer gcc
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
X-List-Received-Date: Tue, 27 Mar 2018 20:36:58 -0000

On 03/27/2018 05:21 PM, Eric Blake wrote:
> gcc 8 on rawhide is picky enough to complain:
> 
> /home/dummy/qemu/dump.c: In function 'create_header32':
> /home/dummy/qemu/dump.c:817:5: error: 'strncpy' output truncated before terminating nul copying 8 bytes from a string of the same length [-Werror=stringop-truncation]
>      strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> But we already have SIG_LEN defined as the right length without needing
> to do a strlen(), and memcpy() is better than strncpy() when we know
> we do not want a trailing NUL byte.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  dump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/dump.c b/dump.c
> index 669f715274d..b54cd42b217 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -814,7 +814,7 @@ static void create_header32(DumpState *s, Error **errp)
>      size = sizeof(DiskDumpHeader32);
>      dh = g_malloc0(size);
> 
> -    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
> +    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
>      dh->header_version = cpu_to_dump32(s, 6);
>      block_size = s->dump_info.page_size;
>      dh->block_size = cpu_to_dump32(s, block_size);
> @@ -926,7 +926,7 @@ static void create_header64(DumpState *s, Error **errp)
>      size = sizeof(DiskDumpHeader64);
>      dh = g_malloc0(size);
> 
> -    strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
> +    memcpy(dh->signature, KDUMP_SIGNATURE, SIG_LEN);
>      dh->header_version = cpu_to_dump32(s, 6);
>      block_size = s->dump_info.page_size;
>      dh->block_size = cpu_to_dump32(s, block_size);
> 

