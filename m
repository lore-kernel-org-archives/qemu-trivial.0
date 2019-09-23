Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCOwC-0008Bq-Pz
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 10:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iCOw6-00087r-QG
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iCOw4-0000xN-8t
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:03:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iCOw1-0000w6-NB
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 10:03:26 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2756C054C52
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 14:03:24 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id h6so4905964wrh.6
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 07:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bdLGECz6UTASApait+2uuLepYLMmCoyTNfj+vR5SixE=;
 b=b/JcA3Jun6Vhl5roUdNFpFNGKd/fnB4KFk1PW96mW2f/tM0wxQv50uKnR66IV2EXH9
 kv2JziIr1BZdHFlYPdVzqsC4qkfBMwxJe647PqgsHZ+qkak8IaRQfemekBThoCeQhT8t
 J1FPsZepA1LtF3VwFgqWrPWT3vsebPS9JzdhKVoK2neVcaD288nMvu4dXkq4r5YHJwE/
 Us7DaBSG6Ar7x+1nHe/7OePM491iwSplPUeXAoIjIbDTOujRSUd4b4Rx+VHbXzs+2UBD
 AcJstLPc7cqQpACncuvHB0eLZ0AHR6uaiLoO0Uk4QFUeR5yll3CcLQwEawZ9posn1nQz
 KrPQ==
X-Gm-Message-State: APjAAAVBzEp2N/li45iYiFLQBpXwyshWg/TyX7dBFuSEYa7reIRhYsMG
 zJeO+ghIXxQZKy3IqhW4zN6ZDXpdUl95xPd3IiAUuvom+dP+i+p6NYFymv+l1whZFLC4NXzebSh
 T2cFo/BPUxV5nqPerkg==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr20364974wrw.23.1569247403019; 
 Mon, 23 Sep 2019 07:03:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyn0ItRAv+yr4hLHFmo/G4aX4KbBy8MoVr9/yXTlbcsZh8XmtAmoQmVPlPjBZt+HE/WZyYkuw==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr20364956wrw.23.1569247402722; 
 Mon, 23 Sep 2019 07:03:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36?
 ([2001:b07:6468:f312:9520:22e6:6416:5c36])
 by smtp.gmail.com with ESMTPSA id s12sm14324430wrn.90.2019.09.23.07.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 07:03:21 -0700 (PDT)
Subject: Re: [PATCH] Disallow colons in the parameter of "-accel"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190923121712.22971-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <41ed27d8-5494-28f0-2ca6-770f0969bc4d@redhat.com>
Date: Mon, 23 Sep 2019 16:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923121712.22971-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 23 Sep 2019 14:03:35 -0000

On 23/09/19 14:17, Thomas Huth wrote:
> Everybody who used something like "-machine accel=kvm:tcg" in the past
> might be tempted to specify a similar list with the -accel parameter,
> too, for example "-accel kvm:tcg". However, this is not how this
> options is thought to be used, since each "-accel" should only take care
> of one specific accelerator.
> 
> In the long run, we really should rework the "-accel" code completely,
> so that it does not set "-machine accel=..." anymore internally, but
> is completely independent from "-machine". For the short run, let's
> make sure that users cannot use "-accel xyz:tcg", so that we avoid
> that we have to deal with such cases in the wild later.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  vl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/vl.c b/vl.c
> index 630f5c5e9c..68f47a9c25 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3554,6 +3554,11 @@ int main(int argc, char **argv, char **envp)
>                      g_slist_free(accel_list);
>                      exit(0);
>                  }
> +                if (optarg && strchr(optarg, ':')) {
> +                    error_report("Don't use ':' with -accel, "
> +                                 "use -M accel=... in this case instead");

s/in this case/for now/ or something like that?

Thanks,

Paolo

> +                    exit(1);
> +                }
>                  opts = qemu_opts_create(qemu_find_opts("machine"), NULL,
>                                          false, &error_abort);
>                  qemu_opt_set(opts, "accel", optarg, &error_abort);
> 


