Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSFpZ-0003Vp-Of
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 04:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFpX-0003Sa-Q9
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:38:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFoz-0005A3-W8
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602578293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv6Fa/S+yjMsgxTeLF/dgikbc6nPa/7K1ehD4HJtvw4=;
 b=D8MYqXGVaBGaVBIcXMi6ytKqO7y1ryKOvM2qj7a/N7Xkc7edg76PsE0Lu+4FFCQIuYP31T
 ++y1aNnNGCkQkRr3/WE6xSG2C8A6fIMni2qB1qftdm+uD+3cXPiY9KEMwL8rz7yI5OrW50
 oSwz8EiXc9hzJQ0yJOZ2qOScflFqiMk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-RdTLfT2tP1CF0vvLtA3S0A-1; Tue, 13 Oct 2020 04:38:11 -0400
X-MC-Unique: RdTLfT2tP1CF0vvLtA3S0A-1
Received: by mail-wr1-f69.google.com with SMTP id a15so843108wrx.9
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 01:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fv6Fa/S+yjMsgxTeLF/dgikbc6nPa/7K1ehD4HJtvw4=;
 b=cp9nWfTCl+VSUWhdhnJSL4bcwZoVYCpFq3EVdGjTy0gB1N6s5ild0MOP3wRmA61sbw
 6+tRBQQVGgFh0hiT+mUgh2r+FsnG3Txy02b5PVzntlL2q2de2qnyR9L6+Z829lsIjPw0
 GsUI7V+0eSfw9ZHozZS6hTf2Z8vpwR5oc9s5fvLvCL0Q0dkblsKBW3LdU95Q6Nzv3IHL
 6iCYO66wCctT4T9fOOVkxcE5LguFzXa8eQ0ESeGmzYiBwqkeZ2QnW+Tf1+O6rV5Csov4
 8FLoGPsnOXs7hxY0rcO9H4UCF1k4kv1aV6UW9O15qLTbcOyqsgmIg6B2EAR7Hiv/vquo
 1u0w==
X-Gm-Message-State: AOAM530dTYrm7WVsVzSfVhIQR5BtS+xBw5ejsXZWXeWAohL+w2OQvENb
 OiJjmHmejVd8XumLivYV1rW8Y8etrXEDNlqzAGNkG2fg9DMuiOSRpCd0u+WOKe5TmozzYEBu+BE
 EdctnYIeIrAicfvwSng==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr34691057wrn.52.1602578290437; 
 Tue, 13 Oct 2020 01:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzKlJf/dy+7ovm3eN2P8LmhOBQuLlfdbrFX0/PiwCSjfFv02l5PAhcG3C6oAyHaIiIXZGtJw==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr34691028wrn.52.1602578290212; 
 Tue, 13 Oct 2020 01:38:10 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v3sm29254399wre.17.2020.10.13.01.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:38:09 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] gitignore: ignore a bit more
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201012233740.190-1-luoyonggang@gmail.com>
 <20201012233740.190-3-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7431126f-cc78-57d3-fd78-bd21c5785927@redhat.com>
Date: Tue, 13 Oct 2020 10:38:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012233740.190-3-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 13 Oct 2020 08:38:48 -0000

On 10/13/20 1:37 AM, Yonggang Luo wrote:
> Enable the creating multiple build directory at the source root.
> Ignore /meson/ and /roms/ for better search experience.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   .gitignore | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index b32bca1315..f78ee9f297 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,5 +1,5 @@
>   /GNUmakefile
> -/build/
> +/build*/
>   *.pyc
>   .sdk
>   .stgit-*
> @@ -10,3 +10,5 @@ TAGS
>   *~
>   *.ast_raw
>   *.depend_raw
> +/meson/
> +/roms/**/*

Why?


