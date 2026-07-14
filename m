Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB0C44501
	for <qemu-trivial@archiver.kernel.org>; Tue, 14 Jul 2026 09:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjZqR-0003T4-Mj; Tue, 14 Jul 2026 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZqQ-0003SQ-CL
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2026 05:54:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZqO-0003TA-VL
 for qemu-trivial@nongnu.org; Tue, 14 Jul 2026 05:54:30 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6SU423740548
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2026 09:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xTNymD3v13JWKysNguHs67dHFs4R2ICi1CmS6mGnMA8=; b=mTFx2g45aZneKvU/
 11dOjmOtSPKuC6g6QtxsWHXzwcr3OG3Uv1rOcMiBIa7/Df2gO5NOby2Z3CoYsyhM
 Q/vVg8yk/MIixP7JuSUlWrCUjJUchEVl3tmRqTib27mYQO+cVGuDVIA1jV9sHiVx
 4RI8ibgPoZuuznrwHMRN/tIqaC56mXz5cBZ8ZGe3cE2Mc4sio//5XX04vm4/h4/7
 tT2lEY6i9liW4jSJIJOxMFvRCpZxlgKmuse1K/MiANGjGwmRR5agpvZ4BHpsCjub
 rXqovu7JF1FekzUyNEzbFai9x6wbqKs+zttdYjGbDsLuJcjbsRgUF7DuAwoatlA1
 1mK1aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde09cvp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2026 09:54:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e606e8f3eso481307485a.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Jul 2026 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784022867; x=1784627667; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xTNymD3v13JWKysNguHs67dHFs4R2ICi1CmS6mGnMA8=;
 b=gPjWscVdDy4CPBrL4VUlbAHh7dbRDOWMFK+mwEosXdirN84VmnCeOf3OhegK1hGEtl
 ljhwX2XRyJUMVqHb4AF3EgKwERmEbsqjl+kCPVc4qO0nuvzeWwsaFeLpNBdirB3jegK8
 P49Kp+sWfrzPuqdpTc2L9lZCRHZ6kbawBRah0K+afbXTcv6MIyj0Vqs3YgWP/Ntz6oLn
 xpGI2FXUy8toV6QKTHHNI2B272UXP8e9fdJzx2M1AHpwQiRLgaH677mYkOf2MntPzll5
 PrtDC2rG8cxZYmUGVsg4zhfYk1hPrWo8p3x6AHTySIjep2BouzjUM9iPb5NrGMmdCC7X
 qILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784022867; x=1784627667;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xTNymD3v13JWKysNguHs67dHFs4R2ICi1CmS6mGnMA8=;
 b=e7BHm4LU3E1CInWlurdqU/JpjmWC/O/zE8D/f/Q2j9+4vkASvFSsGDFAU9RfB9fep4
 gRfxx13SimlQZUqotwjJuzvFirxap4UHyHsX3SCnUNvjVtNR1L06DnJWrSmAtk7d7Ndm
 iQFuR2Soyza7ZacRJD4B0vgGGShLF20sf7ZAjHdklxEGG5lOsr3LlL5Rpkid37lAVmYs
 KlWxLec++NTfLaNi5uRz1mnemQx7YrxtKedufYj270NlbAtuw4DHzqXBX+LYd1P9B+ze
 QZrb27oMJvSrAORRGkEF7U2Rgh0HjT+/Df3D1g99nsqnvBr4X9BmIiE4PnsmTLeZ+m7f
 MNRw==
X-Gm-Message-State: AOJu0YwQJJ0yg3LgoNLgUH+ahuiz8gtr4Urh0orH2viI35XTpuAWeCY9
 YU6s4iVOIN5Jxj54pr9PH+rso12MeHdL/G9nVypFe4t+GddzABrvoRFt2zsMGHM28YR2jgH7KW/
 ird3/G1WPpqUoDwvOTmQg1JXq6iJ4TZyZVVOQFcpZqen+GzxLHZ0hMuIi7qVv
X-Gm-Gg: AfdE7cm6NrVkZpGOJ7RuKY7zCiBtb1yQi8kg9VxNrZCG+QoSgXnuZWqW6+NseiBTu70
 IwszZfuMXhvHnhp94/t/1RHCQf4xrbqU/iM2ZN++tHDdCZIq00Yw6MiiylDbCqD7Khw546uEqEV
 Zy0ze7RDKzp/Sxhu5PS9gm/LOy4qiaKm5ZOHC+hzZaC6pXP5W9dff+cU6a9ucStJsZ6F3VzTKNy
 yfSg416dw31IMBw9yLiy8bm/y5VaUYhdJqDx2RjcjhD4K7jUVyjcapVtwb9gnE/5R1QALt66vnx
 qxyyRTr0cCsm4BptN4zjAtESGcueHMYjweV8AhOVm3wecxYdHYB31o0AszLi9RfUCUkXIGCxREb
 w5STnRCUuMgmY7PsHhtbsgIUtot4ecLaxbDvHslc9niENOo8T6dgBQelm3Y4veA==
X-Received: by 2002:ac8:7dcf:0:b0:51c:20:aea7 with SMTP id
 d75a77b69052e-51e3c1551f9mr30569361cf.9.1784022867330; 
 Tue, 14 Jul 2026 02:54:27 -0700 (PDT)
X-Received: by 2002:ac8:7dcf:0:b0:51c:20:aea7 with SMTP id
 d75a77b69052e-51e3c1551f9mr30569301cf.9.1784022866978; 
 Tue, 14 Jul 2026 02:54:26 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69cd2878be8sm1251179a12.6.2026.07.14.02.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:54:26 -0700 (PDT)
Message-ID: <aec1a191-6f82-4551-b855-5cd481220d82@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Rework FIXMEs and fprintfs in hcd-xhci.c
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20260713161406.361197-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260713161406.361197-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwMyBTYWx0ZWRfX7oACKYxDMr35
 aycV2Fj8NJPgbgeCN3Wzi4DtH+Lqz5A2GftycpRC7oStfsyt7yMtt7qAQzS/mPaoLeIJQ0ikCWz
 wQmmt03MGIDZuxZsi907qryeySJtHyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwMyBTYWx0ZWRfX58gkA68z/tfg
 ViO8tn9InBDiESAC2xID2/KXGZhfqvFf2KRc8u8TUWPJBrCRCD33plnQhNyKeh3txIIsH8EOSEb
 tgr/sl1KqSQQuE2qyQTioKkeqxsZjahErkvsbmmNRHRgQsB3j9bhtzDNEo9hyCthf7bFZFHoz8y
 IjT7nHU2xalnw4iR6O2GyZIQtHcdz/mYSdpzop1l3TroUSR3ETDu/Kvz0RsAPBpUKfCV8SO17m2
 Px6Th44mNwSisGv+0A7Wyva460qySwzsiTwiI5pV3QFOxYD6twk6BB2Fwlb1kp7J+I58jvc6lQq
 ZYLNzy1rqtuuMEBF8oyzLsJxo38qIUwUErydXdRB46QSha3cIcrxVecPuUkAbglS1u/8b0257pK
 7zcIciOfRFGD7UMNLc4Gg07zNPqUiJzFOrvGxeZyHoElB5FeAwIss+FRR7mPhGLysLox6pcEL++
 8MSDeA+vg5B8IoPi1qg==
X-Proofpoint-ORIG-GUID: 4q4vAgyi27yiezBV7454yIjbMHa8Yilb
X-Proofpoint-GUID: 4q4vAgyi27yiezBV7454yIjbMHa8Yilb
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a560753 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4qxsl7YUZGw6SmFp5uQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140103
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

On 13/7/26 18:14, Thomas Huth wrote:

> Thomas Huth (3):
>    hw/usb/hcd-xhci: Turn guest-triggerable abort() into qemu_log_mask()
>    hw/usb/hcd-xhci: Remove the FIXME macro
>    hw/usb/hcd-xhci: Use qemu_log_mask() instead of fprintf() statement

Series queued, thanks.

