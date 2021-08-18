Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGGdE-0008KD-03
	for mharc-qemu-trivial@gnu.org; Wed, 18 Aug 2021 04:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGGdB-0008JP-HI
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 04:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGGd8-0001DU-1A
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 04:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629274136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6M03kD2t+FvQY9ER7LqvHR0FrYbvrq6IJyuKvLTNbSk=;
 b=SoJTT7YGOZk5WUUYR8Vmd11SQBT9XqRdED5wnIGmAZysdkZ2VSni8lHVHhyJSuLmVNfzDv
 tllGVJMJQ23hYtu8PPQaDlUtHT6GJ8MS54r6NAruhCspahQjtD0eI3I82Xg0EaGh1Wq6vi
 BHwEJ/qJJD+bbYbweVQT6oFHdnOv2rs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-B4wd6n8nOD-89ZoVTZAOAA-1; Wed, 18 Aug 2021 04:08:54 -0400
X-MC-Unique: B4wd6n8nOD-89ZoVTZAOAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so318050wri.17
 for <qemu-trivial@nongnu.org>; Wed, 18 Aug 2021 01:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6M03kD2t+FvQY9ER7LqvHR0FrYbvrq6IJyuKvLTNbSk=;
 b=aPwXALKcMYgSRIhnoo+YVaDuTI/jVWgRlIf7dU39/AmdqDwvrfvQfZhjRXe9vBVMSH
 MO5l/ylGBw5rbj+BvAZSVb56cijbay5nS9xasQ4N3K/W4l0hg4T+AQlpmH6memkVjNvV
 n4E/Kf/Ho8CeLJwQ60HG0cfbFKKZKMiWwc99kgussv0+p2/gPIVBV+WKuTKoAIZTsAwX
 Hm3qrqmZrpwApcdeRnmoJLjL80GnkT3PyZHtQjdG9PePEVa2M9sBGL3Mf6R//cCkDOHf
 +OgGZXFtD06VKGi6dGcfxXfTQGQj+d/TXgPz3P4qUZzOXdZqlbjyQ2VxgJk3BOFYmtuX
 63PA==
X-Gm-Message-State: AOAM531n9pKzr8WpRxbdvMhlzNY3kGPBFbQ3WXa2vuVbf+JmwqPRJa4X
 Z1TQuBbQgr2neKfOHfxLl7lgJj0SJs1818jVgDnSUSEXE22G/aFU/HBDohoApYj90oAN+fSa4X5
 VGP+JHQAvoAiTzmfbtA==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr8859585wrr.402.1629274133859; 
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf4Ll6ONEPUqz0C96jiEDYmdsA+c6mKaIHll1LPzGPxug39yth8uA1D9LoxZjDcTiN8ioXpw==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr8859561wrr.402.1629274133666; 
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j7sm4392349wmi.37.2021.08.18.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
Subject: Re: [PATCH v4] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, thuth@redhat.com,
 mark.cave-ayland@ilande.co.uk
References: <20210817192629.12755-1-jziviani@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9eee101-e88b-f085-0430-73704d742014@redhat.com>
Date: Wed, 18 Aug 2021 10:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817192629.12755-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 18 Aug 2021 08:09:02 -0000

On 8/17/21 9:26 PM, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v3 to v4: Used object_resolve_path_type instead of qemu_ram_block_by_name
>           and copied the message from virgl, to give the same user exp.
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>  hw/display/vga-isa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


