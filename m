Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC93C43458
	for <qemu-trivial@archiver.kernel.org>; Tue,  7 Jul 2026 08:43:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wh1OI-000534-CE; Tue, 07 Jul 2026 04:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1OC-00051v-OD
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 04:42:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1O9-0005m1-9V
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 04:42:47 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678Djtr3138631
 for <qemu-trivial@nongnu.org>; Tue, 7 Jul 2026 08:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mDejdOdSbMeLqP/ap1e/QjSjKqGw81Mb0HAwhsn4krA=; b=Zk8ZnXD8wZpDtLYQ
 2xhp5ND/JebYdC+B04U8dAShgKHG0kJts0eCdyRfNnBQWTvdcqZ6RneQlOO85lMT
 5t5y8g70WrUQVDP+KQvnq6XmyvuRFpRHXMVK6XITr/1IYjl8+UVSjKRg7dnXek+m
 8ZTxa0gUYawz/4MQ6YqI1vf4DW7akDCYUHGyrF3lAfNCaDxQdTr8v20Qjhr3nIHb
 T4GZ/NUzLS+hg/qNZxtiXjJkeocBH8IupSF6A8eu+6KmWK8Eg1LttKk+V5bA93OL
 RcaMrJiGkih5BLTaJ7HKaU0lWKsfgYIU5t/B9dfxHhMqr5Tzwb5g1YJpRM/q5X+U
 ZVJY6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1592cv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2026 08:42:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a236220so36470351cf.3
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2026 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783413764; x=1784018564; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mDejdOdSbMeLqP/ap1e/QjSjKqGw81Mb0HAwhsn4krA=;
 b=agrZfmvxQfkr2qGc5eIuCjSGCPyvnG5erN319JwuygGkKhGOLh5sEqJGJ47Es4mL2P
 D+YqiWJbMmPi1GX6etaWhpo3QwjToB704vh3TgYp32bORp2C90/PCL/UQRrK3u0AX9sA
 jbrWoDoLuhBHQuUK7ibkDxqNReDIHI7GvHnmfjs/kmr6JelMj5LRl8BtTybA+IeLF9hV
 JkKIPtZ19CcRcvqDGQvJmzbXK5blY/XLpONxU1tm/1wM1g0GT4ocsXpnsVn4X6j/8cDV
 0+YrfSM5MdvHk3RuPTUxo/0QhCFoNX/o+xB0lt+T6QDT1VHW+joH/ji/BtXigemlgm50
 jNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783413764; x=1784018564;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mDejdOdSbMeLqP/ap1e/QjSjKqGw81Mb0HAwhsn4krA=;
 b=l+RE2O5duQ5nb5MwjiL0Ee4XWYG9FkOU1725Hbmi7tghdKJspef6ZNL4Rmg+L1wmMv
 9CTHA9MCzXNQnyONBjHtGfhUyZUq84CZ2chlrC/ThywypMO9KVAD1W5/j+itCuP2uT7+
 4c1QTorQNAkL+b9zYM0x3/pqvkkIwVRwpIfzR4Hzi3qXwE+1Up7lBhOCFUjMuuBOrX+f
 Hq0JX9oySqGr7gdKv08tN8I6bm5asNqLI84FzK4KcZhGI31u4wW2r4zy959Z5K3OqZQ9
 sI4wRWQEfRR671hZXAX+4f0tnOmiJIpaogqab2ZLvfwzifiMQu7HVYz9TvHDv6r2aMGT
 a0+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYnONJHwU3RLHPMWqMb2Xly5Of/y5NqUYDpJNwGh5BTbpf6Ljxv0OqgwLGT2lwXkItpBTr+xz0PcEYLLU=@nongnu.org
X-Gm-Message-State: AOJu0YyIf3IxgjNN8QsUa6S9SjWf3pf6u1WLwTyE3IeNcYrSYp0P0KmG
 scqgBcZVBLEzn5eBVzrWXTtH1TxrbPBNhm0BMO1musVL65dAb0sgqVeLoVYMvzYwX3XkKiL9GXs
 9VXum54H9VucbKpJMwA2oLRlC4fvLugE70YmbokdSG02zwcOWgp/PCFtwTxFN
X-Gm-Gg: AfdE7cm3tWAtr/TisMongYe2kJdxeyOb5HzCe6TLQYE6/Y6HeNE2XuJzW6pymO9uVDn
 xxR8EiZoKpRujR9fss0hyrlVcFnH26Pokc6ePAwWRQ8PGHfEU51KlAPArilHgAC/oJjEtZiaRsz
 czyuP3c7j/X63kK3hOozHDXRCZGvtDME6egJbunFx8N/NMqrn9Z8+msX7SjB/Glw4QZ8bNscrc6
 TYHYa7pv8Dz6BvNjypRWbiJCPUdluKkMwEJb+VG0n+ZQP1VKdreF8W+c4BwpKz6z+6/IjPgw1Jn
 XbnULUU87p5gPecYgnpx+PMsEBUws1pDACYfiIfdL9eLcI1Or2JHp9LUTbmlvIDmPXsNS1mtuhp
 ik2J+ZktfqBpcokRDW9QX0yyd6wvFH6VoB8zKSb8TPXkDiL0I6KDPTuUOv4XaOg==
X-Received: by 2002:a05:622a:34a:b0:509:3cd:b22f with SMTP id
 d75a77b69052e-51c747beb3emr48443761cf.23.1783413761230; 
 Tue, 07 Jul 2026 01:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:509:3cd:b22f with SMTP id
 d75a77b69052e-51c747beb3emr48443641cf.23.1783413760789; 
 Tue, 07 Jul 2026 01:42:40 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ada04d04sm82653366b.47.2026.07.07.01.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:42:40 -0700 (PDT)
Message-ID: <e89903bb-d866-45ed-b5f5-fa0a6ef1a0c7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <fdb45ef0-a709-413a-bc55-1bfcab648033@oss.qualcomm.com>
In-Reply-To: <fdb45ef0-a709-413a-bc55-1bfcab648033@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2yo35vweBScliaGdx76-U2PvzZ0lE7n8
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cbc04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6aw1dEGQIrAIlxKPOMMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2yo35vweBScliaGdx76-U2PvzZ0lE7n8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfXxn+ppH/2rZkX
 fzrtB3RNhcTCv2UlEMLWQB3UcMsyV+e03sP1RatEjUZtFpaQQ9K0lbkhKSOe91NdxzwP+eQEE0G
 WZUDDNkQeU8abDUVpXXEdE1n1nWNEkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfXzY8XTS07mbgn
 dv2xUfAIlHulWRmF8K94ld7mRj0dRaZzBBsfxm9PugsLhYJe+SjBTksXma1XhIeWAiyq8d7ogsG
 fZ7tYA8G92AbrcHLpucEP2iMvKJNNT/GNYJpoqcyD7CoTP2ey3Yc+0ZwKaY6EsGiGkIrNj84ixx
 vLB13LhgzZCBcFgeoVB/bC3XIdp8T/8cMP5yXgQZltzD8difrMk9dMxphJb64BKHaPlacR2VWcv
 DMvgSgaVA/3GgBHc01hMxPcH+damD/50ZiXs2SASnhNF4tea2v30bIKgAPCRlmwy/Jk1EPK0WVQ
 cnT69jwJ0GVtS7Y5+W+DL6QGEkTuYfHBB090pDYAnXOI3+2pigqGviRz4Y5FXtbp3ZjQ1IahUhe
 G0+V27heBG/gU2sZVBTqW98pUdEtVRjucQ+R0WENrT2dhbg14msbT145qdl/RU6TMNi8nMrK5bM
 ny58csuF+2ibgIpd6nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 6/7/26 23:19, Philippe Mathieu-DaudÃ© wrote:
> On 6/7/26 23:16, Mark Cave-Ayland wrote:
>> On 06/07/2026 21:29, Philippe Mathieu-Daudé wrote:
>>

>>>> -    pci_bus = PCI_HOST_BRIDGE(sabre)->bus;
>>>>       pci_busA = pci_bridge_get_sec_bus(sabre->bridgeA);
>>>>       pci_busB = pci_bridge_get_sec_bus(sabre->bridgeB);
>>>>
>>>> -    /* Only in-built Simba APBs can exist on the root bus, slot 0 
>>>> on busA is
>>>> -       reserved (leaving no slots free after on-board devices) 
>>>> however slots
>>>> -       0-3 are free on busB */
>>>> -    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
>>>> +    /*
>>>> +     * Slot 0 on busA is reserved (leaving no slots free after on- 
>>>> board
>>>> +     * devices) however slots 0-3 are free on busB
>>>> +     */
>>>>       pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
>>>>       pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
>>>>
>>>> ---
>>>>
>>>> I'm still looking at the 2nd part, the reserved slots.
>>>
>>> (Because with this patch, the test passes as we can plug devices from
>>> the command line, but they end plugged on pciA instead of pciB -- thus
>>> the 2nd part missing).
>>
>> Thanks for taking a look, Phil. IIRC the reason I added 
>> slot_reserved_mask was so that it was possible to populate pciA 
>> programatically in sun4uv_init(), and then enable the mask so that 
>> specifying an additional PCI device using -device on the command line 
>> without an explict PCI bus would cause the automatic allocation to 
>> place the device on pciB.
> 
> The slot_reserved_mask calls make sense, but AFAICT they don't work as
> expected, since CLI devices are added on pciA. If you want to have a
> look on top of this snippet, be my guest! Otherwise I'll continue
> debugging that tomorrow, long day and late here :\

Generic PCI fix posted here:
https://lore.kernel.org/qemu-devel/20260707084050.32137-1-philmd@oss.qualcomm.com/


