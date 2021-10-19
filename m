Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcn4H-0003BA-3T
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 07:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn4F-00037F-F3
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn4D-0002wp-Lv
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY1UBN+z0IyXg5lfdapdgy4zMHImy9GZ7yuSsld5Gwo=;
 b=dAjpZLd+jjz3uRJuIx8pASPOE2t8qIjsBKKgBFsYKHX/BjNcMBSuZ/gpeffMZLVpw7tREc
 HqXx3vuKbzO5DmSgels8ObgWEPQT1i5vhNnSY/yBMFkFL1EDZCQsAHzLjr6zXzV75J1sOs
 41D8G7xmEopHnTs8cotNhBHmBEkmz+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Q_DCUSqbOg-x7IsZbNiJVQ-1; Tue, 19 Oct 2021 07:13:57 -0400
X-MC-Unique: Q_DCUSqbOg-x7IsZbNiJVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so1026672wmr.4
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 04:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PY1UBN+z0IyXg5lfdapdgy4zMHImy9GZ7yuSsld5Gwo=;
 b=N9oQA2MziBJ3BIHs30qly+ekLOCppRnnKuVaW4v1QVFWXDSeLQxSm6dcHXxv5JpvHt
 DNV13fRHMYntwWXwM2zNTdxTaBZ5FG1jySSsrAYtIQ/Byoi0O8cnJ0AeF+6OFLZiZQXs
 4xVbB9DdtoHPCj3w3piZMBuw5UsFy0j2voVJn8cnyBc5Sy8L9M/Q8tyylmS1jzmSrSlZ
 mU5ZpjBNWDJEzr3YgsoChfg+lHWTPtWGR8xc05RrEnieuam/yYOOBgXO/BZEtdqulD8T
 E9F7wyqDQZSLw9qLHVV1Ifg7Vu2aq9frUy/Qlsv+I/7KIxVE2Hf8hx+9xibxet32xoHi
 q15A==
X-Gm-Message-State: AOAM5317cslQVo1rM0zRdQRPFjGNDSLvv/bW9CWd8pkqQ6CrOOxuYkHX
 1DzbLS8JsHS8nu9jozIvQeCgsSSoTKlnCRw6Y8d/ESU9LBsfHhBJ0abzT1aqZi3pgt9snL2PL6Q
 nIovI3EvS/nJxunpeWw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5267246wmq.147.1634642036005; 
 Tue, 19 Oct 2021 04:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxurVvDePB6ObfEDgYD+Q0mqbiMq6SRmWSLWvu1ZlLsi53820I4x4KdOCXLY8Wdm4LauDfoiA==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5267223wmq.147.1634642035849; 
 Tue, 19 Oct 2021 04:13:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-83-53-160.dynamicip.rima-tde.net.
 [83.53.160.121])
 by smtp.gmail.com with ESMTPSA id k8sm1272545wms.41.2021.10.19.04.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:13:55 -0700 (PDT)
Message-ID: <7fe8ecee-167a-86a4-5f65-6b08c29194f6@redhat.com>
Date: Tue, 19 Oct 2021 13:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/6] docs: rSTify the "SubmitAPullRequest" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-5-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211019090344.3054300-5-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 11:14:03 -0000

On 10/19/21 11:03, Kashyap Chamarthy wrote:
> The original wiki is here[1].  I converted by copying the wiki source
> into a .wiki file and convert to rST using `pandoc`:
> 
>     $ pandoc -f Mediawiki -t rst submitting-a-pull-request.wiki \
>         -o submitting-a-pull-request.rst
> 
> This is a 1-1 conversion; no content changes besides updating the
> "KeySigningParty" linkt to the rSTified (HTML) page.
> 
> [1] https://wiki.qemu.org/Contribute/SubmitAPullRequest
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/submitting-a-pull-request.rst | 79 ++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 docs/devel/submitting-a-pull-request.rst

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


