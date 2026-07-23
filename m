Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B73C531CB
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 12:28:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmsWi-0004pk-FH; Thu, 23 Jul 2026 08:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmsWe-0004p5-2U
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:27:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmsWc-0006pK-1p
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 08:27:43 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66NC6AqH3833705
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xNphbIzswM9eFwLcfCGZbRoQNelEB99q8hXmKnFIwF0=; b=FpxwZrfBb8LrKrGA
 839s7w3CeR03Z1WpZ5jK1d7k2M5RXY/nJyr6XyBxRwEYzlea9AYeyyYqJRZGiJl7
 3rTg5ljK0JG41rZ9LAbtuJMl6aKwM1BJbxWtyV+AAxwhREGFI5bKRyNcsT7ip96v
 HGyisxtikKiIIVzkYYWjeZq1s01dGfZJB+N5tJsiiEUi5scEzdKqn5279nNsv3Pd
 diRyebJgcFqM28yEGT5Ch7TtKoUPgNBPCxn7X6TNF/gUDRstB1dwvw8cyDGGbKVv
 HpqtmEbXxl8mwAu6RLzLun+PMFwdQE5Z50GTtpj5SIK+wPvvv0dI2Maa91muL7Qe
 leXyAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu82y2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 12:27:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a236220so11198911cf.3
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784809659; x=1785414459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xNphbIzswM9eFwLcfCGZbRoQNelEB99q8hXmKnFIwF0=;
 b=VjoDK9WE7lSSBqHLHv2RK+Y4wMfJR4pDNft0JFC03o9ApRqHsWEzMg3IuSfDPcLSxe
 /SFfdUVDmMkkZtW6Ax2UjBPzo6ZDb5x7fCccKHA8UJLAm9zHU6yDu9Cu9w3w7IMlBZu8
 PoJKjAj7i8hmzQyYl3ungYVRNHM/lNr6wMgzTNcr9K3RfeQfYXoRwU6BvQOROGQF1nFn
 /s9gOkgPDA793xfZSMhv5gzYpRsRE+V8Mq41L9J/+DRYO6E73AOJMnJJadidcGf5n6X7
 848LIZ2/uBt3N+tx3cCcMLKHykZmtTbP5n/GzsOVMFb+PCucFn+1s+Gdho9A4c5zHOsW
 XA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784809659; x=1785414459;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xNphbIzswM9eFwLcfCGZbRoQNelEB99q8hXmKnFIwF0=;
 b=SFgrhDeuYn1xeIN4Lm1Ihcph/4PyQH6PYGyyRLxqIhmce+Abcfr4wOAl9VoJsMtBVZ
 pxYpdrOWoaPk19rIHWDnUO9BxCSQFz7HrxC+3Dz7KG7CpZa7K8jeb531miBmq5nTMzSB
 wQJTRkdlrd4tuKLEgUhNMdl5SoDrvuuExvTwOZmMRcWAkxMY8zZPIK063HafDI/Z7jsV
 KubNaid9yAma8z2HOD1gS+cNmaBdxnREaPti6yIG++ffGv/k5s0kmtAja6mGWfnwo3ES
 LshVnhreTotuQ+DmG8QzIWOPPI0YpMUwg9SpzoxPHOE2ODQ4PYD0syxMxR1TikO6kUlU
 Upuw==
X-Gm-Message-State: AOJu0YyQqyE1nv1oBwdsrdEst8W/TV1GPBnjlnIFHabU1HxdMh3dILyh
 pZ/7TAA58So2xbwfQbeLBr+wchgWTgwSzFE/q4uvBma7tvYb/FRR2xz4EYqLD2U6TR0FBAf92ro
 Ocg/EkxbU+5zMKLm1bvmSythHfRWtUAwxzqlmMj/03a8VwvZXIdlhVzsTubk8
X-Gm-Gg: AR+sD114GiYKxF5Sk50/aSOC846OvJfxsaPGJD4YfjAED18kPBN7UJPj6sI/Z2KAsUe
 659vw+uKHt/RGCOw+u7ekIDvYf9Uy/sqSKLj7tbjIK09ZLqBKDDfv16wmbY53zfqlIRVEkXbrag
 Hmvlera7D6izMLD3ovHn9snS+8FtUyu3pM450+QetmYpvekjktlt/CrgT6+k67mN9jscPJnSj7L
 YOCBGbxokyWGgY8u6oqpL6PuZurmFHZrjpaIx76Qm5zXxVvvysdEzNzKNAIV9Yiswtv2N3y1AQP
 oDOuZ5jicF3elA5HFe8gvlPiKSh6Qa2ARdQJc06VCfhr/1lfdb2gMDqlfjVLT+lednXZ4RgXUwg
 CmhdR13VhzSnhXGfX1nx08f+NJJ1KLCt6M7c8x9athgADIrqXwWc=
X-Received: by 2002:a05:622a:14e:b0:521:556:e492 with SMTP id
 d75a77b69052e-5283e02ea57mr25781271cf.88.1784809658676; 
 Thu, 23 Jul 2026 05:27:38 -0700 (PDT)
X-Received: by 2002:a05:622a:14e:b0:521:556:e492 with SMTP id
 d75a77b69052e-5283e02ea57mr25780841cf.88.1784809658152; 
 Thu, 23 Jul 2026 05:27:38 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6f076sm15665397f8f.34.2026.07.23.05.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 05:27:37 -0700 (PDT)
Message-ID: <d934b1b8-d639-420c-9974-f728fb752bbd@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/vmware_vga: Don't allow guest to trigger long
 running loop in host
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20260723120020.330089-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260723120020.330089-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VHH-6AgG7OeiYRiOT7f7LRJSlKUM-Pio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX24VU7rVW/Dfp
 e8sqFZ3LJ4B1JFBPpT8Pt/bHYUycMBlrct0oZnMf6kGMi4ftA+YhsgFtFLYVB1NA6SgRNZcLhkG
 2JCqb9/LfTCNEt3IbUe/gDzcoKMpWvxeM7EgabnxNYvcDQ+VUAfer8eKT+vG8XZ3g7jZkxXZ9SZ
 nAIC0gYd+Uwxj7rlB2va/4Pxvyuqw/FCVvhAsIqKvgd50k1PslLXeO1PgSZmnyniAFyLqxJJEMD
 zWJOd3Y1Uv1PsZl+WacpSt57//wdCAtAEOPyLAw/ZUBU9HTYQDs2kG07rXT2M3/Osw0m00I2ugY
 PiyK4zzy52fT/4CHqv90k+g+IFYCF3ic103jShV4rOrgHvMXaMQn06q3OxE5i1Wuz83NIIadMh2
 DRWuDShnKHv7OZDrjhc1rGS3S1MRlxOtTbxDL1b1/IWl0EC2eu9PrTubYgCZAJRfpUlonIFXGFf
 IaqhmOARfI9foi0JcPA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a6208bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=J_-Nd1mkAAAA:8 a=AbWGNAM0AYlVCVsMptEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=n8ForQn92ZFaZtFqRdMw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMyBTYWx0ZWRfX506sL9hBQFX1
 qI3pghn0ZSE82SLRIVx9BfGUjvUdMOwQ5DKZ7GauQxpjmvjJQ+Z0TDvQZjqS7pyvwvvTrIfkSMb
 M1to/lG8xmVtql0Xrq2eoz8l6ohETP4=
X-Proofpoint-GUID: VHH-6AgG7OeiYRiOT7f7LRJSlKUM-Pio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230123
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

Hi Thomas,

On 23/7/26 14:00, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The code in the SVGA_CMD_DEFINE_ALPHA_CURSOR handler in vmsvga_fifo_run()
> basically does:
> 
>              x = vmsvga_fifo_read(s);
>              y = vmsvga_fifo_read(s);
>              args = x * y;
>              goto badcmd;
>              ...
> badcmd:
>              len -= args;
>              if (len < 0) {
>                  goto rewind;
>              }
>              while (args--) {
>                  vmsvga_fifo_read(s);
>              }
> 
> Thus by supplying huge values for x and y that overflow the result of
> the multiplication, the guest can trigger a long-running loop here
> that burns the host's CPU cycles.
> 
> Add some sanity checks so that this cannot happen anymore.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3782
> Reported-by: Feifan Qian <bea1e@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4026
> Reported-by: Tristan Madani <tristan@talencesecurity.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4076
> Reported-by: Sunday Jiang
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/display/vmware_vga.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index f6f9edfd1d9..04cc438cc02 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -737,6 +737,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
>               vmsvga_fifo_read(s);
>               x = vmsvga_fifo_read(s);
>               y = vmsvga_fifo_read(s);
> +            if (x < 0 || x >= 32768 || y < 0 || y >= 32768) {

Maybe add a self-decribing definition instead of magic number?

   #define ALPHA_CURSOR_SAFE_LIMIT 32768 /* Arbitrary limit */

Otherwise LGTM.

> +                goto rewind;
> +            }
>               args = x * y;
>               goto badcmd;
>           case SVGA_CMD_RECT_ROP_FILL:
> @@ -776,7 +779,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s *s)
>               if (len < 0) {
>                   goto rewind;
>               }
> -            while (args--) {
> +            while (args-- > 0) {
>                   vmsvga_fifo_read(s);
>               }
>               printf("%s: Unknown command 0x%02x in SVGA command FIFO\n",


