Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25CC44529
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Jul 2026 11:16:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wm8S2-00047A-Iv; Tue, 21 Jul 2026 07:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm8Rw-00045U-2T
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 07:15:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm8Rt-0000Zq-BQ
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 07:15:47 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LAR8q11134525
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 11:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D7zKIZs+Ldd24KY2KnBx35r8P1F1YsKBCk4GvArxelQ=; b=DdedznXsIFjxktht
 yYt+t0CsYP3LvqZqXmWkPKHL+bi3nG5Qb2mBFMAxMTwCmEtzs9IQ4G3IPfzWhVNG
 B1dBHRyN2yMY78WPyaiC4ennMvLD/L+H5FDGQolxosm09HroMOTRAhMjq+gwzoIp
 sYzFCLOHUvYpU9nH6cFHbbA/uh95+tP5uQvEMpzBPX3xzAL2m8T/P4sg38lmC+3d
 MLJC/jM0UNNOxnKMjwlDfmmr1aHvyzm0+5NtQA4OpIXvuzyg8nAn1SdpV7kvT+h6
 zDfciU2SFtTnulopaL5QAxZjGkV/S6RzMxJQlYVrs1iKXRsIgrg9T1pWt3nitRHw
 rFafGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as294b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 11:15:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bff5c7035so120012681cf.2
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784632542; x=1785237342; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D7zKIZs+Ldd24KY2KnBx35r8P1F1YsKBCk4GvArxelQ=;
 b=g1OvEVaCYvQbQK5unBHAm/EmoyZTR//VQlI/90QSGFB8LebfQmoKUZfb5CsRkSP6vO
 dV6afwkEtg4gCPr+p/ZwXhFGXV6R/pAOp69xZH1oeC57U/b7v7N2sL8Wh2tyZOfhcrhU
 /CrYd8n1f7mfgQS+kf4aoX2LmC3o5V2tRROcLjTGrFbPI6rJHLlpjsxETW8HTS3BDEGe
 aif5zUAnNXfAdFulr2tzuTS3MAkgipatYW3Iw1niEXdLsLKACDIsssW63Z+BnlZhsStR
 zBt9dKU2gyDa/ZF0IxexTHhyr019yCYbqahBhbetDFKTS7BWhIPJcccC5rC6stjwqwhZ
 Nf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784632542; x=1785237342;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D7zKIZs+Ldd24KY2KnBx35r8P1F1YsKBCk4GvArxelQ=;
 b=EqJnkf49N4oGGZm0GQ9WFGhgiK1JRz7qPtzJKfMg38N3/Cb618ITodowMLXocfXJk1
 D1V2baqS4eaxoAH/so4z5i8Lk9XFfcdaoq1BUm/2jugU191ixL2BKj12kbxA/TuyZVRg
 h7lRftGEoN68Zz98VqUGie8Wj7uJ/Tmd2KcpHrquuXXWmuJKyUHAc2YfR0N4/+aKWGNv
 bl+G0uNK8J/BtIiwsZyXC+c+PTMNMikyNjQZN7HSMwQZvTwQUIUWwpZpgUdUD/D+bR0C
 o32aASROe+O+9nAgxlh+G3n3jK8Sf6rJr8O73wGaOY9LxxeG2rJxnO9rSrbhcBBEmW2j
 CSvw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+PnQobnZPw5XohwdZu8f0w3h2WKCChyxvFr6gRf86MiH3UGIKSTPgKXbFZ+7JDo4taWzjNFqKh69ZaAk=@nongnu.org
X-Gm-Message-State: AOJu0YygRahysYCekKZxArhDx1YGQ+1PC/vHEp0brkrKOndJKsxrLDHt
 pmvr1+YSi6GZe6lP0svyY8ObwWaX3fRtLs8W6OBU2nyIpa+GmdrUMv+qec/e9tUXhZRQnj9Snfq
 NvA9W5MFbYzncC23YDNvw0uvcu9So2UVRzb9BQCJjaFyx9tGMqL0HKtU0mTSO
X-Gm-Gg: AfdE7cnDhMkgoqoq5CNaRJuLciT49pliW+EAKJ+J6o9yoNr+jZGRGuc2E/fEjgJHjMK
 H2stB6XuXxojGT7Z5fV8Ig0SJH1JC8yRCvV1HR1IaQolx8XJTeFqeP/DZZgG6Wcv5tJ3c6sCxyY
 yuQlm0jO735mL89XQIwEENVGURvbXw64wgG1pJRf/Wh3hdNT3QvXVv+tiSu/d+XEQjWgekfbdmY
 n843KJLSbZHW+zeGJ6Zh/UgwhykoGHKMS+Ri89XUaux18as+ChvcAp61TV7lC4B8SuUSJElxWPn
 O4+0Xh0+MvCMJwRj6ovd1lfFwRiuT4XFLg5AXKv6Xo2fzuSlAyEEnh8J9Q5tvCEztOCFDigLJJQ
 wmJL4n5Vsj7nSEgokB3mE/JWVkRgU77d+zDuU8TNNcN4J28T3nBw=
X-Received: by 2002:a05:622a:118c:b0:51c:8571:1ccc with SMTP id
 d75a77b69052e-5213c7e67acmr164545881cf.41.1784632542435; 
 Tue, 21 Jul 2026 04:15:42 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51c:8571:1ccc with SMTP id
 d75a77b69052e-5213c7e67acmr164545601cf.41.1784632541992; 
 Tue, 21 Jul 2026 04:15:41 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49565482c5asm91361265e9.10.2026.07.21.04.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 04:15:41 -0700 (PDT)
Message-ID: <90cfe9a1-3f79-4707-ac79-fca7138250fd@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20260721070216.82984-1-thuth@redhat.com>
 <3f8027d5-f7db-4fb5-8386-1d5f93974a10@nutanix.com>
 <563e1a3e-1420-4f6b-9244-9ad4360c207f@oss.qualcomm.com>
 <e705d648-eaa2-404a-b654-a15b1648e0a9@oss.qualcomm.com>
 <06ede776-5505-4154-a4d4-a74b77d5cb90@redhat.com>
 <500f7d75-f8a5-4152-bf5b-17cf047ad24a@oss.qualcomm.com>
 <70fbca1d-847e-4f94-9ca8-694efae0f37c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <70fbca1d-847e-4f94-9ca8-694efae0f37c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX7YB3EKHaadRl
 20iE8ncqcuviSFd7G4Acw0R3kP+hkVOofyAYVHtZbRIc/d4fdkjZsP5cuWE63W/1OQhj5z9pEWB
 gSijhigaL/Odv9G4CirAAlwwEBXdTGhTvDIEAYT+HtDq0pE5H61VWx3HLjvRFd0RvP0iEu9pr7V
 HDG4+mJGTKfcefNdWGq67teD7DalEJnWf7yNw0LjTkhowhBlWAq1kl/9+fk5RyZgL5EUtbZnMCQ
 rAUXYCDExuABDCNpyqVfuIMs32SN1J2lWbazs9Kbe/ngm+VMjOZk2ZaQxrpck5f+uFNvPSTQQey
 ttRGon07AIwGdtM1N9/T6msPfS8WcEEFy/fLoZyNYS6HID3Cy3n0uJpNIQYzvH9b+P+VkbFF/SE
 B1WSLf/bKOIR65+rlT4jJ6pU+hU7iGJfsxdYg0F3c8CfAUkaVWHkDQKwlf44T/yrCYBYym0QL/r
 zB22HgG7fzWD91lGjUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfXz+3k5NBVqWDK
 KkPwKD5JRt2h/77mjO0nsZ63R8tbrqIirBlqepVA1y0HRQBLaERgZUf/VesVZUKzjM8NSEygiCH
 nWDAojClJrhYvn/ls0Lg57BIHu0vM68=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f54df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RpNjiQI2AAAA:8 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=ZfjKC6arVYkqvAjnLLQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jwqHwyVixHsVRUq8qYEUdhVbM__FkdT5
X-Proofpoint-ORIG-GUID: jwqHwyVixHsVRUq8qYEUdhVbM__FkdT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118
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

On 21/7/26 13:08, Thomas Huth wrote:
> On 21/07/2026 12.55, Philippe Mathieu-Daudé wrote:
>> On 21/7/26 12:21, Thomas Huth wrote:
>>> On 21/07/2026 11.58, Philippe Mathieu-Daudé wrote:
>>>> On 21/7/26 11:51, Philippe Mathieu-DaudÃ© wrote:
>>>>> On 21/7/26 10:29, Mark Cave-Ayland wrote:
>>>>>> On 21/07/2026 08:02, Thomas Huth wrote:
>>>>>>
>>>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>>>
>>>>>>> ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
>>>>>>> two IDE drives on a bus (primary or secondary drive) to cancel all
>>>>>>> pending DMA transfers on the drive. The code then checks
>>>>>>> s->bus->dma->aiocb to see whether there is any IO in flight on the
>>>>>>> *bus* and then calls blk_drain(s->blk) to wait for its completion.
>>>>>>> However, s->bus->dma->aiocb might belong to the other drive on the
>>>>>>> bus, and if there is no disk attached to the current drive, s->blk
>>>>>>> is NULL. Since blk_drain() does not check its parameter for a NULL
>>>>>>> pointer, QEMU can crash in such a case.
>>>>>>>
>>>>>>> To fix the problem, we have to check that "blk" is not NULL before
>>>>>>> calling blk_drain(). And we have to call blk_drain() for both 
>>>>>>> drives,
>>>>>>> otherwise the assert(s->bus->dma->aiocb == NULL) statement after
>>>>>>> the blk_drain() might trigger if the IO in flight belongs to the
>>>>>>> the other drive.
>>>>>>>
>>>>>>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>>>>>>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_905&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=rCgSz13wVfk11Z-Uw5WTQViAQKkSvwpQqf_dJX1tiro&e=
>>>>>>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>>>>>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>>>>>>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_4052&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=B-AkqMAsQwA0LzU5ptwPJ3ZIBAA8ncf5ZbQg8GTwaME&e=
>>>>>>> Reported-by: dong ling
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>> ---
>>>>>>>   v2: Drain both drives
>>>>>>>
>>>>>>>   hw/ide/core.c | 9 ++++++++-
>>>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>>>>>>> index f78b00220b8..f43ab95b07b 100644
>>>>>>> --- a/hw/ide/core.c
>>>>>>> +++ b/hw/ide/core.c
>>>>>>> @@ -741,10 +741,17 @@ void ide_cancel_dma_sync(IDEState *s)
>>>>>>>        * In the future we'll be able to safely cancel the I/O if the
>>>>>>>        * whole DMA operation will be submitted to disk with a single
>>>>>>>        * aio operation with preadv/pwritev.
>>>>>>> +     *
>>>>>>> +     * Note: s->bus->dma->aiocb might belong to the adjacent 
>>>>>>> IDEState,
>>>>>>> +     * so we have to drain both drives to get it cleared.
>>>>>>>        */
>>>>>>>       if (s->bus->dma->aiocb) {
>>>>>>>           trace_ide_cancel_dma_sync_remaining();
>>>>>>> -        blk_drain(s->blk);
>>>>>>> +        for (int i = 0; i < 2; i++) {
>>>>>>> +            if (s->bus->ifs[i].blk) {
>>>>>>> +                blk_drain(s->bus->ifs[i].blk);
>>>>>>> +            }
>>>>>>> +        }
>>>>>>>           assert(s->bus->dma->aiocb == NULL);
>>>>>>>       }
>>>>>>>   }
>>>>>>
>>>>>> Doesn't ide_bus_active_if() do the right thing here for in-flight 
>>>>>> requests?
>>>>>
>>>>> bmdma_cmd_writeb() already calls ide_bus_active_if().
>>>>>
>>>>> Is the issue in the caller, bmdma_cmd_writeb(), instead of
>>>>> here in ide_cancel_dma_sync()?
>>>>
>>>> i.e.:
>>>>
>>>> -- >8 --
>>>> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
>>>> index 7ce1ae67ab2..e7c6af9a49e 100644
>>>> --- a/hw/ide/pci.c
>>>> +++ b/hw/ide/pci.c
>>>> @@ -384,7 +384,7 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
>>>>       /* Ignore writes to SSBM if it keeps the old value */
>>>>       if ((val & BM_CMD_START) != (bm->cmd & BM_CMD_START)) {
>>>>           if (!(val & BM_CMD_START)) {
>>>> -            ide_cancel_dma_sync(ide_bus_active_if(bm->bus));
>>>> +            ide_cancel_dma_sync(bmdma_active_if(bm));
>>>>               bm->status &= ~BM_STATUS_DMAING;
>>>>           } else {
>>>>               bm->cur_addr = bm->addr;
>>> No, I don't think this will fix all cases. While https://gitlab.com/ 
>>> qemu- project/qemu/-/work_items/905 has a call trace with 
>>> bmdma_cmd_writeb() in it, https://gitlab.com/qemu-project/qemu/-/ 
>>> work_items/4052 is slightly different: The backtrace shows 
>>> ide_bus_perform_srst() -> ide_perform_srst() -> ide_cancel_dma_sync() 
>>> here instead. I'd say let's play safe and always drain both 
>>> interfaces. WDYT?
>>
>> I dunno I'm kind of lost. Can't blk_bs() handle NULL blk?
>>
>> -- >8 --
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 37ba7e9fc40..b5d84c9789a 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -760,7 +760,7 @@ BlockBackend *blk_by_name(const char *name)
>>   BlockDriverState *blk_bs(BlockBackend *blk)
>>   {
>>       IO_CODE();
>> -    return blk->root ? blk->root->bs : NULL;
>> +    return (blk && blk->root) ? blk->root->bs : NULL;
>>   }
> That would maybe help with the NULL pointer crash, but it would not 
> prevent the assert(s->bus->dma->aiocb == NULL) from triggering.
> 
> Simply draining both drives seems to be the only solution that I see 
> right now, unless we want to remove the assert() statement?

OK... Maybe move the comment before the for() for clarity.
Still some review from qemu-block@ team would help...

> 
>   Thomas
> 
> 


