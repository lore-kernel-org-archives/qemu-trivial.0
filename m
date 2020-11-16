Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kef8T-0007JN-Ev
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 09:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef8H-0007Hg-Qq
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:05:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef8E-00054a-IN
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605535521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2t/8ollhjt1K8Re8tNH3g2a9FJsCQb1tj4rUjqRC5iQ=;
 b=YPQH3K1PLq3MA7AcLUSe08PXMFj+XViajz07e+LLsmg46Ra+G8yFmLRofCqvojIpiKj/9H
 fK0AjHOw0cbbe+GOCrbiq/cgCYz0wSdfz1pHck2k2mtNrdBaJxgNVjgQF7IqumTbf81wLT
 URCKhrzSvzFhKPPdGnHK4x3UJxTyAXs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-roEDdPRJNWSFjeMthz3NXw-1; Mon, 16 Nov 2020 09:05:20 -0500
X-MC-Unique: roEDdPRJNWSFjeMthz3NXw-1
Received: by mail-wm1-f71.google.com with SMTP id k128so10208306wme.7
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 06:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2t/8ollhjt1K8Re8tNH3g2a9FJsCQb1tj4rUjqRC5iQ=;
 b=Cru1+QLL88QFk0txlOMYfdKgkrPod5b7zpMHf+tnWLvA90QEil4P8u1dekqpsfcbs3
 zxywVIOnifcGbC1oOUbrjdMpLHvOBDJZFppmiTtHlxjW0qZ9vJPfQ+wXHsTNuv4zk7FR
 x/3SwSGtMHKwolG4QVMLO3uxOTtJYy9/mLLXMe3F8XiDSXiTF7Z5iRlxsF5/nlDVbMnj
 1nSPPxqSV8U+CHm6Y2xM7nAqFPea+ofRM0m0sdSiw5HejNrBf6kCqYmQq47B3S6SCY/C
 5DYLWd2vMchwiospHGtCK1Z8d72Frq7bnkdCAVTWzMfbav9DPFENc6UZIucmeYRT3Rjf
 1Nmg==
X-Gm-Message-State: AOAM533gjYyGLmxmOkHIPQXeXOsfwUYehx4CD8WryLrNCyQTt0tqJXeO
 TdvJz7paH+F4fThX7pxLOCJaL6SFvH8iUSzVBfDPCQbvNV9BVXPQUpA+iHTYLAQ/gJUF0EOtfGP
 oaw7rsmix9Sbe6gDE4Q==
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr16022051wmj.116.1605535519034; 
 Mon, 16 Nov 2020 06:05:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMk9imU/Ow5s4RvFVMBnXlY/ggS75fdMcAAS/QViICp2VCqyZIWyGF2CHbaE1rE9I10z9OQA==
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr16022013wmj.116.1605535518719; 
 Mon, 16 Nov 2020 06:05:18 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t136sm17281166wmt.18.2020.11.16.06.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 06:05:18 -0800 (PST)
Subject: Re: [PATCH 03/13] vmmouse: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com,
 zhang.zhanghailiang@huawei.com, "Michael S . Tsirkin" <mst@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-4-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <350edd33-cb0a-b5a7-ff71-072d57597917@redhat.com>
Date: Mon, 16 Nov 2020 15:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-4-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
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
X-List-Received-Date: Mon, 16 Nov 2020 14:05:26 -0000

On 11/15/20 7:48 PM, Gan Qixin wrote:
> The category of the vmmouse device is not set, put it into the 'input'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/i386/vmmouse.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


