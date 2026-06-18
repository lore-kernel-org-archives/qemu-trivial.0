Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F569CD98ED
	for <qemu-trivial@archiver.kernel.org>; Thu, 18 Jun 2026 13:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1waD7v-0002Jb-09; Thu, 18 Jun 2026 09:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waD7s-0002J0-TF
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2026 09:49:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waD7r-00026Q-Bj
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2026 09:49:48 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65IDLgrE1924259
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2026 13:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RTl+ouaP+X8X4g40LoSRPTIpMvm1Q+FKvkP44cxEJEo=; b=TSE3L1876y1uFVFx
 i2x/OVZGp6u3TIKffvKpi2cUpILE41E+TWSwnt51Ue6NA+dCbNLWp7ca9PRb3mWp
 JdFRpkYa9Sr5XS+gsq2yNCQw7JsOXAPhyuDGVsQFU5qoxcz6lqYSJR4xM6BcgXL4
 exTZwkVE0dACDABi08WxarlJ02bsqH9wwnArTdKJkUQPXUyOuMlk/rFOTkqGkhsp
 p7RRtUv/d6Sa3Ft9tdRkFrCoP9y42FTFQNmko55GpRu7zhHFsxyBZpYIkX+plRXp
 tEAfDmahYMWM+q0wmRovrYTnifwDA8wGEXHXBeCznxQASjuegpT3cNRPMSTByC6V
 znWf+w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jvrdc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2026 13:49:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-6cfc719d238so627972137.1
 for <qemu-trivial@nongnu.org>; Thu, 18 Jun 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781790585; x=1782395385; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RTl+ouaP+X8X4g40LoSRPTIpMvm1Q+FKvkP44cxEJEo=;
 b=DzDdx6BhxJXKT9akSVD68WR+zr38CT0zkXiDShAEgt2HERAxJ1NilTgpCRfTmTlvrN
 vwMybjMbce4re5R4vV6zt+VrnDCDb7GMQT6Cn25zFkD0tkMQ3U539O7eg3MPPLKZhg4e
 1Y/HpYschX4EEwQXtlKi1aSbCUyfPa6mrJizNONsawcIVN6+JdHyy1XhWESIs7a+frq2
 4CyXmFB4z2Q7mE+d0XFeF4pxyXljANCLsGKNEpM8q0nxvSflthV4BfLqCzAMzgETfeXy
 K+MtCEpB7lOH+mDZ3g9mGECob2J2+4v7EQJB1MbJmAfahYZVNeKJWWEaT1bH4CJjDBoT
 e6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781790585; x=1782395385;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RTl+ouaP+X8X4g40LoSRPTIpMvm1Q+FKvkP44cxEJEo=;
 b=EKz0fkra4rahkELs6Nyp+35OcDFNLlTPna4lz3yvzFx+WmPfRx38MFBFtg+8ILhuVv
 niz62TAk5DqqaTpUn3IkDvjWFo5JP9NTdJ4KjedIRr2u8iwhzghIAvHLbA6vsaqgVsWc
 0D+ZYvhre5dTcfgQIUWf/uilBCtC8f+rtPNu1FdOpHRfYjSmE8dxQQTjSCuuA9pZF70T
 dnTQwCwfQJ6BNLCHI9CdhuayD8HHjxJ/XfipzjcmU+PsefG1PSSQEFS2QVVEh9lDOb9D
 n4hlfIO32UKlq5GvtRH6637QMPayAx/E2YrTjSu/dSa5kq3xMY7tNYb9JyNck5l3y13z
 uURA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9kL7JVUT6UePUUmFuForwDpuYlC0q5Qf/3V/PMHtn7ZE8lxmOdfG+FeyTGuNOEwYp4OBrhwLsAVrlnwPc=@nongnu.org
X-Gm-Message-State: AOJu0Yx7biIq7IY7gbLkEoyMG2GuCzQRBYDnHwzZZetBQ7gG3oR4bon7
 ZZonF8JcAxUSgqZGCp2P1LSYFF8Gl0fRQ4ij6k2Q76xz7mfLI9UKC+Pk9nuiC2XxH9UEXePb4n+
 7UUpYUdBJ3QBLedYEWINpnZmyJbeyFigvdInv8E542aL6crOUS6iLBDN2XbCk
X-Gm-Gg: AfdE7cmJLig0oU4FliM8wQrQChXa7h7rhYvg8xj8jhEOXdCvVqw0J0Ed2aK5LGJ2zV0
 CGuoLXLHaAncJuyWyaO8OFb9ApUVws7//EfCuhsnkT2uX4PfA94frt743q5nfQM37G7s5c5xV/F
 2dMtP2aURlumd+fr4XezFSFrbBR8OsK9ILaJlP1gpcrRETW+qGrzVGdAWjnCauxdAEH4Hwvchdp
 IHl6t8txAxOVXUtwK7bBF1T6f+IbzBtpDBekriNXmNJQp4YM5c06PgJmBglSatt7aqNzSS3hIEB
 +roz9VPNirXvtDyfxAERAvC1GgoTkozBxEgJvsLn666hNBr6NorKrd9VRnjgE+fpV0DDDeJlB2+
 21HS6RNK1ZJzneiKlLRUpV66bBqF2S0KeGSvjIyp1jOEvPw52D1JhGqGNcxIbhw==
X-Received: by 2002:a67:f6c3:0:b0:6ef:f691:7043 with SMTP id
 ada2fe7eead31-727c643f9dcmr1788282137.15.1781790585134; 
 Thu, 18 Jun 2026 06:49:45 -0700 (PDT)
X-Received: by 2002:a67:f6c3:0:b0:6ef:f691:7043 with SMTP id
 ada2fe7eead31-727c643f9dcmr1788257137.15.1781790584624; 
 Thu, 18 Jun 2026 06:49:44 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f726sm61184360f8f.15.2026.06.18.06.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 06:49:43 -0700 (PDT)
Message-ID: <978d32a4-0f6e-4c3c-a9ec-2aad628ad324@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TRIVIAL] char-win-stdio: fix typo in spelling of 'stdio'
Content-Language: en-US
To: Filip Hejsek <filip.hejsek@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <20260618-char-win-stdio-typo-v1-1-05086b1b326b@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260618-char-win-stdio-typo-v1-1-05086b1b326b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX7j8ZUwIKwd0h
 9pdNo+v1CMU+SpxKOL3gfUEfvswcyZC1raGQYz1b+E77ehq2oTA6JUFj3SBybIy4nXInJt0d1K9
 TaZxDgicEx9gDyc3B/DiIzc7HOxU9X8HFSgOk+R1km94/9rrnwLbV6DNnQ8IK8WBuTFHqu5LFg+
 gECJIsr4+GScxmPk5Dt5HfE6q6AC/asiC/aUz3ajgZ1Pt6eZOI2omJUUtrww392uGMMFghmvG4E
 dCgwUiqwKIa6u6eO9Si02M+IutxAQFCylHu+Ly7Tklx4dEm23cKSAqOisJ8igk+BTrfxISB6YWp
 oW6AnTq6UFVV8IlnD9/M8C3lRU6C3NIfb5phzuKgRZCTbzYT7AcKDIdbhJ6W1sv1IzjhuGy/zDA
 PeqnaCfsS8I7cAVpcMPbAEmIN0+JLkO4R56R9bYp5yqbgf6MorgqnlU2Vlsbw4tzih5YZc2i/7R
 hTUVSn++NSqw7f8BaWw==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33f779 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=jyHsQcsEmyMA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: bq6xqBvBvaGguZHUkK5G-RreKPjzVNaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX2Z8VfI9fm95a
 8a5rEqdniS9nRtH9eiqUvhcPIW0CVktzwr66KNKrvXKGuLXKohA29CDxsei71dI7FMwEVeXEW9L
 BKbhEgAW3jrmWsv4u42gIgOHUBSMMuY=
X-Proofpoint-GUID: bq6xqBvBvaGguZHUkK5G-RreKPjzVNaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180129
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

On 18/6/26 13:20, Filip Hejsek wrote:
> Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
> ---
>   chardev/char-win-stdio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

