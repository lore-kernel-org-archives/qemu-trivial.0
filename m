Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mizFa-0008FR-0p
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 09:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mizFK-0008BO-DN
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 09:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mizFG-0001J4-Si
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 09:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636118815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3v1Kwu/D7VMLJOSCkry+oYDcsVNS833SFiRE2ADIeQ=;
 b=MJbOUNWZeOR7ValseshYcxmfK2DnK1Bf3bqMdJxIJ30RlpGFEMquy35vp54NdKMZPU3lVr
 7zCbe9+wwCuwaJv3fzeqhr2xs0ft3tpOKkVpPTrsrv/t6Ivf1QQHFLK5M6w40L0TaI49gg
 SwrababpdLgoxlVnvkxzJIENae4/gso=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-eo1wTDCYPyiPv1FlEYqeRA-1; Fri, 05 Nov 2021 09:26:54 -0400
X-MC-Unique: eo1wTDCYPyiPv1FlEYqeRA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so2325888wru.23
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 06:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A3v1Kwu/D7VMLJOSCkry+oYDcsVNS833SFiRE2ADIeQ=;
 b=EM0X12gELjFtrrcxNNZV4czRevmqyVAxL9vjlJ0C7NY4YjzMmdpeJx/EdI5n9dXDUC
 6vQ1aacXArSCLsv4N/9YhNUQSOU/LPo1oI5RkSdUIi+mtApMLof+gDMO8d5hrURD6RKM
 kxNX2HxWef4a16HeE7YTtwTGCg/I84sj7wOdEmDeaLUx091ASDrWUosq4x2KhdGC3EqC
 kZGd3oCppdL3C92a7v+w9nngqjYlogeXRZ0N1laUNd1P5RmRh9pn/F+Nn7Cf5bE2+K7J
 WMAf3mBQePPCxq55rKFDXZksBxePp01W67bErU8mXT2zwnB0MGZnAtQtcuBmjxmi0xTc
 s43Q==
X-Gm-Message-State: AOAM532WB6MqKTUGBbL86AJAgC7BU+Nelb1j8e4ygMx+R4wvN5wIItMG
 kwZljzmqXfxoSoxPPB54nJHoSIgaWUf2fhS5VlhfXx7eaB8CFvMZ4vwz8vpVfyz/9vKgibQMHSe
 i/WRVnU5vTb+WgPJwoQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr30375151wmg.87.1636118813101; 
 Fri, 05 Nov 2021 06:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGq3lHmQxMu2uX2VNjvIjX+Usi/49qtHpZkNMgOzxX5tEVyqo6BRWZs03u+SD4NREWtwsYhQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr30375126wmg.87.1636118812862; 
 Fri, 05 Nov 2021 06:26:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s24sm7399636wmj.26.2021.11.05.06.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 06:26:52 -0700 (PDT)
Message-ID: <98d98c4b-9e34-700c-c659-2dd6f169a4c8@redhat.com>
Date: Fri, 5 Nov 2021 14:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] docs: fix qemu incorrect tag
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 05 Nov 2021 13:27:16 -0000

Cc'ing qemu-trivial@

On 11/5/21 14:01, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> The last modification of the patchset may be 2 month before
> merging dirtyrate implementation, it used the wrong tag, so
> fix with 6.2.

Maybe:

 The patchset merged in 71864eadd9a ("migration/dirtyrate:
 introduce struct and adjust DirtyRateStat") was targeting
 QEMU 6.1 but got merged later, so correct the tag for 6.2.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  qapi/migration.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 87146ce..f0aefda 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1740,7 +1740,7 @@
>  #
>  # @dirty-rate: dirty rate.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'struct': 'DirtyRateVcpu',
> @@ -1774,7 +1774,7 @@
>  #
>  # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'enum': 'DirtyRateMeasureMode',
> @@ -1796,13 +1796,13 @@
>  # @calc-time: time in units of second for sample dirty pages
>  #
>  # @sample-pages: page count per GB for sample dirty pages
> -#                the default value is 512 (since 6.1)
> +#                the default value is 512 (since 6.2)
>  #
>  # @mode: mode containing method of calculate dirtyrate includes
> -#        'page-sampling' and 'dirty-ring' (Since 6.1)
> +#        'page-sampling' and 'dirty-ring' (Since 6.2)
>  #
>  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
> -#                   mode specified (Since 6.1)
> +#                   mode specified (Since 6.2)
>  #
>  # Since: 5.2
>  #
> 


