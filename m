Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9037BC98318
	for <qemu-trivial@archiver.kernel.org>; Sat, 26 Sep 2026 09:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xAOk6-0004PA-A5; Sat, 26 Sep 2026 05:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOk3-0004OF-SW
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2026 05:30:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAOk1-0007io-3F
 for qemu-trivial@nongnu.org; Sat, 26 Sep 2026 05:30:47 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68Q6P2Pj2575022
 for <qemu-trivial@nongnu.org>; Sat, 26 Sep 2026 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=; b=OekqcCGNk37qOa2S
 WgNnxsyWlqZ+aVLVi4pjtifHkrSnwD207+8fNp+Ohwrf3dtFFU4r1RCWVvO4S7C9
 1bEq6DOiK7sYxrm5jYfq4L62nABW1vR07IIlxxbIyuMjY80myaPbqEMkDQ5lRXyS
 NTFhwE+ph3jhH7sGDHCR54Hf34f7UZYQC2bgU69N+sAVXR3aWQ4hqTQtnu0uL4P1
 b3mgurJAbma5/ioovKBruNQ7MK4osA8mvTsZ17zvh+Wk1pjUKzubAQSvAVUCqSOB
 MlG/dMC9lveZ6LDXwYDyxrt+sZl6Rw7B4qElf6eZczwRUGCndzuvGI4YP3II7uNG
 SIA/ow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx7b9rdag-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Sat, 26 Sep 2026 09:30:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93a1e564fd5so306204585a.1
 for <qemu-trivial@nongnu.org>; Sat, 26 Sep 2026 02:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790415042; x=1791019842; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=;
 b=fDw23qDHXhjhSoJKTq52CEKQ0bsJlVUwCI0Hy4MCS73ZP84G1v5KTVOEUEqhwRGHWl
 RPXlATP2M5UO1aZyRSfgSywbtsoKh5VLIUAPzRi/ODCWuTwfFmse1lgbMTolQX1FYWXm
 Me+Ev4WzdDlKLBgW2IXtxRAtIdRgldTOFu4+FLjsXi0wRRQfkWX6Fy3rMwXx4MmUsRx9
 O3cZaz45u3UYHX3CuRPnl1fA9qiBu44TfMREGl6OLXdpNoLmA8nmAVdcuafizysbAfjA
 +FBiSia8Un0qHnVzJLRfqjxCSAJSZkvH/t7wcGK49imcZncBtbfxRWexrxwCrk200aMO
 HKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790415042; x=1791019842;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vIT4lhn9+EDCtg43Y7HYDGKZZ87+GEHLMrThB2dIdZM=;
 b=2iysyKrsowiKUNVQsl6koQTa4nMgP9CfTBU1Fm0XfCPAzBxxhUlW1b3YV9jJRx3oxr
 AsbWYpRkFnzLmA70upfMOTNtae6etQYqlqDAxJAfsLNjVzWT3CEBgT2GRckb8+rRMpaV
 j4rS3PARTu3GvPcAyqe7brC3Iy7t5h/tHh8qXC94c7NOLnLCxGvYvu47V+1rvhhU+YTf
 Cvv6rWpsQiiSPdqKdp4nQMVGDSIxftKWXHe7ksL5xYpyAZrH0L/qL7YA6ZkyCUCSfgIz
 Gip+EMaOL1qRo4WRdGPu1m1BSQuGAFOA4Jd01Us/kvaJwquS9ene4CQ8ZRzKbQfDw/Pc
 0Wqg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1b3BaaAprJJ8INq0iy34N0ANe2xg5X8hpEjrsJBqCo2r6ZLH/aWRe5SS7tiBQqnRcn7Okjl1pBpNgUug=@nongnu.org
X-Gm-Message-State: AFuF++nzqC6zV85jprl58NmYsewiyQ78EgThSB0jvexfG1xHR+FiE8qB
 NxmpM/vuFwVjJ1Ek93vKeZxb/QQTeXH6KbhOcnFXSifIFqOBbbOvc+eRcN7KZrhaeCagyShbfcd
 Y+/6FO1JuddyZHTZeeXC96GZ5EhcbmXo9jTSeSZO7xem+uwpsW5k6As7zaocF
X-Gm-Gg: AYBFou0Qrg5Z7xXl67HanAlBj+2ZfIhdxE9PmfXogz1TIT58oCfrKHmsmGRxEP7C5ze
 lPzSPF1zsSPDQQjWzMVi5WqVQ/OH+3/yOMtkEpY5wcnT6VpFSuFKf0DpP/kDdFnKu27ySTc9bxx
 YJiKL8qKIxt9ebbPCAt0rF2jXNPoZghT6pKfzUVixulRbHl2d7yRy1lC5P7k15oC1x0gfP2/S2C
 3gz3Hxhk8eJNqr0TzQCH0VTDmIyHrnmqHq3iCvIa/ZLuY3+eTQnsGsukcbLzVPcXYLzAOPkKKmN
 F/5BVK81dqpf2BrssI37Nt8cFiiNdfV2G+fnx7C8Ad4CAsobkxM3e/51VhGvO1Dl279CUZw2kSJ
 2BJEQN/c7Z8bp3e4IZA+twPG+LYvp2ZfcSg==
X-Received: by 2002:a05:620a:40cc:b0:93c:2c15:e510 with SMTP id
 af79cd13be357-93c43ca4b3cmr882437285a.37.1790415042099; 
 Sat, 26 Sep 2026 02:30:42 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:93c:2c15:e510 with SMTP id
 af79cd13be357-93c43ca4b3cmr882435585a.37.1790415041683; 
 Sat, 26 Sep 2026 02:30:41 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4c8dsm229820295e9.3.2026.09.26.02.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2026 02:30:40 -0700 (PDT)
Message-ID: <507fb835-61a8-4e66-80f4-1ae6f07a5bf1@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/bcm2835_cprman: correct register index in test
 for mux update
Content-Language: en-US
To: Jonathan Gilbert <logic@deltaq.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Luc Michel <luc@lmichel.fr>
References: <20260925100726.1546566-1-logic@deltaq.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925100726.1546566-1-logic@deltaq.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzNyBTYWx0ZWRfX5j4chMXjXXhw
 PT/7pIGytDZO4moAqOsBynXTKN3Il+GwKw0CwzZHJPVcU3tmSfq57xAewoApuF9IotxG1w81sYG
 7FPu+Xvs5VacEJ3nwn+6viS0U6yyeYA=
X-Authority-Analysis: v=2.4 cv=d8FgWhjE c=1 sm=1 tr=0 ts=6ab790c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-ISfGIX_AAAA:8 a=QlAFhZc9Q7uiVK9XYwMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=6K80JWTZPwV2TOQbRzu6:22
X-Proofpoint-GUID: tkB2sON4i5Onu9nD-VAGUzKa3QNZq5gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzNyBTYWx0ZWRfXzuNy+9tN3RVy
 FiuVE+mmwAq7yxrXMw5gh/bMk6hBSiqPJSurLXr6vHSYgpumM1KeHNJsfjjwp7lpeQQOAIg4f7v
 /80v9/3fnGa30sS/Ze6jShE2nVlW/UmFfdJuBJBcfe+hKDeeN4hj3nSqyCdP76x3MHkexPnpW/X
 M69y13aedyJzLjEBhXaXrnHrKvDaIrowg52kaVJ+BQV3EVv0iWTMX1rQxJrSHMHNs+snZibIC96
 wLqbiroyVjDu3xotGGQF24b1NpkxLv5hGa6hLgWK2TMmAHftd7imyBz0C4sG1AOjd0FQt8zQo8S
 DutOecvlVE5ucEkIIwMcsRYnqTxgYn1iY1Bzuw1N+sO8kCtwXBPzyPnjjh1Hx9yTXaJulbqTR2T
 emFinFCHSgLiWAr98JzPSb8qr1UVZtSAoFH3PEJrLIFBgq1UZ7NukdChhPpyGbgdj8kFq8i2fxd
 N2B7Z3Pi9oi7GkdtuQQ==
X-Proofpoint-ORIG-GUID: tkB2sON4i5Onu9nD-VAGUzKa3QNZq5gf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260037
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Cc'ing Luc

On 25/9/26 12:07, Jonathan Gilbert wrote:
> After each register write handled by cprman_write, function update_mux
> checks each of the clocks to see whether the supplied register index
> applies to it, calling clock_mux_update if so. Each clock has two
> registers, so it needs to check the base cm_offset for CM_CTL and then
> the next slot for CM_DIV. But, it was checking for cm_offset plus 4, as
> though it were a byte offset when it's a logical index.
> 
> Signed-off-by: Jonathan Gilbert <logic@deltaq.org>
> ---
>   hw/misc/bcm2835_cprman.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> index 8220f7a6b4..f9a77ff9bb 100644
> --- a/hw/misc/bcm2835_cprman.c
> +++ b/hw/misc/bcm2835_cprman.c
> @@ -508,7 +508,7 @@ static inline void update_mux_from_cm(BCM2835CprmanState *s, size_t idx)
>   
>       for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
>           if ((CLOCK_MUX_INIT_INFO[i].cm_offset == idx) ||
> -            (CLOCK_MUX_INIT_INFO[i].cm_offset + 4 == idx)) {
> +            (CLOCK_MUX_INIT_INFO[i].cm_offset + 1 == idx)) {
>               /* matches CM_CTL or CM_DIV mux register */
>               clock_mux_update(&s->clock_muxes[i]);
>               return;


