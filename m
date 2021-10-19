Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcn7B-0005MK-51
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 07:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn79-0005Kq-4W
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcn77-0004oL-Ak
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 07:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YP6AYwdn+Z6MF0evpvAlUIvgrrbHdLebz6yiWHi64vA=;
 b=c4fuw1lhlSiFmfkVu/K7yeKdYauXSF1GctjKOhz/6hI5AtjR/gVzuLvll6kHlDolacRGwL
 0zJdQctpf3QulOT59GEd/Lshn0b3h394WjzsvbCu5VYX3651lwVlbKzRK+oRtGm6N/c6lH
 G93JmojbCOmJwi56dt4vi0AqBoaROCU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-3Vu0i8AuOoCdBQgT7LvFxg-1; Tue, 19 Oct 2021 07:16:56 -0400
X-MC-Unique: 3Vu0i8AuOoCdBQgT7LvFxg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so9999664wrv.19
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 04:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YP6AYwdn+Z6MF0evpvAlUIvgrrbHdLebz6yiWHi64vA=;
 b=HNJ5PCeCfJQ05iwlmTFy66YxWFvb9ebAKE492FSgwq7Kx6xCeqsy4lbLlZ+CWNMbC3
 UMm/5flTbRQUfCONsnX/m2zr0TDcRvNn5a4a8PeMTAF80qNDcDmD7PlAUCgAOIDtvsC+
 x+Aw47MxsWujNko96veofwWfccHq/jkbJlY4Pa9DIXdNK1WW9VV9GaEtOQW4XRLDVzon
 yXRYsTSjojk1WliaT67tU74sMAkjXc4VgJ7qa92eYQ4kWWTJZfgUPi3H5m/pViGl2Cd0
 pdDXiG3M9YCKVF8vcNIISrSrQxTwVZ5rvcfXSSBRNbN4DPHmFulgti+6bCUOXx1fxItf
 pBZw==
X-Gm-Message-State: AOAM531w4MWsaJS0vMGy0mghiu5r9SHdlGFtpwYDkdBrYzBDJ72Qu0X3
 oI1lzbqGwlrhq+8Vos3258AdRVa02LkPrScPzss/HNGRxY8Y+pxtRWj+zuylsIddgTHrVxxyQJv
 C3LiUY0dWlOQL7YqVzQ==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr5371710wmi.30.1634642215550; 
 Tue, 19 Oct 2021 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVXk+J1yiUnYWUNjqkL19sIycJyNcLUclxhBE92KsnA6pk+6H5NskQ9vMNebMGZiYAS9vmGA==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr5371681wmi.30.1634642215357; 
 Tue, 19 Oct 2021 04:16:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-83-53-160.dynamicip.rima-tde.net.
 [83.53.160.121])
 by smtp.gmail.com with ESMTPSA id t1sm5183516wre.32.2021.10.19.04.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 04:16:54 -0700 (PDT)
Message-ID: <236403cd-2454-9a02-e1c3-8103618c0eb1@redhat.com>
Date: Tue, 19 Oct 2021 13:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/6] docs: rSTify the "SpellCheck" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-3-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211019090344.3054300-3-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
X-List-Received-Date: Tue, 19 Oct 2021 11:17:03 -0000

On 10/19/21 11:03, Kashyap Chamarthy wrote:
> The original wiki is here[1].  I converted by copying the wiki source
> into a .wiki file and convert to rST using `pandoc`:
> 
>     $ pandoc -f Mediawiki -t rst spell-check.wiki -o spell-check.rst
> 
> As part of this rST converstion, I've removed the dated and `codespell`
> invocations, and linked to the GitHub repo.  And cleaned up a couple of
> external URLs.
> 
> [1] https://wiki.qemu.org/Contribute/SpellCheck
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/spell-check.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 docs/devel/spell-check.rst

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


