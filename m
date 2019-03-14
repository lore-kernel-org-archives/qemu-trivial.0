Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4XoR-0003Jc-4I
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 17:22:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h4XoO-0003J5-Pa
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 17:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h4XoM-00070X-Ro
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 17:22:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h4XoL-0006zK-7p
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 17:22:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id n19so4553002wmi.1
	for <qemu-trivial@nongnu.org>; Thu, 14 Mar 2019 14:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=amjbID1fKon3aQLM6i6cr7/txC+8WfBeKhZHP2B/eRM=;
	b=uOveHeRvGeESKb2pLNERzzXi/VLOsaSywpJKGfM2IJO9sUDVpeEePyMowE5Oaq1ar/
	sEUryFc5DpPFFPFghCJVokXZ1YZhkhVS/8KERMYmp7McOA9UIx+G8ZbZX3TakEtRP80J
	le1DAtRis/wMSlt/rahBSdPoiqsabCRD3lwDzciZ/+OdrWtsQlOgfv2WwqJdBoHqNPoO
	oI1F4hQwR/KwN5unRLDXyzx+sp/HZlzGoKIL++cXjeYi6EA3GOCh++ddQdjWlJnh7cu5
	jYKO1uz3OViykl0MxU3HUGffr4TAulVZmoaXKqN+b5KEnw9SjTujmExwxzGLFYqjC85G
	aVmQ==
X-Gm-Message-State: APjAAAX26SCNaDXwlN9n4L6ON/9NsjSNHfjZEXB/n5EA5Y6+Im4E6aqZ
	TaoYi5p058MISIn2F1yRlEZacpnCWVUV1A==
X-Google-Smtp-Source: APXvYqzDlsnpLVvlrCAkzSIXOHunrMl8tUNCk8rMaR4r20JkGhQsz1nFjnk9BJ8WX30/RljiO2kxSg==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr324042wmj.62.1552598563465;
	Thu, 14 Mar 2019 14:22:43 -0700 (PDT)
Received: from [192.168.1.44] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43])
	by smtp.gmail.com with ESMTPSA id z12sm12518wrt.10.2019.03.14.14.22.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 14:22:42 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190313144557.8845-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cbae5b50-300e-fb53-f133-dd61480545f0@redhat.com>
Date: Thu, 14 Mar 2019 22:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190313144557.8845-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-4.0] maint: Ignore built
 elf2dmp
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
X-List-Received-Date: Thu, 14 Mar 2019 21:22:49 -0000

On 3/13/19 3:45 PM, Eric Blake wrote:
> Commit 3fa2d384 added a binary 'elf2dmp' but did not ignore it
> during an in-tree build.

I'd use ".gitignore" or "elf2dmp" prefix in subject rather than "maint".

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> 
> Yes, I know we want to get rid of in-tree builds for 4.1; but
> for 4.0, this patch may still make sense.
> 
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 77522561b8e..42d2d473559 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -6,6 +6,7 @@
>  /config-target.*
>  /config.status
>  /config-temp
> +/elf2dmp
>  /trace-events-all
>  /trace/generated-events.h
>  /trace/generated-events.c
> 

