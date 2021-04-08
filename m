Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUW2I-0000P2-CI
	for mharc-qemu-trivial@gnu.org; Thu, 08 Apr 2021 10:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2G-0000MC-Af
 for qemu-trivial@nongnu.org; Thu, 08 Apr 2021 10:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2D-0000Xt-V6
 for qemu-trivial@nongnu.org; Thu, 08 Apr 2021 10:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617893608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=jRgZPPkdJhPvwE+bRPbQ2SXWUU4lC3cK7OdFhp/Yxtzrq97jWApSKbR0+fzYtpbf+VzJDv
 JS9s42htUhX4qY1X4RIGcAMeYXPYrYBH/3Y7RPnptYWYSN9Y9z4whV/ed1CZg8PDV1Wmd6
 eKPETEob0iNTdNEfImkoX0BIS0w6/i8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-PVhWcjGnN4Wk0oVxbcEklg-1; Thu, 08 Apr 2021 10:53:26 -0400
X-MC-Unique: PVhWcjGnN4Wk0oVxbcEklg-1
Received: by mail-ej1-f72.google.com with SMTP id gv58so976775ejc.6
 for <qemu-trivial@nongnu.org>; Thu, 08 Apr 2021 07:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=L2YspDcylEcqA79f8CVEaqhSK9nU33opmdHMKy0XahhJfvEuRDWT57cCybEjsx11Xz
 L2EbsnvfuxRUtlLcikGtrcqJVuzXSo4kWN1kzq+0ZaQodzAOHh5hbu2jMqTapAKIpvmJ
 TjUYgXzb99jj1z3jNFGU+s6qqWKXfO0wkpOKTCdyDnj4fIa3V0ca6R1+cW1u0e0FQq/Q
 Ddx4wHSr5FdWjth8mZOFu1EN5GXCzbQ3RCRZTTKsTorivqSvC3peeXkVIZ9X70j2d54W
 Pg++TxHP1zBhhHMuVv2URax8TuV02rlEdZDknudEC8mCG8COamTqaePVXXZ10ebs8maF
 D6Jw==
X-Gm-Message-State: AOAM533EZWJQeqET6W024DHvPt5DlOspFtxdUFdTFApake47WeMqnJpI
 /nmcwpAHSV8eSxYT9edRSOEj4PkLbAfn1FK9ebGRiaHJoX+8SxHWoQagESAgzF+Z9c8+rEJ34wE
 g4SrEmY85gs8MqcO4Kg==
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244211ejb.308.1617893605634; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTw/m33M6jTA02qZ4VuTp3yJchz5VQOyJJDG6ciS65BLoPUunE9DtRZJmvNpUWwWM0bOA1kA==
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244180ejb.308.1617893605363; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f21sm4352240edq.55.2021.04.08.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:53:24 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, wanghaibin.wang@huawei.com
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae3656dc-bb31-7881-b87d-c04de07df4d9@redhat.com>
Date: Thu, 8 Apr 2021 16:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
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
X-List-Received-Date: Thu, 08 Apr 2021 14:53:32 -0000

On 4/8/21 4:07 PM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/block/ecc.c           | 2 +-
>  include/hw/block/flash.h | 2 +-
>  target/i386/cpu.h        | 2 +-
>  target/i386/machine.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


