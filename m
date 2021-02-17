Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCJaT-0007QT-NN
	for mharc-qemu-trivial@gnu.org; Wed, 17 Feb 2021 04:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCJaS-0007P2-F8
 for qemu-trivial@nongnu.org; Wed, 17 Feb 2021 04:57:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCJaQ-00007P-Pm
 for qemu-trivial@nongnu.org; Wed, 17 Feb 2021 04:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613555854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7s87ey3TG1QBVAYgtIYgPo9FMPaf7XkvVIbKiVyF+a8=;
 b=ZSeynu2T9+Bd+pM37RSCmAP9QbsW/UN45zZDqFdjkucLFK49RdrJhEyIxOlfqor3TDryQU
 pRxwvuwVJUyX4bUuXj3wDnyKK5vtHIJ5kfnqCaltTfWjQOvD7aRQJ3dW9OERQGNxa+RHdF
 jmsZTb7M6a/bcP5/4CdaX05KFAT5E+s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-1sLTlN6AMjOM3u4kwL1eZg-1; Wed, 17 Feb 2021 04:57:30 -0500
X-MC-Unique: 1sLTlN6AMjOM3u4kwL1eZg-1
Received: by mail-ej1-f71.google.com with SMTP id p1so7779434ejo.4
 for <qemu-trivial@nongnu.org>; Wed, 17 Feb 2021 01:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7s87ey3TG1QBVAYgtIYgPo9FMPaf7XkvVIbKiVyF+a8=;
 b=mjIBBX6VadD3J7FUZ7bFG2BcR6NJBKVnD4sF6c3SKNtJkp4CLdAGYZFkTAXePmmpRp
 4MMe+rwsVcmNK7ZnthKhABcdgDXYJmN6d+lWcYNI5UOjHQLBelRs5JaxYt+rx4Pow3PX
 I2E3zFn5vgxoTwbBguBQoJ/qmHKIJq6QYpJh9c6VJDYADnHPvLufpVEyYUHmlEHMPmPq
 J+Bq8bXxPbai3+NlJT2w0DVKH+rzuMPsuwDToeNoGQWsLe9j6t24W5GtOJeuWzapr9e0
 HwVltCaLEZpUwBWgifucptFtw3q9ao20Dy42vSkPBUz24HN1jARFuIMkl1bUJU466ss7
 Y4lQ==
X-Gm-Message-State: AOAM533zwz/fIDfJzHyr+g7xelp5XEf5yD+pxvSlfUiL9JjXVmeRXiU1
 4Hjw6eAiDq2ZoLgfrBfhWpAXzpUSAAaqopia7AGbYamEUNcqAIeQ69eyPuYPw8asKSCV910kbon
 KoH0uytqJ9Ya+oWK31w==
X-Received: by 2002:a17:907:d0b:: with SMTP id
 gn11mr24595821ejc.144.1613555849197; 
 Wed, 17 Feb 2021 01:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4IbyAH8M5PnUUWLVHDicAiXUIX8xmdo7tgcAIX90hLXIl3IaMIlwhpXf72F+CjyhmmNP0Uw==
X-Received: by 2002:a17:907:d0b:: with SMTP id
 gn11mr24595798ejc.144.1613555848909; 
 Wed, 17 Feb 2021 01:57:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n2sm822944ejl.1.2021.02.17.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 01:57:28 -0800 (PST)
Subject: Re: [PATCH] fuzz-test: remove unneccessary debugging flags
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210216181316.794276-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d674c20-cc80-a008-04a9-dd92cf31ad53@redhat.com>
Date: Wed, 17 Feb 2021 10:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216181316.794276-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 17 Feb 2021 09:57:36 -0000

On 2/16/21 7:13 PM, Alexander Bulekov wrote:
> These flags cause the output to look strange for 'make check', and
> they aren't needed to reproduce bugs, if they reappear.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz-test.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


