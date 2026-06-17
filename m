Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C33CD98E4
	for <qemu-trivial@archiver.kernel.org>; Wed, 17 Jun 2026 12:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wZp2n-0007o4-NK; Wed, 17 Jun 2026 08:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZp2m-0007n9-Df
 for qemu-trivial@nongnu.org; Wed, 17 Jun 2026 08:06:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZp2k-0002h5-Hy
 for qemu-trivial@nongnu.org; Wed, 17 Jun 2026 08:06:56 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8VqA82192032
 for <qemu-trivial@nongnu.org>; Wed, 17 Jun 2026 12:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=; b=VCbLZAkAIrSn2+Ff
 IGk6VS9V7N7jtqiRsxO/jRFxdW8Lavd323fxub60N3nDAc+M1fqMGuLnA08doNqX
 aijIJlPv2Tow1GYP+def2obBMSfqE4/D5oSDwe/I27jdenZZu78z76HXS5CBMnLz
 qyEkAMfL/8faS4EF3jCzUSkxuHOnue/nhTs1ruvGwy+h/7+smNmPqeeksyRSnE4N
 K0XzRPDw4KddKoFyz8bHTYrh+PhNv1VyznfTKTZsieJjCdbSbyX1kDD37+KVPAqT
 Fq+P9DbfFeZ0KVJFk8WlLdskuvvrHBxrAMHZm2YKjblrHRo/URzPOwZ3vgenbRmH
 WSxLfg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesk1tq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 17 Jun 2026 12:06:52 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-963b07e2003so5355827241.0
 for <qemu-trivial@nongnu.org>; Wed, 17 Jun 2026 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781698012; x=1782302812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=;
 b=dyzgCH73IbE2isHByh5W0P1iW+SDiwToi2JgrZMPUY0Cl3rTY+RtU6ouArjKl0k2tZ
 3ddWseLPRzHyO+lrot5WeCngmIxU+4ga+KYk5/0UG5aYqgSrvLreiZpknpMCCDZTc7Oj
 u+C+vzsvVbBxxTZtXVoZ0g8/Iw9G1ARfFzE5dcF4xMzXXHbETdFxJYrvy3STiC/SOxHT
 SgvwvKF1sLJ8pODLh8PW8m8wGR1+QddZsRDyOagHqPBvXZ+cRtbtkFK55M7F3bc8nDuv
 iOGecpBQjx/i5rE5tjwrDxILo1J0QZo1zZVjbZeOsrHvKmINCPkwvD+qt3dVToWI18Xt
 C3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781698012; x=1782302812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=;
 b=hATUTh875D4GQkR17apv3qG1L+YHR3sUwtZhA8K/Ix89YnuLzDRpBeucPNuP4KWz9A
 qhT9yPv0CUi6PME6I8nTefRkFanqfKbBUj0fidXhVyiT1q2D47aAlVRwoWlr9Vq/Ooab
 eap/HM9VbTG9BedHteOy+H0CT4pJ7Y41zKyjlo3Hz4JHVFiEZVthjZ0CWHKdbylQxF+4
 JQNdB+JnIXEGbq0M4NU0xKHPzJmynyc4uJpf1ZN4Mi2Gq40/yDvvuD6P648qDnVueJJF
 mpXMn0vzR+zFC5hv0THhncKu/umNsK60hXUytt5yTTVI2lNUw9k5heWwX9T+2Dw0nBpO
 4ytQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/s3HnFWlJX9EG0v8oLt0ZpHJQDE1SSIvgtmQ26xTSvmxy7XT/oDqcnvfmCGdLIwXbfIsW9zH6ympDj+78=@nongnu.org
X-Gm-Message-State: AOJu0YwAlR+qZCnGFHVoHDw0i6/NJfG+PL1xEDwoHbOaO1/sBbS2t6RW
 6/jXVDLswTsjShxRpIIqBpQyN9KwtQ+U80g1imUpgDOfiigcFWB/X0SaIs13CA7j1mZJPdDxwvO
 EILkTn2qH7ne9QlDvtTGXpYMkUpgDd1d1ErirPC0ADnXYlq+Sp5/XaBL+2BjS
X-Gm-Gg: AfdE7cmt5sDkQfTcM3/xmHYMR11keL4I2E4ryKunSwb8PJ7BApuYW7SJiDULhZ6qtwR
 laoDbWH3mfTrhGdr5T8tN+RKS64Kcm5I8gIizQ0emqEQVKJdJWuDaPCTtmq2mZ7DsN2HPzkNToD
 WasN+GBE04AwHaPHzbrvhzjU7oU8nHyWqZVOxs4eBf0KM9Xff7wpGXJcQSYflICfwA2ypuvklby
 lWnFbSOpPb3Kf0gdF13auAvxxLjgF4S5Vq6CUGaArKLC1BXeGHLxfKiqyGKfXPwTlf/R5PiqmAo
 Cxdv7rkcnMyfy6pU/cUYfRG3AqWezwqLmEwZeUj3P2FDcbWPplhCQFF6V16FEyCpN0qS0v7ASkv
 Uze16ek5FnyYY/jEgop1cwyxDs0AiZBZI9hrDY4mD60UPNR3Yw/rf8pqdEFu8YQ==
X-Received: by 2002:a05:6102:6a8f:b0:6d9:a879:8e39 with SMTP id
 ada2fe7eead31-7246a30bb12mr1907704137.14.1781698011577; 
 Wed, 17 Jun 2026 05:06:51 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:6d9:a879:8e39 with SMTP id
 ada2fe7eead31-7246a30bb12mr1907644137.14.1781698011147; 
 Wed, 17 Jun 2026 05:06:51 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4f8d7sm151753335e9.5.2026.06.17.05.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:06:50 -0700 (PDT)
Message-ID: <97b7799c-4294-47d4-8673-d9634a173fd4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial v2] hw/timer/imx_epit: Replace DPRINTF with trace
 events
Content-Language: en-US
To: Wang Yuxin <163wangjack@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, mjt@tls.msk.ru, laurent@vivier.eu
References: <20260617115949.93529-1-163wangjack@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260617115949.93529-1-163wangjack@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX7zNIGi3c3c9F
 H0L25ccU0/MKwdllVY7oqBMNYYuV+31tBPm2VXbYVwoOZHSS13C0+pRHidgIykogBxXEa811aLB
 ve46YXDhHrcxRKjpgeNtxxf9zQhv5x8ZWjW+L4OVrxd1Icq5y2G7vzzu8H/T5PHqGyH+TpDVZKK
 IYsgwdlUCbwPnaSZj4QXGQMrDlgFTRsUB9Q6x3zPKmCF4reDmHxs1O9oTSLvq2qFKPrwR12nt5I
 +0gQqXLVKn1rCLfSMDp1nwXrg1DIEm1rj0VyrDRYfNOh84Tww81FSvxDrDrZBGbYVQWEPrnUwmJ
 lcwTrKlh+iw70aa7zoGjz2QcnOVLAycMUsBjTSOeadjdOQWfnJSDU/E8xb+uwu4xfDW7PgNMtGe
 ZIckP90nBENL5KCRKUSusxOEDtbAcBZtQFWZU5i1X9IhZ7bae5n4pgtETxr+sqiThk/uwMN/GdX
 9AYo9/YbvVV+eS3f/jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX6/Im+BNUbrlf
 eNhhDPqm2H+nueo3eHVEGa7rtceJrwrb5esWGYzSa0UydPSFAglScYgwdGWJ3vZIaiiaEzJr2G/
 EADXon1XSSNwt3Hmp2oeIfmqFYfQftA=
X-Proofpoint-ORIG-GUID: 2uIhgLgiXITThfUht7GNpSfxn4ALpAtz
X-Proofpoint-GUID: 2uIhgLgiXITThfUht7GNpSfxn4ALpAtz
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a328ddc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eGY6v0xcA4BH_BAmjdsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170115
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

On 17/6/26 13:59, Wang Yuxin wrote:
> Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
> and DPRINTF macros, replacing them with modern QEMU trace events.
> 
> This also removes an empty and meaningless DPRINTF("\n") in the
> imx_epit_realize function.
> 
> Signed-off-by: jw_mac <163wangjack@gmail.com>
> Signed-off-by: Wang Yuxin <163wangjack@gmail.com>
> ---
>   hw/timer/imx_epit.c   | 25 +++++--------------------
>   hw/timer/trace-events |  8 ++++++++
>   2 files changed, 13 insertions(+), 20 deletions(-)


> @@ -328,8 +316,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>   {
>       IMXEPITState *s = IMX_EPIT(opaque);
>   
> -    DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
> -            (uint32_t)value);
> +    trace_imx_epit_write(imx_epit_reg_name(offset >> 2), (uint32_t)value);

We could simply pass an uint64_t to the trace formatter.

Anyway faithful conversion, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   
>       switch (offset >> 2) {
>       case 0: /* CR */
> @@ -362,7 +349,7 @@ static void imx_epit_cmp(void *opaque)
>       /* The cmp ptimer can't be running when the peripheral is disabled */
>       assert(s->cr & CR_EN);
>   
> -    DPRINTF("sr was %d\n", s->sr);
> +    trace_imx_epit_cmp(s->sr);
>       /* Set interrupt status bit SR.OCIF and update the interrupt state */
>       s->sr |= SR_OCIF;
>       imx_epit_update_int(s);
> @@ -399,8 +386,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
>       IMXEPITState *s = IMX_EPIT(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    DPRINTF("\n");
> -
>       sysbus_init_irq(sbd, &s->irq);
>       memory_region_init_io(&s->iomem, OBJECT(s), &imx_epit_ops, s, TYPE_IMX_EPIT,
>                             0x00001000);
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index ac5afe84e8..3c282800c6 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -122,3 +122,11 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
>   hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
>   hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
>   hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
> +
> +# imx_epit.c
> +imx_epit_get_freq(uint32_t freq) "ptimer frequency is %u"
> +imx_epit_read(const char *name, uint32_t value) "(%s) = 0x%08x"
> +imx_epit_write(const char *name, uint32_t value) "(%s, value = 0x%08x)"
> +imx_epit_cmp(uint32_t sr) "sr was %d"
> +
> +


