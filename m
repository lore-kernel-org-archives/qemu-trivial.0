Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0fZm-0001Ql-3z
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jul 2021 03:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fZe-0001PX-Ud
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 03:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0fZb-0004B3-6C
 for qemu-trivial@nongnu.org; Tue, 06 Jul 2021 03:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwdjxq0fIdVBg5EpmSPTCzctGDKnbANO6zEWljKS/iI=;
 b=YjFvXXqMagXdIdwFjPM0XEMClGtIXjkLFmCPqC1cNBmvWDvjcHQkK9GFI213O2cVPHU8OL
 4ilZoR2R7YNkW2k7d+OR1l6TM8EJcsDYqBok2/P5+5Zh0M72dmvh4SS0+kbVfX8/49C4el
 TRPG09ybeEnmK0AT1tefB0hOFJV9FXw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-eKFQ5yJfPRyRaUoyGpdNeA-1; Tue, 06 Jul 2021 03:32:49 -0400
X-MC-Unique: eKFQ5yJfPRyRaUoyGpdNeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z127-20020a1c7e850000b02901e46e4d52c0so766873wmc.6
 for <qemu-trivial@nongnu.org>; Tue, 06 Jul 2021 00:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwdjxq0fIdVBg5EpmSPTCzctGDKnbANO6zEWljKS/iI=;
 b=FrQrpmkRwhCiGnrpue79gW6Xpgodk6JdWDM5mCt2sDO+OikKsCIPN+wt5aC7+WCV+r
 jmjyobR9QDhm4hk7hDL9FkERYH1nJtzkDJBlXhv2BxcAlyMt5bNY0cNBU5kuCy5Mow+H
 ybVHWcnJeh8/OCy3CIp0jzUipuj+Kq08Q1W4W0MohWg4lACGEnfDOYyoegJyZ+QyTEoz
 vOY75dBqfzn+0ff2+TQkQUSkmlGYbWD6uesOg/BeD3dhCbvtmiQMjrvNYTFDpcJTzWH3
 pZbhnF8n0McmgunwhWvfczLMrZ7U65sipKEQceR0CnyB3/g+mxqU4jGzcKdJ5uFnFTRF
 TNUg==
X-Gm-Message-State: AOAM531RVMF2W8cRu34QfIaZJrhCmxwUXJvrS3gONbLg8Gjb+63moGwV
 mSb+tuVz9JNrEZ4URFUV6pIBvIHc9VexOR5GD7TUYC6aU4K6Q+GqHf+hcRNFiKSHHrqTeviBmzg
 9VhF4SAfGfhMZxkscqg==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr20902664wrq.105.1625556768241; 
 Tue, 06 Jul 2021 00:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/sHM1vonLAQMos7+97ZaFB8JD8AL3AhckCwpodo+QDedNpgLEDTaqirJLT1uCQRyJx/lBjA==
X-Received: by 2002:a5d:448c:: with SMTP id j12mr20902629wrq.105.1625556767940; 
 Tue, 06 Jul 2021 00:32:47 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x187sm5897308wmb.47.2021.07.06.00.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 00:32:47 -0700 (PDT)
Subject: Re: [PATCH] configure: Remove the OBJCC variable from config-host.mak
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
References: <20210706071934.1054496-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e16094bb-2bda-db40-8ad6-93faf19a8f9d@redhat.com>
Date: Tue, 6 Jul 2021 09:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706071934.1054496-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
X-List-Received-Date: Tue, 06 Jul 2021 07:32:58 -0000

On 7/6/21 9:19 AM, Thomas Huth wrote:
> The last user of this variable has been removed in commit
> 660f793093 ("Makefile: inline the relevant parts of rules.mak"),
> so we don't need this variable in config-host.mak anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


