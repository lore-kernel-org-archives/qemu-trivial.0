Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E5C43458
	for <qemu-trivial@archiver.kernel.org>; Fri, 10 Jul 2026 14:36:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wiCLE-0008JD-7D; Fri, 10 Jul 2026 10:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiCLB-0008Iw-TG
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 10:36:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiCL9-00047g-Lp
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 10:36:33 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AD6Ybw700689
 for <qemu-trivial@nongnu.org>; Fri, 10 Jul 2026 14:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 twji/UENts/c1PezN6IXQljJwgtiSH7XcHIYH2EMIcw=; b=ovl4/yifKc8MMi5T
 9WvHaxDDKbslltygswB8feJXvI3ZS+cESRLM0Af6++vCUE9BjaAtCsvUr8u86lsv
 SVDc+2uW4mfbZWweRrD3mow3/Yr0/BKK3nA1DxiAfcV9ok8Z3yVLNe4JdgQUH9Eu
 dI6F1iu8RbMS/IT5kAmS4OJtfakNM1rxLUriJwQxpDcRau8ZEzK2yq783yV2llEq
 9nDA0vhM/yC10msWxDRsdMxHQiUp+WbiciDZx1cY/mjp5lmsjPvoT5iSaZ1VYTqj
 arZsFk+ljQyNfPaLkLSzjTQaBi+9YEyKh/HtesB2pvoaOjVAc/QZUQiLqsicDQMz
 cEHg0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8ks8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Fri, 10 Jul 2026 14:36:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-517e054fe07so19064721cf.1
 for <qemu-trivial@nongnu.org>; Fri, 10 Jul 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783694188; x=1784298988; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=twji/UENts/c1PezN6IXQljJwgtiSH7XcHIYH2EMIcw=;
 b=XsSZ+D8jLt9H4aoCCf/kcZ6hrYFYOlleFvKCRNw20NENIEoh7/P8F7MOh/tGjVjjV1
 e5+EvRCa6t9gg6er6UIAkyG1MWRTn76t2SBsS2paShqtbaR2lmqxL6WjVGAHxCkxRycD
 rSa449Wra1TFHsmNhj0CJWtk0FdaqfIcLdK1OTrByL0z65ornV2Hk6pT4bjGlwfoyMnZ
 CXAsKwqsRBIdvNjuobY3dn/5QZ+fLjWiO8xLJ/F5dQKDoV+Rzb6oo4Nxj/hMw+WMBDQb
 Zzu2UX6VZW3RvtjJvRFb6FuzTrKzTXwGX8cblKK91G1pH6voNb5lhZKtvJrZI+uQjl+j
 TwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783694188; x=1784298988;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=twji/UENts/c1PezN6IXQljJwgtiSH7XcHIYH2EMIcw=;
 b=kplEy95osHdeEPAd4bGT43DOOQ5k0DY6DuxrcXQQ7yYN0kqJnIG3XEaZac0yVvnhhX
 oI9eePZbyeysk90iJu7MHXNbvHZUNXEpBkUEa8NVO6hheVYCg5oWoBB3Koy0ufuSlV4X
 rNR75tqgi+4QtoBGu0I1pSDOM1YhMBwal5ZLryzJvx64gjlr0VDODO3sv1bbLTxbI2Cs
 VY2ItwzZZms82E8c8EcBYqM+QVAaOG3ivpcp4cjtZolcFLuGV59LMZSdNp6Bn0Zx4X8T
 9hT0oAFEKVIOVqpjxNdysb/tlHj71RfHUAOV7tY/cfG8j7dejqJ8lknKdCbdfAv+UMq2
 CXRw==
X-Gm-Message-State: AOJu0YyuymhP4nbpNWstNJzZ9aiyvsAcWITPC2z0lCliyQx9Y0/zsV4d
 fBVrQe5HvvWOxzDW8gCdPYcLQcD2RL08CDvCJgUC4tNsC+e0apWPUDzeVtzilh3yEiRXJ1MrW/y
 PIBCDGh6TIW7Am3NPJQT62w0JX/V3393ejWAUQz+CPPAoO8Eo4Sie3Qe3WV2W
X-Gm-Gg: AfdE7clItlnK02g7hDzaUMpH8T76ILoXCz9KwRs3zBU8hZm5jrUmUZJADrKJQEfUyFn
 KH5gh0t9MnqT/q99BR5MfMKf4ZHOcTtrWlVV7j/59r9t0hztKDizEKHVuv5soEgVHBpIqJIFaVG
 tSTmHLQS9Lc3OLCOaplOgomrAhMyfJsNL1SlckLVrByiHfxB5Sp8N9LMYlf/p266jiSY+Dv86PA
 6fWh1hEaS0bRo0KpVeubVGSUYeHBwwe0XOxPjr9KdKShiwjSaYKKfZHLJ/YeN31cTRrHZzecDO4
 vNOuDVjHG28fdkb8ac57PJiXjaR85cLHlm4onObCuDvULmy6BEWFtKRvOUEkGg8JPoYgVpi5Bhf
 PF9AfIJiMfmVaJdm90r+pR/HPsw952IApB2idL/+GTd2B7uK63kJy6G2wlxrI9A==
X-Received: by 2002:ac8:6f0c:0:b0:51c:1027:34d4 with SMTP id
 d75a77b69052e-51c8b39fe48mr146801421cf.11.1783694188370; 
 Fri, 10 Jul 2026 07:36:28 -0700 (PDT)
X-Received: by 2002:ac8:6f0c:0:b0:51c:1027:34d4 with SMTP id
 d75a77b69052e-51c8b39fe48mr146801111cf.11.1783694187952; 
 Fri, 10 Jul 2026 07:36:27 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f214d2sm59416091f8f.33.2026.07.10.07.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 07:36:27 -0700 (PDT)
Message-ID: <98470e76-bd6a-4a01-af1d-6f03ac9fcdbe@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/usb/hcd-xhci: Turn guest-triggerable abort() into
 qemu_log_mask()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20260710142727.592667-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710142727.592667-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LuqMEg3qye7gSjVqAvSstykDMPCHurkO
X-Proofpoint-ORIG-GUID: LuqMEg3qye7gSjVqAvSstykDMPCHurkO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE0NSBTYWx0ZWRfXzlL4s7XbJcTa
 HaPRVnc8diQfX1/Q3FnE6oGXnS3yDeJg9iaGZPAFhppIk4NS8iYyCWCUsQ8aq2EhRUbIBR0l7te
 xZCoDGdl5E8O0gKHzmvtkOIzDMosJ4I=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a51036d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=KcFzjVdSTcdEk0ENZCsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE0NSBTYWx0ZWRfXwDBu3YLYX/qJ
 +liRsOF4IFN0FRCfFLNuYCtkVw/xzRlbYiGqcN4mqlWTDgD+anun+bdcO/CAr8ZRoXdn2ng9qE2
 C6CwKdIeQ8t2YBrrUozFOhMplA0XrkiHmecRJk0KZAkJDaVznl9aPYCZ4qqDdo0n8ZKlgjUBHe7
 bgyQDieLKf08q/zNZ0K6LzdTKrOLsjbJtJDDmq2fkvIrAZObnqcXa7xAS8IzfXTnOp37F/Iiw+K
 yUL4mki3rnmfBiiQLUqPw11aVcKxFQgNXBoCBqqc0tc1YtjJS7KOPMGdLrOdFn/d1FhzudV+vhz
 hWgcBUK1R7+vzujOrUS4c8ghJHhTXH1fgh0CJ9jWmepQuYew8IeUcEv9mJ59xDN0QsHRMIr3hoM
 imBRmi7kFlWrqKEGTi2VafjsIO+rhM4i/nvdnCA6bHjHEeYur8CCcJE5veK2Q9MvdihdxIoYs+j
 BAakYsHVj3HhfeG27dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100145
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

On 10/7/26 16:27, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The FIXME macros in xhci_alloc_device_streams() can be triggered
> by a (malicious) guest. Since the macro also contains an abort()
> statement, this terminates QEMU. Turn the FIXME statements into
> a qemu_log_mask() instead to avoid that a guest can shoot itself
> this way.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3784
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/usb/hcd-xhci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 2cdab3ba0e4..9ff50d0b7f9 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -965,11 +965,13 @@ static TRBCCode xhci_alloc_device_streams(XHCIState *xhci, unsigned int slotid,
>            * together and make an usb_device_alloc_streams call per group.
>            */
>           if (epctxs[i]->nr_pstreams != req_nr_streams) {
> -            FIXME("guest streams config not identical for all eps");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "guest streams config not identical for all eps");

With trailing \n:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>               return CC_RESOURCE_ERROR;
>           }
>           if (eps[i]->max_streams != dev_max_streams) {
> -            FIXME("device streams config not identical for all eps");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "device streams config not identical for all eps");
>               return CC_RESOURCE_ERROR;
>           }
>       }


