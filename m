Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0RvO-0003p4-VU
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jul 2021 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RvM-0003mD-Mk
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 12:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0RvJ-0006Ss-2a
 for qemu-trivial@nongnu.org; Mon, 05 Jul 2021 12:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625504300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzllJdtYEDgqsY6YQcbUuX8i6ZTlaiE8x2Kjlr2aXq4=;
 b=Ll93Oz229wmz55jaCuxMB4wKm1bJzXln81hwZmZRyjjgnaq7GIVwygUXqoA4eAoxjAvFZi
 MUqz++U7dT2OiEXaXRN7VOzZo7Km7jeQ3+PcoqKfKCH+SL3UD7qPYE9DkHLaN4KXh1LtgG
 5JjpuKZk/krTjpZsI8M4efVwI3yNd84=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-9ZC5aE8UPx2oXA87m-NH5A-1; Mon, 05 Jul 2021 12:58:19 -0400
X-MC-Unique: 9ZC5aE8UPx2oXA87m-NH5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso150279wms.5
 for <qemu-trivial@nongnu.org>; Mon, 05 Jul 2021 09:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OzllJdtYEDgqsY6YQcbUuX8i6ZTlaiE8x2Kjlr2aXq4=;
 b=WFlWpa2oeUnucV63pbJJRb+UWPR1KoLw/puHPfx2hw9aYM6StJlZGGkeUPCjKD4Cmu
 hUkXxHTwFZTPsVcurlfO+YYEpm9u+knSEQ/baN0H2W/nnjI+ueu++MvgJ+cQ2GP8LqwU
 6MSIrcHymqDQxpJDkhidCc4TN91JMKrit7dXp4oSFWl6Hy2wt1NNX3HKZKx4m/5J9fX6
 +h+uyek5oqXt6qjOO17VTJunevwM+mEMmv5qbY6H0JIhnbzaf4jAlJdkg5AUKhA+KZqn
 UeD0Fle5shbSKlZtBOimn/JILyoMNYIZ4wwfgSAPQ3vmOR6llR0l54IfaFnZH/7A7Whr
 KWrQ==
X-Gm-Message-State: AOAM5317QzWn24rnMf3AIaFOpjThva1KuPJc+Cg5t1FTyOV+4SaHz6Lu
 hFXX0VZuNO+yOqPdkvUW9ukWnWWc4sV/0ZGyY/z29bMMYp2+UApedBDyalAH53bjl/aZUxQDnw/
 rQALm8k0YUupmXDcIeA==
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr56082wmr.117.1625504298183; 
 Mon, 05 Jul 2021 09:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/fAAkdpmvYGDYLLwqgGkSsWMANrKoUdkbUlxyWZFrGaRqA+cqYLDpIYh+CPwiZX7Ld5ZXpA==
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr56064wmr.117.1625504297986; 
 Mon, 05 Jul 2021 09:58:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r15sm68683wmq.15.2021.07.05.09.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:58:17 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Remove /usr/bin/env wrapper from the SHELL
 variable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>,
 Eric Blake <eblake@redhat.com>
References: <20210705082542.936856-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd20ba33-796c-e541-8c9b-2fc6e45b2cfe@redhat.com>
Date: Mon, 5 Jul 2021 18:58:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705082542.936856-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 05 Jul 2021 16:58:25 -0000

On 05/07/21 10:25, Thomas Huth wrote:
> The wrapper should not be needed here (it's not the shebang line of
> a shell script), and it is causing trouble on Haiku where "env"
> resides in a different directory.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 30f19d33bb..6c36330eef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,7 @@ SRC_PATH=.
>   # we have explicit rules for everything
>   MAKEFLAGS += -rR
>   
> -SHELL = /usr/bin/env bash -o pipefail
> +SHELL = bash -o pipefail
>   
>   # Usage: $(call quiet-command,command and args,"NAME","args to print")
>   # This will run "command and args", and either:
> 

Queued, thanks.

Paolo


