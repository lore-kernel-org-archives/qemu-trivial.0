Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmuGw-0007CT-5K
	for mharc-qemu-trivial@gnu.org; Wed, 09 Dec 2020 02:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmuGt-0007B9-H1
 for qemu-trivial@nongnu.org; Wed, 09 Dec 2020 02:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmuGp-0007JK-U6
 for qemu-trivial@nongnu.org; Wed, 09 Dec 2020 02:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607500337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6l9I91yG5bHt0E7JfpJoNJVJshhIcnUGTc2wCnvYhw=;
 b=KvIfv0rV4mqsYfKErfGue1sUfwZqns9WywM7r0Xd2YBKKXgVl+Kud8GDeDlBIIeg+Xvp1w
 2c0Af/QxZc2Jt1V4b/YZE3U78NZqnHHL8/Y0sCIdSvEurBkBlxJSZLsnhyEglANMdHS+TW
 LAjC0Q4E7T+IKkQ7958DsU9tKMy7poI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-A51TxujJPNGITLVLN8D55Q-1; Wed, 09 Dec 2020 02:52:15 -0500
X-MC-Unique: A51TxujJPNGITLVLN8D55Q-1
Received: by mail-wr1-f72.google.com with SMTP id p16so334668wrx.4
 for <qemu-trivial@nongnu.org>; Tue, 08 Dec 2020 23:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G6l9I91yG5bHt0E7JfpJoNJVJshhIcnUGTc2wCnvYhw=;
 b=ZywOOzGAWqCdHSYXSeK9kDXED70NmPWqIQkfGUzi/ZusjuTli/bRNiUdjBmh/oWpdP
 1Wty1vssFpZTHVv/sBjzmFSzt0NooY9XAVZzf9xTYjcGN4geEIQvh1lvn/8y2CxdoYB0
 Dvp1ZPMmIebWPtpN3UXT8L2+ZNiltmxiAUw/S0NGD8uiTKRbIdo1jvud/1dmZzqnqyyr
 1KAmmTVT2QhtNf66dnIhzSkeIu60lGGhvm4Df1zTtlGtM0adYV+Jv9WFI6+Z7FQmb6kD
 Tw+Goio+KheTrR2s30yPifBkd/oy9VGhB3xjv3drg2QseBmUe3WtgYswYPtoiRi527hJ
 JzHA==
X-Gm-Message-State: AOAM533vJW1B1kchrj46UmhZ//piK7Em4DGwDAJLDZIzZiyDTpKKmS1A
 tPususaijpmWr54SyKV9iKKima/3UhFgujzDCx0K4S4YIQr7snWWjSMDSxkXI3FX9ILd66lWEKI
 zsqGSTfpTj+zAk7eblQ==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr1198923wrr.26.1607500333944;
 Tue, 08 Dec 2020 23:52:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuZ/IvYTwKdn5oaeq1xZyuXK94wTKRsbDMkHmPCfxN3FiZ9S3fLUvWgmNgiKKaHl3cSeFiXg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr1198893wrr.26.1607500333645;
 Tue, 08 Dec 2020 23:52:13 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id g192sm1663956wme.48.2020.12.08.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 23:52:12 -0800 (PST)
Subject: Re: [PATCH] fsdev: open brace '{' following struct go on the same line
To: zhouyang <zhouyang789@huawei.com>, peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org, alex.chen@huawei.com, qemu-devel@nongnu.org,
 hunongda@huawei.com
References: <20201209060735.2760943-1-zhouyang789@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f995879d-b18b-5d78-4a66-0c1b65e26a31@redhat.com>
Date: Wed, 9 Dec 2020 08:52:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209060735.2760943-1-zhouyang789@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
X-List-Received-Date: Wed, 09 Dec 2020 07:52:25 -0000

On 12/9/20 7:07 AM, zhouyang wrote:
> I found some style problems while check the code using checkpatch.pl.
> This commit fixs the issue below:
> ERROR: open brace '{' following struct go on the same line
> 
> Signed-off-by: zhouyang <zhouyang789@huawei.com>
> ---
>  fsdev/9p-marshal.h | 12 ++++--------
>  fsdev/file-op-9p.h |  3 +--
>  2 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


