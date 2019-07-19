Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoRKl-0007Lx-QG
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2019 07:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hoRKj-0007K6-Cu
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 07:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hoRKi-00016x-CZ
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 07:45:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36336)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hoRKi-00016S-5f
 for qemu-trivial@nongnu.org; Fri, 19 Jul 2019 07:45:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so24635309wme.1
 for <qemu-trivial@nongnu.org>; Fri, 19 Jul 2019 04:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ic/Zh/DiGrt51Nn2Kyvkv205FonItVi+cVwsMddKFrE=;
 b=dratzOS2gulkoEXjDb1jIa+lOgp1dd64vNceJb3PMJg1TkZ3edQmHUXQSBIpeUflbi
 LbUJwsiFJuoQDDzItFGVcaAUuLzK7P0BPt2n0ZF4ZQ5mNYYRi9kL4p63pjuI8DsIEGnO
 ksD+DpqN11IUPThd700NovLRYKi9AODH6sSAWC0uPT+eTg8txxVUItK0XwauOGf706F7
 wF3i8c3HlbzLnX4PV2lXI7J7NpFsdUDvLaf8mzNW6z14LuXBiYlmYljgcaWlgWxLxoAt
 PHhvh/EJ8+Hqfzymv1xw7BvQrXwuMlq7xy+IF/npmBpLMWP1kh8OxaTuIwISlQwjGJkk
 dYyw==
X-Gm-Message-State: APjAAAVXr1uMJtVS4Fe38xhh7j9CeTE246u4nyFIDkdoKE5b709alF91
 wmgPRhoqUaJAqh1VH1BWxH0WvQ==
X-Google-Smtp-Source: APXvYqwsLveD9UIUX/Ov9HgKXcrJUGRX5n+falgajfqCNtDq5M+gO3IWOpu2Jk5Pv85yvT6qcVevtQ==
X-Received: by 2002:a05:600c:214e:: with SMTP id
 v14mr49363175wml.96.1563536751122; 
 Fri, 19 Jul 2019 04:45:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:8501:6b03:f18c:74f8?
 ([2001:b07:6468:f312:8501:6b03:f18c:74f8])
 by smtp.gmail.com with ESMTPSA id v5sm32485452wre.50.2019.07.19.04.45.50
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 04:45:50 -0700 (PDT)
To: Jiri Slaby <jslaby@suse.cz>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Brijesh Singh
 <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
References: <20190719104118.17735-1-jslaby@suse.cz>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c5487d32-f3b8-8534-fe19-3c7aef7188eb@redhat.com>
Date: Fri, 19 Jul 2019 13:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719104118.17735-1-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [PATCH] target/i386: sev: fix failed message
 typos
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
X-List-Received-Date: Fri, 19 Jul 2019 11:45:54 -0000

On 19/07/19 12:41, Jiri Slaby wrote:
> In these multiline messages, there were typos. Fix them -- add a missing
> space and remove a superfluous apostrophe.
> 
> Inspired by Tom's patch.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-trivial@nongnu.org
> Cc: Brijesh Singh <brijesh.singh@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  target/i386/sev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 5ba1384ea1f6..f1423cb0c0d1 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -763,7 +763,7 @@ sev_guest_init(const char *id)
>                                          "reduced-phys-bits", NULL);
>      if (s->reduced_phys_bits < 1) {
>          error_report("%s: reduced_phys_bits check failed, it should be >=1,"
> -                     "' requested '%d'", __func__, s->reduced_phys_bits);
> +                     " requested '%d'", __func__, s->reduced_phys_bits);
>          goto err;
>      }
>  
> @@ -783,7 +783,7 @@ sev_guest_init(const char *id)
>      ret = sev_platform_ioctl(s->sev_fd, SEV_PLATFORM_STATUS, &status,
>                               &fw_error);
>      if (ret) {
> -        error_report("%s: failed to get platform status ret=%d"
> +        error_report("%s: failed to get platform status ret=%d "
>                       "fw_error='%d: %s'", __func__, ret, fw_error,
>                       fw_error_to_str(fw_error));
>          goto err;
> 

Queued, thanks.

Paolo

