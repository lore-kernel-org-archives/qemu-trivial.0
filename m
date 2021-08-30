Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhQe-0007Jr-Fe
	for mharc-qemu-trivial@gnu.org; Mon, 30 Aug 2021 09:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhQc-0007DV-85
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 09:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhQZ-0005KG-Ml
 for qemu-trivial@nongnu.org; Mon, 30 Aug 2021 09:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630330459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wh/Wb7lDYrsB480QD+uiafhPjZ+ojkQP+l82wGeNBlQ=;
 b=XGtK37/CNm2kHaQJUIdd7E94Ofc8MyGtFwHLVjEMwhsLTvhxlInEV3f/0xqclCfQGsw8Ah
 de2x4i0Q2ykujs/HFQneDSLxNrgVbMeCvStmk2A38/9qvVItzO+p4UI8DOk6D6P74rpqQu
 WicjOmjVyIGTMEIDAqfFrKutzNEJ324=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448--z3sMxXfNweD66cjPEPGiw-1; Mon, 30 Aug 2021 09:34:17 -0400
X-MC-Unique: -z3sMxXfNweD66cjPEPGiw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k8-20020a5d5248000000b00157b9110fb5so521274wrc.11
 for <qemu-trivial@nongnu.org>; Mon, 30 Aug 2021 06:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wh/Wb7lDYrsB480QD+uiafhPjZ+ojkQP+l82wGeNBlQ=;
 b=rvlqFklSkcMYubGpMu5NNetJU5O34ZXHA3pV5Q0MNRIuQyI5Zo5/44FSrH/Sv8dTFo
 KwcrHSYKBI3QR44M+jTSasKaLUqHnok2oKiJKsVBgKzjpoM/qUg+dvBCW1VdcnBs788d
 G7NAstJPU8gTS31kxg3hsVYjDlJSMcRtyfy+Rb9IQtQrslRmdTwYaJyMlvlff98sT7EB
 m+gBjHtm+RetjM8nfsIeQK0GTnD4aKH7VJTdRcpDd9xpQbpODqZDaZVfcXfuVRtVHZzu
 4v+a4V+EtB/ls+ESGxMh+UXMDa4lmLC+0HATZUsQCuXsQZGe2npYX4SADFjlmXKUK2DB
 0sIA==
X-Gm-Message-State: AOAM532YHnc7RmV+H1KAfp2xz2XzMStKNLz6d0stUw1m95IuEMCM8NSz
 FM+INdqXS6rAZF6oX/rWtUL6ZM0N2gCHTOfiXV667HJC95cfrZH7dhu3Qcdf7+gSeDP7ftYVNVH
 BMTkC+LscSZI/cFP1SA==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr21913974wmj.44.1630330455969; 
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVE5fIMGzamf55JNoBom1vxmno2N9dQIjkbRycK6I4MUDAxLpbomXjAkRkLZ5fq3ZEAjP2Tg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr21913963wmj.44.1630330455839; 
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m3sm19652152wrg.45.2021.08.30.06.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 06:34:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] docs: add definitions of terms for CI/testing
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210820210946.291335-1-willianr@redhat.com>
 <20210820210946.291335-3-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66629452-44dd-865e-1912-c6d89fbf202a@redhat.com>
Date: Mon, 30 Aug 2021 15:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820210946.291335-3-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 30 Aug 2021 13:34:22 -0000

On 8/20/21 11:09 PM, Willian Rampazzo wrote:
> To understand the current state of QEMU CI/testing and have a base to
> discuss the plans for the future, it is important to define some usual
> terms. This patch defines the terms for "Automated tests", "Unit
> testing", "Functional testing", "System testing", "Flaky tests",
> "Gating", and "Continuous Integration".
> 
> The first patch was borrowed from
> 20210812180403.4129067-1-berrange@redhat.com.

^ These 2 lines belong to the cover and are irrelevant in this context.

Cc'ing qemu-trivial@ otherwise (patch reviewed).

> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++
>  docs/devel/ci.rst             |   1 +
>  2 files changed, 122 insertions(+)
>  create mode 100644 docs/devel/ci-definitions.rst


