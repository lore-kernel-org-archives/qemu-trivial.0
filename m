Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoNLA-0000ZO-Ql
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 03:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34319)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoNL8-0000Si-4P
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 03:30:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoNL7-0002jf-7Y
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 03:30:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hoNL7-0002jB-1g
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 03:30:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so31155564wrf.11
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2019 00:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h6SaMbLUxsNfiBr7ugrdEUpYvlqkvzcv1pXbGi5RT1M=;
 b=uIPvRtxKlAsDjdmtkfJeXv4E1NY90gJuE+yccJMKjo4awKZn5cA+880g/aUc3yvQqf
 fkviIGG/Ca6cPfrSwKz7BMnqRmN+t006tqfNla7rwIpmTEcGJcxTpE2SunBH9XcXsxH6
 x9XAE4EariFBexxdG9jjGfDW1QuLkCM+xkX17iuFawY28noCSz9Bgwqc2RVOjGmMtOCt
 ykXvEtWkKhDcjcjKIaJpHo1F20PYIHj+5l/z3m7wLh4sJQOneHJAhZHMHSvlMzrQHSgD
 ZPyG7jFGbM2VlYqU4z1vdoPO06xqFuY2vr63ySAFYdXZAOdAlTZj2Wo/1p5IUJMRTUvu
 HPmQ==
X-Gm-Message-State: APjAAAWm4PocPTtkeCzgqE6u4qcqVBU+twfaYtunsoD+j66vGgURYUCe
 y0EGJvnHIO1sMfQDGmnf85I6zw==
X-Google-Smtp-Source: APXvYqyDuAPd/yqV+G7Ng5nCxr2od2WHT74hWcn2Zamu93Si8xG6J5REr8aRzCW+x2cGKLzRE/uvHw==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr53836462wru.195.1563521400051; 
 Fri, 19 Jul 2019 00:30:00 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id v15sm29519376wrt.25.2019.07.19.00.29.58
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 00:29:59 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190718193441.12490-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6241fd95-789f-f560-2170-0544cded1720@redhat.com>
Date: Fri, 19 Jul 2019 09:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190718193441.12490-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] audio: Add missing fall
 through comments
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
X-List-Received-Date: Fri, 19 Jul 2019 07:30:03 -0000

On 7/18/19 9:34 PM, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  audio/audio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 5fd9a58a80..a7a13e900a 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -304,6 +304,7 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as)
>  
>      case AUDIO_FORMAT_S16:
>          sign = 1;
> +        /* fall through */
>      case AUDIO_FORMAT_U16:
>          bits = 16;
>          shift = 1;
> @@ -311,6 +312,7 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as)
>  
>      case AUDIO_FORMAT_S32:
>          sign = 1;
> +        /* fall through */
>      case AUDIO_FORMAT_U32:
>          bits = 32;
>          shift = 2;
> 

