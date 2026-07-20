Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E89C44515
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Jul 2026 20:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wluki-0005VQ-Fn; Mon, 20 Jul 2026 16:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlujR-0004r0-Nb
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2026 16:37:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wlujP-0003yy-57
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2026 16:36:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KJTXYZ3397240
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2026 20:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nquiQaqPLclDTxm/S9UDg+k5jLVs0YBC4NdhrU2brac=; b=VShz1c502kz5Uo2A
 Pn8elhCGxkyD14WsMVHMGGlVmVUj9Ae75I5S6yZ5FEOaqdtd2mqnfkCWBCrNHYAu
 iAdU1uQWGk/Pzt8oT2uZ21xdgFWmhP2hvLDTxMAvrAlztJOkWSR0a4tpxEiYTP9u
 UV3/zN6aeZijhxEXy0kIloytVAHHRe0h25RLfU1NyBmgrPtyITU97ArSrZjell/9
 tfqRmOVZGhfznapZRrBUvbjiWFYgE17J6KQpOtKvowybFMVNPyV90EsA8Irgj8Ln
 rRYaNRCr8DJNuEbQtPz+I7uU1wBKBhHAe2QYNE6oUIGNtsdOPJdUoqY2239f3/Fk
 XGY2jg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvc8uqw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2026 20:36:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ef18406878so208887056d6.2
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2026 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784579812; x=1785184612; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nquiQaqPLclDTxm/S9UDg+k5jLVs0YBC4NdhrU2brac=;
 b=cn4kTUrDTDtSw0LnZHRuzU9ZLEAXpGRogMr2uEkdir7tGKFw83AbrrWuueN0169Duu
 V5XB9TiYTDapYsjdHZ8aFyVvw9FgPORQk2IfLVHsFf8heg79KeeA3RiBJ5Eob4QStsIy
 3muBk5Xv9wn7Gl8WpApjm+ME6OFrWwqUK0EGKTPnuuAhBgXsVT9PjN7F5A1pqpbcesue
 Z5gXnLN94lmzYLbxjNRllOcl9GbJsZTc8fDNmdkuDzxiVLpRlzzg2y460TJ4G/+MLaDc
 ZuA5BNUyo9tRtfDn7Q/l/ssQMR6muMYnGV8k9VPD4O9cra6ybrNMRbuOLpb3skgF6HWd
 25Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784579812; x=1785184612;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nquiQaqPLclDTxm/S9UDg+k5jLVs0YBC4NdhrU2brac=;
 b=GgqOlxe8fOmOVQ1hTEMwDg0GA+8yl7MmtpwzCxKSHGiU/M4tmhKLRc1Pw1doryBgxT
 PDsu2ol0F6YVjY04yWHp+hVIcuqriHqSNBQNkjZKd5irlXukazTR/S8zDUUjaB1OcJ2c
 9sMOsMXu2rmPSu//N0WynCPR5fX7gtJ8qLKU/6PssrDRVW0wlx/Nwz/4w6KYdAazhcH/
 Mb70SxNMapZoYxjtkw++1m4RqXhKKU43R00sIY6eA0yHkLAruK2z8Ey9NK8iWEFuyUsM
 H/6qDy6Lwao5dZrUHzcfpQL6i8z7XFjRQ2IcS3/tMH2t5wfiI1wZe+VJmU5FGlinx2Vs
 +OeQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoMkaZR7uZdd3p6noiI/bi97AAW/W0c+Rf/8+HcAR1iHCa2Qoomhuzu8Y7rJc9O/cRGzMwHuAAH+/HlcrI=@nongnu.org
X-Gm-Message-State: AOJu0YwltnAbUhJIrCiMPAUCA580L8ZE9QVDMHr3xohb/dyWYqOZzlzr
 xQJU0yAZHF835avyj/fLi6B59e+muPEVxF3/jo5sV/NPl23AM6JB3VvWBoyyhfVLV1QHdGxSspF
 OB4f38+HeetO/UDD97RpK6gVQfC7qAZz6PBSxosu51Wu7S+HRVxOrwADVPkf5
X-Gm-Gg: AfdE7ck1EEHfLuEuPdM79d0utEGfPeBugIaLZYIFtbYpGmu2s058mI24Ariyuolz6Ty
 YTHQV93MhJE4XRt5i1j8GlFEMtJv3+DmDUA1PKQ9NMSb0ZHgTiQ6JdW2qPyf+9LIz1syqlcBUeh
 CrjFYEeDuXaWkNQkh0PQNbsmrlUlL9WIbHjvPrv1wolkiUwjRLy0Yf0vUFCI/eA+CzFsQaX9Dn1
 YCT8V+3MF7XpLQoggL4kdYqjxOeuCUd45SWUTV2/al77o2iWg9OBftRtxI8/mLGuOn7Tf2WV6dG
 vlm5cEstHbwpN1LLWyJHlKP3nUCbem1tUOYD5yHnZO0XZ2669OvLENSTYsjEXXdGkMSmTZQELnC
 MFP4t6obDegcRFHKUyrEq/aCmAOBnoezCPmAJZ6hy0Wp6exF2f5Y=
X-Received: by 2002:ac8:5706:0:b0:51c:1a4c:3c9f with SMTP id
 d75a77b69052e-5213c007406mr144975461cf.4.1784579811881; 
 Mon, 20 Jul 2026 13:36:51 -0700 (PDT)
X-Received: by 2002:ac8:5706:0:b0:51c:1a4c:3c9f with SMTP id
 d75a77b69052e-5213c007406mr144975171cf.4.1784579811349; 
 Mon, 20 Jul 2026 13:36:51 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eddd1csm32688249f8f.29.2026.07.20.13.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 13:36:50 -0700 (PDT)
Message-ID: <cd8ff4ea-9d66-4be1-b8ff-e361cfaea5d2@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/ide/core: Fix possible crash via NULL pointer in
 ide_cancel_dma_sync()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20260720194210.663629-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720194210.663629-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyNSBTYWx0ZWRfX4mhqesaG820S
 3rlmX4UkaygqUfSG/3CGCf4MBHg13GftXlV3nuKuoO/Aq6XO/VOF7UbXQL9exDfpZmRgDrYss29
 5dNszOzFMYb0laevBmYh9q4FkIFM4uQ=
X-Proofpoint-GUID: W5Lq9GKfzhJihv65gWwL5OITSFXRGavA
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5e86e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=M3TV-_b8KnQ0B_pPhtwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: W5Lq9GKfzhJihv65gWwL5OITSFXRGavA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyNSBTYWx0ZWRfX3rd0cWl6BQZv
 17lRqGWMpWek1OM/67W/A1RNyM2Io83+zEVxKLofHD1lab/UHuFHz/VBrgawu1yLRT9xbTSh6Jk
 8jkHqbeM2iOBr4mEK36qFFXwDuDLlvcgxWyMRo8/eOyXj8i+ENXZQ90gw3IxdeyChRz9kE6Otpt
 rNgc+dQDWnabODAT9FHN+La7MOaT6NBHOyBdMOTN3fsx0Xx3vGw+e0FLIhszCEIkiRx882LTJoh
 zRZElZ9ij7Zn+2reSMlPJJWrRUZsRGfrpb5/dVMCq6gT/ycIobIdGFxAxoBx10cPtf1oLpWNDOc
 ZCiVtd+xzaruraX7trOX3o6XcVrfNzgLuoz1I9JWjeoS0EaLiTOQx9pfgyeTNLNtfCfjCfb9kKr
 z0iV1ToU4HYEnrsJw9UBBWrUjJkr5YIYQ50xfdTBPHWYr863v++2sSQSQeHr2ecflOHGqBeHy/y
 HW1Y1yBD8NsWutJSGng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200225
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

On 20/7/26 21:42, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> ide_cancel_dma_sync() is called with a "IDEState *s" for one of the
> two IDE drives on a bus (primary or secondary drive) to cancel all
> pending DMA transfers on the drive. The code then checks
> s->bus->dma->aiocb to see whether there is any IO in flight on the
> *bus* and then calls blk_drain(s->blk) to wait for its completion.
> However, s->bus->dma->aiocb might belong to the other drive on the
> bus, and if there is no disk attached to the current drive, s->blk
> is NULL. Since blk_drain() does not check its parameter for a NULL
> pointer, QEMU can crash in such a case.
> 
> Fix the problem by checking s->blk to be a valid pointer before
> calling blk_drain() in this function.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/905
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4052
> Reported-by: dong ling
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/ide/core.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index f78b00220b8..49848c8e6bd 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -741,8 +741,11 @@ void ide_cancel_dma_sync(IDEState *s)
>        * In the future we'll be able to safely cancel the I/O if the
>        * whole DMA operation will be submitted to disk with a single
>        * aio operation with preadv/pwritev.
> +     *
> +     * Note: s->bus->dma->aiocb might belong to the adjacent IDEState,
> +     * so we have to check s->blk for not being NULL, too.
>        */
> -    if (s->bus->dma->aiocb) {
> +    if (s->bus->dma->aiocb && s->blk) {

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

If you don't object, I'll change to:

        if (s->blk && s->bus->dma->aiocb) {

when queueing.

>           trace_ide_cancel_dma_sync_remaining();
>           blk_drain(s->blk);
>           assert(s->bus->dma->aiocb == NULL);


