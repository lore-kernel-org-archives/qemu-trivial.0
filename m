Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17CC43458
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Jun 2026 17:13:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wec1r-0000O4-EJ; Tue, 30 Jun 2026 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wec1p-0000NY-Iv
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 13:13:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wec1o-0003FL-41
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 13:13:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65UGbL3T2465192
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 17:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3Ne++MIg4SYmvqIRdlRvBbq6MOLqeIW9s+AHlHEXSx4=; b=DgrOmGh86KAISbNR
 ybn2EL25O5983WVOCrjYXB8nG5x3oNRq+/ckQ4pD2/JUuCdloXRGpsnh3hEU8Jqa
 eg8HHesW29jeXs43mofVkcs2NEngrQRDDdpjt5pbFJ5aD1SkjJ+xevo8z36rQuD2
 b+Rohy2ROODW9/ArD9ONwKLVH/ASWP6f3r5zdvpKRc9m80xa7QRKxYySL/8Y/fk8
 EwNiIdlS2FjTAoJpqVpnNtjCf9f1+YlexOwRmuZrJfTw4FBOFQ+hbzTduqiyXpSr
 2362wc0VoKM81jFJTQ3XQWiv9G9xpMKIQxV76dBn28Qj5gANAUCBW/6nQmRl1sG6
 tlNfZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfy85eh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 17:13:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e68cb7a3eso223422685a.2
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782839621; x=1783444421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Ne++MIg4SYmvqIRdlRvBbq6MOLqeIW9s+AHlHEXSx4=;
 b=e76BhKwa3P2Fz4bLGK12v4W1PPboBebYwQJJmiEIBYNeZtnAtkCzQgFD0mCImaHw8t
 SV4l0UsIbQ3US8z9yKHJ8AggM5Osf5q/M0g2dT3y6HQU1ABIGA5/31Al5R8bIhNFGCF6
 28NqoGZV1IqEbMmxLnqAowT59jR0U5s4W1V3q9xeU+fZQGVUnARPf9cHlDO0MhrgZkK+
 AvXU+YrzVq5vgUKw68eXRBkN63pFME/F9Y6SFUZ9tP9xDf6mpUWIAkVIM1YD81icH1hv
 LZ+IzMhlIhxg3wDFfXbAJYuLiJCEDUxXOlnYPGLAFQ2WQeLFiUTOwKo/nAsEpsHnem1r
 ijPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782839621; x=1783444421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Ne++MIg4SYmvqIRdlRvBbq6MOLqeIW9s+AHlHEXSx4=;
 b=IUEIqHF2wDenI0JrbIdPvEsX8SGhn6FL9LsXbOLM8ecvJwdTzm5a3HS0x3rRRrq/sX
 /S7jsrF8cb5qg8iV/x59g8W1U2TN9pZirKfvM/e+KqXtsVyeYxmec8qMyzAU9O0jpNxw
 WqYVSTPQMYQCKYxZwTcjo+fLjmdUfPHKXYXX4I0cDdBWp5CN6OpvlY0IthrJgXs3Qlon
 iJZ2wV07Np5LE65DgWGwxodmcRI4RcAdv5IyKHF3j6l7ztOJcY0YHLGudXio8G2FFjY5
 Hz08NpLfGItmJp19Se/cak//9uWzn8dtXBAJDbpp5glADXPva+LOKG0e5nVVkNTxM6he
 FBvQ==
X-Gm-Message-State: AOJu0YyxbgUjnwfUmvg67Rhl9W9rwtfaNJ9VYOmQPrqGLW3wUOOV88iv
 U+I7sm8tp8/6mzrinkYQgwK8IfJQtN/cKFDjtol+bzkSyFhAfjgRkyC77tn+y+LClMTemsbuDun
 q2tu/R2n3TgHTAGL6yDzPDhdLlpC8tdo2B+9N/DW12D+mEve+SGuFaAUsRjOI
X-Gm-Gg: AfdE7cnBiCNWJBX3jpta3Q85pV7A/vqa/bAH/voM6q0Qec1Tlu5h64vJ3tRA+hBGnHQ
 6MwLPtAHqAKKeWTP5eiKUGdJfBjfBGHaN21AzlBKh4K/CXlOzj95SoqdCtJ6expuOboqhyq+Wew
 1HrUySA4IdENKb3tMpI7HUYcQ+bnMo777Nx+WHN3eqNdcpWKQMy4iamGTzSI9uoUwONxE1d0RZg
 HO/a/U5+g9D8OOgUurGv6ZBLVLO4zpuWF0UJBOJdALTj2Bt4sU1KiRspTk9fEJyD6CnNXYlohGa
 CCCBskLEw7whRX76OYhSVA0JdsGqJGhYtp1KRcrpJCG4K45cFnLdeWhzj6yfvnkc/SlJljzgDlh
 YMkvd9+lDowT2wJraeo9Y7t3By66DXSJzoTImMycgs5bmce/8zGyfGObZ02o0Kg==
X-Received: by 2002:a05:620a:4387:b0:92e:62d8:1faa with SMTP id
 af79cd13be357-92e6d858f52mr246000485a.46.1782839620644; 
 Tue, 30 Jun 2026 10:13:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4387:b0:92e:62d8:1faa with SMTP id
 af79cd13be357-92e6d858f52mr245992485a.46.1782839620100; 
 Tue, 30 Jun 2026 10:13:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47567979eafsm9178570f8f.34.2026.06.30.10.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 10:13:39 -0700 (PDT)
Message-ID: <5d292049-7d76-4118-9e55-66caf2799fc7@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 19:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xtensa: replace calloc with g_new0 in mx_pic
Content-Language: en-US
To: Ajinkya Udgirkar <ajinkyaudgirkar@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ajinkya Udgirkar <audgirka@redhat.com>,
 jcmvbkbc@gmail.com
References: <20260604162849.199541-1-audgirka@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260604162849.199541-1-audgirka@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a43f945 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=w1a5SNonieEqtlb6S-wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MLeLvHn8H-VE0h_jgM0qHLzHXKd6ZSyL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2NCBTYWx0ZWRfX261Uj2glXoKS
 Xg1rWlNK/jAWEO5j36OvP348hEFw4jKCpMCaUmj9KJrGf+H9N8ApFtM3I9XJS56INFEVJddf4Hw
 QwZyT5kYY6uLaMONsWjCwE/67qlW1oo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2NCBTYWx0ZWRfX2hqnD2VHLzbA
 zwL83zp+zArKdsvEz/oKKya/9CgCObHsVoP3tWil04xrJM9xXDfCQAA1zOSPfD7anWJ/a6m91bV
 sgT7uC0a0e6jgJiqww+tQ7EUbW/6Qx3MqAeFmXqN5iBsyqgYtsKfp6rgzN93osteZTdaslHEGEQ
 Uot5b/XU1ryS6P2JCjP+NoP6YtwqhWLeCGmaVLgvtw6r10v930oiRDP1wfBWB9afU3yZ4MCEZkk
 OdFd1mpH2MOBIU7ZFqsFs9EqkAE5neR8sbfrEQ77v2xml3fCx+XQZSqNh4+cGkl3aSmWMlnBB8+
 JoPAsxuUT0DBOgKZXqeWmQLqcOzEHTH7x3L1HSpRDS0H9nx7zeRMYnuqnl7eV0ZuMc5Zflfj0MR
 MXGComxRCGJwdZJ7dGT1o+b5BGiuYlasjzgkjh6ntTHN7hSU0uzUijtwr+NoxF1z+L6uWNxu+LK
 2e9LwgfQERmpZdCEapw==
X-Proofpoint-GUID: MLeLvHn8H-VE0h_jgM0qHLzHXKd6ZSyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300164
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

On 4/6/26 18:28, Ajinkya Udgirkar wrote:
> Replace libc calloc() with GLib g_new0() for consistency with the
> rest of the QEMU codebase. g_new0() aborts on allocation failure
> rather than returning NULL, which matches QEMU's allocation policy.
> 
> Signed-off-by: Ajinkya Udgirkar <audgirka@redhat.com>
> ---
>   hw/xtensa/mx_pic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Merged as commit 19bb5635a0c37435b7897abb2810665acc8c2f1f.

