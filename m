Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29954C43458
	for <qemu-trivial@archiver.kernel.org>; Tue,  7 Jul 2026 12:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wh5Lj-0001dI-Mv; Tue, 07 Jul 2026 08:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh5Lh-0001cl-Qv
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 08:56:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh5Lg-0005Hy-39
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 08:56:29 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C93sE3590163
 for <qemu-trivial@nongnu.org>; Tue, 7 Jul 2026 12:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CNicinN0JC3gMw1nnn9/4RGSuWHnh1nQXkzNwy3uO3E=; b=A0HPNcAKZuOK8bKb
 kD5nut8gJi1lByj8e+jSnipV2GduvPaKpT8I9Es50Le+lHCIyTeu0GeZP4Ti+i5x
 JdpZlZTJMOusbZy7zsQPH/pCMTaTfExdOxgSQHpiQ7JLKlF2wul/y8qBjGCZYHr/
 MJrqhwWiH8kd+h5Wjor5AWwomIlFz+zTflGBJbHfaqivRrMXI3zsmjac0oO6JCsY
 3wnyJSumUcxqwv602rE1089hZO/oagstHuJHB69C1eZf5xlERovZWFPS7zr+S2Xu
 AvTSW+e1TCs/e998AqlXkxQSOsWHaumTeSqY4ZkhkKG+jWLGsgRTALxfO+oD/V2k
 SRKPtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u996r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2026 12:56:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c12e43b98so51446171cf.1
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2026 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783428986; x=1784033786; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CNicinN0JC3gMw1nnn9/4RGSuWHnh1nQXkzNwy3uO3E=;
 b=CeSh07YryGWNXUCjL15X4ZYb1saihzm2rvjQnMZt2mkbyumW3qjTEdof1Ow7qYPaOn
 pWILieODt6nSlMVNqnAh3I2eWHz/4aeMNUSNjhQt4l1Ce5d2DbviA7gnOnqC68cfHeIl
 JhZM3pSRMMAM2Zlr9z0voBHHwf2H71/HYx9ZpXjN/uyq75dNEwKI9PfpjfYea/i52LgL
 2jUKKwQymr+oGO2n/kRHIt7BuH35wQoD4ZY83Ipbc+tRM57xl+J3FNiO05UrTx21o51G
 i86d+HYqGDaRbcjl+b93BBNGY6nWLz6SquTc/CE8BeY12TtcmGMSFSXg75Sft/GPLfEu
 i/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783428986; x=1784033786;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNicinN0JC3gMw1nnn9/4RGSuWHnh1nQXkzNwy3uO3E=;
 b=DWFMJAn3HYe7bEvHW0KAkar5BOKo6pUnJFl5OTG3Ri3KhfEQl5LwrNtp+dAtjeFb+S
 Y3pcvMet4Y/VQwH7GgHFDk6XZ4DIBsBtuKl8Vcr45+ZDds4kGeuKL3trGPF5kkdmV30Y
 rAsSqptPPVQDxKCU27T7nOR5hPPKI7i12PECqxapcmz79Bobxa6914rh6qQQlrxIAdOT
 D6O4T6CbTr5iCk5jylu7OCHodxG6FydTxRqiBmO6Khv7LZHyYwD5UeorExUzYruDWHkI
 eXyfI+PJz7DTfo9sEGZrDx42aPXFenyS7nb9HFku10W9QbaLCprniXza4ODaJs/wj+Ma
 VBSA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqfuWDDPWKdu1oz7GIejYpPBqvjoDw2EWRI1OPDJshBzrRvgdbb9n3zn+cosj36OGyqA3LOaRLvH0NmpsI=@nongnu.org
X-Gm-Message-State: AOJu0Yw6ygyWIcC4wqYo3p3o5v2TsOmsf355UEUx0D9Whg4nScFUyGLE
 8IswlXUVY6aYvecjBVWJFhs6OAVToowzVEko5IL8LZrdOC+MPMbbpbsPOiM/dcGPF7irH3mUznF
 bYyU+ch40ms+5wfD2S1ZnFH64CN9ra/rN3eQn6LWXBlsRrtOwBH1KfpiSM5+IuNS+ogGd
X-Gm-Gg: AfdE7ckfnj8eFwbh5TsxsVuvcXYlCsDZYD95h/7hcQSi7n3uhQ82XHhKrogUy3fyvDd
 32CqpXHI+W9B+NpUKTspwe0UTs+7ukjIKkQ39edInHgL1zFQodRggFfJW2Z/DSsAvuXlsu5LE4V
 o6JMKUtycDpZc7RV7RjSbt792v65Y+YpkWNpDcvp2EhmJn+roLSsIo+9+gwx0pbpl62Cw9I/Eoc
 zj15ERwPk2gIo5omloZ1fBtNrFWwNHvFawdOFheqytcdvjiIZh4mkUaq+LxYPgehLXX6FEo/zq+
 cJkCAl3Y10RoOKzCv8VRe1xcTgrs+esCwvYr9BvVTeC5T5LiO9vo3S4ZaBOckc90YY9xo7g03g2
 3L5xl+/5NxbmQKSnXdnT0vkUE8BE0OEZyJU0po0RjEwKIcyG2wLwhIxiJ4YAaeA==
X-Received: by 2002:a05:622a:147:b0:51c:8fb:fa44 with SMTP id
 d75a77b69052e-51c748816d3mr53329851cf.59.1783428985696; 
 Tue, 07 Jul 2026 05:56:25 -0700 (PDT)
X-Received: by 2002:a05:622a:147:b0:51c:8fb:fa44 with SMTP id
 d75a77b69052e-51c748816d3mr53329531cf.59.1783428985151; 
 Tue, 07 Jul 2026 05:56:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad9bfdccsm135459066b.36.2026.07.07.05.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 05:56:24 -0700 (PDT)
Message-ID: <7a3c8e51-cede-4e14-895c-ad8171cea0b7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <0b79579f-d021-4e7f-9244-125c2bee0d6c@oss.qualcomm.com>
In-Reply-To: <0b79579f-d021-4e7f-9244-125c2bee0d6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNSBTYWx0ZWRfX33nVoIWEa54Z
 K50kgrsjDsrjVw0S/6vruT3tb9HjojMJ8cILXJT3+6efq/g6aTLRKd87rUAP5Iy+qa9bIRkjaST
 Ds1rTAbcXtnmn4/53AMOhO6vddGNTv8=
X-Proofpoint-GUID: YCYjKNa-HM3wlLto-TV0riSJTNPJCnTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNSBTYWx0ZWRfXxcDyWw9stEy7
 kLYwAHHvU+SR0i/utnz3eznb19WfsGW3ABBjvmD5LY050wPFLMHG4GLOLJqtXN/A7BqtrPtrBU/
 vQfXhstZuEUTctCaOakyh7hxUy+oK3vIfF4XaVO82Z+i+4jC0/FQrRKSBMYngaSU4oj0Tj14eAL
 ViJjbn3eingH4rQ58lZ6gelIYsP0Tyc+lZWhfq4F1qsL22hVEKReNKjB5LhRu76IhaoFxrzjKJ5
 bYmyVrCyfSnKhcCqoMn06uFOmg6GF+NCrsfjSqQZ236XxCU1Wqd+foG/Je5qw9g2kk0hUqjqarw
 uxuYZjoWKOJu2mBRLzKA1f//MmZGcgUsrD2IuiSBSRckt/AJRaoNwAZ6406dobf6MtsASJbfenH
 lXGXjkmafLPD0WW0hS607Rc0Jlw0iHR7trfBFKxFmVjMfhp5+aejZExWiOe3T0aB3w6uO1MmvlM
 Ey8n04d92wlzG9ys+dw==
X-Proofpoint-ORIG-GUID: YCYjKNa-HM3wlLto-TV0riSJTNPJCnTx
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cf77a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P8dsoeSFSmiUCL4bGtQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070125
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

Hi Thomas,

On 29/6/26 16:56, Philippe Mathieu-DaudÃ© wrote:
> On 29/6/26 15:43, Thomas Huth wrote:
> 
>> While it's not urgent, soft-freeze date is in a week, so it would be 
>> nice to get this merged before it misses another release ... WDYT?
> 
> Queued via hw-misc, thanks!

I wanted to help with what appeared to be a trivial fix, but ended
putting myself into troubles for the soft-freeze day, so I'm going
to drop this patch. As Mark noticed, the issue can still be worked
on until the hard freeze.

Regards,

Phil.

