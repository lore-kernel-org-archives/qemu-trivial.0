Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0fYv-0000Ud-S0
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 03:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0fYr-0000T0-8B
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 03:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0fYn-0003bX-Ae
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 03:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPWS48xyHJPcaLp1sBYohywsr40Y8GFu+h4AF/SahzU=;
 b=Fo1V8UY0t4p8bGyjnTS8iMTuidAysSdS7w0/BjpO2nZFL9nc6cweK0ijH9AUA4MgcoIiBX
 XQq2NTOt8Ieyr6tlUKZZiw8Pn6EGF7qA6D+6TAf7AInt2MWXzQSzaSzBUYeiPf1Kk1+EV7
 Ie+Mkd6/hvUlSgOca8LNWUILVUd+Jyw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-GAHee0oEM8CvSIZPjd7maw-1; Tue, 06 Jul 2021 03:31:59 -0400
X-MC-Unique: GAHee0oEM8CvSIZPjd7maw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so766085wmc.6
 for <qemu-trivial@nongnu.org>; Tue, 06 Jul 2021 00:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cPWS48xyHJPcaLp1sBYohywsr40Y8GFu+h4AF/SahzU=;
 b=asywnmZMLv8/8jUSh4ufQDFSOeJaEipWq2Kw5wCz0WKYoBzJZgfGeOdkKuE4WibrZ0
 JE6VTkoSOppmx1vjMRxZtAkHXHiKeeWI8UFrwQfdDEYmOXYi3/Jyo3Lb3B2uJFjZ5QEY
 /r/671iTbiaYlHnDgBUiqU2D+CrKZ56wFaCZTiNZd6UdEr40Odc09kvDqcNvG5C3Jaow
 q4c3pyV0zuBIEiC2dBmQA7pxpIeFkk2Ws5icMigrXjm1KxS5WDftGyd1R2nGbx18S6sR
 cdtCWuHTMVWEMg33kJyQE0mAGPJCl1fHrNACGU0+zMl49KBSYiuF1QAZKusLa2fZ2PH4
 lOwg==
X-Gm-Message-State: AOAM533B4iMeEtR08L6FMWgQPAEuqsPpSEpm1bW3cRfUiSFn2yNSkiim
 d8zSelFIWT09mFJmTcerAdUZEpkcUzk5jiSKjfxhUq/o0Zgb+D0gxMUPvV6pS8jhkShgm9G817n
 iX2ggJX8m2PL+xTvgNQ==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3150190wmj.99.1625556718229; 
 Tue, 06 Jul 2021 00:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztOf24+lpgNpDE4vlgF7YlTWPcztiWuTcSy/b1fJvgdNZM62EvLJmRQJ06YZZkSBAHo4uGIA==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr3150168wmj.99.1625556718041; 
 Tue, 06 Jul 2021 00:31:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w9sm15024137wmc.19.2021.07.06.00.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:31:57 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove the OBJCC variable from config-host.mak
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20210706071934.1054496-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <61e0202e-aeea-f66b-bd76-615a66690df4@redhat.com>
Date: Tue, 6 Jul 2021 09:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706071934.1054496-1-thuth@redhat.com>
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
X-List-Received-Date: Tue, 06 Jul 2021 07:32:05 -0000

On 06/07/21 09:19, Thomas Huth wrote:
> The last user of this variable has been removed in commit
> 660f793093 ("Makefile: inline the relevant parts of rules.mak"),
> so we don't need this variable in config-host.mak anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

There's quite a few more: CXX, OBJCC, ARFLAGS, RANLIB, NM, PKG_CONFIG, 
WINDRES if I didn't miss anything.

Paolo

> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e799d908a3..068716a56c 100755
> --- a/configure
> +++ b/configure
> @@ -5888,7 +5888,6 @@ if $iasl -h > /dev/null 2>&1; then
>     echo "CONFIG_IASL=$iasl" >> $config_host_mak
>   fi
>   echo "CXX=$cxx" >> $config_host_mak
> -echo "OBJCC=$objcc" >> $config_host_mak
>   echo "AR=$ar" >> $config_host_mak
>   echo "ARFLAGS=$ARFLAGS" >> $config_host_mak
>   echo "AS=$as" >> $config_host_mak
> 


