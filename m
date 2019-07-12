Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlyuH-0006O8-KL
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jul 2019 13:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57807)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlyuF-0006MZ-E3
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 13:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlyuE-0007T9-Ft
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 13:00:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlyuE-0007SP-A4
 for qemu-trivial@nongnu.org; Fri, 12 Jul 2019 13:00:22 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so9567548wms.2
 for <qemu-trivial@nongnu.org>; Fri, 12 Jul 2019 10:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUBsIKX1x/E5OBfsa3QHVjy4My2fSIWjSQcItrVCVs8=;
 b=Yg7t/tyQLvzb0XaVDoWm3MyYuUExFnq3/dLWssLqG1UIwvxwkb8obWuTl08hiUq8us
 gBn8DbvlbKI3ENEeOOT6a3BW3xE3oEjihQu8tH425JaTIxvlPFeU29LtADy1i2IkwZqw
 iI7qoxNQI8RSwrqa0gMhNYKmRp9s0Idd9MCpwpC4EbJPOM48maCQE9VKzogvzYyNIA5z
 y5cd2pKz8OFjvKcdvmestdOGEnFJFiklX8LeuUgwMHBXJyS6bTkkNRpIEJnl2JlB6Xc8
 2sJSRC7gyW/0YrTXyW88DF0hQMr9gSh3rMBbVkM156gVQv+I6lEtY8xmssVHkMHslfze
 e36g==
X-Gm-Message-State: APjAAAX6iV/+2+945jIL7U2/b/6KqEUjYm0R1RJTWTdhL0x5F7UgwP5r
 DNgCl6yTgX2c3e9RWI3Jmk8gTQ==
X-Google-Smtp-Source: APXvYqwqr2RY4ZxW6ns4W4KPel6al8YxZGI9kOkv4jDCFpdWjctC9yiL5qTE9pkz24sz3yu1pDqfDw==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr10621651wmg.48.1562950820989; 
 Fri, 12 Jul 2019 10:00:20 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id t140sm9907753wmt.0.2019.07.12.10.00.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 10:00:20 -0700 (PDT)
To: Michal Privoznik <mprivozn@redhat.com>, qemu-trivial@nongnu.org
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
References: <db150a03315a89a849ab9968e4a5a26110d41424.1562942402.git.mprivozn@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <65135f2f-8e84-321f-14d5-3ae8af753e2d@redhat.com>
Date: Fri, 12 Jul 2019 19:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <db150a03315a89a849ab9968e4a5a26110d41424.1562942402.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] .gitignore: ignore some
 vhost-user* related files
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 17:00:24 -0000

On 7/12/19 4:41 PM, Michal Privoznik wrote:
> Commit d52c454aadc creates
> '/contrib/vhost-user-gpu/50-qemu-gpu.json' and '/vhost-user-gpu'
> and commit 06914c97d3a creates '/vhost-user-input' neither of
> which is ignored by git.
> 
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  .gitignore | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index fd6e6c38c7..e9bbc006d3 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -65,6 +65,8 @@
>  /scsi/qemu-pr-helper
>  /vhost-user-scsi
>  /vhost-user-blk
> +/vhost-user-gpu
> +/vhost-user-input
>  /fsdev/virtfs-proxy-helper
>  *.tmp
>  *.[1-9]
> @@ -131,6 +133,7 @@
>  /docs/interop/qemu-qmp-ref.info*
>  /docs/interop/qemu-qmp-ref.txt
>  /docs/version.texi
> +/contrib/vhost-user-gpu/50-qemu-gpu.json
>  *.tps
>  .stgit-*
>  .git-submodule-status
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

