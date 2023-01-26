Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL30V-0005Ip-Sz
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2023 09:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pKxK3-0001Xj-Lm
 for qemu-trivial@nongnu.org; Thu, 26 Jan 2023 03:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1pKxK2-00032m-2k
 for qemu-trivial@nongnu.org; Thu, 26 Jan 2023 03:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674720565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8Qoxrqa327pKhERwNc4VgKU9oOYUofgJEx8sVwqNNw=;
 b=cRlEyiL05LJG2MyPtZe7zu67x0yG8zgQQ38I2xKE/oQ1o0vw6Ezcp7yj87NkNJy840YVCI
 UDeuqR6mC65ZfyoTW73a6Anf6MZhtKByIGHK97Kaet0vGJRhYSZ+TLZlDBjiTYpXyvCzT4
 UVrjmn8ATmzUGfYTXdXtR4wLd2KVzQw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-wr5IAsGaNhyWpsPQ0NLX0Q-1; Thu, 26 Jan 2023 03:09:21 -0500
X-MC-Unique: wr5IAsGaNhyWpsPQ0NLX0Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 e5-20020a056214110500b0053547681552so697742qvs.8
 for <qemu-trivial@nongnu.org>; Thu, 26 Jan 2023 00:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8Qoxrqa327pKhERwNc4VgKU9oOYUofgJEx8sVwqNNw=;
 b=PI2TOdnldi8fyulqEjK5/DJRJGSv7O3hgSGqSgSY68kuXzzsejG75hjTPCyY3NDsCa
 mVY39naahr63MFJjzZfgDVod4r0NMKHe76VpAQvWXhHEAtPCvjkp7Oj5BWaFVPCAraVz
 7k5gAmD7NfEKSvFWelvihRzDLUKKZ9sqlinG/5lknboVzk5MMTtJcXsfA1uDsCaPYvso
 HGkrCRluPCE0/DzeXYHMRo/NKPmftN9wuj3VHTbPy1eHwaCfR+DMHdrpHBDKm3m2UftX
 XQD63OGtS68Ob5o7simVFo0i+wcD1TrEYXiY34EqZJYyjJ/cQ9aIIK22s9DBkk3XqX5R
 HAeA==
X-Gm-Message-State: AFqh2koT0hArTjbdouuEe2bNJXC9vj0m+eftnTuE3VTT7pRQDlJgNmBz
 XlE/Sa1m7Oz9xOCSN4/Vr0oyqJ3hwsHf/wWQxRN4ExRDK7eosaXoGet98o6ELfQxZzNfj2j7M/K
 PW4ki4BWLC21HlmGUjg==
X-Received: by 2002:ac8:718d:0:b0:3b6:3508:2a3e with SMTP id
 w13-20020ac8718d000000b003b635082a3emr49728029qto.4.1674720561174; 
 Thu, 26 Jan 2023 00:09:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0RVNTifLaj7sXEEuZ9w2pHUArFVviRMBIpdEmCXmvHoDD0ds+PNwNDEegfUVmElwI7Bogfg==
X-Received: by 2002:ac8:718d:0:b0:3b6:3508:2a3e with SMTP id
 w13-20020ac8718d000000b003b635082a3emr49728012qto.4.1674720560897; 
 Thu, 26 Jan 2023 00:09:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a05620a127700b00704c6263924sm547357qkl.13.2023.01.26.00.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 00:09:20 -0800 (PST)
Message-ID: <00021f81-d7d8-22eb-6ee6-6243e58d61ad@redhat.com>
Date: Thu, 26 Jan 2023 09:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] docs/s390x/pcidevices: document pci devices on s390x
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-trivial@nongnu.org, thuth@redhat.com,
 cohuck@redhat.com
References: <20230125171530.49542-1-smitterl@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230125171530.49542-1-smitterl@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Jan 2023 09:13:38 -0500
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
X-List-Received-Date: Thu, 26 Jan 2023 08:09:27 -0000

On 1/25/23 18:15, Sebastian Mitterle wrote:
> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.
> 
> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> 
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> ---
>   docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
>   docs/system/target-s390x.rst     |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 docs/system/s390x/pcidevices.rst
> 
> diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> new file mode 100644
> index 0000000000..2086c1ca29
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
> index c636f64113..fe8251bdef 100644
> --- a/docs/system/target-s390x.rst
> +++ b/docs/system/target-s390x.rst
> @@ -33,3 +33,4 @@ Architectural features
>   .. toctree::
>      s390x/bootdevices
>      s390x/protvirt
> +   s390x/pcidevices

Why not under the "Device support" section ?

C.


