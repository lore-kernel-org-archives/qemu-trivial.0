Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971DEC43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:45:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjEA2-0001Vr-72; Mon, 13 Jul 2026 06:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjEA1-0001Vb-7b
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:45:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjE9z-0003JJ-Jm
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:45:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6Nm9t507315
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 10:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4r3+okj6ROdiTC4GSPI5YNx5gab0rTplPVka10EUdTY=; b=QJiUlLAebNBDpE41
 TzV1w9vYb3VRKGZs1togOrYPn3tMJP5/d6xjX7S/v4aLV8PGc/Ae/eYfbINEii5L
 vsquoWo7K7hJHRkA03cIgvUWmTMAjswVz8XgN8b4LwvkxSgjMjRUyEOI3viXb2Kt
 bs6icGQIm9gGZs42NMGrV3nkPwO3h87greE7SOHGWGO3Fv18EPGQGy0fy/FHgLSU
 bNvW7UUkumJE6Ko/VwxAtQ6sxqI1FZBacV8aVSkLKcX6rRKbYWNPGX7A5hoKkEmz
 zO5RUE4ssNuniR9JwglOGlBxzEfYBMYhuQpNv3se4Hv4Luu9En3MnrYJiwJUbD1D
 BJdX2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h3sp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 10:45:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f45dde7595so38110276d6.3
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783939513; x=1784544313; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4r3+okj6ROdiTC4GSPI5YNx5gab0rTplPVka10EUdTY=;
 b=ZRWQVPZECU6wSU+6y//1+ZZ/JuD3ko49LoQtHjZrQLBEGv/EJgxJ2+AasojDAvLlfi
 z5cclZmBvYqNWqafIocoEgtmryAe+Msr/RyUEsXqW0g4DTH8v182jWZivBG1YrA8VOY9
 8gLtpSwTWXUKMY0fuAdPa+Zv0gqv8s+YAY4J+LNZMVvsVbo4rDu8qKOCFFAEudM8AgZa
 TfdBTqZ3+I7j5mRvstwjKzw+LJsYF+dthUPnqbKcFk5lsY8xydr79Dq32Yhl6SO2cC+x
 n0W2vQmCyo2D6FBP9g35wCd3gmvI7dhQGa+v2irVUL1vFVsFnyPyn2xUkz8qbDkM9teZ
 W+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783939513; x=1784544313;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4r3+okj6ROdiTC4GSPI5YNx5gab0rTplPVka10EUdTY=;
 b=CexRfxIEM8/jgt1w07faTBaX0CQPMixA8fVvwJjKqRS52j4xuh0ZmMvHNojZM7JHlH
 p2KYrgYcvooIWB7sXWkrwUHZCfG4WayRt/tnXK+P0E8xNNdq7mhx5OqZERlWJqICtK6D
 wzhpX5gdSwiflf9/yVkDiK2iidfioVBEeL+neUY39IrgFFPbUezXYljc+XZ4xitgiAHJ
 YlHTFQI6812N4F/WAVuxstP6W6AdxHNWUGIbGFx77+Lt9n/8eHDUpr7X51sZ1JRV/oXs
 uvhGDQt1axiL5RnVUgv4PTEJX0NUzTLhgXseN2R0Hz6cxRSWDAzWb3Whc1oILEGeEIGP
 73Uw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOWU/UwaEj6f3cPwfubvTwoY3b2SfCdFo1sFNs99DpSgP3QRatkbf7cX57yF6gjaJ1U06xWt61Msjo4eQ=@nongnu.org
X-Gm-Message-State: AOJu0YwMQS3iZwZ15Ok55Lh9ecy5wRaQoxkblEpaXqjzekVKdEAIfiV2
 ReSk62uE+PWIpt4Dv6wQ+aLcvcLjGT64qFPZi8LWezaV9Qwu7cgjDCgrf4elV0o2YzWmWUaDBTy
 jBpYhda9gibabSnrkmFUwzcqotVg0w4M5WqtReDo0cbjECG7FaOH+RtUwMpzy
X-Gm-Gg: AfdE7clUatZY6z8HBYxO+p1B48quNAHv9lJqe4SzhSEWDKjdUdR2EfVY2oscazVblwO
 4YZcSCio1PKLnF8qRfgo7UrNjeG4eJsoErsCf5K6rDCUxEqZc6KYF5eYsVVXFNUIbmyXTy6ELYc
 5pIuGMvCFoNC9DGlwD4vQ31aibdGMfrATylpCbP7i6GabmX1Q3BzVt6Gkg+YtxW70R6huxENc4C
 gU81aAkeldb8MADSkt6EmFjhDjFGdujL1OzaXHXGSdcixpZzHxqJdZJRHZzgSN88crPwfC+olNt
 VuzE8FGTg4fNuCzEPanGI2nOf5K5NI7GdrMk82VLw0+KTDGwFPnwN8/tCuTmyIw2o1FpQzUw5pn
 HQQEewzFo298HzW27oq1Da9EQSwdAdh/WAzZpqGGaZSoimWoSq4eI0J6u+ekfXg==
X-Received: by 2002:a05:622a:993:b0:51b:fe7a:4eb8 with SMTP id
 d75a77b69052e-51cbf0e8c9emr85554741cf.35.1783939512639; 
 Mon, 13 Jul 2026 03:45:12 -0700 (PDT)
X-Received: by 2002:a05:622a:993:b0:51b:fe7a:4eb8 with SMTP id
 d75a77b69052e-51cbf0e8c9emr85554381cf.35.1783939512079; 
 Mon, 13 Jul 2026 03:45:12 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039ad21sm84032945f8f.20.2026.07.13.03.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:45:11 -0700 (PDT)
Message-ID: <983b8403-4d76-4112-9a28-ff5bcc053c18@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/usb/hcd-xhci: Remove the FIXME macro
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-3-thuth@redhat.com>
 <CAFEAcA-n-9YVVRr2G3wP0a7sp6arZS4Vmqt35TJY40iGM=DCSQ@mail.gmail.com>
 <f91767d6-c78e-4a2e-b67e-fc74e07a0930@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <f91767d6-c78e-4a2e-b67e-fc74e07a0930@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X-YKZfyRCwsq_edX4_wgG6QA8MryMERC
X-Proofpoint-ORIG-GUID: X-YKZfyRCwsq_edX4_wgG6QA8MryMERC
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54c1b9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9r4J7D_JezKU99ura1UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX4OPeCz+Vlncm
 87d0n748Xpz+N+yJ28+VQ/+1nZ2dBEZhAak5WDPTYU9Y/kQOKCQLcgO2MhobPGXeySRvFgFHeUZ
 ZRFE2tJ99l9O/4lenwmJ5Ap0GVraK1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMSBTYWx0ZWRfX7kLMaoRgOKWt
 ZgzKSjNGsiyq96ay3CK/1VQ2qqx/Mv6GBcipcVfdcCLD/jumI4TLNQejyDBvtofTn38I9EcUoyU
 CGuTJKQD+mrmzMNMKHALS+CRkia40Eylx1r46S8fvwtVnh5OmSGigaFLJ56HBzwsUU/2qUlFapX
 DyTmz87zNdgJYJZ9WSJo8OhLkZLSzEgMkWa2UgFziNXgdNGQaV//JmIJVYa/AZvUHOl5NpxIX7n
 hQCHUdMHPsnX3y//dLwlRs9J9ZTgP8DVkpqexgX85bSCwhFuY50+3AxzMMeOQNCqn40G0EPZ1ln
 hOx2C5Zr2NCGcJ6TclX3PsaWEoF83/Wa7cfECqGpWnxWQN5p/hxaWCPITR1LzFI+8EredaugSWG
 WDR0N/agou6FoM3Z1y2t7OaGQ8guGocB9PLWVDh5Sujc3ItJlDzV8L6qGSzkRtAHz/1G0eBeRzx
 jHezaen11pjS0t54DTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130111
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

On 13/7/26 12:32, Thomas Huth wrote:
> On 13/07/2026 12.16, Peter Maydell wrote:
>> On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> The FIXME macro is only used in one case, which should hopefully
>>> never trigger: The containing function handles all the USB_RET_*
>>> values except for USB_RET_ADD_TO_QUEUE and USB_RET_REMOVE_FROM_QUEUE,
>>> which are both internal return values for when an async packet needs
>>> to be queued or dequeued, and which shouldn't still be the status by
>>> the time we get to this function. Thus let's simplify this spot
>>> and use a g_assert_not_reached() instead.
>>>
>>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   hw/usb/hcd-xhci.c | 4 +---
>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Not sure if some compilers/analyzers would complain about the
>> DPRINTF followed by g_assert_not_reached().
> I hope they don't complain since the macro is disabled by default...? Or 
> shall we play save and remove the DPRINTF here, too?

I'd remove this pointless DPRINTF().

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


