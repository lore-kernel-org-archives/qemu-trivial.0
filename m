Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSFlG-0007gD-4z
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 04:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFlE-0007ec-LG
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFlC-0004aq-Ii
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 04:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602578055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7waybJVBI9uSsjKZ2aTqAy3MPMStO7qPJG9cYHM54M=;
 b=KQnxcBLKJLqBub7DJX/mHGdQdY2KdDiL6si2lyRhR1xOcThCfyK9RYXNItzCXpxrVbtTfH
 w8sPTMVbF3a6ofcYV6ysxQ3vHVFSc8MaiapEu9T+raRhBfUizWV/c95g45SoJItCAxrTQG
 xw2XnmMq7c6/nU1e1GAov9cw7OOuQl4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-E9PpIYN4NSavMX8-RPND0g-1; Tue, 13 Oct 2020 04:34:12 -0400
X-MC-Unique: E9PpIYN4NSavMX8-RPND0g-1
Received: by mail-wr1-f69.google.com with SMTP id 2so1402277wrd.14
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 01:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C7waybJVBI9uSsjKZ2aTqAy3MPMStO7qPJG9cYHM54M=;
 b=Z7B++cgDqjGngKlwm33o2HI3CE3irEC/bXhhbhU5RWbGC9i/f6jw42vQDKKDOKkENc
 yLiDfh2np0P+y1AYNRqGwC5suvrpFE2uYz5z+bwKFHTxXjp5KFY7rK8asJBKi0I7TjmJ
 bxbj3hfGIPrWjxmVOACjRq1k4JTxVdAvamXH7corEO/LzymBHgznFc42NdI3I8/ALk7r
 O7e8CU2UM6DA//eDcb+Hg16wsritpkOyiHEEnSTGERXzWgvL9Drt/w0M4h6fzBRSrGEN
 f/7OxKHDvcKR6bsBm/Sa6PDLszWfEB66VF6SU4v9xq+SvteTcN8FIXK+IVeSZ07kujcW
 rD2A==
X-Gm-Message-State: AOAM53264XS7vsCHI7leIKLSJ0HPBtBtAwwJx96xyq0SyKAbkQNFkjMk
 GKDff+kxhFWX5hJXuDsHr8iCiutNy7MyIjIo/cZLD/QkKL+nVZGBsphGsqfHlV7l0BKxig/9wC7
 9hcN/iWv04PyiXFQigA==
X-Received: by 2002:a1c:3b8a:: with SMTP id
 i132mr15259061wma.189.1602578051402; 
 Tue, 13 Oct 2020 01:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxqWxzU32F98Fi3/XTnB3kUK/ah6aMhWDCZ7WXayd06UtrcqtzvhMeNIcY/MYzIZLGJP+J8w==
X-Received: by 2002:a1c:3b8a:: with SMTP id
 i132mr15259037wma.189.1602578051199; 
 Tue, 13 Oct 2020 01:34:11 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 64sm7273207wmd.3.2020.10.13.01.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:34:10 -0700 (PDT)
Subject: Re: [PATCH] hw/core/qdev-properties: Fix pci bus range in
 set_pci_host_devaddr()
To: Klaus Herman <kherman@inbox.lv>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201012225831.72920-1-kherman@inbox.lv>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6b392d9f-37b8-0cfc-7227-5cebcb1524b3@redhat.com>
Date: Tue, 13 Oct 2020 10:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201012225831.72920-1-kherman@inbox.lv>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Tue, 13 Oct 2020 08:34:20 -0000

Hi Klaus,

On 10/13/20 12:58 AM, Klaus Herman wrote:

Please include:

Fixes: bccb20c49df ("hw/core/qdev-properties: Use qemu_strtoul() in 
set_pci_host_devaddr()")

You forgot to sign your patch, see:
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

> ---
>   hw/core/qdev-properties-system.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 49bdd12..e3dca56 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -903,7 +903,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       bus = val;
>   
>       p = (char *)e + 1;
> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> +    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xff || e == p) {
>           goto inval;
>       }
>       if (*e == ':') {
> 


