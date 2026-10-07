Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0778ECA5FF1
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Oct 2026 09:15:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xENeQ-0003xe-5c; Wed, 07 Oct 2026 05:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEMQp-0000P4-N2
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2026 03:51:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEMQl-00028R-RL
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2026 03:51:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jglw3334712
 for <qemu-trivial@nongnu.org>; Wed, 7 Oct 2026 07:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZQtqoVX/rTP4bKM66IQAHSm/v/EqNRjKbhfiVFETvRg=; b=R/fgwoGT9rbTmiBs
 Tjh7zX5tCUSINVddJFrOt9GW1WhDm+lz1z7Hgz9/bDMCQ/HqleYpOrbe8Lzp9el9
 gGRphch0bXaiiu1wwiwukLNgY9EdG3JmI+uugbAzFY23EDzU6sG3H+VxWAU8OuG9
 KJSCf8g7StK/UV8D8gi6xBZi9xbp7ZdGkljDybS4egIGyz+Pxo5wzshGcw4Ge1tU
 1LGstr6DYByULdSvFTVTeVUKE9iPifTuOfL+VG//i6JwLAgkDpmh27KmhNLHFPfV
 4t08gSusnFXTMNRmr1rFkPCpwc4k6M6etVtKfVsTZ7Ks1NV6EVHJZSnxrnFXm86r
 jNWC3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h546233dh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2026 07:51:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cc0b31ecaso806746485a.1
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2026 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791359473; x=1791964273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZQtqoVX/rTP4bKM66IQAHSm/v/EqNRjKbhfiVFETvRg=;
 b=I6FSVr5t9uYW3wNs1kZrN1Nu54TPw/Xy1SFvXX3y6qcNJhFSHB62Tk/oINQ8pF1vn4
 KfvLZACMUQpAbm/eO9AaAM/3AB29tcwKS9MygZJSZ9NsvsySLjyRFNC6FTJ2368iCzbQ
 /XdIbjNcDjek/VXLkxpkRFCeUHfiAENtWiV7LxOZ3d2b5BRfVsQDVWGVHGUrpTx/QRUR
 KaQOQITsw96mGlkg6UjMopp/TG3+lnBVi0CoqCvCp4RSk1rPedVZaUJN6pLR51k/kXKJ
 Q30Di5RO6xygowK7PQ+7damvxeCpaIMsoxV/ecAG9IVWHCGCRWeR0p89+LijKGpu3Sa3
 x+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791359473; x=1791964273;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZQtqoVX/rTP4bKM66IQAHSm/v/EqNRjKbhfiVFETvRg=;
 b=cM4Wn/FNhXe6HdSEIWzopuq7NmoTcH1XsG/pniTO4PsWzGGcBORZwc6m/eKyobSfHe
 M8VYQtnOxjdmv7Dbkhi3urrGVl6pcC/BH9y8YMWxUXLMKlsvYPvjs6PT4EXn4uKQ7J1e
 pj/zHdBiYRXJUxAF3RjahE4YDTL1Zp9XOK4dw2c9vLurymQ+fEyvosR/MicaoEWHXYw8
 Tmy7TPv+YZRGeL1jV2hee8m55NWNcyhClkz3QQTbAxGwCIuHJ6POoD97ny6TZibNzBHO
 F+4tKUuEzpQJZJEL1ALsjJ/4fn/LIbQBa58PSwTRlyBST4qu8raCBy8QMW3TukrA9xpb
 8B6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcEPw7CYyk/LUq/dRAv9wNrjeUFmTLsFcAEwFs32P2XYzOqABvRDAQjQ85jf2kSqdR9Jr0Itogb6wbFuk=@nongnu.org
X-Gm-Message-State: AFuF++loq6ze72xkggACq1z4DUqi8sgvjn6q+8W92YG/k83zet/2XRIh
 6BiUf0B/5UIqYU9toQWyGA6ux8Br2ERNYvw2G7zymZh4/PXswKVvdwzO22OficqJGK+Q7gx/puV
 gPqRMRJqpovpk5tpBxVnQwph1zNEkS9lkH0InKeFUI/MvtA4lXlo2LFQ6opyg
X-Gm-Gg: AYBFou1ibYmaIBKF9twL9KZjrjsnd3HrD/nhUFOu6lzzkPZyfZX1eNuIFa32hQILAks
 YPR8KheIbdIPr0AAwVO3yvcdVbRvGLueXbQf6wciovu6GCz2YvyXAPdiNcEBnWjZ8Ez9VNgybMl
 5YRYXq+G8U/MrDZQZIUUAU/Mm4oVPDVDuLNyw28EwUi21U0vo46ii4rDcUMdyI5wHsDBPpquW32
 SZXVx6m5nM5pq1mYp4/phTNTUy09LgjYQKwc40NuqpmgtSeLevn0hpBC1c9uW2aPWvKamP5wjJZ
 rIcbwSZQaX/p/8yj9IRSAfQeFp7OikGq3E08PgVQjU8yoiO0pmTZt6h8N9Sc/U0Cg9lw5dxIL8c
 qHspLF+QZiUoWBe84rdOPNh9X/dhVlZ6Zcw==
X-Received: by 2002:a05:620a:6f0e:b0:939:de6c:cb45 with SMTP id
 af79cd13be357-93e9b7e3fa9mr255016985a.47.1791359472508; 
 Wed, 07 Oct 2026 00:51:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0e:b0:939:de6c:cb45 with SMTP id
 af79cd13be357-93e9b7e3fa9mr255012985a.47.1791359471874; 
 Wed, 07 Oct 2026 00:51:11 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c75b4e3b2sm1541459f8f.57.2026.10.07.00.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 00:51:11 -0700 (PDT)
Message-ID: <b0bcfbaf-e49a-4005-b40d-4e64678031d5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 09:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/apple: Fix obsolete PGDevice function
Content-Language: en-US
To: Yundi Xu <yundi.eric.xu@gmail.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Dennis Mueller <dmueller@qualcomm.com>, Joelle van Dyne <j@getutm.app>
References: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C-tGXuCzfSpNtqqAGO3IW1B8OBYlrhzi
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac5f9f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=0s5TjalLHGbX2h47szYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX6Bv3yCZVUkN5
 64wQ2N6/r9t6nIwJVCF5AA+1KfTDLc02vkhBISIJzRljICR3oGBHWG3TNW3LDDXO2xPqBPatBxc
 8b0Tewto0GN8WFyA7/JrYcIH1iXIbgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMSBTYWx0ZWRfX8tj+36c03sq/
 rYyv1E7yRkxlwZsHUIpxZrmhNOpanmU+MbRXeO5cEKOg86SNkPWRRmc1U6nVmzH5h2MNk/YJ3o4
 fHq4bj4LFInXvEp6cbQcwA2hqeUffR0uCa2bO5qeZCvbE1oEYwpm7PkSO+eVcUWhodsbIz/kiQe
 VzOw4yHTFzJ3lxaGSVE2lGnVN7MeNgkp7LBvoB6IFngH6IjUtwFjxyNC4ZiNSMkHZuiG6hknv1s
 1G1kWjUi2pC/8cfFrBWwZ162JxhQaibOuWcOc2eSmoncyoJf+2xjpgyZnPm3eh5LYAnJqNrbbl1
 uAgivoW0WwNO5DlZ69UcBRLBGla9zlLl7rtJjNnk99zHCuFcnn2xUxH/akZeJCnYY4ff1NCn1/8
 XQvCd11TkvmY5FwMCwiAlz8BjyCFGIjc1fm8l3p64d+N2aOKuDESy5VdYyuamVKVFYDV9FGAFqs
 JsULIjflpNinhp0nnvw==
X-Proofpoint-ORIG-GUID: C-tGXuCzfSpNtqqAGO3IW1B8OBYlrhzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070031
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

Hi,

Cc'ing Akihiko and Marc-André.

On 5/10/26 22:59, Yundi Xu wrote:
> PGNewDeviceWithDescriptor is obsolete. Replace with
> PGCreateDeviceWIthDescriptor.

Joelle did a similar fix, can you compare?
https://github.com/helixml/qemu-utm/commit/b795d6de88fc52cb6ff061e0e034be51d8e9c474

> 
> Signed-off-by: Yundi Xu<yundi.eric.xu@gmail.com>
> ---
>   hw/display/apple-gfx.m | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
> index be0061b9db..e730909c7e 100644
> --- a/hw/display/apple-gfx.m
> +++ b/hw/display/apple-gfx.m
> @@ -767,7 +767,24 @@ bool apple_gfx_common_realize(AppleGFXState *s, 
> DeviceState *dev,
> 
>       s->cursor_show = true;
> 
> +    /*
> +     * PGNewDeviceWithDescriptor() was deprecated in macOS 15.2 and 
> removed
> +     * in 27.0.
> +     *
> +     * It is replaced by PGCreateDeviceWithDescriptor(), which is 
> available in
> +     * >=15.2
> +     */
> +#if __MAC_OS_X_VERSION_MAX_ALLOWED >= 270000
> +    s->pgdev = PGCreateDeviceWithDescriptor(desc);
> +#elif __MAC_OS_X_VERSION_MAX_ALLOWED >= 150200
> +    if (@available(macOS 15.2, *)) {
> +        s->pgdev = PGCreateDeviceWithDescriptor(desc);
> +    } else {
> +        s->pgdev = PGNewDeviceWithDescriptor(desc);
> +    }
> +#else /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
>       s->pgdev = PGNewDeviceWithDescriptor(desc);
> +#endif /* (__MAC_OS_X_VERSION_MAX_ALLOWED >= 150200) */
> 
>       disp_desc = apple_gfx_prepare_display_descriptor(s);
>       /*
> 
> ---
> base-commit: f7ada39edacaa5c26b30e98b94017b0b2ccbcf94
> change-id: 20261001-fix-pgcreatedevicewithdescriptor-3ec303c2500a
> 
> Best regards,
> -- 
> Yundi Xu<yundi.eric.xu@gmail.com>
> 
> 


