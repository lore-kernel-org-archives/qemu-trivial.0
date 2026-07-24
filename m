Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547A6C531F9
	for <qemu-trivial@archiver.kernel.org>; Fri, 24 Jul 2026 06:27:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wn9NC-0004zG-O9; Fri, 24 Jul 2026 02:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wn9N8-0004va-LG
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2026 02:27:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wn9N6-0002F1-H9
 for qemu-trivial@nongnu.org; Fri, 24 Jul 2026 02:27:02 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4m5sR2099930
 for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2026 06:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ej/jbIFHJ7jU6fgDYpSb7r0e3tjEeP0X/JhIl2sD1Gw=; b=lrgAAoI6Z7PF3PVa
 Anpo2c3LNdwDoRVkM9vLIKOlmE1ZjR5Qeu5CwJIYZXESAX9bqx6NIPFmXeMdNzYW
 BwsdmT8nkHoPhZoAOUp6qMIumCWaZ9cF/OYNe+u6V5n797elhPLgxoFZo5CU6Iu6
 cSr6vd4NQP2nXmeaZ7H1c98epvn0NGHUOi6Dd1oHdsuMCq6QIOIhQFfbA96Ym3vX
 P/h2izg0x7jbNtkCuveoG9uZ/wk3AKHjQDspQhGCLSAyshE9Dr2SWE7/3l5X6N79
 MqHv7vmm7MoDuFju1s8XTaFjGubZRLOcS/JnkMQGwsjaBSzMRWMLvLSnYQNkXmZv
 xGOqFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahsk6r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Fri, 24 Jul 2026 06:26:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so1637781cf.1
 for <qemu-trivial@nongnu.org>; Thu, 23 Jul 2026 23:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784874418; x=1785479218; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ej/jbIFHJ7jU6fgDYpSb7r0e3tjEeP0X/JhIl2sD1Gw=;
 b=W26zxl4WocZrWK5vRSSSv3ZLaALPSq672eQWFDDxPyxGcIyHE2r/F9B99pEA9tYkTZ
 2piSOe7QdWK2jnKJdris+mJ6ifGsHpDOnCLAwaxw2DvLK1D9IrCmoW2QZ4W4ny2M/TFQ
 lKYWmPBI8HeElk0p5KMk3atW2ZtaoqH9c5O1tDWvTR8SImm5qqV+aBw9yxtSCVw6m+zD
 nUbb0u+6t8dLdbkL2qnzh+lBPph+v1PEQIr4ntCQE2t+F1Kqo/3n4DbTFvogSLQyEhCm
 dSddaM33PVRaj3pT2BKo7JvOO5tZF1LRARtdELggu6R5W8MvH+NOpCLrTZMgyIW4qd6l
 +rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784874418; x=1785479218;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ej/jbIFHJ7jU6fgDYpSb7r0e3tjEeP0X/JhIl2sD1Gw=;
 b=dCV2mKwrbWc5No2SEHV6+QOkQiyuHQ+3AaSvsqo4UOL6wsa3i86y20p0u9E0LLRW+L
 jwTNQX/KuBGCf4OSMMYZ/hqj/R2JFyjkiK4aYNjJwWZAWcsVo+fYcm9db/j/Ksj8Iac8
 3oaYdNG/Igqh0uInTwbUuIO10e3N3mH0KMaDvigRFKIRbOAKLa+usk88DPJGA2wKJ0fk
 diLU2sNw6oOj9C0l+lhHQzUO5Mi652VNc2ISk544biBBdv21rA5lj2/W4pXs/g81E5nA
 J3OQBNszbJpKCaym/ai/RAAYmuYVthYtIPOxJoMkcZGyFg7SDwaZEroqhffsLLLZY5Hn
 0AWQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RreOnOp2zZDDIQhloaoDRl0NlI87h7uD/Cge7n3EMvCisie1SEwylbypeZCYhhPG5wDxm59Iggu44K3U98=@nongnu.org
X-Gm-Message-State: AOJu0Yw0QsKQQGjdSYPirO89dnPLzInLc6s2nhbPNVqJUQaj5oJFshRs
 KSlJWlhFJgc6seqiFzmFKZPTQ98vxnxg8xvRR1tBfGvDC//CVuRUwjdHA+xcreqGMAFQty2KVkI
 aWuW4bhEAS6C5yth7b8/zy9jKWeJBO5ddsSy6z8sN5/YcEbvCjgC2Ua3d/Efa
X-Gm-Gg: AR+sD11dlBXmjfsaA3ywVF4Z98UFFAMgO78FnV1QkFg423GWOHf/RTDvfoII/VODJYE
 FMhAFhkX870GkMlNy/j9BP7BFrdw8Bx0vm40uzeAMVBrlYN8oE5DzLrgQ7NF6WkcNdpyQWsBpaI
 ITDMJA9mlRFRLUI+gsMxn2zczFRXCpyP0Zx3lXXR0uouuJ6ZRu6q6Lunx0e4cDtBagutVbzAzX6
 8/SrmTjBKpfCCBjuw6bttYZYkT8iA389OIkunjah7LCQ8KeH9hCzFdaqkoPcVPV+vpyt9ipjfKC
 cPg+5DSAcNU0PmRnC8qfVl3r8C5BaIVEqdhKNqTSXWIjRDT1WICoKN+9+TPirjFcQxWqH/JklAv
 BY0Ll2ZSmQgsN5jZ4jJYFPlkS8Kk=
X-Received: by 2002:ac8:7e94:0:b0:51a:89db:95a4 with SMTP id
 d75a77b69052e-5283ddb0ee9mr55210441cf.6.1784874417804; 
 Thu, 23 Jul 2026 23:26:57 -0700 (PDT)
X-Received: by 2002:ac8:7e94:0:b0:51a:89db:95a4 with SMTP id
 d75a77b69052e-5283ddb0ee9mr55210201cf.6.1784874417271; 
 Thu, 23 Jul 2026 23:26:57 -0700 (PDT)
Received: from [192.168.1.138] ([176.176.154.185])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb57cfsm20867213f8f.11.2026.07.23.23.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 23:26:56 -0700 (PDT)
Message-ID: <63228d8c-2a67-4f8e-96be-b71a37e21bcb@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/display/vmware_vga: Don't allow guest to trigger
 long running loop in host
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20260723124432.353969-1-thuth@redhat.com>
 <28b3741f-3cab-4e7c-b830-01fad0d80d35@oss.qualcomm.com>
 <amIwSvAAv-LWbmYT@redhat.com>
 <7f8e11c2-f7ea-4362-9840-a295a7def315@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <7f8e11c2-f7ea-4362-9840-a295a7def315@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA1NyBTYWx0ZWRfX4/1hWmEWPw9s
 PxXG+h4qEksYDsrpfLdWNWMcv5jWPTqJB0cjZWEPjoqwjPqTAbVzrVdVCgNASBAsvhNbt0EG8s/
 qUN7zIN/zAV3XEfp3UZbM3FBfZYNrfg=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6305b2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uVRRv9AK2fddTnT+2a2/4A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=J_-Nd1mkAAAA:8 a=YSNzndg7L_ASFngmpYAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=n8ForQn92ZFaZtFqRdMw:22
X-Proofpoint-GUID: JfGoyd1abTTYnkry5Dgd-echTOFch7YU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA1NyBTYWx0ZWRfX5QwmcFYPZL4f
 B6rG8gdeff30AqcmZkturKF3EZeoO437UpGB+mxkC4OiEPU+0CIrDsOhWEZUShylEdE4hL8vKbV
 CB2nd4TSsQR7ukI7S+Jc/MANClR1jqi4/lRXezkTtVTOZ7ijmscpaQdMFJ/SoMtLKacPohB5ojn
 hCaagpoVW0/i2GbEX4a6QWk+UhfPRvCPkjMXhnF2vPcZkj0a9KdLXF4JAnMiqvFvToKaSKM91jf
 p93keHNzv/BHkBe3WXHaZw5pGmHvphIWephPdwd2NxyPwRgnDrjw0NO76I9s3nowoAk5mZ3Qt8w
 5dxn/zmy100XrwpArP4VVDK6OdYgAx4u1POcXFe/1MjTvcb0TBFwG2oXEFBjH9CLkGfAwi+FKKt
 TSKoRk1c+G1Gkxwv1Wq4Eh1Q0unVimFRgCphacw1joX4c2p3BASfpeNbit5b6i/dwgebP2uzoLB
 pB5x5MDb8GQ07vmOhHA==
X-Proofpoint-ORIG-GUID: JfGoyd1abTTYnkry5Dgd-echTOFch7YU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240057
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

On 23/7/26 18:18, Thomas Huth wrote:
> On 23/07/2026 17.16, Daniel P. Berrangé wrote:
>> On Thu, Jul 23, 2026 at 03:54:41PM +0200, Philippe Mathieu-Daudé wrote:
>>> On 23/7/26 14:44, Thomas Huth wrote:
>>>> From: Thomas Huth <thuth@redhat.com>
>>>>
>>>> The code in the SVGA_CMD_DEFINE_ALPHA_CURSOR handler in 
>>>> vmsvga_fifo_run()
>>>> basically does:
>>>>
>>>>               x = vmsvga_fifo_read(s);
>>>>               y = vmsvga_fifo_read(s);
>>>>               args = x * y;
>>>>               goto badcmd;
>>>>               ...
>>>> badcmd:
>>>>               len -= args;
>>>>               if (len < 0) {
>>>>                   goto rewind;
>>>>               }
>>>>               while (args--) {
>>>>                   vmsvga_fifo_read(s);
>>>>               }
>>>>
>>>> Thus by supplying huge values for x and y that overflow the result of
>>>> the multiplication, the guest can trigger a long-running loop here
>>>> that burns the host's CPU cycles.
>>>>
>>>> Add some sanity checks so that this cannot happen anymore.
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3782
>>>> Reported-by: Feifan Qian <bea1e@proton.me>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4026
>>>> Reported-by: Tristan Madani <tristan@talencesecurity.com>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4076
>>>> Reported-by: Sunday Jiang
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    v2: Use SVGA_MAX_WIDTH and SVGA_MAX_HEIGHT instead of an 
>>>> arbitrary value
>>>>
>>>>    hw/display/vmware_vga.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>>>> index f6f9edfd1d9..567806f0e47 100644
>>>> --- a/hw/display/vmware_vga.c
>>>> +++ b/hw/display/vmware_vga.c
>>>> @@ -737,6 +737,10 @@ static void vmsvga_fifo_run(struct 
>>>> vmsvga_state_s *s)
>>>>                vmsvga_fifo_read(s);
>>>>                x = vmsvga_fifo_read(s);
>>>>                y = vmsvga_fifo_read(s);
>>>> +            if (x < 0 || x >= SVGA_MAX_WIDTH ||
>>>> +                y < 0 || y >= SVGA_MAX_HEIGHT) {
>>>
>>> vmsvga_fifo_read() returns unsigned... otherwise:
>>
>> But x & y  are declared 'int', so at least on 32-bit builds
>> a large uint32_t value would wrap and become negative.
>> Although we dropped support for 32-bit platforms, IMHO it would
>> be better to use uint32_t for 'x' and 'y' too rather than
>> assuming the 'int' value won't be negative.
> x and y are used as signed int all over the place here ...

Ah I missed that, sorry for the troubles.

> so reworking 
> that goes way beyond fixing this problem. Could we please get this patch 
> merged first for 11.1, and if someone then still feels like reworking 
> the code, this could be done for 11.2 ?
> 
>   Thomas
> 
> 


