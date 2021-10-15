Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbNC4-0000L5-VP
	for mharc-qemu-trivial@gnu.org; Fri, 15 Oct 2021 09:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbNC3-0000Kp-Qc
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 09:24:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbNC1-0008G0-Be
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 09:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634304252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7I8luzIRWK4wc+yKfCzAoKtKuPvHMHsZ1AEMCK+Ij0=;
 b=MxLCdAQcXahmmc6qh4C0YDKEn/IKtVbVDoKHO16yUG8RnAaQsYJHqtwNsfKuLSCZyXYkzp
 /BqTRsv+MI4103QqIEKZgDODKxRsFHC9i0TrNxPId/ikF/KHLjfWyrccByWhq6zkGtz6NM
 rZj+YeOd7gRb/s/PiYzSiUpIyJi2Z9c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-7pncifsjM8ORix9hekKK7w-1; Fri, 15 Oct 2021 09:24:10 -0400
X-MC-Unique: 7pncifsjM8ORix9hekKK7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so5908948wrb.14
 for <qemu-trivial@nongnu.org>; Fri, 15 Oct 2021 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U7I8luzIRWK4wc+yKfCzAoKtKuPvHMHsZ1AEMCK+Ij0=;
 b=v36G5bnyIbAkYxmvaKlw9Dn0S6UpjKYpUCMoRLIRQYJhc7Dcd5v+VGP40Gt5CChRnW
 JtCAZA4ninaTItLZ2LK9nKpo0vAgSH0yb5s3ouKwFjHddocfk/RvknLwQLyR9r0xecf9
 3cwll+eqMQpIxRgSJ6HeaJPjKPf6QYQCTJyNeY0o5q7k8DqObKDQfOiPpQuh20JD3J33
 ExuX8AAXy5VrsQFrTK6Nk1XgopAg1NKWRjYjIsnmvSPbnkxjYj2ZgTpJAkKHv1KO+4eF
 Yo615KRzOizadrjOwusxierO4bZN7vyesxr85iwkQuEhjxB9Ding86gHc4501e7616H3
 sKjQ==
X-Gm-Message-State: AOAM533i60s8WZ2A67bSgzavc7EGe84EZ9Q/YBKli4s4/awWoSNUdIW4
 sYOmU3qf9z6hPOllY4Qs8+bF/5Vja0FwchHIh6mWElXZe/xIQurtX30rP3bI76wdY1HbdSuRUMj
 ysBRYtYwVJSnna9BC9Q==
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr12184415wmg.53.1634304249067; 
 Fri, 15 Oct 2021 06:24:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8AaD2VMHZB1xbQ5zqDC88XgtBqFnnKP9zDXXg0ABjGP/asal1Q3h9TZX16wJ73CWepNh69w==
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr12184393wmg.53.1634304248865; 
 Fri, 15 Oct 2021 06:24:08 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 143sm11004145wma.37.2021.10.15.06.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 06:24:08 -0700 (PDT)
Message-ID: <2a969cbc-402d-330a-1ef2-942832f1ac1d@redhat.com>
Date: Fri, 15 Oct 2021 15:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] analyze-migration.py: fix a long standing typo
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>
References: <20211015131645.501281-1-lvivier@redhat.com>
 <20211015131645.501281-2-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015131645.501281-2-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
X-List-Received-Date: Fri, 15 Oct 2021 13:24:16 -0000

On 10/15/21 15:16, Laurent Vivier wrote:
> The parameters of '-d' can be either 'state' or 'desc', not 'dump'
> as it is reported in the error message.
> 
> Fixes: b17425701d66 ("Add migration stream analyzation script")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  scripts/analyze-migration.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


