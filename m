Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLKy0-0001dC-UL
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2023 04:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pLKxy-0001cp-Ig
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 04:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pLKxw-0003oX-UL
 for qemu-trivial@nongnu.org; Fri, 27 Jan 2023 04:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674811452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZpBPAmNs37lFbHisocXNi1mrCynDUloBAOaoI6PFLc=;
 b=gotLkDJB1GP2lRamXu1uVm/1YWBmHcuptzBinU2I56k9MlxHdO9oZ11SM4dHC1kmnNM8h8
 HzAIvxeEuHKPKvXro9/0eOzYfD3ueuPC8uz6w9Q30gWF9/pzZH+lnZHvK+aR8SD6QMnjeH
 qww8qNpZhTSc4q3puLXIIbnFl7jwi7c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-34oRdjBZNKelpsTS8IqtPQ-1; Fri, 27 Jan 2023 04:24:09 -0500
X-MC-Unique: 34oRdjBZNKelpsTS8IqtPQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 kr11-20020a0562142b8b00b005355b472a65so2520863qvb.7
 for <qemu-trivial@nongnu.org>; Fri, 27 Jan 2023 01:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IZpBPAmNs37lFbHisocXNi1mrCynDUloBAOaoI6PFLc=;
 b=LoU2AkBiApS4fJaDy7P0IlPwnToHijZYwC4Z5eGpoNMsErqhgr+oylZeLPrY0vz/dv
 GT40pTp48TypYu5lRlraFrfhFMU4nghpIE1U3xAtts0dKKdVTOHO0RCXwLTv37AD1Lr3
 pWC/ieeDo4ZSYRCl4vi9JPvaQ3RqmGHenoZrkwXWgwmGIcuAU6awYyOfuDmu1bNTnAiQ
 UNoywj1uRbCy+Yg0o+RZ6zuo1KIZzGOd+RLnFvcW1fFrdnnxHbmuiXL2gMu6RYNVEPPO
 41mrBZC+sDXsZAbaQe7kKQbtXhu2U/Yh57ZfP7oTTmpfOslB/OG8P23Gg0PEs4drRY5h
 zIpg==
X-Gm-Message-State: AO0yUKUVbVEs7JqNGO8Nipfw5G1HnCkVain38nk3M066sm9ZecT1Ivtx
 dTG0mcKJlRzJkEMPA70BUQ3DGdsV+8mKEYwMqEj++tPAmORNrGdPGQ7p6vTBTXChEf3G1AyX6u2
 Ffg1Q+EO6QWAsXZth2g==
X-Received: by 2002:ad4:44b3:0:b0:537:7ca2:6087 with SMTP id
 n19-20020ad444b3000000b005377ca26087mr8908634qvt.49.1674811448743; 
 Fri, 27 Jan 2023 01:24:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9TPW4lG4Wen8dK58SkhRmIDsfYsy4RCDoOpKwkayWlk5fA125Bjz7pg+kUI0yEfuLPNKAqog==
X-Received: by 2002:ad4:44b3:0:b0:537:7ca2:6087 with SMTP id
 n19-20020ad444b3000000b005377ca26087mr8908617qvt.49.1674811448536; 
 Fri, 27 Jan 2023 01:24:08 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 x64-20020a379543000000b007090f7a4f2asm2087621qkd.82.2023.01.27.01.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 01:24:07 -0800 (PST)
Message-ID: <46642f8f-d514-798b-1e4e-bc337a206c38@redhat.com>
Date: Fri, 27 Jan 2023 10:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: cohuck@redhat.com, clegoate@redhat.com, qemu-trivial@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230127084604.53175-1-smitterl@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
In-Reply-To: <20230127084604.53175-1-smitterl@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 27 Jan 2023 09:24:15 -0000

On 27/01/2023 09.46, Sebastian Mitterle wrote:
> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.

Thanks for tackling this! ... some comments below...

> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> 
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
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

Please wrap lines at 80 columns (if possible)

> +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::

I'd suggest to be more explicit here:

in order to pass a host PCI device ``0000:00:00.0`` through to the guest, 
you would specify::

> + qemu-system-s390x ... \
> +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> +
> +Here, the zpci device is joined with the PCI device via the ``target`` property.
> +
> +Note that we don't set bus, slot or function here for the guest as is common in other

"as *it* is common" ?

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

s/oder/order/

(and it's a very long line again, please wrap at 80 columns)

> +it.

Should we also add some information about virtio devices? (can also be added 
later, not necessarily in your patch already)

  Thomas


