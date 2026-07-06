Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B516C43458
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Jul 2026 21:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wgqiz-0001xP-Hx; Mon, 06 Jul 2026 17:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgqiy-0001wt-3z
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 17:19:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgqiw-0005c7-1B
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 17:19:31 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666KEDS71665496
 for <qemu-trivial@nongnu.org>; Mon, 6 Jul 2026 21:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zq1DrS/UkWb7I+5+bjj/MxG+SnAZS8Tjg5gX+IoJ5Wc=; b=cyw4pGFjILL4LZUb
 gQSRx04r8kUNnQhpiSpFzoNmG1MS7bc3LXmxnylgHECt78wmMw9hDlusn47xD9RC
 kQyS0XWm8PWnoQvtjs9SDdVz8/dpGhc3XebWU2nc+8lqdAuoMH0VBwHVk/bLGeq/
 8cuQbPqCdGQJOdTpNVugf8TFuYox5t4/v9pr6vtknpY6giW5D75PJMmxZ/KZa11u
 dRNJxZpy7kxWEbAawN2IMbGBrz+CkqQdJ8QpcaNve9cViMVJJtFgKRgsyGJ5abNT
 BbteQjigj1qXxnQ9oKk0m8BrCEDe+D8mgpee0UDQkPGZuvPD/fwwUsEpwmQpSRcL
 Qdfxvw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gty4v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 21:19:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0ab07320so31696451cf.2
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783372767; x=1783977567; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zq1DrS/UkWb7I+5+bjj/MxG+SnAZS8Tjg5gX+IoJ5Wc=;
 b=B0UKufQt3qz230/wTrcIKWXkXa7QLlr8euQtJjmlH3TvNpRk0HuWi6+IIT68z0Nsda
 xW0H33RU5OnoGNvqnqLyWoS15iwL5SQubG55bAb/4d/Va6TZniMj+jzR6t0XzUv+h+OO
 AImBoA0Rle+/NaDXsAzjQwq11Gdct6wyO9g5U+24DBHB3FFaYTSFSJIaCE5IlGe67QVX
 h/9TOr1B5+XV/wJrrZAfXU4yMvS67bRhmBTTJECr7rf+9ti/EQhfE9bJvDa/UTfKU6uf
 RRaYvLUAlW1DHbued/tLPlSOf8e1oPmYCld/cCER1yUKaWrfheRPXRjUzHB9YtdLpllF
 lD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783372767; x=1783977567;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Zq1DrS/UkWb7I+5+bjj/MxG+SnAZS8Tjg5gX+IoJ5Wc=;
 b=MOY5QLykpMSQUiyoKGAkVsr+Vj8qb0TI3n/sR2g0JftZb40P3F1LZ3m/0KNKdMnarU
 99eCtUlel+b9oz5KFXOnEJ6weyD0cJ2tUwqU0TxZznZhuNI7G/JNDVIV0jcV655ivdow
 BcJOu0xvfSZ+5dKOWsn9vw+57RAWOId9wrVGn8QQxn2422trhOoKrh6S1O9hTlkd32lb
 P7Oi2U9mAioXx6Un5fBfUbn4y1VKn5VbTLChCxzg2CDTP9S9i05djF+iJC5ptu9guUl1
 wHjR2MX5O77G7fe26o5v+I062l6SuCSEXExNaUu/e8YhXlIm+IEnnA9T8HodcxkpMwda
 ULuw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpGWg6iYbYPVYQSQ55aG703y+3vqOexCRA1m1rstDcQ0coAXc//CIDxGxDVDGpy+U2kCD0+F8uyuxmf38g=@nongnu.org
X-Gm-Message-State: AOJu0YzDMDGDOK0NjSm6nqod489ZvlCp5SoOyaBVSygfa8KCQ8nPMR74
 RiGH2+PywINFTPs13nQRGNH27vY08aO/VvInaPJ6TYvObDwNz+Cn97UsqjrW2wtO04PbWLzl0rA
 O9Hz3/PUgkDx9ivWn04QCmS0mVBqjbACIBnfj+UN07yO09vdQovVcksucNExA
X-Gm-Gg: AfdE7cndJ3hTzf5+Z8qk7zIwvdGh4e6VaJZwaZQk7NDLB2SGnOkCmT/sVLGoIJODAdb
 12EY8msZ66d9KTSH/IKTnVzIQjMXtxT4hjrHZfDMIRVtLmtwqE0KHwhusiviQ9Rj4eWAJUiTA6z
 Mhu+9mJpwB9GdjyiJsHA1+bwJrL6JxIUwjE0W2w4r8R/lIh+DNh3SAui7Jtf7+iCXCZFm0AYkrx
 v+irPWc9hhPZeYuSiZhzdhUjs4FajLU+KwsT2LWP5nPrUs/G0LPBINySbnOOwzCBvj6LhY8Sz72
 ljXUne1dZ8lZ/CopP3Thm8PZSjrLp1a8Wqvq42R4rNi7d2HewzXTrW6b8deuGLURLcb0lXJ2E7G
 qeZ3j+i8qCLp0hKd6qzNspxy0IMtiDpNQa+/f5NkK5pM5cYPlKvQouPQR6HpWyg==
X-Received: by 2002:a05:622a:14ca:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-51c7479ed31mr30118201cf.19.1783372766859; 
 Mon, 06 Jul 2026 14:19:26 -0700 (PDT)
X-Received: by 2002:a05:622a:14ca:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-51c7479ed31mr30117741cf.19.1783372766362; 
 Mon, 06 Jul 2026 14:19:26 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f4e3afsm1311475e9.7.2026.07.06.14.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 14:19:25 -0700 (PDT)
Message-ID: <fdb45ef0-a709-413a-bc55-1bfcab648033@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 23:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
 <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
 <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
 <c0cd50bd-e054-48b6-af54-1050e13bb720@ilande.co.uk>
 <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
 <a60309be-c514-4b22-8970-ecfcf2b4fde7@oss.qualcomm.com>
 <c7b0d42c-4243-4f52-88ec-7f1deac160fc@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <c7b0d42c-4243-4f52-88ec-7f1deac160fc@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yrA39mnu4SNPahYx9ulu9VRSochIxq7r
X-Proofpoint-ORIG-GUID: yrA39mnu4SNPahYx9ulu9VRSochIxq7r
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c1be0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=jS8ohOMORicR5GROgbkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNSBTYWx0ZWRfXzum+H/4YSS6F
 M//k8M33c3bD8X9C8LLG7N8CAJaNUtZIK7ZXIC/sqnj6ytajRIMMKFbvlyv8E0G/zi6XiKY7gZL
 CGYyC51oUbuYWFcKGrQBKiYQpdGBR3hRbyCsinQYgcgNp8RaOuel9FXn7/9cpIgUljinodTIT2h
 kywHAd6VLv1VmZS6AX4ouzXFWHGYnTD7CzoLCyHMiq92wBRVE2/sl9H+gNeL1AGHQVBHLEX7+0X
 Ya+5y2YWT9c8T/RvjG8EFTTz4Q823+u/xiBARCa217Ol7fI/abxzrVjfNqWaT0GAV/qdRsbNxrt
 tGMsmFNlk/vOXwG28Z6Zh4l2nd1rY5RnZVK6NkKkApzjKXhxKVN8+ELiKbEA0lg3x4XPm0OhgNP
 RK5f3unhxM96ET0rj8WIircVfuLJJ+xV/NDZF/8WVh68mgR/oNMq0EQyhKDpEceTaA95yOewqeI
 a7lopdDpe5tSGTGTxQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNSBTYWx0ZWRfXy95ZEPHDobLU
 59cGZ8ntWXk+CvprqMTKP9vSU4OP5vBoyplwvojh1JlpjW+8V8Z2eRtiDvJBNZwAQX0S3Sz4WQ/
 5ZMaz1X2v697/vOY6IXqfYpRSxtMy/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060215
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hey Mark,

On 6/7/26 23:16, Mark Cave-Ayland wrote:
> On 06/07/2026 21:29, Philippe Mathieu-Daudé wrote:
> 
>> On 6/7/26 19:29, Philippe Mathieu-DaudÃ© wrote:
>>> Hi,
>>>
>>> On 30/6/26 00:20, Mark Cave-Ayland wrote:
>>>> On 29/06/2026 14:43, Thomas Huth wrote:
>>>>
>>>>> On 09/06/2026 08.02, Thomas Huth wrote:
>>>>>> On 08/06/2026 23.29, Mark Cave-Ayland wrote:
>>>>>>> On 08/06/2026 09:26, Michael Tokarev wrote:
>>>>>>>
>>>>>>>> On 30.04.2026 12:50, Thomas Huth wrote:
>>>>>>>>> On 09/03/2026 19.14, Thomas Huth wrote:
>>>>>>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>>>>>>
>>>>>>>>>> When trying to plug a PCI device to a Sparc64 machine, you 
>>>>>>>>>> currently
>>>>>>>>>> have to specify the right bus ("bus=pciB"), otherwise you get 
>>>>>>>>>> this error:
>>>>>>>>>>
>>>>>>>>>>   $ qemu-system-sparc64 -device virtio-scsi-pci
>>>>>>>>>>   qemu-system-sparc64: -device virtio-scsi-pci: PCI: no slot/ 
>>>>>>>>>> function
>>>>>>>>>>   available for virtio-scsi-pci, all in use or reserved
>>>>>>>>>>
>>>>>>>>>> This is quite annoying for the unexperienced users, and it 
>>>>>>>>>> also breaks
>>>>>>>>>> e.g. the iotests ("make check-block") when running with qemu- 
>>>>>>>>>> system- sparc64.
>>>>>>>>>>
>>>>>>>>>> Mark the non-usable PCI busses as full now, so that QEMU can 
>>>>>>>>>> automatically
>>>>>>>>>> plug new PCI devices to the right "pciB" bus.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>>>>> ---
>>>>>>>>>>   v2: Do the change in the machine code, not in the sabre device
>>>>>>>>>>
>>>>>>>>>>   hw/sparc64/sun4u.c | 7 +++++++
>>>>>>>>>>   1 file changed, 7 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>>>>>>>>>> index b8bda1eb816..37539535c6c 100644
>>>>>>>>>> --- a/hw/sparc64/sun4u.c
>>>>>>>>>> +++ b/hw/sparc64/sun4u.c
>>>>>>>>>> @@ -723,6 +723,13 @@ static void sun4uv_init(MemoryRegion 
>>>>>>>>>> *address_space_mem,
>>>>>>>>>>       fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_DEPTH, 
>>>>>>>>>> graphic_depth);
>>>>>>>>>>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>>>>>>>>>> +
>>>>>>>>>> +    /*
>>>>>>>>>> +     * Mark internal PCI busses as full so that the plugging 
>>>>>>>>>> of additional
>>>>>>>>>> +     * PCI devices happens on the right bus that still has 
>>>>>>>>>> free slots:
>>>>>>>>>> +     */
>>>>>>>>>> +    qbus_mark_full(&pci_bus->qbus);
>>>>>>>>>> +    qbus_mark_full(&pci_busA->qbus);
>>>>>>>>>>   }
>>>>>>>>>>   enum {
>>>>>>>>>
>>>>>>>>> Friendly ping!
>>>>>>>>
>>>>>>>> This, being a simple change, somehow has not been reviewed 
>>>>>>>> still, so
>>>>>>>> it's sitting in the queue...
>>>>>>>
>>>>>>> Yes, apologies - I've been absolutely flat out recently, and I've 
>>>>>>> got a note to take a look at this and Peter's patch as soon as I 
>>>>>>> can.
>>>>>>>
>>>>>>> Is this fixing an urgent issue with "make check-block" or similar?
>>>>>>
>>>>>> It's not urgent since this has been broken forever, but yes, it 
>>>>>> fixes "make check- block" for the case where sparc64 is the only 
>>>>>> available target during "configure -- target-list=sparc64-softmmu" 
>>>>>> and thus the iotests run with qemu- system-sparc64.
>>>>> Ping!
>>>>>
>>>>> While it's not urgent, soft-freeze date is in a week, so it would 
>>>>> be nice to get this merged before it misses another release ... WDYT?
>>>>
>>>> Hi Thomas,
>>>>
>>>> I'm still playing catch-up a bit here, but I can't immediately find 
>>>> my notes on using pciA under QEMU. I think if it fixes the iotests 
>>>> then go ahead and merge it for now, which gives me time in freeze to 
>>>> investigate any reported issues.
>>
>>
>>> Anyway, back to the problem here, the first part is indeed as noticed
>>> Thomas to use qbus_mark_full() for the root bus:
>>>
>>> -- >8 --
>>> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
>>> index cd2328ad53f..6a8d0b6c6d2 100644
>>> --- a/hw/pci-host/sabre.c
>>> +++ b/hw/pci-host/sabre.c
>>> @@ -400,6 +400,9 @@ static void sabre_realize(DeviceState *dev, Error 
>>> **errp)
>>>       s->bridgeA = PCI_BRIDGE(pci_dev);
>>>       pci_bridge_map_irq(s->bridgeA, "pciA", pci_simbaA_map_irq);
>>>       pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
>>> +
>>> +    /* Only in-built Simba APBs can exist on the root bus */
>>> +    qbus_mark_full(&phb->bus->qbus);
>>>   }
>>>
>>>   static void sabre_init(Object *obj)
>>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>>> index d69ed9a81ac..b65f3d1a140 100644
>>> --- a/hw/sparc64/sun4u.c
>>> +++ b/hw/sparc64/sun4u.c
>>> @@ -546,7 +546,7 @@ static void sun4uv_init(MemoryRegion 
>>> *address_space_mem,
>>>       unsigned int i;
>>>       uint64_t initrd_addr, initrd_size, kernel_addr, kernel_size, 
>>> kernel_entry;
>>>       SabreState *sabre;
>>> -    PCIBus *pci_bus, *pci_busA, *pci_busB;
>>> +    PCIBus *pci_busA, *pci_busB;
>>>       PCIDevice *ebus, *pci_dev;
>>>       SysBusDevice *s;
>>>       DeviceState *iommu, *dev;
>>> @@ -588,14 +588,13 @@ static void sun4uv_init(MemoryRegion 
>>> *address_space_mem,
>>>               qdev_get_gpio_in_named(DEVICE(cpu), "ivec-irq", i));
>>>       }
>>>
>>> -    pci_bus = PCI_HOST_BRIDGE(sabre)->bus;
>>>       pci_busA = pci_bridge_get_sec_bus(sabre->bridgeA);
>>>       pci_busB = pci_bridge_get_sec_bus(sabre->bridgeB);
>>>
>>> -    /* Only in-built Simba APBs can exist on the root bus, slot 0 on 
>>> busA is
>>> -       reserved (leaving no slots free after on-board devices) 
>>> however slots
>>> -       0-3 are free on busB */
>>> -    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
>>> +    /*
>>> +     * Slot 0 on busA is reserved (leaving no slots free after on-board
>>> +     * devices) however slots 0-3 are free on busB
>>> +     */
>>>       pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
>>>       pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
>>>
>>> ---
>>>
>>> I'm still looking at the 2nd part, the reserved slots.
>>
>> (Because with this patch, the test passes as we can plug devices from
>> the command line, but they end plugged on pciA instead of pciB -- thus
>> the 2nd part missing).
> 
> Thanks for taking a look, Phil. IIRC the reason I added 
> slot_reserved_mask was so that it was possible to populate pciA 
> programatically in sun4uv_init(), and then enable the mask so that 
> specifying an additional PCI device using -device on the command line 
> without an explict PCI bus would cause the automatic allocation to place 
> the device on pciB.

The slot_reserved_mask calls make sense, but AFAICT they don't work as
expected, since CLI devices are added on pciA. If you want to have a
look on top of this snippet, be my guest! Otherwise I'll continue
debugging that tomorrow, long day and late here :\

Regards,

Phil.


