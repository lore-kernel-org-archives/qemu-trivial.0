Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK1cP-0001uh-29
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 11:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK160-0000lz-ST
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 10:50:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK15y-00069h-DZ
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 10:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KWH3nZ9M/1f3E+qtUj95wVjktoN5lIrtuO6vOvKojMQ=;
 b=CCAVO6air6/pFfRexRapszlC6Qh0F0MFK4TfeEsTfvRyrhyvr9MUR/69IzFXmXwCdu0xD0
 wlql3qcfE4IdE/AQAjAgVDUMm5ZRZh30wFzdvJOzYuYNoGvUQdG8KVRH/vEkOcYu9TzunF
 JYAPQbSa+PKT/myqUFgl0RlZk9YTWw4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-TSJNC1qbO7C4moIBX_5Dhw-1; Wed, 10 Mar 2021 10:49:55 -0500
X-MC-Unique: TSJNC1qbO7C4moIBX_5Dhw-1
Received: by mail-vk1-f197.google.com with SMTP id r63so4925251vkg.6
 for <qemu-trivial@nongnu.org>; Wed, 10 Mar 2021 07:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWH3nZ9M/1f3E+qtUj95wVjktoN5lIrtuO6vOvKojMQ=;
 b=KKSblS86DK5nk6uG712Mvr56Kx9xV2RYRMuqowrgwCcU3XsA1Nf4RENu7VqP2yUl1b
 4u8v487Vj8gZ78RNrFrLq5+En2R2icEIwr4ijk4dq2DSbaJoCb/L+dIxNCWJBM2fCQKu
 izm2HNYF/dWJUOuSvaAK8yzcIf2q9Nqzg0fOTpm3+MrnQ14yUq/LKsW8kwuTEGvsRUky
 Ob9wmTUoQmJ7vHQdLyCOTY8GgEeziWdtDgap9452tJdOqC6ZrQnl+OkOYre6v/UQF/UJ
 1MT1x3B4skjqA6lvUQFA0yjnOWM1F87orzvnWRBxOPm4JUDBu3TVWaRaG7eq6ZbiKH4W
 OI3w==
X-Gm-Message-State: AOAM532va5waeCpySLpp1U0CekCKWohAaCuoiE2+PBY6+2BEVS8MuIuY
 kdRL7NLqac6SoSXamMJojYdyAjIz5HF2FpCQOyEPuaY/wxqx5v+Op5jFqwU6zoa4tJpeCsjnpmi
 iLGvLCepMrpJA73MZYnO888nTZ9LnWhppDQ==
X-Received: by 2002:a67:3241:: with SMTP id y62mr2032343vsy.45.1615391395281; 
 Wed, 10 Mar 2021 07:49:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEkhYZfsO5XCfYkgULYHZ4I6UP0yGTeIDJH8Tvs+t9wdEVpC5Tn/9ltj0WXNmCYlthmw7Lhz1kPw0WdktckyM=
X-Received: by 2002:a67:3241:: with SMTP id y62mr2032329vsy.45.1615391395086; 
 Wed, 10 Mar 2021 07:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20210310094936.1318317-1-thuth@redhat.com>
In-Reply-To: <20210310094936.1318317-1-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 12:49:29 -0300
Message-ID: <CAKJDGDZdUGW=eT8ZnsVohUzmvrWGUgLdKUs=-0VNejqZyOag0w@mail.gmail.com>
Subject: Re: [PATCH] tests: Fix broken "make check-speed"
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:23:27 -0500
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
X-List-Received-Date: Wed, 10 Mar 2021 15:50:01 -0000

On Wed, Mar 10, 2021 at 6:51 AM Thomas Huth <thuth@redhat.com> wrote:
>
> When running "make check-speed", currently nothing happens. This is
> because the redirection to "bench-speed" is not working as expected
> (since the bench-speed rule in the generated Makefile.mtest filters
> for "bench-speed" and "bench" in the MAKECMDGOALS variable).
> Fix it by calling "make bench-speed" instead of using a dependency.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>


