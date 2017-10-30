Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e90rf-0002Ot-Ed
	for mharc-qemu-trivial@gnu.org; Sun, 29 Oct 2017 23:35:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90rd-0002OT-35
	for qemu-trivial@nongnu.org; Sun, 29 Oct 2017 23:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90rZ-0002UU-PN
	for qemu-trivial@nongnu.org; Sun, 29 Oct 2017 23:35:49 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:52069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e90rZ-0002Tt-KM
	for qemu-trivial@nongnu.org; Sun, 29 Oct 2017 23:35:45 -0400
Received: by mail-qk0-x243.google.com with SMTP id 17so14527282qkq.8
	for <qemu-trivial@nongnu.org>; Sun, 29 Oct 2017 20:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Bf+QwFv5W9hlu52QPwNQchD9EdZyF3awjdlmYaLdPrI=;
	b=Hdm7CPBFGky4hCdy7hDfuD1qlEqhwpNGWPXrcpbfn9DxTefrF5zJcM7AF/3C3rp0vH
	/jmtzuGXJ7NVimQhccQOkdCFrRk3CIufFNaKU+zsw6br+ZNRT9ChOFPV2m1vBgaXIu6j
	yTdZVr0DpcxYAKEJkYn4m5PqyodPD0+b7pSaZkQpKA36qB1SnMTwE+8JuO+pQB1Q45TR
	5tElCyk0cHl8D8D/ABueP99JsdUV8GEaOTpD8HGpXH211ABpRH/68oQ6mP3uY1iglNV6
	+HdoE50leWrSuV9Ql8FVVVIV2r+w97LJ+SjeCkDg20uVwbXDK87XXhy6WdAhuywvxtyo
	gVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Bf+QwFv5W9hlu52QPwNQchD9EdZyF3awjdlmYaLdPrI=;
	b=VOFARU7e9GMdUiZGY4Z8iTotythCcqZmJ5eh2w/RLPd3ovwJjf+ngfMiY2RW6j/T0t
	J2MOLXsk9AketVWFagOSFsjaPL5ez6HDye2AsPwwsAZiWFkkfwRJgGHus1zzNE1LGwi8
	L0CJRJ5pfjZ88hIY8BccutcQXUg2x23iof0VGnsMs9WlcnMaSGZmdrYxIA4oq+wFcZwT
	rGUzlxqdxAvPi3UsLITKrXpJ5CYr4dhFT84wJ8J2AIdrLqyDKeR3SQ7cDo2X7Q+/eaPt
	hMy1HnT0QLyXtX+f2m+uq37NCjou641vxcJEA/CPuEoelxSF6Hm9fNyl2SIZRDPNjmZ3
	hTQg==
X-Gm-Message-State: AMCzsaW1qgeCuiXsaOO9y80+1rJnq9mQxvcodmBP12uu/qeC7z99RMvP
	ew7o6Dre7obU5HQNpAbqfX68K9pT
X-Google-Smtp-Source: ABhQp+QnDmZIMG/9Ww7ESIqIOoJ6sZQXKdYrPz9ScjdA3OelEoFmEJnCGoWFT/4BQ0JmLMh4VECbXA==
X-Received: by 10.55.156.210 with SMTP id f201mr10435699qke.283.1509334544633; 
	Sun, 29 Oct 2017 20:35:44 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id p6sm8808095qke.64.2017.10.29.20.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Oct 2017 20:35:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: ZhiPeng Lu <lu.zhipeng@zte.com.cn>, dgilbert@redhat.com
Cc: qemu-trivial@nongnu.org
References: <1508411793-22868-1-git-send-email-lu.zhipeng@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8281db1d-0b0a-c794-4ea3-55e1e230fac5@amsat.org>
Date: Mon, 30 Oct 2017 00:35:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508411793-22868-1-git-send-email-lu.zhipeng@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [PATCH] hmp: Replace error_report_err
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
X-List-Received-Date: Mon, 30 Oct 2017 03:35:50 -0000

On 10/19/2017 08:16 AM, ZhiPeng Lu wrote:
> Use hmp_handle_error instend of error_report_err to set error.
> 
> Signed-off-by: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
> Reviewed-by: Jiyun Fan <fan.jiyun@zte.com.cn>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hmp.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/hmp.c b/hmp.c
> index ec61329..a03bd03 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -667,7 +667,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
>  
>      info2l = qmp_query_vnc_servers(&err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>      if (!info2l) {
> @@ -782,7 +782,7 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
>  
>      info = qmp_query_balloon(&err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> @@ -1125,7 +1125,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
>  
>      data = qmp_ringbuf_read(chardev, size, false, 0, &err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> @@ -1192,9 +1192,7 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      qmp_balloon(value, &err);
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_block_resize(Monitor *mon, const QDict *qdict)
> @@ -1518,10 +1516,7 @@ void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      qmp_migrate_set_cache_size(value, &err);
> -    if (err) {
> -        error_report_err(err);
> -        return;
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  /* Kept for backwards compatibility */
> @@ -1552,10 +1547,7 @@ void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
>  
>  end:
>      qapi_free_MigrationCapabilityStatusList(caps);
> -
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
> @@ -1653,9 +1645,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>   cleanup:
>      qapi_free_MigrateSetParameters(p);
>      visit_free(v);
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
> @@ -1909,7 +1899,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>  
>      qmp_migrate(uri, !!blk, blk, !!inc, inc, false, false, &err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> 

