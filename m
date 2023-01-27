Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLKyi-0001nT-I0
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2023 04:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pLKyh-0001n2-PB
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 04:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pLKye-0004cU-VN
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 04:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674811495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3BaXnZwSRYami6lWXFihpFr1wdXWA1/2+waWSKM4oA=;
 b=F11+WUDF5dqpW6B14F2f7tL3QDsgte30EDyQeMMABTNqeWrr1tIndpm2dy6thaPRTStI9S
 WrUpcZKAYHG2eeiPOnNkVqwFuoRZ6cq3raWFh5JZ850uGeGlaX+0yrl6sbOGsFclWDvBLM
 +T1uAGHk9l313nWjd5sZHyisGABCbSg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-e6g5qaAOMayvKK66wZxGtg-1; Fri, 27 Jan 2023 04:24:54 -0500
X-MC-Unique: e6g5qaAOMayvKK66wZxGtg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bm30-20020a05620a199e00b007090f3c5ec0so2679635qkb.21
 for <qemu-trivial@nongnu.org>; Fri, 27 Jan 2023 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L3BaXnZwSRYami6lWXFihpFr1wdXWA1/2+waWSKM4oA=;
 b=GRartH9qSV09CrMv3WG9rLG8jR5ZoeYPVFUm7W4P3aGWdUMC8pmyLiRRPcD7FIlQzm
 7fATYudvscND4R0fzZXlasjYMRXt7J6J3uXp/892IusRkiZirE9UXuhEYnjfVAkG+PGS
 HUzQm1hEWZ0n68qyVxCmvmShPazC1w4nHkIeR0Vjy7e0MpDVk6sNJHvl+qepZNCRSove
 zLvdxRUkSISRhxWqxGG0uHMuVNGH6cquvwopPCAUen3U0yZK9XoAYJ8M58dKsMkEJyPs
 wzRkqYzpv0MYQzi3V1zUXCiA+RhQkYlogjcNGmv1MGwcbZHDr3yGFbMM4xZw5v7tFVep
 Fttg==
X-Gm-Message-State: AFqh2kr0rDQyJy9K1Ce+7maQFJvnx/sGLdZ8fkSvNRgzyAcAq63Oq7rE
 OYZVI2Pi3ONuyhkFTHdTHccjQ4Yfxz2TaTu+eaG+UZ10xdgUXWNXMP4DhSE1hoFpyaggwvMYkg5
 vj9gBkFNpXz1qLcgeWw==
X-Received: by 2002:a05:622a:22a6:b0:39c:da20:f7af with SMTP id
 ay38-20020a05622a22a600b0039cda20f7afmr57708475qtb.12.1674811494057; 
 Fri, 27 Jan 2023 01:24:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSQ88y1d32wqprPAjGmYZH4lrRJbdO3L6AlhQgTbMwKY0juVJqlaoA6fHzmGJ7e+iC/iPgtQ==
X-Received: by 2002:a05:622a:22a6:b0:39c:da20:f7af with SMTP id
 ay38-20020a05622a22a600b0039cda20f7afmr57708462qtb.12.1674811493755; 
 Fri, 27 Jan 2023 01:24:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a05620a22b900b00706c1f7a608sm274094qkh.89.2023.01.27.01.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 01:24:53 -0800 (PST)
Message-ID: <7fdfe6af-cb74-a29c-67bd-bfa0480397c0@redhat.com>
Date: Fri, 27 Jan 2023 10:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, cohuck@redhat.com, qemu-trivial@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230127084604.53175-1-smitterl@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230127084604.53175-1-smitterl@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2023 09:25:00 -0000

On 1/27/23 09:46, Sebastian Mitterle wrote:
> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.
> 
> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> 
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
> v2: move section below 'Device support'
> ---
>   docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
>   docs/system/target-s390x.rst     |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 docs/system/s390x/pcidevices.rst
> 
> diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> new file mode 100644
> index 0000000000..fec905d6e6
> --- /dev/null
> +++ b/docs/system/s390x/pcidevices.rst
> @@ -0,0 +1,34 @@
> +PCI devices on s390x
> +====================
> +
> +PCI devices on s390x work differently than on other architectures.
> +
> +To start with, using a PCI device requires the additional ``zpci`` device. For example,
> +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> +
> +Here, the zpci device is joined with the PCI device via the ``target`` property.
> +
> +Note that we don't set bus, slot or function here for the guest as is common in other
> +PCI implementations. Topology information is not available on s390x. Instead, ``uid``
> +and ``fid`` determine how the device is presented to the guest operating system.
> +
> +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> +``fid`` identifies the physical slot, i.e.::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> +                   ...
> +
> +will be presented in the guest as::
> +
> + # lspci -v
> + 0007:00:00.0 ...
> + Physical Slot: 00000008
> + ...
> +
> +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
> +it.
> diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
> index c636f64113..f6f11433c7 100644
> --- a/docs/system/target-s390x.rst
> +++ b/docs/system/target-s390x.rst
> @@ -26,6 +26,7 @@ or vfio-ap is also available.
>      s390x/css
>      s390x/3270
>      s390x/vfio-ccw
> +   s390x/pcidevices
>   
>   Architectural features
>   ======================


