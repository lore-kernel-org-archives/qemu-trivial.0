Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF962CD98CC
	for <qemu-trivial@archiver.kernel.org>; Thu, 11 Jun 2026 13:08:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wXf8g-0003qV-P8; Thu, 11 Jun 2026 09:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXe9X-0001lC-NC
 for qemu-trivial@nongnu.org; Thu, 11 Jun 2026 08:04:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXe9U-0006Gy-Pz
 for qemu-trivial@nongnu.org; Thu, 11 Jun 2026 08:04:55 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65B9xJrV2890193
 for <qemu-trivial@nongnu.org>; Thu, 11 Jun 2026 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ERxTYedAuezs5cwoqs3WIu2N6PL3h70KNlsKrDOuXJ0=; b=TrbI4wx5SJRJkSq4
 dVCE9xiMAeSJ4A3l/fMzVCsCw4lhzuaHK35xUZWABB43L4XbeI8zykHWlYhb+pJ+
 nCX5b5CjrM6LxiZegLETkN74PN7nixB6WAIooEGWPhmr90deYyh5EDgjbB/7MQbd
 yiPQ3DuUD+73DV9fDFaMuM8iiRRia/KGNtj9/EKhmqBvlOqWD3kh0w4TTeeA8Ohr
 SWd+rQpCDL4P8f8d7HuBmwUeqZFuSxkAs2OeIWZqsKyPpRwYLyldVc/9dt/daKFI
 +Xbg8tLXQz7lFZxMSL5d7igqPKODhGbzKuY4SthYZ4XTY4q2nTCMubXwkZRRrV4S
 kDo1Dg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k7qy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 11 Jun 2026 12:04:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-6751db2792dso3594898137.3
 for <qemu-trivial@nongnu.org>; Thu, 11 Jun 2026 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781179489; x=1781784289; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ERxTYedAuezs5cwoqs3WIu2N6PL3h70KNlsKrDOuXJ0=;
 b=eTWQsudpStY3ogOuXT4vPDqUEWclz6Uc5NadR/cBtBxdm5vyUS2Yd0JwliuFAYtXjf
 FXuOVtP2zYDvBtp4TxdZq3bq7W6QVB0kmH/iQsqkpa7cnAd+c74pr8JWoc+Dsv+6QO9C
 fZ0U7kSY6OfVrZf+XtnbcaxQcrSuhJWnIfU7IdkgWyq+a9WptWr/6c+O5nXlRLpZJA8C
 inadm4dKGdd+mVJn8m6VDVpm31dmE9n37MZzwd8exBXDIcxkWcohFb90iSZ72MTQMxWD
 ajWmUz6LlEer3YaAsuFQR/3brcrFQFuAKywW4/7ELkcVOvurlE1yaVXT9zEkYgnMbCdr
 0hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781179489; x=1781784289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ERxTYedAuezs5cwoqs3WIu2N6PL3h70KNlsKrDOuXJ0=;
 b=luw72PFFxu4gpjeiDyKL0+zGi+BVDsKUlO8CJdfcBnQazfYVSaZEo4QCFYSlpuuO6a
 A/W5XZ43ML0J53ogXvn2zshCARajhQYEzmbd8BY6NR0JF7mtqZbnY/YIIA4BDpLWbtU0
 WqPFWL+y5grS+UjmKzK3qStgPvsjownL/xF/fotAMO2J4YQYeMDF+6tpcAlKDzG9yWzK
 1d+KoLZpV4An+vZtY0NIXnJvgSGsMSY3T8b2cxVt+OyUGvB6l0KwaHaRrai3AuQBaGTE
 GsJtRBMP5v2hXLGqqoC/h7ibbCtPIlNGMtVqNZMAj2ypoXPhFbH6ir+MBOXfREMivIoi
 lmug==
X-Gm-Message-State: AOJu0YxRxIWpdbnyX5xlQdz4PO7jASz8NQyH3gl1PTlRRmFaAkaf5uYV
 BHSgh4+YWEiXJ0TUXaEcMOmPv0hJ8RTX5juOQOM0FbQtuHwkBKbYgDMt/IJa2Q9/h/ALVir+R0P
 agCfnI8rVnipmxvBmQH4CruA8xREpH6GJsR3CB81CLHCCEd7aO5jrX48w21H9dhwbEVI7MMg=
X-Gm-Gg: Acq92OFVtvWHCox/5TJVSXE8376mafDyg2D21QRGXJp1Ww6tejhtcSFcdSwhNDwHMt6
 hlYy5Vkp6ox5F3Nv5i4l2LqxfQyVNU+R/NrPDXGG2Qb4EmIEiqxtCa/jATBVhZQPtRLINXcmdl1
 eTN9YxsQadiV7HwEj+kx3KFHIUpOwtkeJ5dQmSzk+T1rpIM0acLX6Jt4Z/2MpUh74hJK7i05Mvn
 8Nr/eIq0/GKuo9JkXf8isZphzJKuT5CpqStVcz3YHnn8z2mtZnez7O2L8tAOYO2239xfsLuyTpm
 us0oQfohughPzc858Bp35UvV37YKbzSzOMfqYVUsBvinhbeYwdcL0OzJcV+98eatWSbf6NT3gp8
 E1dWlkXIXFlgeqfVe4MbvcF0bT9jUBRqMAchMlaaMtbIQLeOzp/JIHq0lgeOZ6PulvE0YJtLloe
 thbNBI61o=
X-Received: by 2002:a05:6102:5086:b0:6e0:3d72:3044 with SMTP id
 ada2fe7eead31-71d601cffb2mr716474137.28.1781179489641; 
 Thu, 11 Jun 2026 05:04:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5086:b0:6e0:3d72:3044 with SMTP id
 ada2fe7eead31-71d601cffb2mr716408137.28.1781179489035; 
 Thu, 11 Jun 2026 05:04:49 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e64c2d2fasm11079451a12.3.2026.06.11.05.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 05:04:47 -0700 (PDT)
Message-ID: <7ac5c98b-1840-4735-b30a-2c4707e4233b@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-options: fix typo in spelling of 'scheduler'
Content-Language: en-US
To: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20260611113547.651075-1-f.ebner@proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260611113547.651075-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n8i9QlE3pK_29NjMTTtXaGmVfG210yFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfX0/fAE+rR7zSI
 ZPNvuI/PTnF1iv/jJ87mbE82mn/uSJtJrMeJR5HY1XSYSd3YdXMif3N+jveKM1WYe+2Tap8Nz7o
 t9YEATs2FODjpmsi7zUzM6R0AIEIrLaNfv0ww+g1Mqs9SmOmUR/eo99mpPp9P0cgEn6lppWHsCx
 Tz4pmIZEvOLEsg6CBf3KoTrzEwsDwuuJWihxlInXOZEM5/AhZxhxdNkbRgdJgn/HDPuHRdi4oce
 hDtOZulr9QHkIEmFfNyB6O15XUYdaMUKNuF9oWsnnfK6O7cCD6f1uluAsonMQCUrD5lFNXWjwbb
 iEEwyWi8T/+95sdQt9jUqRyD+UcUIlKES6WRbcwZTdFj2hrZxnj/pT/XDsVAiZbLAa3J1VFRIkJ
 Oh77KIhDSRMQhFp0R5Zera6gH0Fa3ku1PvnnUSyHGQWokr7b0eR2PvaQncUP4CsEpf7io7TQQrj
 DMc6GLlviMldsvoycLw==
X-Proofpoint-GUID: n8i9QlE3pK_29NjMTTtXaGmVfG210yFl
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2aa462 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Qm8iP6mkAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=aoPmF-vobCUA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=kDhhxE42lZnxL3pOKqYK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfX7WCaIjVLB9Dg
 7ByojTcz0zlRtb/DxZ7E0Sn0lQEtgugDjN1GaHNOBQAQt9xGvvJtuJaYsNjSebbvIidEBYxVnrp
 XtO2VLBR83/nKpvYCnHVbfkZcFl23go=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110121
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Jun 2026 09:08:06 -0400
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

On 11/6/26 13:34, Fiona Ebner wrote:
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>   qemu-options.hx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

