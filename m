Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EB3C54F54
	for <qemu-trivial@archiver.kernel.org>; Fri, 31 Jul 2026 13:07:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpmwd-0002ld-VG; Fri, 31 Jul 2026 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpmwc-0002kw-5F
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 09:06:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpmwZ-0006Y9-MH
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 09:06:33 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66VBa0a43742176
 for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2026 13:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VSwV7LTIGbap8owHH2xw1MJU4PQgeevELg+GTAKVFyw=; b=FPexjjKxL3T40Ip3
 TiEU2QaoYHHcny3N4lWeTyYN0t9o07AF11eI169JHIDmVRBZY95rAbU855ZQclQ+
 sw7f3L/Nfy4y0uuXriYsVN1qSljQfHTAEu1Hqibi++IG7DxKGHIFzxJh5zSE3znK
 cBivD6+rmymWQb9dPIsQpmNl7aGY1N2uQy6EnaZbu0lFX6DudAWzxSfJ1SzXtKUG
 tNkddcn6+AyvQCVQXfGadUI89Sqk8mi31+gV4cJVRys/X2wV5Rc96SeHduffEY9v
 Vol4M8Soe7NSqMhNBk99Zp/MhyJQbwy23xa6moUaCb1dp+9YlWTKMXorPlk76CxU
 FOGg2g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqgbme-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2026 13:06:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-977d89e0647so194879241.1
 for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785503188; x=1786107988; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VSwV7LTIGbap8owHH2xw1MJU4PQgeevELg+GTAKVFyw=;
 b=ZBmGjcsZP0Z1pSWOWiE84GXOP1oGZSnysyypsW1vmrxOXhbVIh192ffQgYyrmu3RNx
 HsR3HF3dj1M1GVnESg11qoCLDf6ZoEVIDeZ2OHWiN8ZgsP0e65nApY7FgAUhvXVyJHgc
 DHD90aqnrEB4yR9GZmwuZ/b0j0p2kr7pHYLsH3sh25rb6H05yopDJjeR9g2PAi1hZmU1
 OUnhVAHuqO+REmsRk4szEn24xOXbxs/Q+knSBGbIwkFgJjuGX0CKxBPiI+cXHSYsmiGu
 JMrR6KSgrmT2dI0Oq4LQqLvsWC1rspXqUIwvCgAUGMHNyncIC9AqhRO/iqXQvscWOisy
 sXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785503188; x=1786107988;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VSwV7LTIGbap8owHH2xw1MJU4PQgeevELg+GTAKVFyw=;
 b=hK37NxEZy34RtQjbz2w0/y2C3LfpJRU0229OvoxEu7XzmNJqqOCJWQ2M0aTWBoGZS1
 1yACztAGkWF/mB1nuBwaIv66yv63i2ByiMqwnF7rjTt4L5qTK1SOdfuGKPsqXKlDRTNk
 GVATujQZqmqaipDXY5NEHTQgVKAkG/6HAQOTQeQYjUvPw78Ue7YQilKyS6qelbOUpdgX
 vOy2m3a7yEACihjUlvQDJSkaLuEr6MF6iMHVR3MvQkYqfgdJUtUNyBKMkkFoucBhjlMP
 WcvLEzUKZcmvk22rJKpRFX/OjYc3M/QHvCKLs0tBECbPmtvFQjRu5VXyG/JIgh7mlfml
 ZgnA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJcUHA/LzgCVAzasWUBPh0QukCzFxbWHBSgeWSOyOi4I5m1smA9vyjaNIlcVNwPNJWQ41rsqm8hkrp8YI=@nongnu.org
X-Gm-Message-State: AOJu0YwNCE2UMDnQlilcq9ni01nxqq1rUMDuwmRQetVqNfrmxwb0wDVR
 R16GE+tH7JPZxJToLAny9RK77uw3YAMpnyM+Gl2qvvWX3PnmuN7c++AQWO6aW1j81e8jFH16fyx
 mw3Zuwe+WQkKqAbRKTn+Xnl5FsRzStOAyDnQnOMZt9svN1RrHmEW+r+N+U1Jx
X-Gm-Gg: AR+sD12/rBy+V8BvzjgV7he8RvPO2RF8Qzc9QHf+K/iWX2jfy0ie83mhNb9TSXY72ch
 bjO1DykTev0sQJDJ0MfuYHImt8Gd73LQfzzf8I8AeNYdMbSmw8a5yThwUlYcaT+D4W+gN4Jfbpq
 oN5pHglJ2HcU3e7nvNh5KY7MVLxYAvCYQ43vZDjfE9vIzUMku4DkhGMDZhIMea/QK9hmg2RD/xR
 mhcW+11ffxggPvLMkKI9ICj1t8dDxRMExgcDI73XtzsoDZbRC8XxH9TXigRfXP6P7Q2o3/PiyzQ
 aMPA4TGPAFBTTwD4bMcOIh0seO1DsKazbYN0VnZ05S/AddjzYYCnleNlAJYregHWBuVKdWa8wvx
 cr0eSCh8fDJJQveB45fDpT9C8zgYyEeK91H6pd95Hj1ljJnEwzPc=
X-Received: by 2002:a05:6102:4b10:b0:74d:ce65:4739 with SMTP id
 ada2fe7eead31-758f7554264mr899037137.8.1785503187925; 
 Fri, 31 Jul 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a05:6102:4b10:b0:74d:ce65:4739 with SMTP id
 ada2fe7eead31-758f7554264mr898907137.8.1785503187407; 
 Fri, 31 Jul 2026 06:06:27 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd4454306sm159195766b.36.2026.07.31.06.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 06:06:25 -0700 (PDT)
Message-ID: <aebdcaeb-efa1-4ab2-b48a-e0a183bb53da@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/net/vmxnet3: Do not abort if guest provides bad
 interrupt numbers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 qemu-stable@nongnu.org
References: <20260731113352.189066-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731113352.189066-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5OSBTYWx0ZWRfX6mz07HWq3G2Q
 hDwz32rlQY7GIYETobtskSgWHw5L6drjhS3euK1Er4IrX3hPdWHplNAcqepeDqmhuYT+9atXDef
 63tW6vDo6Sut7GeWga1xn3PcBdAW1y62lEjORFIBlTki061kGl1VB5rS6G1R0rsTc+RyWYtly3G
 7ZoSo61Hp0rtp6E0rPoPT6dTd69LMhrOxIu2oTqZWsdcMVpQ1qKZ5DcMu5C8k93PiKi+ItdyYB7
 EU1qrI3s9418al8BfKETDXfAuQiufMHyEmWutMM+I1CaJIE+fqC5GcOIJedGMH4qAl9sg180bMV
 GxBITGLwJWACGg86TSIcWraNbacwQxJZa2/irO1O8hItp/XPEqw+qI0f5/sbMLbdyNZA5LTTlP2
 9xdbkB2bC+4zqRR8/BhM1qbJQ5RlLU/NPu1O/c8n/rL2liyTnVi2Bx7TKHO4udT+sUVhuD9vwxm
 50/XKm78PGDOe5Emamw==
X-Proofpoint-ORIG-GUID: XI1Ab2YYjy64TnCb5gkOQWzbMEosypwC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5OSBTYWx0ZWRfX4pV5yMwrCkka
 GTpXbtHjOtZVMiow0jiNLTMwKpEcWCaf/nq5OlDM3tOsfybsgFkxbkqd+6Aw1iJYACHf4P3axBz
 vO3nkm46o6vaNsGZNxEgI3bL3trwdYM=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6c9dd5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=UJx2ctYxQamrb8bvw3MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: XI1Ab2YYjy64TnCb5gkOQWzbMEosypwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310099
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

On 31/7/26 13:33, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> vmxnet3_validate_interrupts() currently aborts via hw_error() if
> the guest provided bad interrupt numbers. This should not happen,
> QEMU should rather refuse to activate the device in this case instead.
> Thus propagate the error to the callers to handle it more gracefully
> there.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/539
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Drop the unnecessary vmxnet3_reset()
> 
>   hw/net/vmxnet3.c | 34 ++++++++++++++++++++++++++--------
>   1 file changed, 26 insertions(+), 8 deletions(-)


> @@ -1554,7 +1568,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>                  sizeof(s->rxq_descr[i].rxq_stats));
>       }
>   
> -    vmxnet3_validate_interrupts(s);
> +    if (!vmxnet3_validate_interrupts(s)) {
> +        return;
> +    }

Better, thanks.

If nobody queue this patch, I can take it via my hw-misc tree, but
after the release (since this is a very old issue).

Regards,

Phil.

