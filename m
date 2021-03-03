Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHOm1-0000DP-9x
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 05:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOlz-0000Bg-MW
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 05:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOlw-0005ra-Un
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 05:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614767428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBa1/4EcCarKUVBt1NUymXi6rS3yHrCuTpax9oeU97A=;
 b=OCFjudjcRSkejD5eTP6iAU6f1SG6mt+/sMCvOrEcPyoDhMHEyPGhTgGYIlxhn8Tz9kXNrd
 fYGwWL0zViqI1ui5vKEm/85QWjGNIwHWgir2tXbO2yrICv/v11ODcjGrJxKF+NOEhZAEbp
 Gq+fYk5o250mKbNUttsbCwKRK7lXNUQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-JigtDXOrNPCDUR41irn78A-1; Wed, 03 Mar 2021 05:30:25 -0500
X-MC-Unique: JigtDXOrNPCDUR41irn78A-1
Received: by mail-ej1-f72.google.com with SMTP id p8so3850919ejl.0
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 02:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBa1/4EcCarKUVBt1NUymXi6rS3yHrCuTpax9oeU97A=;
 b=ptBjg6LDy259Ws0yX8yIQHiCmbx/sms8XUqWiZh3Yc8OpVFLihGUZQDl7Oq7x/XpWc
 ZNUIsl/Z8djmuMSozMM0If2qfQ5pro/jwhDLtyewmgC5o7LgKmpqaMWBrPmkg1C0G/AK
 BmsK2C9ImWS8aq/KsWj+V7/x7pWTx3uUlZSbYiBlzsG1TFhpyTzkyjaNZ9q/anyPRnkN
 7SoiPNU3Sb5dI6pjs69eWt/qTAyQyKwjKUgXEU3gYzDBpww0f8aTVSaYPk7Q2FRHfm1S
 NwXiOxtXdPtndklJddJd//xZ99mwYrTdi5VkHELuqOk08brpQfRWen+PopWVn2OHfIZP
 oy4Q==
X-Gm-Message-State: AOAM531JLczIhK6Vq+Uu/Rv2j15ROC/bylgB4Eh9DE5uJzG3O+LFKTyQ
 A5zjH9VTD03ugJRHdCwcWNHC3TD4lXx23BLqyHKELbtWzpqaN8Ou4QfuIxpskuEbPQ0K8srCO7R
 Hd1d2i3PHI4Y8Y2qLYg==
X-Received: by 2002:a17:906:1754:: with SMTP id
 d20mr24771239eje.221.1614767424536; 
 Wed, 03 Mar 2021 02:30:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSEL5vY4aj2jtim4LY5F0lOjq8oHtgdKDpxU+mAT960ic012x9vTW5nCfrTzP/VqA/nslYtQ==
X-Received: by 2002:a17:906:1754:: with SMTP id
 d20mr24771219eje.221.1614767424409; 
 Wed, 03 Mar 2021 02:30:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g2sm20957837ejk.108.2021.03.03.02.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:30:23 -0800 (PST)
Subject: Re: [PATCH v2 0/8] misc: Replace the words 'blacklist/whitelist'
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0200b600-b683-b939-4c46-eeaf9356243a@redhat.com>
Date: Wed, 3 Mar 2021 11:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 03 Mar 2021 10:30:31 -0000

Hi Laurent,

On 2/5/21 6:18 PM, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "blacklist"
> and "whitelist" appropriately.
> 

> Series expected to go via the qemu-trivial@ tree.

I forgot to Cc qemu-trivial@ :/ The series is now fully reviewed :)

> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Philippe Mathieu-Daudé (8):
>   ui: Replace the word 'whitelist'
>   tools/virtiofsd: Replace the word 'whitelist'
>   scripts/tracetool: Replace the word 'whitelist'
>   scripts/device-crash-test: Replace the word 'whitelist'
>   seccomp: Replace the word 'blacklist'
>   qemu-options: Replace the word 'blacklist'
>   tests/fp/fp-test: Replace the word 'blacklist'
>   hw/vfio/pci-quirks: Replace the word 'blacklist'


