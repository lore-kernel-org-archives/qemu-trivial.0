Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C6C531CA
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 13:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmtt8-0007iz-4R; Thu, 23 Jul 2026 09:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmtt7-0007iU-6s
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 09:55:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmtt5-00035j-Kh
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 09:55:00 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66NCvZt03954530
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 13:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X8Ur67wfDCGM5dWiMyoi4X79L+V/OmhrRreEQsEctDQ=; b=lFZdzqYjoOkszPao
 hwo+vgLhV2ui40eVHzy4efn/j5fv2b80SDASQ0/CdDm79oHwJ/n49aUUWFvzLQTX
 RdbmDWlbDeE8+wCEoJMnZjSjQRgH/gcJJK/jLlDuL2Dg2O2t3Klx5W7Y+j1amK9h
 fUxPv/+vRCdrnCuG1qYkwDeB5u3i2HR8xHx1QtGhPrT0nEL1Siiui+uoqg498Vm9
 bGD5DNjl941te/PItap7GAftvwS5V6olHfaiGfrdABDT/CPcoCdX/ya/phJjyDrY
 3m+OP7HUSlImHedOon4ebWiWmYe8RWvkRwyY26PKpWDWw6UmI9X5f6HRzl3Kghus
 0gSomA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ksp4v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 13:54:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f0c46bfb6dso19773056d6.1
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 06:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784814898; x=1785419698; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=X8Ur67wfDCGM5dWiMyoi4X79L+V/OmhrRreEQsEctDQ=;
 b=VW6/2bAZXsUx5mwlhspgLOB9VBjiJFeC9HIzP46V4X8YpR14jy3rTYAROOBY/Ch/AX
 hgHU6K1gj79bUr+kHUiyt71mNn2plBhtoXwYPEOMjq0YfX7hwpIWRIzrI0Nzg4uWH52y
 B/k7RwAB7gSuqzmVECi03zfWuxdpVUiLpwf+LYTNnRFzjZUp8pYa5FUJnQrmWXXHsfAW
 D9A2YilA0rRdt/TnK6pxr7ywMxxDofkuAk/r12cALxQMsS3DwJUkYh3W4E6ZQE+wqk6Y
 t5aOQdqIJaO7e9Vcg61ObxTIkhEGfJf755IKxxEIZHtKBvBa4uzIbPlnnF49lOh09sxt
 QFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784814898; x=1785419698;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X8Ur67wfDCGM5dWiMyoi4X79L+V/OmhrRreEQsEctDQ=;
 b=X1XcifCno4nxgfnvbc+JDf0hinu8JM3wzEggjWRQDOap/WZev4twCqHGdwmPokbMsS
 RT1f3o0LYgNPPOznGCO05GW0JiOBiRarVyYlCN3oXq6WPnC4nqttDAUOTkcK5Q2CWvYp
 /fw4qkB0QLSdRnnONngPLG9WSGO/LAKcq3yM05TTTxAq51ARRCnAIBFj+W+HNP1FjwKJ
 GdOzNU78kHCFKp9KJxt71mv3xUFCywXPds/GqSmCe3WH1x2zJRdCFUwdMkHxOB+FBbTN
 /nvZ5Z0esU7GudngCSzGUnHBBqdIdIxyfq5DX8KhapfykXw0xAeu5IX3HbeipZ1ksBIw
 CrIg==
X-Gm-Message-State: AOJu0Yz+1y5QVBBb1n2F/mIIhou+rhlp2LHZVvDOhWDEa0JNGuKHwijr
 0KoU1hRcXsTJ0HBQfXDxDWUkHkzAfGXPwewxivx+G6pSB2baSl05Lr34XiGO+Sk5S4gacVkcYA/
 Dsa1hRxpDduvPYvGkUYLpVv1lpzS+/IuuHA4za0TFSyUC9s+2ebjE1HJGAGH+
X-Gm-Gg: AR+sD122bQGH27bflmbwohpasd3Yrfu5Zfh7NQEj6zhWaPe/gQh0WLlEghQ4MEpXTjq
 YBy1bp/FNogNQmVsM5G/hdj/an/EC4xXTAcDWC2cQBQMkvIntxh2sDaI+LOtRnybsJF4sDSASeC
 xB1FyJCIcgs+VNvkdMa23Gqk/+OpgvH6fG6gnMQfxGtHV3q6aXoU0ouoOLdS1bHxLM1OVGpq8bH
 h3jE2aAFORH6BIRn4mxpFTjx9jjtqYbeYHNbgTUGu43PhbhWtfeTfPBsAwwxsKaAXb8+GvzOfWp
 gAtZgohzhdwvmwI/7YkmWSeuApLlwRkYOXtoISV9DQmXyfDt3OyVgPZMh2uCjv4VdYzO2eXg2tq
 TXQkHp0fF5WNO4dB9luL8+7mwuLmjz5IUzxd+JyVZvoZl9Kb/SZM=
X-Received: by 2002:a05:622a:c09:b0:517:875a:d634 with SMTP id
 d75a77b69052e-5283dda389dmr29237631cf.2.1784814897817; 
 Thu, 23 Jul 2026 06:54:57 -0700 (PDT)
X-Received: by 2002:a05:622a:c09:b0:517:875a:d634 with SMTP id
 d75a77b69052e-5283dda389dmr29235581cf.2.1784814893648; 
 Thu, 23 Jul 2026 06:54:53 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b7483f0sm128463825e9.3.2026.07.23.06.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 06:54:53 -0700 (PDT)
Message-ID: <fe596402-0be0-4edb-ada4-73e73b72e0d8@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/display/vmware_vga: Don't allow guest to trigger long
 running loop in host
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20260723120020.330089-1-thuth@redhat.com>
 <d934b1b8-d639-420c-9974-f728fb752bbd@oss.qualcomm.com>
 <a4e46837-e55a-4f9f-8ad5-03f490e39cf8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <a4e46837-e55a-4f9f-8ad5-03f490e39cf8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8bE1xAsvfY2r8VpPCmGTUtzA5xIOXTDt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNyBTYWx0ZWRfX1gYxkDsK1pdA
 GrjaGsUlD/Cjh2vP59OgaAWxY8h5Q7YvqUaGsTZwdOc4FAcHjcCgn7Laus93g3C1MKO+O5WESU7
 qojDMP/Vzn1jo68Gx1gLvzdcLRZUbFo=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a621d32 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=J_-Nd1mkAAAA:8 a=NdJ0D6ZV-04Lh1VSvEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=n8ForQn92ZFaZtFqRdMw:22
X-Proofpoint-GUID: 8bE1xAsvfY2r8VpPCmGTUtzA5xIOXTDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNyBTYWx0ZWRfX1MG73yMTblcc
 lziGNZBZEXHPA8wEUfv+7kputA/rOOjqAvedT5PktMsXFoZFjVa3cAVQ3H3ZsAs8aKMsJy0USTf
 Ql4bumYebq8D3jt/Bqkx4zUEtFNYJaJjOATDLojF/8FX+xdyeN+2icwV3BorvXdpBDiKgZ9397H
 N14eEjupLyPOeII9fv9Cx1oUnaiJjJLp87QGKVFFi1sA2TnuLL7n0PoftgoPpuRpRDnI3QbZKMc
 +ZYYM8pteeEIRY+Hf4qp3U1XjmYXjMxMMoL84hluHvSGhuilTS8yzChrnmMmnHSkO9/3qdydU5r
 qPCJVdEXXkDO+6AT6kYRMCWSRURAKFnG8T+1rBWikvNotOMqi+7Hn58XD+NPORpg6YyaZg434L4
 yItJOQdGAn2hOo3mr4fpNXSAaehokwUoHXSfJyaGPXH0bJ9eYRE0xfUDImCBVpyufEwz802+og6
 NTdJYjYo8mehS6DgzBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230137
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

On 23/7/26 14:35, Thomas Huth wrote:
> On 23/07/2026 14.27, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 23/7/26 14:00, Thomas Huth wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> The code in the SVGA_CMD_DEFINE_ALPHA_CURSOR handler in 
>>> vmsvga_fifo_run()
>>> basically does:
>>>
>>>              x = vmsvga_fifo_read(s);
>>>              y = vmsvga_fifo_read(s);
>>>              args = x * y;
>>>              goto badcmd;
>>>              ...
>>> badcmd:
>>>              len -= args;
>>>              if (len < 0) {
>>>                  goto rewind;
>>>              }
>>>              while (args--) {
>>>                  vmsvga_fifo_read(s);
>>>              }
>>>
>>> Thus by supplying huge values for x and y that overflow the result of
>>> the multiplication, the guest can trigger a long-running loop here
>>> that burns the host's CPU cycles.
>>>
>>> Add some sanity checks so that this cannot happen anymore.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3782
>>> Reported-by: Feifan Qian <bea1e@proton.me>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4026
>>> Reported-by: Tristan Madani <tristan@talencesecurity.com>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4076
>>> Reported-by: Sunday Jiang
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   hw/display/vmware_vga.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>>> index f6f9edfd1d9..04cc438cc02 100644
>>> --- a/hw/display/vmware_vga.c
>>> +++ b/hw/display/vmware_vga.c
>>> @@ -737,6 +737,9 @@ static void vmsvga_fifo_run(struct vmsvga_state_s 
>>> *s)
>>>               vmsvga_fifo_read(s);
>>>               x = vmsvga_fifo_read(s);
>>>               y = vmsvga_fifo_read(s);
>>> +            if (x < 0 || x >= 32768 || y < 0 || y >= 32768) {
>>
>> Maybe add a self-decribing definition instead of magic number?
>>
>>    #define ALPHA_CURSOR_SAFE_LIMIT 32768 /* Arbitrary limit */
>>
>> Otherwise LGTM.
> 
> There is already this in the code:
> 
> #define SVGA_MAX_WIDTH                  2368
> #define SVGA_MAX_HEIGHT                 1770
> 
> Shall I use those? WDYT?

Ah, these look like good candidates :)

> 
>   Thomas
> 
>>> +                goto rewind;
>>> +            }
>>>               args = x * y;
>>>               goto badcmd;
>>>           case SVGA_CMD_RECT_ROP_FILL:
>>> @@ -776,7 +779,7 @@ static void vmsvga_fifo_run(struct vmsvga_state_s 
>>> *s)
>>>               if (len < 0) {
>>>                   goto rewind;
>>>               }
>>> -            while (args--) {
>>> +            while (args-- > 0) {
>>>                   vmsvga_fifo_read(s);
>>>               }
>>>               printf("%s: Unknown command 0x%02x in SVGA command 
>>> FIFO\n",
>>
> 
> 


