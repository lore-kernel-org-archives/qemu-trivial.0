Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A6C61DB9
	for <qemu-trivial@archiver.kernel.org>; Thu, 27 Aug 2026 08:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzVfA-0001En-6q; Thu, 27 Aug 2026 04:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVf9-0001De-0l
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:40:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVf7-0006bz-2n
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:40:42 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6RDfX3257928
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=; b=IUs4rwdim/Mea8RA
 SzmrAM2qg09ynuk0KJGhht84Qgasz1eMrZkTPTIhpc6GuIToUs1k1WqPVHTxbkpC
 dngq8rn4zGlFI194CaK/rjItk/wN0JrqY8XrkNtb0ySr4yIxGdt8HCXf7gP7XSMB
 c7VqOrPISlcHMM5W0LUNvw2Zn0TsEfQlU0qallQTlktxdh4z4GxJdifkub/HgMl7
 ekeUCEu6qblZEVHvzmN0VQ30cuIiZFR+W9pDlvTAbzw0guSwn8FMbTE9fFa1fLbZ
 hZDYsX5t+/9Z0nQlSttF/gss8gmjdJ/metK32FMJm8e+64Lz9ykaTdXC4rHRJl0N
 2f1NCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ecaujf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:40:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52ee59064d2so9824311cf.1
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820039; x=1788424839; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=;
 b=BwIuHtdJCyVRpoTecFKJ0JKM4f9ejiaR8oWuPwZjqetina9iRaOApAq5d7kSH2MWCv
 xAcMNHwOp6GeTbllaPE39pz6xJVATnEzprPyoCIh6R0yka26VI7x2dDQOeOpk6COWOEC
 j4Esl52BoM0m8WHvsT+2bjRfTvpo+F9v8FulsE4UVN8GnmSwaThXj7Wvxk9Usn0ptxqq
 AplkAgrqXb+JiOqD30F/E878X5tc3VAqmqGfn1vfm2Jq90CRJEknY21MVUDwpxZ/+JGy
 mVS1o2x7CORs4qeEgP/LhMYSh5fVmwshp6JbxJzCxhUXyrNMZMGBdXNtjihCdfshYqho
 Kh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820039; x=1788424839;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sQ50trFlPo5d532JdYVenY8HaFTmYzIbecwPOKivr/U=;
 b=lz7Dabx7BimIrMzqQgs+lFUIM57XQyNcRvey2XRLXr+0sAsrbnO1uD2sQ/1cMAk9Bi
 KunRl3+cxlkAImNLLS9aIn5KUrg3oqWbm6x+01h6o7hVa+ryl2pXaPV5ss1VkXbJqBMo
 61+YFQ+BVm46OSzIf1xhlwMq0oVBx49+U3GJM47xHd+udlWurFh2Y5WSFiFav8cs6wwJ
 qo0LRiHB4vZ4FZLPlSH6WYeXX63NDlCwUQgKi/AtdtXFp7Ka6zI9gyYoTnOllXQiMDlM
 2gtHjHZ+V2phJ8mByXy3wnBx8YQovSv2AVjSj6/becQi36HMzxjacCB1EMwpjH/dhVGH
 32Fg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqdh44vwZGeE1AtguAQFPH8G/C/L3lBqe70//wNcPoT7e/8NfZD22AV+burnvmldVjXNnAjgmPCC1vS7Zk=@nongnu.org
X-Gm-Message-State: AFuF++kIVAi2heVuuzaeWNhY6umWUCEr8RfKhgFdQAdCEr3aUqDkbYp/
 HxZnMXHjkdcdIje+aQdFEp3VwZT2VWbL3soWHmQScZ6to5BeKahnj7o8uuIIRKVqPVAayRa7qL3
 k8eaGCx5dGSDGSHZZuumvxDMAqkGp15eTRxJZfXSOQG2P72RYcACrMpbkexR6
X-Gm-Gg: AR+sD10jbr5B9UFpGkZ1gKq8K2W+VodJHLcI0+qZVgteaDGH9Pfqy3xJAld7YmyJkOA
 XbmJp78xznpvx5IdITkbZsTLckmqPgW/ife/8qTfLkjFod4pLfp2al24Hlolv7qqNjIOr0BT4wm
 AoqiU2SXU0mHJiYfwQELSMoRUOLMZvkeRk7WbwVwwPJyFpUq+cWBhFbVbfgjDDeLi8XjMmciTM1
 T/Db/7vodaS/Ly4pV6WK2j+r53O6kRqN3AgayE8LzkucZaRh5e40qrb56cWpH/cTTo7ZvzM87+t
 YloOeaCnu5tpg+P1vbJbKqWIi+DOEmmZJ7RfdbkVMqMBI+aedaMt0dPEYLcj1oBkgIbTfHgH2+j
 8WNXsm/Hona2VL+6zxD1YXCWS177zsaj44skhMNU8CqKikzER
X-Received: by 2002:ac8:5950:0:b0:51b:fcc1:a0b7 with SMTP id
 d75a77b69052e-52fa1a99ecfmr41469251cf.8.1787820038722; 
 Thu, 27 Aug 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:ac8:5950:0:b0:51b:fcc1:a0b7 with SMTP id
 d75a77b69052e-52fa1a99ecfmr41468881cf.8.1787820038289; 
 Thu, 27 Aug 2026 01:40:38 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28dc0d6sm7964052f8f.18.2026.08.27.01.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:40:37 -0700 (PDT)
Message-ID: <b62f7ab6-80d5-4e2d-b253-db6c1b5758b4@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/43] qapi: convert trivial intro sections for pci.json
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
 <20260826193840.2152000-26-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-26-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8ff807 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8QYKir9KL0gRwZRtvNlgfBTCC98eBauO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfX2c/h/hw3cp+C
 y74Vw7ZEWmdujT6PKOD245++Y75FB38mLMo5T266IdietKJCxfC6uw1RnqODes7HdVDiDs67PAN
 DFPlMiyhm+po4iGFbZrCTCPlz/g38Pupy95bRs335bWQhwioJtTLxSkoeYK0eZoet3r96K/R3mA
 IqJz4Ri75Joqgdk4snbI6Ql5ewk1xW7luwe86oxvulPx7NJHdxrs4FH1i3Szx7UUN+OcXYr/f3d
 iCmhZL/3yFao2SYK4C5/j16RJTyMAG0iL5I558UKkIACWp0LWa+dAHjnhYSel7FeSkv/DvQ4+Hg
 T8/L5U7gffAO/y6OpGHD+cZOexZJKrcV45LDaQ+rgb0X1Wh7WuPLalvkTZTeRpI46i/wQCgYcga
 UknWZwIKEzgkxA026X2P3xe+6bvYphn2g3l5lNTzyJkEvwN/G1FNYFsk4c2WA0KqwAeAdSBjkt6
 lKXXqEFXM39zOwYkS/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MCBTYWx0ZWRfXzkBFIydlHUNC
 ltgUrEEJiqRZ0UQr4HJO3Pbx8ad0063K00fz8Uuz1rF6+NDOIzD8KhH+Y87VIwqt8UxcpPUx9+d
 qGx07GS9A35QQwa5WYf6OrKsB8z4pa0=
X-Proofpoint-GUID: 8QYKir9KL0gRwZRtvNlgfBTCC98eBauO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270070
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

On 26/8/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/pci.json | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

