Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLSyd-0003Cz-5Y
	for mharc-qemu-trivial@gnu.org; Wed, 01 Sep 2021 12:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSyT-00034e-Lk
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 12:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSyR-0004AT-3E
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 12:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630513224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9v72gwWAy5qaNuog2S1FNiaTh/MNfzgNG47O7CVqO+w=;
 b=N8hcHNUAsGbJ5EMQ4n/kdo1JGzBVXSPVlT4mgYICAUsHTpNj0PwOICEKh9dXnp0nPLaIHM
 BJ/BpDgPKwvI5TNP6BCBCx/d28NO8QzLebzC29+LyTTtU4zy5lXP/5EMerJuaT3nxVdT/Q
 w9K7ORvkUzBoW6H2dTZp3wJ3iZYMarc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-yldZml29NNaObOnc4TrDJg-1; Wed, 01 Sep 2021 12:20:23 -0400
X-MC-Unique: yldZml29NNaObOnc4TrDJg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so79967wrm.8
 for <qemu-trivial@nongnu.org>; Wed, 01 Sep 2021 09:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9v72gwWAy5qaNuog2S1FNiaTh/MNfzgNG47O7CVqO+w=;
 b=opEDYbm6cymT3c3EScJd9eCvMpVq6geAiYby7BqnXUdb2bwA95mSmEZub6wEyPch6c
 dteQIVoCq61qzb9a5GYQ/zktIVzN9NunZLDLWKieF8PRpu3Rz1XpsLtCAiJyGj/UpUgT
 AXfHzctpJHifTrhp3f4M+OR1a4PqtB6KwQoKNUu3KWRIYH1hh2LO6pMkA69eRgQmFpNn
 MsOTdN1IBJt2aYDC5CL4Jgp9d6hTPG6D6aH7krnkOOgfYxOTD56t6GMlD6ftkLv4GUCa
 0V9jUfquhB8YtiSkpcF8nC8xs/t1K+kZ/ZXsBjE6zHyOWEfV1aKjFHxBbVclXSns6bA7
 9O8Q==
X-Gm-Message-State: AOAM531Hy7J98DAMnlczrgCUiZlQPXVLMAqrHfSrIRQYZFUpOTBTO2ut
 Pk3cuP4lkXNgWTT72cls0Xx8vUCq8XnMcQkBUvuLEG6zhD3JM75TkZN54sDDLSin/n2ES1rp5xb
 QwnFQ4Uq6pcOATz9Ili1ER2ubmk86bE9J04CHYIGnk3YQ2UuBlYnHhUPR4B5etCq0P0E=
X-Received: by 2002:a1c:443:: with SMTP id 64mr229438wme.180.1630513221219;
 Wed, 01 Sep 2021 09:20:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAtfp9jfyI0IPx20Kle69FyxFbs9YX4EaqrspdrtwwezBumNf5UU4xkKk1vt88XjCidwfBSA==
X-Received: by 2002:a1c:443:: with SMTP id 64mr229409wme.180.1630513221029;
 Wed, 01 Sep 2021 09:20:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k16sm22248014wrx.87.2021.09.01.09.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:20:20 -0700 (PDT)
Subject: Re: [PATCH] tests/vhost-user-bridge.c: Fix typo in help message
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210901152713.25701-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f11e5af-41b2-fdc5-fb01-1e3284e53670@redhat.com>
Date: Wed, 1 Sep 2021 18:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901152713.25701-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Sep 2021 16:20:31 -0000

On 9/1/21 5:27 PM, Peter Maydell wrote:
> Fix a typo in the help message printed by vhost-user-bridge.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/vhost-user-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


