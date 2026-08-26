Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261AEC61DBD
	for <qemu-trivial@archiver.kernel.org>; Wed, 26 Aug 2026 17:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzHGp-0007Qj-MP; Wed, 26 Aug 2026 13:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHGo-0007Q7-EY
 for qemu-trivial@nongnu.org; Wed, 26 Aug 2026 13:18:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzHGm-0000Er-U5
 for qemu-trivial@nongnu.org; Wed, 26 Aug 2026 13:18:38 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGv24B2548930
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 17:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1TiMaw2Dvi4pIcnqx6g+loHEZry4n51sB2EsiQhvI+o=; b=MFE99XxUMuYxnnAE
 ZuXy4U5Syy/2HIjIB00kyAETsDegy0Z6pWdDZtZQc0652uJItOI9MGhX68UvUNTV
 4nKAOXRsjSLgQuWyEnC2tQ2/3YlAKYCTjvV3oNk7LP1eiWfKeWGf/ZuVEwOjHZ+H
 MHBLDTwSwaqU5N5vxa7g1ilUEIh6/NLF/9zWwfYYwyc5ITKdkVZzS8zPdjxamcGd
 4MO7VEwd72/4vK5rqi3zwOnDnQg4hO1+fdbnV5wKn+BAdDkvQQ+D0nZqUJ4ojHQA
 l8DMq+xDfBSlI6VCBD1KJR5L7sv1qCqiPo3bbsq8jrFI60uY9h2IxFdxlTqhRQ49
 E9PlVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1tcgf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 17:18:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8db414c7so16408371cf.0
 for <qemu-trivial@nongnu.org>; Wed, 26 Aug 2026 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787764673; x=1788369473; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1TiMaw2Dvi4pIcnqx6g+loHEZry4n51sB2EsiQhvI+o=;
 b=fE92fORmLYtCwjSJzBgCZ7b6pMo3CeSjwmv0lgK6BNUVEHKQIYRzv0rjbsliCGQYtU
 z4lMpdBszI/5GI/lRp2lm8uZgakH+5jR3kcJtf0/24HdOdUAeLRPws7uI5m7aycVQ+cT
 41kaXXfgZ/OZo4sDEUjEtFHN9N0NyzSSaX3FMeeuPJ8XcDcRDQhY75E3kOMMFLs2KT68
 Q5VTcmnaQJZqejFKjMFT8C4Z5Z1A52t/YiaK4y+u3DmY6hgRBAi38P+x4bvWdrInuo+v
 0+RMIz7pfz31GviHg4oQSLbcryr+T510hkKOSQ2MN3OWdWFOa03kMx4AcjLPxTeU6bET
 h4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787764673; x=1788369473;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1TiMaw2Dvi4pIcnqx6g+loHEZry4n51sB2EsiQhvI+o=;
 b=ECSOoG0Zam0uJym/HKTColjkxnmeBjm33f7GgmK9/CFsPeotFBXvHfbe4pIVgJ49ww
 o0plK/HzJGM99Ft2FuOd9+7TCPQnw2FEAl5EUaT0mhzdREoSKj1P+H+mBz3bfO11i/FC
 0mUh4P77AQAF3jOtob3z2gZ7EKeMCxCAPtTuoi8zRIk6OFgjHcVmWSRA2a5vssEGwlAm
 2t4tI3JdXO+QPCXF2bsU59gsfmeuz0uaFYnJhBO3L+lM/yGUiYe82Fo2Rt26L7dpLeHN
 9oXd8tdBZFSIizhuHBgBLx6kWl3hnnz0Tvex3900pZ57JcRAIfJqXFpcHOunjbdOvnKG
 nDJg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxUABjpnYn13E7ff5OsXpCoxfJKZNVK7fzFtODTGGggeFXYzzELREygOU8sBqZ+cGensUDD8teKgd+ku0=@nongnu.org
X-Gm-Message-State: AFuF++lSvLh2yaEDtCjQxx5NiRXjcJjJQbmvr53KKuL0+fhFby7mw/G3
 /CSZto0prRISZ4fHwCox+oVn5Yn6BS+5FeFS3RX3FIDeFB6oLpGMBaxRB+dROc88ymHF1Ix+TII
 jA5uefa0cmlEJ9rUHoRDgV4rNAmzsNh75KHdXp7zorkG2HylOVDaxVVW38UK2
X-Gm-Gg: AR+sD12x3QS9Xu4JfcZBEYwYZ1gMwjGQMIK5wY5bld1T/MZw6ElLtzQMSLF74nGseQE
 YwzXrBmFD3p8uKvUhds9dqTsK27xaUv+RBpfZCdWs5JBvaofH6u8XMyOCS2Woxx5+2xbbZStehy
 YFrTKIKrvvT/PJS2OHtasvqkQoc+ZDd4+IvG3JBZmyE7Q2HZZfeTp9lD4DgqTLtIoWMz6qfCZB5
 BrG7IO36tvaVJFkmyTfCnJEmvJLK2g/cSb9iz27j8asB65XwYMv2mfUQvuwHPqhTAE0V5PO5BVH
 9by156jAvJApCUVI6HzZ/6xcfISMJQufTjfyqV3i2rO3FjIwtugMbSMrC2UBzya14dWIKb+Qw7e
 7UgrtwyLKiqZ9lxk4rYvmzOxI9by49rXSrER7A3+elit8
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id
 d75a77b69052e-52e424270c9mr99768541cf.31.1787764673540; 
 Wed, 26 Aug 2026 10:17:53 -0700 (PDT)
X-Received: by 2002:a05:622a:408c:b0:52e:3a51:6fd2 with SMTP id
 d75a77b69052e-52e424270c9mr99767651cf.31.1787764672989; 
 Wed, 26 Aug 2026 10:17:52 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a5d62dfsm568566666b.4.2026.08.26.10.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:17:52 -0700 (PDT)
Message-ID: <0c976f3f-69e8-49e4-9e35-8f83700d5e17@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] hw/riscv: trivial code dup work
 (riscv-server-ref prep)
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4ZsIk3vs4T2uldghC3dxXytdw8PxWIJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX+s1JouNPHAww
 B7A++2NVxZA+s7xcmLIl+wWUgvxPvJVGdTEpa7AJfBrIvFsGnXWIaMG+ounjFMF4IDTxrc6FPiB
 2msSkCguhxLsDkp2JA9KofOJIrpOg9YrN6S9klg3o+66fwHXnRxqWOCi2aY73lE5C8X26oRtXjS
 LXUlyHHygk4sNP6ngtUph7grmSwiiytpXhkoVkL0+XZkTX36lEyTj5iAvIL4fcbpnEvDWyAuszn
 +C9VRc2sWqsjsZyGT15RJNrB+F54Nz9OJwAKSIII7cD8/Zc41yLM7djTWyiZ79X3ol9q9zm2hWY
 owReLA7mI341grqF+LIzppO4JHc/jLn6nrJHAiC/iqJuoDXu43R2qrVEkMfl4k0TSvk2b6GkUqI
 c0FqTCIF8NH+KeP7/EhM1eJRn+ihGvPPbgl2JYSc1v+gJzTDuBJrIbPYscLQN7a1URS5DWBXm3v
 ZshAIYRpWO/2AgQkbnA==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8f1fea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 4ZsIk3vs4T2uldghC3dxXytdw8PxWIJ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfXyUGIYkfJ3Xc0
 cpL7DMCGqGUqjk0eTA3gaS4FrE1jKXYFcN3w88DWo0kkbsoipjpshC0/sJW8BdYsJuJ7InbyAtx
 rVTsYW9HacCHqXF3zonVIuLdtqm9+aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260144
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

On 26/8/26 18:48, Daniel Henrique Barboza wrote:

> Daniel Henrique Barboza (13):
>    hw/riscv/fdt-common, virt.c: add create_fdt_flash()
>    hw/riscv/fdt-common, virt.c: add create_fdt_syscon()
>    hw/riscv/fdt-common, virt.c: add create_fdt_riscv_iommu_sys()
>    hw/riscv/fdt_common, virt.c: add create_fdt_pcie()
>    hw/riscv/fdt_common, virt.c: add create_fdt_imsic()
>    hw/riscv/fdt_common, virt.c: add create_fdt_socket_aplic()
>    hw/riscv/fdt-common, virt.c: add create_fdt_socket_aclint()
>    hw/riscv/fdt-common, virt.c, tt_atlantis.c: add create_fdt_uart()
>    hw/riscv/fdt-common, virt.c: add create_fdt_rtc()
>    hw/riscv/device-common, virt.c: add create_platform_bus()
>    hw/riscv/device-common, virt.c: add flash helpers
>    hw/riscv/device-common, virt.c: add gpex_pcie_init()
>    hw/riscv/riscv-iommu-sys.c, virt.c: add create_riscv_iommu_sys()

Modulo few style comments, series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


