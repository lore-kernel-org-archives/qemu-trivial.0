Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72E9C61DB9
	for <qemu-trivial@archiver.kernel.org>; Thu, 27 Aug 2026 08:42:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzVgz-0002J9-0n; Thu, 27 Aug 2026 04:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVgx-0002IK-FT
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:42:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVgv-0006nQ-RZ
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:42:35 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6R5Hj2726536
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=; b=kCqXnufVK1shlEJ4
 5UPS+/H239/KEj1HJfFerfxh0oBobJkWDz0FkVGdfTr6VrF/whboY68byyJbZeV0
 cdQD7aoPm8TbkMKrxiFfIj6mRqkT0GraTI/go4xoahp1kW23UVXvEcXN0vGXPXnJ
 NFQ8IqksMC+uXLNbcky9WgpR4IuGk087/1gKCK4U66G8/J4g6msD00gOcEiI+U77
 vvgcShJ9xcm1bCKyYU2hRNxxu1xIQgRNgRxfwhFzruqvTrmgJHxczKd/SukPSnan
 yaGewgvhkRaHLvOI3F8m+tonZjRaVX7dV6kgXBikDSfJQBGKv1FGcshvSh5clLMj
 CoAYHg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga6ettbw1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:42:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52f52ccd459so16869281cf.1
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820151; x=1788424951; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=;
 b=IKdaBmX0qibyYNlQ95ss9emUHTUGkkZ3aIv/EzPNcX75iRkcAzkCj1tEHsY2miW4KN
 T6RkBNtbX2xQBF7ajBZdQtwKQybv0yoFXphIULCPhfM7jt/14NZYc9XN38/w0PQEROyH
 p0l38wxxbqaKcrI5c079xXJpN+DCtcMDl0lIo3gwMmZhw4PpBjbCqLOhoxUV4DIsijRM
 EqjYG4aPvRzx7as3WqEWZfYcgE6ZWGj6mpkUuM2PcnZ+5qY7jE+s7Sdk+fBnV3McVEo4
 sCkHNxB3Me+vXuHwViYzGhB46e8buWoOi3abSsGtz8zjZBl2AYpnJcvD9MAeU6C5F1pE
 O8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820151; x=1788424951;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eTOp0U6hBPBLp7IWusXAj3yNaChjytvOMMoMQ0I0hhg=;
 b=CTsanQ2rRIdalaBAP6J4un1YhTrPLbXNDI6ftmupxbxZExaJPfjiSxih10J4vYmBzN
 sKiWX/7/9xHkeLVga1RKjd6iAfvPXOV7xgh6H13gdcvD1fboMBLsnHgjJwvhRKdDGJFs
 s//W+9qLrjx89AymMcCdEhMjgfyLSKPfuiqZCAZ8P4+I/+72ojqXBC45GoapElZFtWg+
 /VYbTu5G716IjfMOHrLgvTK0n3WxTdhYGtawNMME68+ACiA2PEHVZkTewHtYKPaV07BQ
 zP4+1oZHSxc8W85xYEwdZ5+EkAu+V2XfDfIZIPimj84sv/HCAwv+3Tbjt1Bnvw/V53zJ
 Z9cA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrgu+4GEhatXC32fDJcgSyylBCdFdyV4HEYodxJiZ01C5Fy5mt2f95hpH/SnRFHldI9STpNPqjSbIIXpPQ=@nongnu.org
X-Gm-Message-State: AFuF++mGplZGlm0VtI9u+UGETmKvXxI1VEQYA4EFHGRPIPcF7j2WkVwb
 srESH+TAWNitvSdOTOafh27o7FW2uljJWwcMOaalnnmCCyHGhL25nply5MafZy/AD24ssT92foO
 dLT0aUX3Ss86sb7iAdB04C7y5VZR2FPfNEcdmPMSxB7iigLrtyAJndoyAcQVt
X-Gm-Gg: AR+sD11henWhoFuX6jOr1d6lONGUeg0XRaIJ4+Ppjk9QOd2OpvlRzh06zVVpLu1HrVk
 5uYTUXSrMjHerbrqa9uUzLucSQx1/YZLrLUElh/8J/mG5KHepJHC7yaLWQfjtG9kjqbC1kZVfd4
 VZJ6LEE5RAUBVovdjrNO7PTagIJ2lmT1VqNPSEJpckx/vxZM2YnJNTl7HIoiYpyVOGhywEy4IKu
 aqVH5eAveSoPf1QxRgiCCe0pRycCM/gY8WU2ygseWnh9sbzMyc1I6VyP/tQ1fxiB/Myhk897VjV
 thT3zlbXH5nldX+6aywp8JBdl1uTetYb4QTVecVrZIQgB31jE6DKQ3UbPggteYsIFfJCsAPD/Bn
 2XoVFWr5qgiP3q76LIj0ks/84kFYP582Io41hTWnI6I8ZdKnF
X-Received: by 2002:ac8:6107:0:b0:52e:2906:9124 with SMTP id
 d75a77b69052e-52e420a0859mr147672131cf.0.1787820151499; 
 Thu, 27 Aug 2026 01:42:31 -0700 (PDT)
X-Received: by 2002:ac8:6107:0:b0:52e:2906:9124 with SMTP id
 d75a77b69052e-52e420a0859mr147671551cf.0.1787820151047; 
 Thu, 27 Aug 2026 01:42:31 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942366asm32395695e9.3.2026.08.27.01.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:42:30 -0700 (PDT)
Message-ID: <3e222ce2-9e3e-4dfd-918a-37a03aced152@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/43] qapi: convert trivial intro sections for qom.json
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, qemu-trivial@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, linux-edac@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowangio@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Lukas Straub <lukasstraub2@web.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>
References: <20260826193840.2152000-1-jsnow@redhat.com>
 <20260826193840.2152000-40-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-40-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a8ff878 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 6cn_zGBWygMEgnzyb2Ph5ZtDHKH0__wq
X-Proofpoint-GUID: 6cn_zGBWygMEgnzyb2Ph5ZtDHKH0__wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfXzEOzBHXAUGS0
 q7l0/JnKHtxFkoNLavl2A7sYewG8s1K6rCgHPtBgdKljXoBti0xBxlO85WJ2f8kVA188S4WWx8e
 FfsEOA06qynzVxrnSAlNf2WPb4OEUKEqsJRnURkdxftuyyuLacPt27tPrpij6sW+ACGRVRuuNm4
 PLvZnBNFTofRExtPPmaruSK7qDDQxYcqcUfQXnLsU2Yo/tcvnh1nSr5aYlShIWDJbm3LEf1ioU1
 TI5Sp/TU6tyoC9H2cfp/+PY2hBXcx6L8qc+BAYiCT4yLyvKAbfHKt5fcj5pKOaY8DeGsLrgjLGE
 D2RJDNaiwMzlTF4w4a2BMp4EpPPfiEpRjZ7cYqqPUi+bUvpQ7JTCuESlfaMsodFXJ8vJgdr4qk7
 ozG8jLApudJb6yngGZouEX896haCYTPyDhErIqtLvebpZH6lsOU7wksvoiyLvrXGtPoYbVBMKa6
 0+aHAN5mjRuqPX8i/Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfXwmDpvVMXEP9z
 6eyfK5HRPBMe7dx01mEyofs/U4xBfoKtnMSxK5T5cedq6Vq+gENjqXurfboE1Fmab1HDefVkNCw
 z3NyhT9zAG7mleojBWidoUUXveLWA0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071
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

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/qom.json | 150 +++++++++++++++++---------------------------------
>   1 file changed, 51 insertions(+), 99 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

