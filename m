Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l00u9-0000Ey-TR
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 06:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00u8-0000Ek-Bw
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 06:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00u6-00016f-RE
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 06:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610624101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dcRajHcr1N/4P+S0A0AV0uaR8Tr7mSa4F7XPXvzMBo=;
 b=dXNA8kuEC26a1knwhKDMQNyjqnGY6mhanrSBN26wMgsqLRX/A103cdCqwQnnP+TQ7d/oMK
 1H4mSvSM4R26TiPk1jZ9kzf9ioOiDaRP79+R4dT/O8vKTjGq93QAy4X6X+/L1w9PtwCTP3
 UrzpV+wIhOxn+NfPu+GWnXNSFHnJnAM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-_gn7e05YN2qZBAf7EdTYmg-1; Thu, 14 Jan 2021 06:35:00 -0500
X-MC-Unique: _gn7e05YN2qZBAf7EdTYmg-1
Received: by mail-wr1-f72.google.com with SMTP id g16so2493791wrv.1
 for <qemu-trivial@nongnu.org>; Thu, 14 Jan 2021 03:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dcRajHcr1N/4P+S0A0AV0uaR8Tr7mSa4F7XPXvzMBo=;
 b=ptMj5my6rjQ9Tvb0GX9W9ULuegOXNwFTb7GhufP2qGT/l7+WDC+s19eInHGjUy6Fs3
 j5aNLLvxUP6CyFqIvkKCNkJcMsPm7SL4b0m7NGxZfm1OeB0O+ysPQfdPPuqIC85lS38L
 MZlcLaBPFvcWYlrqMlUCj2YF5OPi56aU9hkIbs/F1v+Lv/eHtQNAOJhhE7W7bL6mk7Ir
 P+qozJTYmo9jvZ9hTVHkRYU0IrBGZBleRbfEZFyOSjCAswHOqyZiLizHq97UpGIF82Ob
 HqIoMf/0lUyqV5BxmdfXKyKWb501UKlW/wzXAuBASZlFPFNds0lbCCPRE7fM6/B3nSXg
 xs4A==
X-Gm-Message-State: AOAM530rzQiE3E6yR0rWfmsfIolGURErCL8z4winAj3k4xJcAmxAJ/lV
 2Bth4zXt04fKtIGJXvg4yHtDB4jOaWGeBB+lx2sp5E7SHv9PrMOQQW3ldaJqDIYYk5ScBUucwL6
 oDTuvzm28UVY3NsrcWQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr3637188wmh.114.1610624099105; 
 Thu, 14 Jan 2021 03:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcgI+3c4QPRIV3lsUo69z6s+JCyFf8l0Cm9CPKfU4PwP3tCicZSWRYvtF8E00NC8ElhI6eWQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr3637162wmh.114.1610624098842; 
 Thu, 14 Jan 2021 03:34:58 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u205sm7729569wme.42.2021.01.14.03.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:34:58 -0800 (PST)
Subject: Re: [PATCH 6/9] net: Transfer tabs to spcaes
To: Zhang Han <zhanghan64@huawei.com>, jasowang@redhat.com
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
References: <20201222082340.67405-1-zhanghan64@huawei.com>
 <20201222082340.67405-7-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec8d38ce-180e-4718-d39a-7cedee0a8350@redhat.com>
Date: Thu, 14 Jan 2021 12:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222082340.67405-7-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 14 Jan 2021 11:35:04 -0000

On 12/22/20 9:23 AM, Zhang Han wrote:
> Code indent use spaces instead of tabs.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  net/tap-linux.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

FWIW typo "spaces" in subject (no need to repost).


