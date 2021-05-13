Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhCXz-0005YL-5U
	for mharc-qemu-trivial@gnu.org; Thu, 13 May 2021 10:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhCXx-0005Y1-3Q
 for qemu-trivial@nongnu.org; Thu, 13 May 2021 10:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhCXt-0005uh-4Q
 for qemu-trivial@nongnu.org; Thu, 13 May 2021 10:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620916954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39i/nz9HPJ+YZJLDFf2edrKiC5YOwXrOZuzR4o70F0w=;
 b=DBH9bH1nzYE4pswybts4qnYROL6N1P0W5xEoiMJqDUmAEo/uMw/GvyrPYpMal2pBBW7ZSO
 4IK9d/kLQHpbMFfgUtOcpriIUvAc22VtsXcKIKs/aYP9XcKF2UUxln+zLmtdszgfdjYyof
 /7/S4F9WkW54ptHRGNC2xDXzg7YuGws=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-mdhmaPe2Nau1Lthz1ivreQ-1; Thu, 13 May 2021 10:42:33 -0400
X-MC-Unique: mdhmaPe2Nau1Lthz1ivreQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a50fc110000b0290387c230e257so14763209edr.0
 for <qemu-trivial@nongnu.org>; Thu, 13 May 2021 07:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39i/nz9HPJ+YZJLDFf2edrKiC5YOwXrOZuzR4o70F0w=;
 b=PfHmQCW2za26GlLNoLgFpMxoSWdRbKRYMbVYpWgpLm0peXT/7o307LfrwPeRUVTMWJ
 p7QxqET21o0VwwI9Ux66rYurLneH22LFdrcvObJSEbC29X6jxMXGcc5tcYX6aCavyU9J
 YwT3CNysotWScLxLMxSfSDzLA4JmODjIq0auppfsY8H29kKyBpoX2EPrw7vID/mr0sbV
 Q2gin2GzzAXXAIOA5616eS8N/DDL1KGvuSZoA2RVhEfKovd7WgnEdCbVOM8N0rQDG8Pz
 5vWN+UqJ3s1u8izZcZIf8Q48nTz1h8ZfzDiiRAr57hqvEg9r9HESzrjN7uneu33zSd7P
 qACQ==
X-Gm-Message-State: AOAM533UJ27zo1Ccogcup/JFgFqCM0EAdQBE3IlUWVfD1aJSxyw4y0du
 P5EUhcwvc4hgcDL7tFlssbQwOx+v6xIcyXdDms0SGD2Cts9RtOTx6/FYyhpgmEQryLVG13CTJfV
 bijLe5DCVuIHCvZ0sIQ==
X-Received: by 2002:a50:c34a:: with SMTP id q10mr50979982edb.346.1620916951935; 
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnIA6pkB3nnnLpnuNmaCeLFNyW73/6seX2dYbGf1hthWHm7cYbKC7s/gfIjmIkHs4YyA3Jag==
X-Received: by 2002:a50:c34a:: with SMTP id q10mr50979961edb.346.1620916951784; 
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k20sm361283eja.10.2021.05.13.07.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 07:42:31 -0700 (PDT)
Subject: Re: [PATCH] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
 Christophe de Dinechin <dinechin@redhat.com>
References: <20210512070713.3286188-1-philmd@redhat.com>
 <8f8954d2-248e-95f3-fd84-0d4deb42b9af@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9098aa73-bc20-876a-d617-1222cafecdf2@redhat.com>
Date: Thu, 13 May 2021 16:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8f8954d2-248e-95f3-fd84-0d4deb42b9af@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
X-List-Received-Date: Thu, 13 May 2021 14:42:41 -0000

Hi Stefan,

On 5/13/21 4:08 PM, Stefan Berger wrote:
> On 5/12/21 3:07 AM, Philippe Mathieu-Daudé wrote:
>> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
>> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
>> macro.
>>
>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Thanks for doing this. I suppose you will send it via a PR?

Christophe asked it to be sent separately from the other series.

I Cc'ed qemu-trivial@ (patches are collected there once a week
usually).

Regards,

Phil.


