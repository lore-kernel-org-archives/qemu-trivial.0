Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B61ACA6009
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Oct 2026 09:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xEOGs-0000wo-Vc; Wed, 07 Oct 2026 05:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEO8W-0001pk-Da
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2026 05:40:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEO8T-0006st-8n
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2026 05:40:30 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jaVB1873502
 for <qemu-trivial@nongnu.org>; Wed, 7 Oct 2026 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8UOW82D52omUVAIQxpdoa2sN+1d3GbNqatrMVqW0lfc=; b=Z0AahZtFUEb/6xc2
 XiLPLijS5aWvj48vzjc+YIO5Dnt2CtAZDmi7uit9VTDQzrWKWKTV2Dvw/8zEOw09
 KtPgqE2/mkpaLZP3cuxbFA2/isDzlY5nJ00/KmlK8xiYcsD6Zjb94AdmEuNWvJN2
 dAVcMpprn2FV0dHNjPzIavx4CmHcLqCrUp44iD7HmPEKwbvjiDRwMKdjOKiXmyIh
 Ev4ze0nnDCB51P8sxgv37rHlN9M32JqUsu+s60Yg85+7pTWaauEMLawGYfHh2RcR
 Je/2FNfDRf8VSat206FgumjzGb+yT1sfO1jfCsqJYO7PCPj7pDTqX+BQNlqb9+si
 cq9WxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rt05-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2026 09:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93caa0ce0cdso469199085a.2
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2026 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791366026; x=1791970826; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8UOW82D52omUVAIQxpdoa2sN+1d3GbNqatrMVqW0lfc=;
 b=Z4LG/7xFyR7M2HZgBfxX+kXWlBBcpCtEfm7Ni6ceO8BXBvXHx3lQIo944M72OF2e0D
 hZZDkn2jO4JgEG59M7YfHyyfkTBhgthjpH4bSwnWdDfo0dwdsH2t89UOsZUuzevIKgaq
 ON1g+YndgPlcxhsMlfHTcRehAAr7qcCEgv9XVQPGcasyxNV2B2m6WGYmTgcpEl0lnLiY
 KogbLwUM5ubEfvPe6pVE+qmPj8K31sCtljv+I8XU1UGkkcYwjs0qn3kfD8Nc9o1aY/Y1
 PkE7FMtHTg1gr2jsd+0mK/9XB5ypJwzuAnarhYWsY068VTGcL6+cVIODB8c01C5ETy1l
 k5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791366026; x=1791970826;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8UOW82D52omUVAIQxpdoa2sN+1d3GbNqatrMVqW0lfc=;
 b=dNvm4bgXAsX088EzG5h8tlP9GfzvwjJFjWNiaFj0Or/lNYCp7NK87XRIOTmUUdqG/9
 /vxp+rq7wsVPeRx8w74S2HxYQBPj2c/hNObMhpo7632uaV+FzHLrVCFcye/5fAhJgByB
 5g/rcr6LSXTxSDBmOnxPjPccOH+6cWeR81hkoMJfsUte7XPJHk/KODys5STZpX/4VLPj
 sfya2aZ0cWJMvt1DIE5b02reTDihsSkJ1bNrg6S5L46xKfbWTtfdCiq8ZpCYnl23jssX
 ZomhfHbvldO8RVI32yGSMF00Pn/jEG1VkFqtmoxqecYKPOgvkmveFQoHygEdxqlgRzNv
 BEdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzm9p6Ds8FcsI1lBo20V0Qh+njvngyeHreP/CD1LK1ahBjexTYPBe6TKn2HKn0wyPm4dVRYBmTUTJyAvpo=@nongnu.org
X-Gm-Message-State: AFuF++kpYBXXibO5gl/ZpVitdBH4lbV+TT8rIApUk2jes447BSCvTjK/
 UtRw7+y7VSqfEHYp1ovQIapZyIfqJGiot2TnnC+2lap1L+qaIB30CYMKaZe0ZhU0RUiivAO9fRW
 x9mTY4hfqxPBLVnyYgzNd/w2tIgweNXjJhsLXKAfrjk+EBX8Yfqxkaqly1Faw
X-Gm-Gg: AYBFou0KAB8f+tGQhO19aoo9/8Fmu2hjkokOKV0w9/mWzvSUs/FG5DqIYvmHm7FC7ZJ
 XUvS5aKo4AbbQ+1FSijn0KvhIYYccGQ5zrFyiDmY/WN2cvvU09FPVBgnxY1dAPXVCqdsTUXLg6Y
 bhsXfRX4gumJM/FAszutXk7ZWCggRdmLnK/JV0qj8PZkm3xQsAEpju/Dg/M/9uiuICNa5RRuDKn
 JVl1Jbgq/uOaK+qwyxicvsPhHS8KcyzCxoih/PPpOhnEDv5Oc0/yyqvNgbctA9wjwBHoaQ7isUC
 edagwhWwrUQFVV5gX+JhR496/T0IesxdMbSyMw3FE8UjhEDit0iCz+swKmbftPBUg1iMqam/nCz
 d6O+gs3Xz5ZZ98RobzUEg+w==
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id
 af79cd13be357-93e9b757fe3mr317295385a.31.1791366026046; 
 Wed, 07 Oct 2026 02:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id
 af79cd13be357-93e9b757fe3mr317292485a.31.1791366025388; 
 Wed, 07 Oct 2026 02:40:25 -0700 (PDT)
Received: from [10.251.40.199] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c7202fa0bsm4005278f8f.3.2026.10.07.02.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 02:40:24 -0700 (PDT)
Message-ID: <b98c3cbc-6feb-4dda-8a76-88feeded65b0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 11:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/apple: Fix obsolete PGDevice function
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Yundi Xu <yundi.eric.xu@gmail.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Dennis Mueller <dmueller@qualcomm.com>, Joelle van Dyne <j@getutm.app>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
 <b0bcfbaf-e49a-4005-b40d-4e64678031d5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b0bcfbaf-e49a-4005-b40d-4e64678031d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX6ZG9UvEDzbKn
 U+OAYKa2x5Vhfq7KAYvJQDGCKMLUq/lKcOpXtuV77fSBNJKk3mZnwBELuZXwMl9ATqpN1gVvyQj
 1wpBLwc+ltFd0Ggri6irMRjyBCRa0HQ=
X-Proofpoint-ORIG-GUID: ADA9NYx3oc_2Dh879JWyXc7RqGb8RpS0
X-Proofpoint-GUID: ADA9NYx3oc_2Dh879JWyXc7RqGb8RpS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfXxWy1thRrC/tn
 nxiUyw7AwI3aie2igC2IwCV8aXnkeV6ulwgNANM2RwC7MiHkfVrni4u19rbhvBmsP8uV1ZHZXm/
 FjOn95kiQnbju9hawbZDa1xtBLY8pSlGm5jSwECh2hsini+jmAN0zlSULT99BYLbpmJhf1+mYwG
 aofcdMaKOUe/Mroc4lbvQaImjF/Q0jq1tvEcp3KFfg948+gBcAX6tXmfFI5jxY+Gg5W7SkKU1Nu
 Ve9sHvco87vQoa3E6YWgBpSl9PAxcYC3H5lT97d+HV6gfAElwilRXzGUvNyUPK1Ov14GeRP6ebR
 9ID1KWGSS0CLwdEwi1qq3OjnpjsRHEM2HibMJD2G4TyoxdAHpgQBj9SDkfad3qelotS6EUP/PwR
 yWojGqNE/icLx7I2sp/c3y540R/LrZ1HUIW99AlvG+eu/YeYYR61oGwra0r4rXW90JXWA2Ks4CJ
 pSQNWm/ItDS8M3DO1hg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac6138b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=GaQpPoNlAAAA:8 a=pGLkceISAAAA:8 a=W54V9ymPeIzmK9jEwKkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070038
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=unavailable autolearn_force=no
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

On 2026-10-07 9:51, Philippe Mathieu-DaudÃ© wrote:
> Hi,
> 
> Cc'ing Akihiko and Marc-André.
> 
> On 5/10/26 22:59, Yundi Xu wrote:
>> PGNewDeviceWithDescriptor is obsolete. Replace with
>> PGCreateDeviceWIthDescriptor.
> 
> Joelle did a similar fix, can you compare?
> https://github.com/helixml/qemu-utm/commit/ 
> b795d6de88fc52cb6ff061e0e034be51d8e9c474

The mailing list seemed down and I started to receive new
ones, in particular Peter pointing to another fix:
https://patchew.org/QEMU/20260916100021.73825-1-mohamed@unpredictable.fr/20260916100021.73825-6-mohamed@unpredictable.fr/

So please disregard my comments, sorry for the noise.

> 
>>
>> Signed-off-by: Yundi Xu<yundi.eric.xu@gmail.com>
>> ---
>>   hw/display/apple-gfx.m | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)

