Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDE5C43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 16:19:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjJMr-0003Gb-5X; Mon, 13 Jul 2026 12:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjJMm-0002xP-4D
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 12:18:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjJMj-0000CY-KD
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 12:18:47 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DF84g01887697
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 16:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PKWNHD2qkQw5jGhEN9VwLK80axVLSqxGv8SY/A8ukew=; b=DKYQPIutMgsYGVTV
 j2B4bzqPaVaWfrx4kaF6dnmlSueFnTGog0Xcok5Or3WA/OGmp/5FTIBLCPaGbqVd
 DrtG6KCbvCrnpNKo/W0xVTX+tBa8OaCZjDZUk4S3GzTnz2iH/Oo0LgExGpcc+pzz
 cjY2Pteint5oCvREXCcMO/WQno9FCy7GPv4qQJM4qvyVQMt6YFShVy8PslMpZLtX
 E45uBgAezxVptxvtz4i9M7F3vDXywlCQdwIhHYijSvhfn03IuhdpHh+94lwQAmNW
 8llqwRiCvNc1HPcucSm7XeL1ov66mwhwoG8PO97oRg/wcOd2ewdLfKZtjs2wrrn6
 f1Ts1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavsp7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 16:18:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso49433511cf.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783959521; x=1784564321; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PKWNHD2qkQw5jGhEN9VwLK80axVLSqxGv8SY/A8ukew=;
 b=Nof6CG5qO1xJQEtcAL9OQBHigeNr8MEZ93sPOAvMYWGotls/33Tyhj1Khzq/TETEhM
 EwDYHfbCYzhMlen1K4D3x3TIzRYtBh9+R1/g+ibCBvZ28Ajd3RNFKjhGPB0DaZSSjM9C
 g35bAQZh+cKrPHHJ5pHaU9/yfxgI1wstkGFbxdGKKIbO+EHQxb2r8z6YhNuu2yVFC1Sa
 CZMSB3itzakupj80IdFjwVbboQQo6EuaZRMQZRsXWt5P3OwQuxUkOcBgGJ0pu8CUfSaa
 zVB6wKe7Gu/EVi3IvbQe7qwmUw0tad4hwaY8InnnhvwThyKoAOrhDA/AwlbWb87XBtmz
 RHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783959521; x=1784564321;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PKWNHD2qkQw5jGhEN9VwLK80axVLSqxGv8SY/A8ukew=;
 b=VqbatbfQ3BVwt3zid2nmroT1v1eUvwviY4Y2XPqDGKIqKu7eeCBkdiyvG5Gim0TKMG
 qim1oOwINTaDzSvwLl4rA+OtjhxhmVIB5vv3mCn7DvKKlE55RHYmRsBrPMvtFGp46rjq
 m5OvyEgO3DNWHHpO2gJA58kBD6LyH+MOs51UlZRAueDVe4xwE2cunh5iFO6333xUKr1D
 w7yPaBY2Wzg6XyMv9B+jTYVD3Y5TThxZ8DrKCywwRZZhrWfcdkidbpBSrTk0hth96ToZ
 roL3xCyEYpJHJMcZuProHtOzgL+zxBqBHrQNgnOMDPFlNEFy92ge5MpOhrv0O1d23CR4
 onsA==
X-Gm-Message-State: AOJu0YwguR7KE1d4PMDdCqCToE62ROFi6oiXU8dtfXrGKvKMNBCNxI0u
 y5zFklqvIKnZ3jyvXyFnmmjKUGmG5l8OnsbEyx+3mNUqcMheuEkuCA0+KJIIuDMOtJIzwVsXZRu
 lyytFyx06cKTrBfcCePnpxWD1KIEETpAOhh3mxt5oDcHngJO8tKqB5ItPI8zB88YVTGoE
X-Gm-Gg: AfdE7ckHUfQlAXGhx1/X/FxGoRcjMUFxE9iKpC+AHPfg9DA+a9FPQepUjL86LdN+HSM
 +pe9Svtq+XNmwcfuOKMvxGYra2w6jIXvy17kPHuZP7aEYHAOQYx1POOU5AIfYkzQueLbu8TLaeq
 PWhUvD0uYBLFBsU9zndnolPnAqgTl8KCiYSbKDS5d6tRkfkETQvzuLioahPlhPfGEsbu/gv9T7z
 NOK0L+HI4O+rI0ZWJ/fdnw5fxD6j8HOky4qxNg/5esc6lsNXEbXj0ZPHD6USMcITaIzrh7F7Wiv
 rGy9djjDEqeB8TVlVaA+0PRmSnplOnZM/W4yFt3YvezLnE1yQ5sa+xoOKfI3XANgafyWh4Bs1x/
 aMmUm43hpkPrpqQOi+QBlNiyK9sPLT9mUeA==
X-Received: by 2002:ac8:584d:0:b0:51a:8945:3141 with SMTP id
 d75a77b69052e-51cbf1faa3dmr94762101cf.55.1783959520986; 
 Mon, 13 Jul 2026 09:18:40 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:51a:8945:3141 with SMTP id
 d75a77b69052e-51cbf1faa3dmr94761811cf.55.1783959520553; 
 Mon, 13 Jul 2026 09:18:40 -0700 (PDT)
Received: from [192.168.0.138] ([79.127.134.30])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15e353d2f8sm643488366b.34.2026.07.13.09.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 09:18:39 -0700 (PDT)
Message-ID: <fe431b68-d60d-4391-bbfc-22a75d25f323@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hw/usb/hcd-xhci: Use qemu_log_mask() instead of
 fprintf() statement
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20260713161406.361197-1-thuth@redhat.com>
 <20260713161406.361197-4-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260713161406.361197-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FWONh5-6oGxJh4K1iGIEjP-Qrg9fu5Dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfX7wtMPEuLq1cF
 QnLLn/CtDEabtHLiY7uLAWcxizHLAOMuLnWpclBz3gCz/Iwjh5j67K9EE47T6y9n72Rdcm39zwm
 6pWpXjsnx4tJDvQVAq4hzpJ1+qHwl3hQNTmG9mF8QD5BhZtlRjjbNWcX92Cc3ZcvinoYvQL/j2P
 XV88tkerko4gxRdrY9Bbe3sXkiaNqrKlvYXFlcbFuZO7QcFoS1TMznyoNPQGOX1cMVFelEkiL/V
 rw3h3YJ9s5O6Ec85xTfbFUyBx6n+Y/vKfPq3jSIPrppG52lMjligGFx69FjMBdF7M+IWdfrytMu
 20mrzn/f4Daac3jCWWsd7QdFoj/QDxgrdBM3e4Rae3bdfxj2Xw/vfF8dldt48gzKRt0pqr0PrSV
 JOcpNnUEZY0QSqnwDWVMM0FotIHo9ZUoN09lVbyeeWwpgY/Gd2EdcR765d66j0g577Z3xkC8KrY
 c8tZn3kDwebBMwPBU2g==
X-Proofpoint-ORIG-GUID: FWONh5-6oGxJh4K1iGIEjP-Qrg9fu5Dc
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a550fe1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NafPQ6+GGz8L+AY99u5vTw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OSBTYWx0ZWRfXy6Bm7K5mFsce
 MPmQ1CM3yhypYpagRRmK+YUB0VJs6JwGypG73sKKC3x7/3JQg9t5u/tDPI0Y5+SIy4Eu/xhP4Vt
 95uzceRG/pDqNh9cZCuiarJ6I6Sfxlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130169
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

On 2026-07-13 18:14, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> We've got a proper way for logging unimplemented hardware features,
> so use qemu_log_mask() instead of the fprintf() here now.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/usb/hcd-xhci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

