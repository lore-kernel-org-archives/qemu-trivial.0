Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F88FC44529
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Jul 2026 09:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wm78z-0007BX-Jp; Tue, 21 Jul 2026 05:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm78v-00079L-Oo
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 05:52:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm78r-0004oi-Uh
 for qemu-trivial@nongnu.org; Tue, 21 Jul 2026 05:52:04 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L6GQWk3980888
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sgCUYdJRD8ZViaLD0ofGlwBCPNlq6SlS05frI5Iuvmk=; b=jwftnejStrZVNul9
 GVFW8mS8PvcOSNRUJPBAJ72z+Mmfo+WaUPT0SL6JlsWAvqdz1PmvbNAm7/wY+x39
 sqOWxN2l1zfx23fEf+LNp3Mzj1QTBY/EyxAfZT1aqmHjBzSJmqMoDkBgiIMy46md
 k3mjU/z0RQFM5yCWNpnWawPLAK4BEsolpby/c22FqmjeVoJGdzkR+F0z2rfR7y7Z
 3pxPBzBE4kolMbl1q3bBxpdKMut+WD/p1AX0b47cIGClvvTsxq3Dox5ObCWncmxw
 zr9deChqBC5v8YA42dW8hx8IpVziYxfc3l7mYaNGAnXQAGoGqOp5D98lFL1kJiTl
 re5D9Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tjr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 09:52:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0e702df8so162363261cf.2
 for <qemu-trivial@nongnu.org>; Tue, 21 Jul 2026 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784627520; x=1785232320; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sgCUYdJRD8ZViaLD0ofGlwBCPNlq6SlS05frI5Iuvmk=;
 b=Ol9mqelh6dwY6S1kt8WFmDzEYm0SiatboTiqqBCjbne+E61WvxpsJNdwjxBgspjWPf
 JSmcOKQ9TXaSX3GViJj5RQYfhgQc+gZFKNMzn7epCobRsv9bvfyS0u96/UfJJW6kyE47
 tbO/3k8yV1+336ta7zZJXKbprBnMUJPCmb4f8veJV2ytoblLq0E22SK7D8ZRtxDbHj6h
 B4ZC4jFCCuOfvzTuaGUxBSyTSqlBR9BfeFTfOik0sjf6n6MGoR0hwaPBtPQ8N/RLn3Zl
 vD1b2cSj9Px7qoCX9bjn+62fFtAEtP4LQJlHZDZVHewOFPPQF/1OSLckoBhyPTFEtG0N
 0+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784627520; x=1785232320;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sgCUYdJRD8ZViaLD0ofGlwBCPNlq6SlS05frI5Iuvmk=;
 b=clisWw/hHdqjhXndQMuCwoSdd6hc6Wtl4VQ/1TNl2ZSp5kTJ9J4zWGvx3v095E9Fcr
 1DViZir3SCcox6yx4e5fyuKd+F+98+BFDK0eOJcXQCunhNf8oywFYJVSfVk+4FHy+3hy
 Wsyz6jQz0SX6ehTc8DweUDfJJNtXLfX+RwLapO84UqGOQHPoClbUbY78a5fpkKJDUQE8
 i/zcNw2A4urwZXi6fAUhW2UDG2ldoOxpD02pIINwaGUS4NmRiT6lcyveDd7lOdVcWsT3
 XL1KUEjDlOn23/WzA4PWmXY0Soc9v2EZi4+5xw6GNhCm8sdh5BsdKP4EsfO+xFGmrAok
 aCag==
X-Forwarded-Encrypted: i=1;
 AHgh+RqD4RVGYB1CMopc7KrlpGUoU0CaPY0sZ5Rk9TnfFr7FmE3oDmMIrpglx5rQiiRNlH1Is1osTM0hDTP5uCo=@nongnu.org
X-Gm-Message-State: AOJu0YzOrR+v+42WmPSgTlziv+HbETwYBYpGIgFI3dCCN0SDuMiwe9i4
 GjGWBzeAMj7autk6qdN0zzXaOI4uq56bJuNX11Vhk2ggwha2DgJtF8aQLKvC4pjpmbI1nHcynN0
 vmG9yqmQnTpHqWYzK07am0xfbmsnov8lE8BlqxLwLkoQO1ZCPvzLYiPONhRYn
X-Gm-Gg: AfdE7cliNj9orhqxWhffvtyC2t7Czv1PsCP22GiPO6sKdQaQqErLZezdrIHtPy4/YCx
 v0cFTlwod87kSixqCC1/c3STsc55fY1dhM8kOT/560YJviwMlxNDm9FojYIbKMGaZV7YUzbgott
 YmSFxsruvEIWgapsi3bufMBFpC/qgN7kvNDPuuS/wTeUQWGZbtuQA0GMFUkaRCYjp/IHrcqwRjf
 30ugE9NVx5XLFTEGPzJwm+mnVe9VXnqiYPZ2+CvTH2i6OCGW9aZHx2Wp8uf5c19S0ESF32fDl2N
 VLEFXWvqXQFxG2vyvAjQcGmC0R2GRrNqfCwJAZZw9x+Fv5l6aA9KmdVRwsW50o+g6gowU64Q6qy
 PKyI2TIenv0c52BwwMKFleaoSDUlwBI+JqT2AxrR/1WDZRfVMUzM=
X-Received: by 2002:a05:622a:e0cc:10b0:526:f963:2d0f with SMTP id
 d75a77b69052e-526f96337e7mr4227201cf.53.1784627519769; 
 Tue, 21 Jul 2026 02:51:59 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cc:10b0:526:f963:2d0f with SMTP id
 d75a77b69052e-526f96337e7mr4227031cf.53.1784627519281; 
 Tue, 21 Jul 2026 02:51:59 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956548321asm57437065e9.12.2026.07.21.02.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 02:51:58 -0700 (PDT)
Message-ID: <563e1a3e-1420-4f6b-9244-9ad4360c207f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20260721070216.82984-1-thuth@redhat.com>
 <3f8027d5-f7db-4fb5-8386-1d5f93974a10@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <3f8027d5-f7db-4fb5-8386-1d5f93974a10@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dC2EYBt0ToF1nZ2YXbzqSGnYFvPc_7kQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXzCPSQKtBKtyG
 aegqZkN9OoBE+Ua6OXlvDLJSUZCdRnhwA78ag5CZd8bbNXyQ6YMJLeANi3O4LxrxAKECSa+A/9n
 yq5R1X1hGXBZRupjlNC1FsUmcaRSSgD/BqAOom9j3uXAeNPEfFyu60k/HtTxTtFSW9S5oXig4FX
 byLYGmSBojqHbWNVh4vNbXlN73xHqU4W8IS86/AUmlIF4c1Xxa6gIupewR6aJg0Omi1HN8r40FX
 Wl5OcCAmKYAmwR9J7CEecukV+lhIcwZ4pYpmQZjbA7vOhwOHrnUDm3Z5liYbmxZSdrn5SqwUlWG
 pvCxqiFRnL8Teuc+/AIryyHhjW4s+mJ1N3liHQ3He7U9r3zwt9Y9Ixte7A64QnoCkv8lRnFQyIn
 1rRvVFOyxo/fAllz4EaY4tH2R+n8hjcWk48Sh/zUgJ2Ng0Rf3d1+8AVqfPctZVXppP58GXU4MuO
 58RTyU22E/fJkCaWkJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX3OMNtU4Q7gqo
 4Hz/Mu2+hToHeUL/6gsFKOlwSL2/rsgvOK0hI+Xk68z0Y4oSmhs/a5+WkA4up2pfWjTr/Svxnag
 YIkL8l1tfxOmUYo/z0FxFbLJSZGbOAg=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f4140 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RpNjiQI2AAAA:8 a=20KFwNOVAAAA:8 a=dNiI6ryHRrKgJtV6AdoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dC2EYBt0ToF1nZ2YXbzqSGnYFvPc_7kQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104
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

On 21/7/26 10:29, Mark Cave-Ayland wrote:
> On 21/07/2026 08:02, Thomas Huth wrote:
> 
>> From: Thomas Huth <thuth@redhat.com>
>>
>> ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
>> two IDE drives on a bus (primary or secondary drive) to cancel all
>> pending DMA transfers on the drive. The code then checks
>> s->bus->dma->aiocb to see whether there is any IO in flight on the
>> *bus* and then calls blk_drain(s->blk) to wait for its completion.
>> However, s->bus->dma->aiocb might belong to the other drive on the
>> bus, and if there is no disk attached to the current drive, s->blk
>> is NULL. Since blk_drain() does not check its parameter for a NULL
>> pointer, QEMU can crash in such a case.
>>
>> To fix the problem, we have to check that "blk" is not NULL before
>> calling blk_drain(). And we have to call blk_drain() for both drives,
>> otherwise the assert(s->bus->dma->aiocb == NULL) statement after
>> the blk_drain() might trigger if the IO in flight belongs to the
>> the other drive.
>>
>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_905&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=rCgSz13wVfk11Z-Uw5WTQViAQKkSvwpQqf_dJX1tiro&e=
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>> Resolves: https://urldefense.proofpoint.com/v2/url? 
>> u=https-3A__gitlab.com_qemu-2Dproject_qemu_-2D_work-5Fitems_4052&d=DwIDAg&c=s883GpUCOChKOHiocYtGcg&r=c23RpsaH4D2MKyD3EPJTDa0BAxz6tV8aUJqVSoytEiY&m=BbZFP82dEZMyWzN5GnJ9XaxwmyrmYGbqWbEBNSUM_afB5JRRF3InIaZAr5UpUUh2&s=B-AkqMAsQwA0LzU5ptwPJ3ZIBAA8ncf5ZbQg8GTwaME&e=
>> Reported-by: dong ling
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Drain both drives
>>
>>   hw/ide/core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index f78b00220b8..f43ab95b07b 100644
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -741,10 +741,17 @@ void ide_cancel_dma_sync(IDEState *s)
>>        * In the future we'll be able to safely cancel the I/O if the
>>        * whole DMA operation will be submitted to disk with a single
>>        * aio operation with preadv/pwritev.
>> +     *
>> +     * Note: s->bus->dma->aiocb might belong to the adjacent IDEState,
>> +     * so we have to drain both drives to get it cleared.
>>        */
>>       if (s->bus->dma->aiocb) {
>>           trace_ide_cancel_dma_sync_remaining();
>> -        blk_drain(s->blk);
>> +        for (int i = 0; i < 2; i++) {
>> +            if (s->bus->ifs[i].blk) {
>> +                blk_drain(s->bus->ifs[i].blk);
>> +            }
>> +        }
>>           assert(s->bus->dma->aiocb == NULL);
>>       }
>>   }
> 
> Doesn't ide_bus_active_if() do the right thing here for in-flight 
> requests?

bmdma_cmd_writeb() already calls ide_bus_active_if().

Is the issue in the caller, bmdma_cmd_writeb(), instead of
here in ide_cancel_dma_sync()?

> I'd expect to be able to do something like:
> 
>    if (s->bus->dma->aiocb) {
>        trace_ide_cancel_dma_sync_remaining();
>        blk_drain(ide_bus_active_if(s->bus)->blk);
>    }
> 
> 
> ATB,
> 
> Mark.
> 
> 


