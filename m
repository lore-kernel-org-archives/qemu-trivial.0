Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUQbD-0002rV-1x
	for mharc-qemu-trivial@gnu.org; Tue, 21 Feb 2023 06:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQbB-0002mN-OA
 for qemu-trivial@nongnu.org; Tue, 21 Feb 2023 06:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQbA-0008KD-18
 for qemu-trivial@nongnu.org; Tue, 21 Feb 2023 06:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676978055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbcLJgbiABfuVV/q11k5fi4fHDbLsY5amFgm8NW07fk=;
 b=KCurSJN0W01PaDauT8FBaTOfC6WPQtCkAYKckKbFyY+8NPTQiY8T75KF+oA3cU9RhJWsrJ
 0+Bg33dAvWA1io0w+4J45CCcKLgerIelaWRwRdXGTz6m78C7L2bvVX08s21Mm3zdTyJ4jr
 Wj6FTxOCTmr4KwNQQUqMPUFw/93Kvh4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-oPblNulQM3-U4pYLD6sMcg-1; Tue, 21 Feb 2023 06:14:14 -0500
X-MC-Unique: oPblNulQM3-U4pYLD6sMcg-1
Received: by mail-wr1-f72.google.com with SMTP id
 n14-20020a5d67ce000000b002bfc2f61048so968094wrw.23
 for <qemu-trivial@nongnu.org>; Tue, 21 Feb 2023 03:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbcLJgbiABfuVV/q11k5fi4fHDbLsY5amFgm8NW07fk=;
 b=wO5GzfONczdcDD1CwZfjYraKnK/U0yMcsynKksyo7GNW1O8jk5U9Pq6/8XCmE9VaO0
 nnU3ONXGvJvAuTgVyVvM/K5JimuCnTs813DZVTMF93UT64bhrKccpUryLhlzeiwpGsMb
 QvG1EW8tjS9M9tEDkPFpw4ibbvfPmC0WYa2fg46oTqFAgadS6YuTl7kKiizSwt4IEXAh
 YtpxraQvuSJ9TYFrInjmOTAEj5nxJCVElSoBGtuR8/yj1qaK9FywYUZaRyUanTFTTrFr
 kkBgQESeMbAHMIDO0Sp7IGPKDeVeEulESiiCboaQV2gb2DKkPnM66e9UvDzq1AOXlu/f
 YXqw==
X-Gm-Message-State: AO0yUKUUMnXXIHigsjLtZ+xyIp21piiVwb34Ccc9juUnDIg5/m/HNh0M
 fnOJbgTOtamyvKlapwwC8RZjnCfZ6K5blFNBXdEfkn8EgGpQK9A9dlUc3JZenukNVnTgAqlLXgC
 ePEmRz1s7bPVFpxrnYQ==
X-Received: by 2002:a05:600c:714:b0:3e2:1368:e3a0 with SMTP id
 i20-20020a05600c071400b003e21368e3a0mr1083617wmn.18.1676978053205; 
 Tue, 21 Feb 2023 03:14:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/BZrLRMszyY8AYLNtHurrG7m64XkjTVXaHlbjLwJvb96KSLaYIdelcjsogWTdfsJrh0bjpPA==
X-Received: by 2002:a05:600c:714:b0:3e2:1368:e3a0 with SMTP id
 i20-20020a05600c071400b003e21368e3a0mr1083599wmn.18.1676978052863; 
 Tue, 21 Feb 2023 03:14:12 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c00c800b003e2243cfe15sm13980763wmm.39.2023.02.21.03.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:14:12 -0800 (PST)
Message-ID: <391fdaaa-4b77-b17f-0cc2-0d7bdcf065b5@redhat.com>
Date: Tue, 21 Feb 2023 12:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] configure: Add 'mkdir build' check
To: Dinah Baum <dinahbaum123@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230221110631.4142-1-dinahbaum123@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221110631.4142-1-dinahbaum123@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 11:14:18 -0000

On 21/02/2023 12.06, Dinah Baum wrote:
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
> 
> Checking if 'mkdir dir' succeeds prevents this error.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index cf6db3d551..1ef3e7f77d 100755
> --- a/configure
> +++ b/configure
> @@ -31,7 +31,12 @@ then
>           fi
>       fi
>   
> -    mkdir build
> +    if ! mkdir build || ! touch $MARKER
> +    then
> +        echo "ERROR: Could not create ./build directory. Check the permissions on"
> +        echo "your source directory, or try doing an out-of-tree build."
> +        exit 1
> +    fi
>       touch $MARKER

Nit: I think the final "touch $MARKER" could now be removed, too, since the 
code either exits above, or runs the "|| ! touch $MARKER" part there already.

Anyway, it's just a nit, and maybe could also be fixed while picking up the 
patch, thus:

Reviewed-by: Thomas Huth <thuth@redhat.com>


