Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ktqSz-0002gQ-E5
	for mharc-qemu-trivial@gnu.org; Mon, 28 Dec 2020 06:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSx-0002dq-9V
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 06:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSu-0003nI-Q3
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 06:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609154008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7p3Oc9PDJl3SFKn/9CXzds7jjg++8Mo8Pv6ZGV02bwI=;
 b=RWT80E9Asr8M+x0kkVu9lR1ZqSiqtTONpKtJEhlND8pCt7DXZ1pfx/eKwgRC8Vcc/M0CGS
 wZP9yZlx2EGYs0SCGX5TMYIEpmcbqSxl3+H6C6OqlCJST1JFFOPNnwnuSaAO/jqhc7BVVN
 Dkjtxd0LgiML18D1fVd8R6zan8xbIH8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-2MDWG_39Nx-4eceHcYUt7w-1; Mon, 28 Dec 2020 06:13:26 -0500
X-MC-Unique: 2MDWG_39Nx-4eceHcYUt7w-1
Received: by mail-wm1-f70.google.com with SMTP id r1so7002480wmn.8
 for <qemu-trivial@nongnu.org>; Mon, 28 Dec 2020 03:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7p3Oc9PDJl3SFKn/9CXzds7jjg++8Mo8Pv6ZGV02bwI=;
 b=GpSzAcsNE7DvZ6Ia6T1ou+XKCpmIc5XzFaPra7zUHGyKaEeFUr9l28T4GwDgo3Hbe+
 yySY4lmhs8Pttapb+tu0JNsMbLUIHfwB8Y32sQc64GYlteLw682i52av5dKa1jMdKpvA
 KP7VvutzS8cCMWmy48LMZBmbRUGTNBJvB08moEMbOU1ahujcITAzIRU/YaNJmb6MQ2nP
 2ks4igok8Cc5nEuPfe0FX59Vvgbm6Zw1JSyQ5Vhf3mJpmtZXEEFeAMFYVRrReBc9BNSJ
 bGQ5xYU5Z+hWvL/bh4M3qImJED659zKcvsRL1Do9dmv7ynE4LEsmUB0dD4AeU5IqEBtm
 9nzQ==
X-Gm-Message-State: AOAM532Y405HGPXt3d2Kbc+RK1LSMZN/+nSyOpU81SenkDdoI9Ba7knV
 a4RiFJ9wg/69w6kGJcFKsdhOI3M+lvs+OagvCAT+ORab07myNAHMqf7eLBuzK+lC5dVdMfP/nsk
 DBWQc6iJf5t856HAs6w==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr20251636wmj.5.1609154005639; 
 Mon, 28 Dec 2020 03:13:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiKkKfa48xjfbghHcW/AxbIK3Rk77OBXnznlAfFfXRcBuo62ZKiCi9dFutoNYgrfLAsQhCcQ==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr20251603wmj.5.1609154005277; 
 Mon, 28 Dec 2020 03:13:25 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id m2sm18826592wml.34.2020.12.28.03.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 03:13:24 -0800 (PST)
Subject: Re: [PATCH 4/4] qobject: braces {} are necessary for all arms of this
 statement
To: Zhang Han <zhanghan64@huawei.com>, armbru@redhat.com
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
References: <20201228071129.24563-1-zhanghan64@huawei.com>
 <20201228071129.24563-5-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <99dc0059-b4a6-d8fa-80fe-58ee77285db1@redhat.com>
Date: Mon, 28 Dec 2020 12:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228071129.24563-5-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.829, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Dec 2020 11:13:31 -0000

On 12/28/20 8:11 AM, Zhang Han wrote:
> Add braces {} for arms of if/for statement
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  qobject/qdict.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


