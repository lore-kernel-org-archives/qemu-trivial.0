Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B3C43638
	for <qemu-trivial@archiver.kernel.org>; Mon, 29 Jun 2026 14:56:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1weDPY-0004vP-Hj; Mon, 29 Jun 2026 10:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDPR-0004tD-T3
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2026 10:56:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weDPP-0007tY-2q
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2026 10:56:28 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65TAT6HS2627938
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2026 14:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9/oCyhmjXz+KKfudtfEN2iHH1bOiZ4tAb00LKpqgSQ=; b=px3FS/nF8qqPlncU
 7CxrAdZaAFNYDfbo+6IKj3ECzAbDCK166/07zEqWEW/zrSrfxV2QuqeVxv1Ti9sa
 thkNh9Tld6QUY94Mt2bRXsT7tv/W+yMk70HS0Cm+JGkPaOzXSY7/sF0nWu3oSLTn
 uVKPz351EGqfc+nppevBfsPSpCkTmgRi+GPT3gF1nrSRTuiPopZFbLpa2Ymho5E3
 tXCRNqJV+Rm2NExk9zMrxFBypdMKDKtpuA1/ttAp4ordilJrdgLloNKmP9jG+B4p
 4slPc7qPmP4zQA4d6I7HWV7+YatCxXkMSqCZgYUwhDe6J3YBzSN0AMUYwjoMOlct
 xu7p5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgsg0x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2026 14:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e4f946461so234681085a.2
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2026 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782744985; x=1783349785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z9/oCyhmjXz+KKfudtfEN2iHH1bOiZ4tAb00LKpqgSQ=;
 b=WM65SMZm+gEnQkDi/PNxnXTCwAeeTdHryqSV0MNUWD8Xtb04/8F3fkUI1bGqN+v1xo
 gIaxNm6Y83EspMnDL9vHf8XhhkKkpa/mjWybMaCkMDWx+wKKxO8TyPWUFSoHzqvOSr1t
 LrDsibyqyDW2MATTgDkRBdYbKV7zP11QQd5/fpVGOk1iuWhBxdWcLAiiEh5H7DlI13/Z
 IPjWr4FDalXfReXT+BoTSU5BWeGgwwbLvn2YZ3w6O3xQI9kn9QadzsX5M/zYzcTAbCXz
 NSs6lpzggmLHGm3rBl34jDiM1l2VqFuGC+ERZqwVLfV3/6ZyRYDMdhAKd9GN45k5R6v+
 1vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782744985; x=1783349785;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z9/oCyhmjXz+KKfudtfEN2iHH1bOiZ4tAb00LKpqgSQ=;
 b=BlD6rq5LPP6yzZ9Va4aDnULBMpL6GiOdVdvLy4wmiNI9UYkrXoed4E8dG6/UHUjhB7
 tydoV5oJwdjjEELurEIhUdZxEC63E9+TOE0BPFuih+mCfW3sT3iI+1J7oo4X0rHjW/kt
 AG8PQytb89RlUeUhNAnrLbsG5QujhnKOnRnu5XI+Lg5k8J5AXAWoAKdG3eNKXbeikoog
 zUUvyOJPglz0b8hFhuwqYrwJQboX+vPCwMui1/YRy2FrzUtAsMvMJNWrTVAFZMBX79Bz
 N/8qjY5FoVFKs3VXzOsX8zQWQOwHcj4B+iREZakrMwTMBFCvGT2olTapdf9bu3aaRPUV
 qXIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bi/ZKl9Kd6vlRMvULTDFwttG+d674Qz4MQgrsWtctZmH9UcLhfPZjxRZawoTdivqGMWiFrdBjvPfX3t0=@nongnu.org
X-Gm-Message-State: AOJu0YxU607F9LMGwnR5wfGY/nBFd7yV9+WgQXKobv+ru8JKqEmkhTNX
 nTC4PacKFH8QTAZQwiBf7CfvdXjTYYaj559zCM06MHtwcnKVtivmxlfbTP0hVqRSTIoCEdkPuyv
 tfjK44RqUpdL5vXIxRhN2pbE/Fe8+6tLTS3CO+p9lrctZowgpkOrZ28QwCgCs
X-Gm-Gg: AfdE7cncpt1sWxKheC/203ARUq3EajhswGB44inbDA2N11alVZAHrVRQVVilibJsWOH
 ZdvxsThefp5t+o/2WNfr3Saywz+0iYn+ns0+5UoOy368RzD5HbcroZQg2V/oSWp9Z0cY2Pm0vD7
 VZ02QjMaWusv43UaaeXDfsO2IqaHKK+kJxaEFYobD/yPUtvAWEoaLsALOXC3SlFX0jjfPiEILCG
 945sPLO0CRHh/X2I2dJPwDOvbSLtAt0b/wEjaiZM/69fbMnZb36VZ9XO/d4QhnguSAHOXFr+sjw
 skg63fF1otNb83rw7DcEeWlMl1lYb6YS3dVS6H9dH4xAc6HboG5iRGNqign3K0zVFZMHaouqOql
 BbNqaZoksgeE2RsCTJ0dJbua+Ez2B++KESCcZyDC5UaK7qb4fCx12qNfNJYMV/A==
X-Received: by 2002:a05:620a:319f:b0:915:e12d:19ed with SMTP id
 af79cd13be357-92b3ea64c44mr1519964585a.52.1782744971552; 
 Mon, 29 Jun 2026 07:56:11 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:915:e12d:19ed with SMTP id
 af79cd13be357-92b3ea64c44mr1519911485a.52.1782744966242; 
 Mon, 29 Jun 2026 07:56:06 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4730937e18dsm15021627f8f.21.2026.06.29.07.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:56:04 -0700 (PDT)
Message-ID: <0b79579f-d021-4e7f-9244-125c2bee0d6c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
 <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
 <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KygJ3iHiZlfZDLx8TjoFhvfMUAzVaJzv
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42879a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gVTEzMJrF13lI4Zu8YIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyNCBTYWx0ZWRfX0hzPqipewyVe
 dQnpuaLtE640eGlfRTO2cjVkUV+MNAUTrMQchcviHeko81vmoK3BHWDR+YKoYhQRLZqrF24xPLd
 a1HJEHkGxJr04T8QtwQzHnlKezTF8iM=
X-Proofpoint-GUID: KygJ3iHiZlfZDLx8TjoFhvfMUAzVaJzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyNCBTYWx0ZWRfX2IaWrrUlrRhK
 It9MNKA7eVf1wucp3Q84aywMR9pGbCbrgYOYvZq8wNgiHSMsEGntG/Hbxu1yH8ciCmZNeD0PEnG
 WnLTkrgLZ51lOpRAEwl+87rruvU8EvKlSqjwTsJii6U0f9dsUTrU7WODpppuFJo9BdA/zsHRL8F
 x7PcH+bzw65Y/KaeGqyhGkA3J7t933Jcrudg8u4xxTCINXGf6ATifys7wl+H23J7NAOXyLy2tsG
 kHK+kxtzVy+0JmdxZ/T5x4IqfnXivfp60FVqTRMlk/4mA9iKuc0SsqstahbBKN47bm66K4z9tmv
 04/b4feE1yOxYN4z+TdEu2LryOM29StHRoKxiGR8xRzBKJ1fjlCGw9Z350IsxzQwn8A8Fhb5fmR
 VGonDGlGgSQ//o4tqozCc/eBBiMH+L1rSRpoTOn5sZviqgA8Gkgs6cFTM81HEZax0sTJUc1yfQz
 v2XZ5HeZQkE2OtVsrOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290124
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

On 29/6/26 15:43, Thomas Huth wrote:

> While it's not urgent, soft-freeze date is in a week, so it would be 
> nice to get this merged before it misses another release ... WDYT?

Queued via hw-misc, thanks!

Phil.

