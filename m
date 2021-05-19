Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljLQs-0001Sl-1d
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 08:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljLQp-0001SQ-7w
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 08:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljLQj-0007na-7b
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 08:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621427764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WwOy+3Cu0OcoEk0EjFd0azQnW2UiAPSndV4QK1AAsM=;
 b=MkZoO4pofYL2MTNaOTB4VwbBeK0m8di9Nvr0waO6Wh4QNbIqnIVlAT5MWZ88jtNOBvPeGn
 gulF5NuMCHyUQ9aidmsQNdk/RcmVoM8gRJ+nQfoi8M6mfPsFZcc4PC8QOH9VWrdz4P3NQ8
 0DUSbPM2XBODSceQ8kygnm5dyyW2bUQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Mx762FLMPXa6z93lI0zyCw-1; Wed, 19 May 2021 08:36:02 -0400
X-MC-Unique: Mx762FLMPXa6z93lI0zyCw-1
Received: by mail-ej1-f72.google.com with SMTP id
 p5-20020a17090653c5b02903db1cfa514dso419866ejo.13
 for <qemu-trivial@nongnu.org>; Wed, 19 May 2021 05:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5WwOy+3Cu0OcoEk0EjFd0azQnW2UiAPSndV4QK1AAsM=;
 b=nWiLLQGbXuMrOzroqOmj8VbNIRjZNUnoRnBClX2ZatTTxPiE9cyjQ8Zqx1dOdruQbO
 XRxELXKSaYIVMB/zDxqMe2F6tcbTxJuSisWJ4y371UjwOEQKqCYTofmLvX0C/JGYpsdP
 cJVrqPCzLwslgQN/GAAXzQx41qCUBM50uv2jdSaiudVDkjTXEYFXtslexoPgATteEWkj
 bPI+3MYchEhbYXip3W9+bkEa8CO4iRs7sdaYe9K3xYEo8w1GOXV/u8/wVsSlTEsQiurK
 2YIpsbFBcM786ZAqTkGANEEz0obxIiS3Ox+n4maX8QLZdHLlgwhc4D4DRhkhGwulXIrA
 Jelg==
X-Gm-Message-State: AOAM533P5niwXLuWaC+fmDBGIpWsSsj4TbBaNdut6MvRfmXJNefHsb/W
 mJ4PC40/Cbsnx8kqD8fl6uR/Z6iClM6TTcr5KiGEqNpax+eUpmYFB1584jQzcic+dCGnskyt7UL
 I5eZrL/tFt9gZklPoZQ==
X-Received: by 2002:a05:6402:696:: with SMTP id
 f22mr13885188edy.131.1621427761030; 
 Wed, 19 May 2021 05:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdMHDW+wbTZgBdyiZvXULt9XeDg3fJEHQZ3nkt6zNioV0F1s+uVnhAIN607riZsFRa4Tukhw==
X-Received: by 2002:a05:6402:696:: with SMTP id
 f22mr13885163edy.131.1621427760784; 
 Wed, 19 May 2021 05:36:00 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id w19sm15925684edd.52.2021.05.19.05.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 05:36:00 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Avoid error messages about missing
 *-config-*.h files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210519113840.298174-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
Date: Wed, 19 May 2021 14:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519113840.298174-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 May 2021 12:36:11 -0000

On 5/19/21 1:38 PM, Thomas Huth wrote:
> When compiling with --disable-system there is a harmless yet still
> annoying error message at the end of the "configure" step:
> 
>  sed: can't read *-config-devices.h: No such file or directory
> 
> When only building the tools or docs, without any emulator at all,
> there is even an additional message about missing *-config-target.h
> files.
> 
> Fix it by checking whether any of these files are available before
> using them.
> 
> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use ":>" instead of "touch" as suggested by Philippe
> 
>  configure | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


