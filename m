Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jihzI-0002oC-AI
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2020 13:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jihzF-0002jV-NP
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 13:24:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42390
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jihzE-0002fg-R7
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 13:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591723471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrtYesPsePE2y6iNnLBQDttdg+4PmQO/LvWsKOtEWXw=;
 b=GpPtewdxGZu7cY44Nh6XupuVFR2VWwVeG3TMD9FNXqdkW6kUXsRbI/+7/OJopqKX14JOXX
 QKv61zm6OsdICH2Nb0jHOs83gE3Nt8PGN1GulxdU3uUFsnij8FZtYNQmBdra3edqz1huA/
 MHbWr7u2ggXNzSoWtn909HwSbIsIbW4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-1i1bIp7pNguDsN1WrMZDdw-1; Tue, 09 Jun 2020 13:24:27 -0400
X-MC-Unique: 1i1bIp7pNguDsN1WrMZDdw-1
Received: by mail-wm1-f69.google.com with SMTP id b63so1130354wme.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2020 10:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrtYesPsePE2y6iNnLBQDttdg+4PmQO/LvWsKOtEWXw=;
 b=mPE3Q4umhiCrVRsslQLpYW/bd77cK9Vv43XlTAqckR8jcnpiHAa66L5QKlavMlLVvL
 qlskNmwiC/7OacK6E8Db9oDz5RDXZJFi4FmtRRv7QCdhGU/IGBkqG9xoE77tICJr7NYZ
 gZkGZN1Y4WdaYIIIjlR3eIGfEm79esM/mlOB8PfKy3tf8g6AOBDGbQuSZzsp8MDknz/2
 3Y1XA21DUb9I3XZuySIbywUNHaY9mCF0bsgpjk4PzayskNwKI7Rhv7fDOAkEEsDlt/hB
 dUiMkdL8WuA0q2Pe5qOTwX/pA+WOovlpExghT6DU1t3o2ZXStE4AnDJy960K8TwNMSt8
 4r5g==
X-Gm-Message-State: AOAM531UHmThNyjrNsoywlVZivKX1JsS91F+wvWUSsXyjn6K0uH1wHxI
 wRA3XLvQZiSD0CAcJK4vYCDxXMy1R9LZGjkwyRQdOdn4OVvrNZhlCp80Kzd63Gw+RpDA9LhIcv5
 5afLkIgpJs/ykyKjSvQ==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr5691373wrp.370.1591723465847; 
 Tue, 09 Jun 2020 10:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6wj83d7xAVAMCyYBWBX24SfkMqR+VtAowdjtSMeZXCMVmq2bOCIz5z3HIhKTY35cP6DtiDg==
X-Received: by 2002:adf:f4d2:: with SMTP id h18mr5691347wrp.370.1591723465569; 
 Tue, 09 Jun 2020 10:24:25 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u130sm3638551wmg.32.2020.06.09.10.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:24:24 -0700 (PDT)
Subject: Re: [PATCH] hw/pci: Fix crash when running QEMU with "-nic
 model=rocker"
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20200527153152.9211-1-thuth@redhat.com>
 <bead355e-de7f-e584-53a7-34b2f1664be4@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7e862bc4-0d5d-298e-0d1b-b8249100da9c@redhat.com>
Date: Tue, 9 Jun 2020 19:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bead355e-de7f-e584-53a7-34b2f1664be4@vivier.eu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:44:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 17:24:34 -0000

On 09/06/20 19:21, Laurent Vivier wrote:
> Le 27/05/2020 à 17:31, Thomas Huth a écrit :
>> QEMU currently aborts when being started with "-nic model=rocker" or with
>> "-net nic,model=rocker". This happens because the "rocker" device is not
>> a normal NIC but a switch, which has different properties. Thus we should
>> only consider real NIC devices for "-nic" and "-net". These devices can
>> be identified by the "netdev" property, so check for this property before
>> adding the device to the list.
>>
>> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
>> Fixes: 52310c3fa7dc854d ("net: allow using any PCI NICs in -net or -nic")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/pci/pci.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 70c66965f5..46214f8287 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -1887,7 +1887,18 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>>          if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
>>              dc->user_creatable) {
>>              const char *name = object_class_get_name(list->data);
>> -            g_ptr_array_add(pci_nic_models, (gpointer)name);
>> +            /*
>> +             * A network device might also be something else than a NIC, see
>> +             * e.g. the "rocker" device. Thus we have to look for the "netdev"
>> +             * property, too. Unfortunately, some devices like virtio-net only
>> +             * create this property during instance_init, so we have to create
>> +             * a temporary instance here to be able to check it.
>> +             */
>> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
>> +            if (object_property_find(obj, "netdev", NULL)) {
>> +                g_ptr_array_add(pci_nic_models, (gpointer)name);
>> +            }
>> +            object_unref(obj);
>>          }
>>          next = list->next;
>>          g_slist_free_1(list);
>>
> 
> Not really trivial, I will not pick up this patch via trivial-branch,
> unless PCI maintainers request it.
> 
> Thanks,
> Laurent
> 

I'll pick it up then.

Paolo


