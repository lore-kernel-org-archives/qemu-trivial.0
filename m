Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxRtz-00062y-Vf
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 05:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRtx-0005y7-6n
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRtt-0006fp-KI
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639565565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yl7Iat8NEH7R617MBcEG9XlQsFSTJgx7q72i+BxS6AM=;
 b=EP8uezMEuQU7nA5cbM/Vb377nD/3Micq0GBZRCik2g0IaYxsrtAUNPNszQpiB1h+SFiBP0
 5Mx+sO2mTG+IBY2UqPdHSQa0nbjIKfSEmewRL4DHE1An5SfxQKiNG3o+nyHp+H/c3OwOHR
 JWSF6pAwbYXsYtHdIOVaHwR3w/fJSno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-tTOK-Nm1P9iv2_27z7nhTQ-1; Wed, 15 Dec 2021 05:52:41 -0500
X-MC-Unique: tTOK-Nm1P9iv2_27z7nhTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so5816050wrc.17
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 02:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yl7Iat8NEH7R617MBcEG9XlQsFSTJgx7q72i+BxS6AM=;
 b=rquCHuUQAjCJyV+Hccp8WB/zBfGGdARTzLUTkcLy+/+M424h+Pwf0YEKKknxBCRikf
 wiPWMn5pS6XCkm3/Y2Rk0Q9qWWEoiSuOaZd4f6ZjU/jTpBCyGXoTmNNzz7KQChoXi+CY
 ceotkM6Lb8a+wDF+q4OT9kfbE4Tcl5oF4WN9y3VrQ3W7f3NmI1G+reHBIFI5sIvYmN0Z
 +sQByWz7hn5uppA5sjhWbC4NVqyQHwwpmGKPx/WMtxby03kqXQgROrcZWguNQCPCs+ho
 Lavk/ZfyhMBhjogX7Bik79OmnQwOKLOdq54Tu9uKWQkqwTIwcD3YUFIVOSykF4J7TTMo
 5S6w==
X-Gm-Message-State: AOAM531YXwL6F1//ItAAmUA7boZo8pu/nUDAxVANTTVHvGagrxAREftr
 4uuz/PG+GXSTj40Vbdh+rpH/tnmGNUh43XdXRMZ9CXkva8/zU+AEiawV4R+hq96/gwKWbUEARgb
 GO2P1biRV6zsruLbUww==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr3990381wrw.116.1639565560706; 
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm+jFlLMhndi2bXsNeKf2CWoLLLFbJIaaPlyt3HRsdoFqq1tnDluDjZfzBV6L/dXY3OXVc3A==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr3990364wrw.116.1639565560530; 
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f7sm2007868wri.74.2021.12.15.02.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:52:40 -0800 (PST)
Message-ID: <dac2e8e7-87f2-7998-13a0-2529b7226e48@redhat.com>
Date: Wed, 15 Dec 2021 11:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] configure: Symlink binaries using .exe suffix with MinGW
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211109144504.1541206-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109144504.1541206-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 10:52:50 -0000

Hi Laurent,

This patch is reviewed/acked, can it go via your trivial tree?

On 11/9/21 15:45, Philippe Mathieu-Daudé wrote:
> When using the MinGW toolchain, we use the .exe suffix for the
> executable name. We also need to use it for the symlinks in the
> build directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 48c21775f3a..31e8f586dc7 100755
> --- a/configure
> +++ b/configure
> @@ -3786,7 +3786,7 @@ fi
>  
>  for target in $target_list; do
>      target_dir="$target"
> -    target_name=$(echo $target | cut -d '-' -f 1)
> +    target_name=$(echo $target | cut -d '-' -f 1)$EXESUF
>      mkdir -p $target_dir
>      case $target in
>          *-user) symlink "../qemu-$target_name" "$target_dir/qemu-$target_name" ;;
> 


