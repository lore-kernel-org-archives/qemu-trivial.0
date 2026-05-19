Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766BCD4F3C
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 03:59:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPBbx-0006IQ-6f; Mon, 18 May 2026 23:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wPBbt-0006Hb-3N
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 23:59:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wPBbq-0007mq-LH
 for qemu-trivial@nongnu.org; Mon, 18 May 2026 23:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779163147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SZXk9n0GICLWrqnc79UERiMshy9yOKaaTKzI2r1bV1Y=;
 b=BfPIGlHcSbFl/BA9QDWgIjzXpjc7VrTakCY1kbEYlRdtz7aKUJH23SwKkDLYo5ORO/AoXe
 d0+Q6C0NhjgW/MG2SQrOqTkwca9SWJeD3CI8ZMzeFkKuunCjJFkUXeZ4FPF7nTsqtfLgDG
 perR/hRXpmOp/qZj148b4LUqU2PIQW0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-IJUwR5ysP3u4ehr2Ckkzfw-1; Mon, 18 May 2026 23:59:06 -0400
X-MC-Unique: IJUwR5ysP3u4ehr2Ckkzfw-1
X-Mimecast-MFC-AGG-ID: IJUwR5ysP3u4ehr2Ckkzfw_1779163145
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48906aa28cbso27503015e9.0
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2026 20:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779163145; x=1779767945;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZXk9n0GICLWrqnc79UERiMshy9yOKaaTKzI2r1bV1Y=;
 b=ANJLhVnRIuO1nNFpY5mCwomTcfULqgOzc3Bt/fVD7/BIJWwz6dwtXMNpTcFkhU7Sca
 elGt+eD8rXo89iCx7WiK49wt7OmU6mI226IUGNCjF777wkaPRRSPp9yfwOOmSPKcvqNI
 H/WhhCL2j8yjgfl704E4RyGEFxjtcw9ctKro0UiyNLViNTzi4qhB/EMrF5wLG4rnyGGk
 9AGu9Iijpmu8tvs80PbQWKrwlQyDwrQvOw8QsWgrJfdfFHN6p0kBaHP1/TdwR7FFRxTF
 04Lj3RLtGhjrXSVFYpnGzB9wzuzw2fn6kRU0FbrhL28OhAN5nac3hSG9B40jDAddwx54
 cxJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ92eGRTZYZ3W7IXcMnIU9ycCV9x/mhifU70KN51fc0/JdaxtV3h1++ZrTm75m7jBJfxxOdpSW8eWOnw/+s=@nongnu.org
X-Gm-Message-State: AOJu0YxwuXLaSRnte17Xxdv6h+F5GfbsspLOr83Aa7NgC5Pk4VVXFB2X
 ItyK6sCt4yi6vt22lbXBSUOfQwcAYFLItgGEmoQRlW9Tdalb6sBmFNtMLmXrWuRSlC2aNuQGIRh
 g88GzClKiJinpEPhS/OR08ZgdeNMqx8JvIz/TDRnRtqbQT2nXaQNpkWzNPlI=
X-Gm-Gg: Acq92OHFXSI5V9JQd54Yu/P79gStwHfXlsnAopeQJVd0QNjc/rmNuP75YdGMq/mUxh3
 IogQHw3lRZ5FjKeCEf/C0zHd1dC6bntQn/7V0qgUU9j+nyvHJbs+QIWF7Pn8GRvZOOvIlasS3qx
 KDE7vQpHx3V6aVIfnCz1XQp34wmcw81ySFoujFk6nJduIjv+prgCoKPc276DH5tMGuBZLk/8F3y
 YhIOjywk6P6+lTTyUnri3/TRL5zh54vyATszVssXHlD0ChNL9yidglnowGUm+dUhd4gyWQA2suS
 AeDRi3zoXtJthLb98DO+Sa8xUyNQ0b7IJi981TWYRhQJ2xgUJVyisfdsEsD0EG77UykYDvtSWMz
 fXJEmUcLQN5riWUPe8I4=
X-Received: by 2002:a05:600c:c4a7:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-48fe539519dmr262103625e9.14.1779163144953; 
 Mon, 18 May 2026 20:59:04 -0700 (PDT)
X-Received: by 2002:a05:600c:c4a7:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-48fe539519dmr262103495e9.14.1779163144657; 
 Mon, 18 May 2026 20:59:04 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm298009215e9.2.2026.05.18.20.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 20:59:04 -0700 (PDT)
Message-ID: <a829f2b5-d50a-4bef-bbe3-27995a9505fc@redhat.com>
Date: Tue, 19 May 2026 05:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system/exit-with-parent.c: Close the file descriptor
 before exit
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, lvivier@redhat.com, farosas@suse.de,
 pbonzini@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260518184333.8505-1-rjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260518184333.8505-1-rjones@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zxoczbQoYAdN7HBj2DLrW0992WM11j6Vy3G-EfpZ7Sk_1779163145
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 18/05/2026 20.43, Richard W.M. Jones wrote:
> On macOS we leak the open file descriptor in the background thread.
> Close it before returning.
> 
> Link: https://lists.gnu.org/archive/html/qemu-devel/2026-05/msg04286.html
> Reported-by: Thomas Huth
> Fixes: commit 886898baad ("Implement -run-with exit-with-parent=on")
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   system/exit-with-parent.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/system/exit-with-parent.c b/system/exit-with-parent.c
> index df65d2231a..d236944572 100644
> --- a/system/exit-with-parent.c
> +++ b/system/exit-with-parent.c
> @@ -109,6 +109,7 @@ exit_with_parent_loop(void *vp)
>           /* Behave like Linux and FreeBSD above, as if SIGTERM was sent */
>           qemu_system_killed(SIGTERM, ppid);
>       }
> +    close(fd);
>   
>       return NULL;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


