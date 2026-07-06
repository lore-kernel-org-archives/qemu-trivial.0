Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97D2C43602
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Jul 2026 17:30:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wgn8m-0006DP-UB; Mon, 06 Jul 2026 13:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgn8j-00067f-46
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 13:29:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgn8g-0003I5-DS
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 13:29:52 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666FFIeb762537
 for <qemu-trivial@nongnu.org>; Mon, 6 Jul 2026 17:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L50LWVonixc/e87WUfMbnTbdyzuF1Mr8ooTNMgcXdO8=; b=mI51rWTGeyIJe6kx
 vRtDju0pkcLhnO5032AE3SYTyB270JaKyzL8nQqfQjVWRs2YbZhunuGxzMAUrKgj
 Cpo7ldE84Bvv4dcvj0VRv4iWnFAvk5Xo6GsuXaa9zLXDEDssziksowMy0qTnBrNL
 SGDNySoyyIA9pXVU2Gv7dB/ilZvsSC5UaeGbQBpBRFfkQuqJip+ITzOxUkevNWTv
 8kYpjGr+TndaG8ubldJODdlhPEEM6WMh+xFGzXnltz/LXYJHFybbfvLIb40FXhio
 dhQI7+ihM4HViAvA9+UnldiIfW1LS47TigimtQHjGAIGYie/1sPCf60qFmjnmy8r
 6Ta4QA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtrwc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 17:29:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92aea0d801dso318043385a.1
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783358987; x=1783963787; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L50LWVonixc/e87WUfMbnTbdyzuF1Mr8ooTNMgcXdO8=;
 b=KTesA6/jW8GZ8y7A4CSKfS3E2ymKdpJ8ca0aZQwSx1NZH3D5608oCGyceA4cRRT/d5
 42hx+UgYBs5IN6Ed/SMzx3hPwRXMstZbRmPNSb2heLJ1Q1nrWXHI8I0HN2qUvCrJWe8N
 fM6qShEfhA8x7LGe03iLbaSe7WdzALIFmuPPF1katbEVfeRGEGNmXaHzIVC6B77CWzw7
 YPXImPvL7GPeapkSXZsrTHxWqAMjxY0UvZN9m8TVworxoxOjv0khMKlLTt/w65Bi32+F
 z/8q4DeCpzZsyp6gake/mbtqEG1g8royrr6TPQ/QBMlHJmvkO/XnPpCYhQ9h1ptRQ/zt
 Er8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783358987; x=1783963787;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L50LWVonixc/e87WUfMbnTbdyzuF1Mr8ooTNMgcXdO8=;
 b=fAx3yOpgKuEZ3zifDhUNqBkuoymzW483SPKpCO8YpUliE4QVGIUwCHd2Dpch6SJF/X
 deEUYEbBgTw88cc/mN2IQyhk4T9GeV0NLNrTTltp4MM6r0efo70YNWIK1dpKwwhQeWib
 4MTfTPYsQ+gTqpJdi5Co5ikpIUN+6jTIJ4LeS8QdZwOPcqf0ano9Hga2VCORXW1uA/b3
 MaHM47cLL1bot19raoekylKQF62upRsSw3pJJ+WF4oxUs+cJKyPSYij1h0CXe2WtL/AP
 4a+0JbLR5KCeQk/aRt+ZGZpC03LMwLB3GgkWqoLRu/6lu00l4blNzlZeVbO/2rucJS2F
 89fA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6LKnQsw49G7/M5D0w29d/DJiwu14dMcagrm6f9/EXuiswrMmA7108q0FHC0yX8L8Zrs0p1fdpBe5srEM=@nongnu.org
X-Gm-Message-State: AOJu0YzE/9GREgsz1zivJJw5O6gcQsD+4XTdqu1dtbvwykMDtb1vToLH
 KEgd/0jqJXCC4OJgWlSx5P0RlK4URFIC1sPOEbrBM2rRjMR6NtM3Na/6P3knaYR5n2kP+EvlLGm
 qQRMS4pRoValZubUMBahPEIWjjyAbk4YZ5v/Um5xI2Kgc3WjXQgatHn8wBWFk
X-Gm-Gg: AfdE7ckvk6ShKF5JRsCMR0q4f3pejM7aX4OODA5XZo5zvKuFify68Mc+U0q5CJWwClo
 9JeBYX6XlVnTacU3wOE58I/8A1xHlS3Aw5sUrcr9pFnj+00q0XXheMszTnfydODK+miAXxDSYBp
 3nN+tBWuoa64kThQtuNXlcSil6f9ATuu42ezlKgv3gK+JiHtUB8LquMuRFuBoNvxVayX9zAGjdx
 KFm1bcgNAdXVqBcVgsABs96ZOjOIRQ0IEfcyQqhtwRB5YMdQ9R2sfn9OzXqEmGv4MOdO9EriZlq
 tXjW472IZiX5U19dSL8HPDaKCzrdm83j5nmeI67OW5GmgMc3BVgxzSd0+B2Uq7WAJAB8/sYvdVO
 zo4kpSQ7+i0EISkL90Goc3LPLZECQQDWzCt217fcUMYqTMcsbN2V56h2Pwd33HA==
X-Received: by 2002:a05:620a:6014:b0:92e:603f:1f20 with SMTP id
 af79cd13be357-92ebb4a958amr208456485a.2.1783358986938; 
 Mon, 06 Jul 2026 10:29:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6014:b0:92e:603f:1f20 with SMTP id
 af79cd13be357-92ebb4a958amr208451285a.2.1783358986321; 
 Mon, 06 Jul 2026 10:29:46 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef23feasm350576855e9.2.2026.07.06.10.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 10:29:45 -0700 (PDT)
Message-ID: <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:29:44 +0200
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <c0cd50bd-e054-48b6-af54-1050e13bb720@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZQjRyQuYanIsq4f5bOBMhISbitwdEJJG
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4be60c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=qaPWF_J4CJ_GKUZ_ancA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3NSBTYWx0ZWRfX39XY+9I42SIf
 6tQNxBiQ5cgIxFi9eotYwhmnrA7x2+RmKBaXOdmoqQABzXkbsVRXiYVlOUjoLsLpxMTMQyG7RVn
 nDSQDlr6q0PHmprqhyKqK7jKtV4aFoM=
X-Proofpoint-GUID: ZQjRyQuYanIsq4f5bOBMhISbitwdEJJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3NSBTYWx0ZWRfXxOlNHcnregE6
 5W+zOBZWS75WPkMh60Tf50ylOX9dkj5McMaUSvQBndcLqTOEBMr0vdqS/9qnheUx9IOd4eFi9Or
 IfiX7i2oo2Wmyvsj3gZcLF2qkmTatOLceIn4Kl7c11vd5JM7YLHUd1ivbdfoUuPWj+UhOau0R4a
 7DqYAbZSJSqGs0tnhkPlOb1S+e4cxoSu00/hL8BW/BS9U/9VqOga4sC7jRSCuj3Ke1MNy8C4KKb
 B+Inrk9Rf34pPNHBRJZGXdLRTx7v+6zpDrz/d2aHd7SYjDy3zETBxMN1Dz0jRGS7CnGnNIL+/cd
 kuRGoGLIx3OU0eE3TPAin7j/+yqZlNc4pK3jznVTv3vILCStZv/ZO21o9mgCYdJx/LAdICrU5eV
 kso/hQaDXPgvm6oIE4KHz5mo0JqPOs9uYvyXs8QSDEGYFjxUijJg90Nmr3kcgZUqW37azx6mlNK
 VxC0vOppro0K87I6ovQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060175
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 30/6/26 00:20, Mark Cave-Ayland wrote:
> On 29/06/2026 14:43, Thomas Huth wrote:
> 
>> On 09/06/2026 08.02, Thomas Huth wrote:
>>> On 08/06/2026 23.29, Mark Cave-Ayland wrote:
>>>> On 08/06/2026 09:26, Michael Tokarev wrote:
>>>>
>>>>> On 30.04.2026 12:50, Thomas Huth wrote:
>>>>>> On 09/03/2026 19.14, Thomas Huth wrote:
>>>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>>>
>>>>>>> When trying to plug a PCI device to a Sparc64 machine, you currently
>>>>>>> have to specify the right bus ("bus=pciB"), otherwise you get 
>>>>>>> this error:
>>>>>>>
>>>>>>>   $ qemu-system-sparc64 -device virtio-scsi-pci
>>>>>>>   qemu-system-sparc64: -device virtio-scsi-pci: PCI: no slot/ 
>>>>>>> function
>>>>>>>   available for virtio-scsi-pci, all in use or reserved
>>>>>>>
>>>>>>> This is quite annoying for the unexperienced users, and it also 
>>>>>>> breaks
>>>>>>> e.g. the iotests ("make check-block") when running with qemu- 
>>>>>>> system- sparc64.
>>>>>>>
>>>>>>> Mark the non-usable PCI busses as full now, so that QEMU can 
>>>>>>> automatically
>>>>>>> plug new PCI devices to the right "pciB" bus.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>> ---
>>>>>>>   v2: Do the change in the machine code, not in the sabre device
>>>>>>>
>>>>>>>   hw/sparc64/sun4u.c | 7 +++++++
>>>>>>>   1 file changed, 7 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
>>>>>>> index b8bda1eb816..37539535c6c 100644
>>>>>>> --- a/hw/sparc64/sun4u.c
>>>>>>> +++ b/hw/sparc64/sun4u.c
>>>>>>> @@ -723,6 +723,13 @@ static void sun4uv_init(MemoryRegion 
>>>>>>> *address_space_mem,
>>>>>>>       fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_DEPTH, graphic_depth);
>>>>>>>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Mark internal PCI busses as full so that the plugging of 
>>>>>>> additional
>>>>>>> +     * PCI devices happens on the right bus that still has free 
>>>>>>> slots:
>>>>>>> +     */
>>>>>>> +    qbus_mark_full(&pci_bus->qbus);
>>>>>>> +    qbus_mark_full(&pci_busA->qbus);
>>>>>>>   }
>>>>>>>   enum {
>>>>>>
>>>>>> Friendly ping!
>>>>>
>>>>> This, being a simple change, somehow has not been reviewed still, so
>>>>> it's sitting in the queue...
>>>>
>>>> Yes, apologies - I've been absolutely flat out recently, and I've 
>>>> got a note to take a look at this and Peter's patch as soon as I can.
>>>>
>>>> Is this fixing an urgent issue with "make check-block" or similar?
>>>
>>> It's not urgent since this has been broken forever, but yes, it fixes 
>>> "make check- block" for the case where sparc64 is the only available 
>>> target during "configure -- target-list=sparc64-softmmu" and thus the 
>>> iotests run with qemu-system-sparc64.
>> Ping!
>>
>> While it's not urgent, soft-freeze date is in a week, so it would be 
>> nice to get this merged before it misses another release ... WDYT?
> 
> Hi Thomas,
> 
> I'm still playing catch-up a bit here, but I can't immediately find my 
> notes on using pciA under QEMU. I think if it fixes the iotests then go 
> ahead and merge it for now, which gives me time in freeze to investigate 
> any reported issues.

I wasn't sure whether merging this patch now or wait for your update
during the freeze so hold my PR for a bit; today I looked a bit at it.

Some notes:

- pci_bus_*_slot_reserved_mask() API isn't much used. I supposed it
   worked for a pair of corner cases but doesn't scale (I expect it
   to be called in more code paths).

- Bus capacity is odd. We have a generic Bus-class @max_dev field but
   do not use it with PCI variants. If set, it limit the instances
   capacity. The capacity is tracked in the instance state, and when
   no @max_dev is set the only way to mark a bus full is using the
   qbus_mark_full() helper. Then if we remove devices, the bus remains
   full, and there is no helper to restore available slots.


Anyway, back to the problem here, the first part is indeed as noticed
Thomas to use qbus_mark_full() for the root bus:

-- >8 --
diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
index cd2328ad53f..6a8d0b6c6d2 100644
--- a/hw/pci-host/sabre.c
+++ b/hw/pci-host/sabre.c
@@ -400,6 +400,9 @@ static void sabre_realize(DeviceState *dev, Error 
**errp)
      s->bridgeA = PCI_BRIDGE(pci_dev);
      pci_bridge_map_irq(s->bridgeA, "pciA", pci_simbaA_map_irq);
      pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
+
+    /* Only in-built Simba APBs can exist on the root bus */
+    qbus_mark_full(&phb->bus->qbus);
  }

  static void sabre_init(Object *obj)
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d69ed9a81ac..b65f3d1a140 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -546,7 +546,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
      unsigned int i;
      uint64_t initrd_addr, initrd_size, kernel_addr, kernel_size, 
kernel_entry;
      SabreState *sabre;
-    PCIBus *pci_bus, *pci_busA, *pci_busB;
+    PCIBus *pci_busA, *pci_busB;
      PCIDevice *ebus, *pci_dev;
      SysBusDevice *s;
      DeviceState *iommu, *dev;
@@ -588,14 +588,13 @@ static void sun4uv_init(MemoryRegion 
*address_space_mem,
              qdev_get_gpio_in_named(DEVICE(cpu), "ivec-irq", i));
      }

-    pci_bus = PCI_HOST_BRIDGE(sabre)->bus;
      pci_busA = pci_bridge_get_sec_bus(sabre->bridgeA);
      pci_busB = pci_bridge_get_sec_bus(sabre->bridgeB);

-    /* Only in-built Simba APBs can exist on the root bus, slot 0 on 
busA is
-       reserved (leaving no slots free after on-board devices) however 
slots
-       0-3 are free on busB */
-    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
+    /*
+     * Slot 0 on busA is reserved (leaving no slots free after on-board
+     * devices) however slots 0-3 are free on busB
+     */
      pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
      pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);

---

I'm still looking at the 2nd part, the reserved slots.

