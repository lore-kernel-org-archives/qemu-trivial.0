Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90589C4451C
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Jul 2026 09:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wm7F7-0000sO-QT; Tue, 21 Jul 2026 05:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm7F5-0000pn-PW
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 05:58:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm7F2-0005m4-Tx
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 05:58:27 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L61Odn3978346
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 09:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AvmPEeXORihifk6lBg/ffgkbdyeGUuLEFjdKJ1RgRqE=; b=RceIT9Xvp1zmjIsA
 uMjLDbsS+LusM9gF7au7lsv5QMpfV0g8Hve8969revEFRxM8FCRaGqm7nM6yvU/r
 AhOtBLN3O0y4Fk0tOPWxTUA13vlkLmIL6FmEqzHOKCCUAhjSrLJE6Bp77VOro2vo
 WjEq4jr+xd6Bqb3kM1kETK47OONv5/2ok6BlSyEXqFGzGBPmeivd1H++PHf8qsK1
 WdvQEHlsZrV/kdv0UTkqmxHu8Ys5rvVORZAaaqbkuEZ12sS8jR8yP8/KsWP3p5LK
 q2HoLHMdmPZStw9Vf6QyQvhHlVQCi1Bb5Ia5mIUOupJDffZAvE3bXVt9ktNKz+c0
 tIFfyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43uby-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 09:58:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1e6f602cso167781801cf.3
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784627903; x=1785232703; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AvmPEeXORihifk6lBg/ffgkbdyeGUuLEFjdKJ1RgRqE=;
 b=VXVhZMfsHCEpPDc+b7o+1K4+Xh08Hd2g4DJ7h3iF20Td3skPO9X1z4jdvq9/KnM4H7
 2mxIGE6d2xWxLvK5iovwcJHc1euq1D7t8EP8BjOopLDiV4oycBiMFf9mmsUABPYr+MiI
 2S0JrRdKdGLQPkxfjqAM+xQ27Q0eT5ij9lwGVXfkbDDga3iDOk8RhMebAKE4sjLtrBRl
 yWUPsYYwAfct7BF7/8RlhIVLvqS7or0iHEWqU+zFDZHs9Ju8P815MDkfMW2kZDwd8SVz
 lWG8QlIRks4LXJC59cGDhqBMAtN4whcbVK4usoFU0gdWzwuXTqqtXIiRXpy5ZvCQKB74
 E6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784627903; x=1785232703;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AvmPEeXORihifk6lBg/ffgkbdyeGUuLEFjdKJ1RgRqE=;
 b=sxUW6qyv1Tv0iU9MDJCbzD2Yk+4KWYwQJKh2T1qRcNqxnDKOzIvdl8O7YYaD0HLBOE
 gc4PAxAVIjQjMFineUMTcX5armttXNszqvs1Dg5vsXgTaDDwIzVD++OEE+nuT+zP2Mj1
 /2XtrqUjXlEBrIJt2/W3YcKkLkkCrFdLO6jGRrk1gO83ko188k5zcvm8LMqKDRFmgKkw
 VK1G8xyCjOBPoFxDrtQqYGFU9QRFd14ib1Dx2JcphahDio4ZP687hxjEZZHvyWu23MS9
 auR0nfSGzoLw96y+vdRm3yS0Gc12xb4QWT4Fll8HQcePf8yrD0OZdlQDhtYuFSOJre1M
 kgRA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoknV/kC8WjBORfbmtOx8IueKP6tO68T0GOCIKeXDOCBmRLYdSKN81fhuQLDKfhxXwAPnOo4pTze/PNuFU=@nongnu.org
X-Gm-Message-State: AOJu0YxbDzDEIJKX4Ec0Etfd44zbJ2mR4EUW8E87h7FxHWADQCLNJ8S0
 kC/oJ02CaYHbwTlz9Dj4nymxqTxPbNh6iaSQhytAqivOfUEjP8K1+WGxoupNF/nNNRIAq9/qZxU
 ugnUoqFOjyobxFWjzCKK4Eu6A9URkfLnhjGyEq2m6+q0Ih5qsNQecgYpw0P7f
X-Gm-Gg: AfdE7cmrLEX2sJ3+qThBVzvsKsWo6Wx6NyOgqmi7nPJU1HJ4iPrJ5RBtS3CXU8YbAJf
 qF8yXjsKFBZkXvQF7or1sRVSyCFcCgfmOx4+XyX5wcIchO/jsE+eG2+IVTsxMcydzFrG0jXgMho
 QSF6NqFCTcBIbSrjFPKSL5TOWXZuA8Obir/OUasG40ea13Q7Vwixv0D8DsXZhL69dgiJAAtMqjL
 tHLSyx3ZjGukYuF7pXcnLX2HI53QbMgAP58cU2Nsmx4nhHhRz9ZAvU7gXIijbh0s0wsEl7MKc0h
 7Mc847PjYCihqObT4OiS1FotP5FetDmw2BCPwlx5Bg8/P9YIwYRmXzkuCaJMtj/+1f6/fb3MnDc
 KtzzxQWbDgx+I6hdmHSB9bPbUYFZPv+S9+uuGPZkd6E6HxpsmRpU=
X-Received: by 2002:a05:622a:38b:b0:51a:8c97:fb9d with SMTP id
 d75a77b69052e-5213fc58323mr161022581cf.70.1784627902876; 
 Tue, 21 Jul 2026 02:58:22 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:51a:8c97:fb9d with SMTP id
 d75a77b69052e-5213fc58323mr161022421cf.70.1784627902461; 
 Tue, 21 Jul 2026 02:58:22 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49acesm36251511f8f.6.2026.07.21.02.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 02:58:21 -0700 (PDT)
Message-ID: <e705d648-eaa2-404a-b654-a15b1648e0a9@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20260721070216.82984-1-thuth@redhat.com>
 <3f8027d5-f7db-4fb5-8386-1d5f93974a10@nutanix.com>
 <563e1a3e-1420-4f6b-9244-9ad4360c207f@oss.qualcomm.com>
In-Reply-To: <563e1a3e-1420-4f6b-9244-9ad4360c207f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BGUD8ViLi4_xruW5FPngGO4vmq-1m5K2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfX3/agnI/fT94b
 M8ub9t7h9yy1qtgwoV2N64BwGhDoXo+s9tn2VsOVkH3Y132dN4GVCWyPVeTt1fVZpBFdQicbRLI
 l3qIIbtJ9WS8HOTJSgNyNxWs8v8Eq9zb2Hla1GiSXcTsLuZeNSK76TYh4fd3ulBFoIx+gGhs4SK
 WMkeLehNXvtSFb0jGRXIpM69ckPauwPAFvQLgq712r+7YUmX5Y1sVukHuGS3hYz9gYy0rsimfk2
 /lcB7CPV2H4Mrsm2UswIt4lUHSqz8fNPEJ82HkSuvRYx8xizCYAfAS9ElWOSb6hxBAzYQo5cN75
 QLMpP6rOqmb9TN21RlCZkGlR2QY11Rfhg/v9j8I0AMjIn+gNSSJJZqCIM7GVf2mS/jVmlA7koRJ
 zHfmh3zMVUqzp5Z6Knvj9cH0Ly4PaR48nmJkvwurCLQNlWX0nkdHNsURDEbM1EOKrEXGqA/vyXB
 LH0fYQpHhVNLl/N7kAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfX3nXHjMHewg70
 JK9Z0+gnWcbQpsoPup71nx2Rkv4CfVOG6TK/5lxUC7v7Y0ucMNSj5r2k9xVCjRWYhiq76jnsmTJ
 eimiqIu+tgNr1EwE7mPHiF5JYpoUugo=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f42bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RpNjiQI2AAAA:8 a=20KFwNOVAAAA:8 a=2QUrxFv762PGgihxwb4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BGUD8ViLi4_xruW5FPngGO4vmq-1m5K2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210105
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 21/7/26 11:51, Philippe Mathieu-DaudÃ© wrote:
> On 21/7/26 10:29, Mark Cave-Ayland wrote:
>> On 21/07/2026 08:02, Thomas Huth wrote:
>>
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
>>> two IDE drives on a bus (primary or secondary drive) to cancel all
>>> pending DMA transfers on the drive. The code then checks
>>> s->bus->dma->aiocb to see whether there is any IO in flight on the
>>> *bus* and then calls blk_drain(s->blk) to wait for its completion.
>>> However, s->bus->dma->aiocb might belong to the other drive on the
>>> bus, and if there is no disk attached to the current drive, s->blk
>>> is NULL. Since blk_drain() does not check its parameter for a NULL
>>> pointer, QEMU can crash in such a case.
>>>
>>> To fix the problem, we have to check that "blk" is not NULL before
>>> calling blk_drain(). And we have to call blk_drain() for both drives,
>>> otherwise the assert(s->bus->dma->aiocb == NULL) statement after
>>> the blk_drain() might trigger if the IO in flight belongs to the
>>> the other drive.
>>>
>>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_905&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=rCgSz13wVfk11Z-Uw5WTQViAQKkSvwpQqf_dJX1tiro&e=
>>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_4052&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=B-AkqMAsQwA0LzU5ptwPJ3ZIBAA8ncf5ZbQg8GTwaME&e=
>>> Reported-by: dong ling
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v2: Drain both drives
>>>
>>>   hw/ide/core.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>>> index f78b00220b8..f43ab95b07b 100644
>>> --- a/hw/ide/core.c
>>> +++ b/hw/ide/core.c
>>> @@ -741,10 +741,17 @@ void ide_cancel_dma_sync(IDEState *s)
>>>        * In the future we'll be able to safely cancel the I/O if the
>>>        * whole DMA operation will be submitted to disk with a single
>>>        * aio operation with preadv/pwritev.
>>> +     *
>>> +     * Note: s->bus->dma->aiocb might belong to the adjacent IDEState,
>>> +     * so we have to drain both drives to get it cleared.
>>>        */
>>>       if (s->bus->dma->aiocb) {
>>>           trace_ide_cancel_dma_sync_remaining();
>>> -        blk_drain(s->blk);
>>> +        for (int i = 0; i < 2; i++) {
>>> +            if (s->bus->ifs[i].blk) {
>>> +                blk_drain(s->bus->ifs[i].blk);
>>> +            }
>>> +        }
>>>           assert(s->bus->dma->aiocb == NULL);
>>>       }
>>>   }
>>
>> Doesn't ide_bus_active_if() do the right thing here for in-flight 
>> requests?
> 
> bmdma_cmd_writeb() already calls ide_bus_active_if().
> 
> Is the issue in the caller, bmdma_cmd_writeb(), instead of
> here in ide_cancel_dma_sync()?

i.e.:

-- >8 --
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 7ce1ae67ab2..e7c6af9a49e 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -384,7 +384,7 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
      /* Ignore writes to SSBM if it keeps the old value */
      if ((val & BM_CMD_START) != (bm->cmd & BM_CMD_START)) {
          if (!(val & BM_CMD_START)) {
-            ide_cancel_dma_sync(ide_bus_active_if(bm->bus));
+            ide_cancel_dma_sync(bmdma_active_if(bm));
              bm->status &= ~BM_STATUS_DMAING;
          } else {
              bm->cur_addr = bm->addr;
---

> 
>> I'd expect to be able to do something like:
>>
>>    if (s->bus->dma->aiocb) {
>>        trace_ide_cancel_dma_sync_remaining();
>>        blk_drain(ide_bus_active_if(s->bus)->blk);
>>    }
>>
>>
>> ATB,
>>
>> Mark.
>>
>>
> 
> 


