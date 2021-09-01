Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLQir-0007qE-HU
	for mharc-qemu-trivial@gnu.org; Wed, 01 Sep 2021 09:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQip-0007jP-95
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 09:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQii-0001rf-Qc
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 09:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630504563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htCU+/dL11k5zpwbo6uMsUIoTexVrriGE8wDg6jg7pU=;
 b=MGVmN2bMydtZY4EwTsxOT2Jmb//YaeP6hPczrOg+d+pv7xBjSZ+Ei72tDvUxfhIX3iGBFy
 7ZGGmcS7TT7aesdnVu4O6/eMXAGWqq3bLnoHhZPkLqJ8EhETRJYcO/dal74obH7LyUTRst
 HVOBCPD+IICIHKNBFQHrUfT7IFcp62w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-8Rpl-479PCCihKFidzURRA-1; Wed, 01 Sep 2021 09:56:00 -0400
X-MC-Unique: 8Rpl-479PCCihKFidzURRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so2873806wmd.2
 for <qemu-trivial@nongnu.org>; Wed, 01 Sep 2021 06:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=htCU+/dL11k5zpwbo6uMsUIoTexVrriGE8wDg6jg7pU=;
 b=QX+CxKnuwi3+FpIxrK+0odeU4wUo97h/NSe5Ddh/ameJ4ifew8gWt0Z6lGPKlFvBFc
 ajDPbFTsDgyA85C0vK+AsvIgPyNQzr/30Xgz9+yfdwY12qE4xRlK2lEFEul2X/MEwB/6
 whHqQX+oNnY8Fn9g5KGmz4Um/op7+/TgggjfP2GySaXIAwdowo1BF5+f80ph60eIHDRu
 ktzKEKeZA8v132dT1B7KeNQ51hWwAZcLCZDh3NtVFRBIMD51uKPJTgX9n/H/8lMkabrn
 uJu6zA3lDY84iAyuHeYPv3PmdYBkPgAGLJzotHgxUykodDJNfzyWZ4mWaGjSKcf+C8Or
 H9YA==
X-Gm-Message-State: AOAM531mzHoX08grrZa2yZchy8iFCAwYpNB4mZZpg5VnaCvrUJC65x/R
 zDP8OR2cFts6bodayzntQSB5qouGt/qdaQMzzxYMWyxCcALMp9qlLY9h3qdr5QIv6HVgLJYrIY+
 YoJpy3IiP+7mzcrZA3w==
X-Received: by 2002:a05:600c:1c95:: with SMTP id
 k21mr9026593wms.176.1630504559582; 
 Wed, 01 Sep 2021 06:55:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3u39bX09blmg4pH83/ZqrewiyumxvkPT5p9LnUArJYE0Qqm8StDoURmjTL968CJMtXKZZHw==
X-Received: by 2002:a05:600c:1c95:: with SMTP id
 k21mr9026576wms.176.1630504559362; 
 Wed, 01 Sep 2021 06:55:59 -0700 (PDT)
Received: from thuth.remote.csb (p5791d006.dip0.t-ipconnect.de. [87.145.208.6])
 by smtp.gmail.com with ESMTPSA id l21sm5353068wmh.31.2021.09.01.06.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:55:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] docs: add definitions of terms for CI/testing
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831152939.97570-1-willianr@redhat.com>
 <20210831152939.97570-2-willianr@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0c53f6ec-ccd8-aece-bb0d-db81148f5b7d@redhat.com>
Date: Wed, 1 Sep 2021 15:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210831152939.97570-2-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Sep 2021 13:56:11 -0000

On 31/08/2021 17.29, Willian Rampazzo wrote:
> To understand the current state of QEMU CI/testing and have a base to
> discuss the plans for the future, it is important to define some usual
> terms. This patch defines the terms for "Automated tests", "Unit
> testing", "Functional testing", "System testing", "Flaky tests",
> "Gating", and "Continuous Integration".
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++
>   docs/devel/ci.rst             |   1 +
>   2 files changed, 122 insertions(+)
>   create mode 100644 docs/devel/ci-definitions.rst

Thanks, queued to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas



