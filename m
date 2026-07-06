Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A7FC43458
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Jul 2026 20:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wgpue-0001on-KX; Mon, 06 Jul 2026 16:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgpud-0001oA-7e
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 16:27:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgpub-0007SY-8f
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 16:27:30 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666KE5oH1428845
 for <qemu-trivial@nongnu.org>; Mon, 6 Jul 2026 20:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oChlt5PI7hqOmBWkKHtP/HUESYJfDlQ3GdOhaCXRieo=; b=io2dsn+WSN00+wQd
 v8nw+UMqxfYigHap8H/XnL9Za0aK7BGu8Apn70IkGYn0XclW5U+zpG/8EUSO7KAX
 lx1fstzpSbskhmYlj6Jt745izzp9u3FV2/QfzYpyNNJzeKqUolO+puNsPuKg2x3B
 m3PI3PG+Rw0f+8/FD8oeSk27uq7gXtXRiCQaK5+Vg4AfUD7FyPZZo/t3kf28oKem
 wPId2x+FToADX8Ugu8R31bOJ0cU9YuoPGCdSZAKFNHMpMP3yJqCiRoibxCL1LHFI
 p5ZJrOUI6KTSxXqqfPeqOqkaKbWzb/7fWl9KY15vYoNt3b129VS8E+mih3Jkf39v
 0S3LIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxudxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 20:27:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e8004d60eso544077985a.1
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 13:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783369646; x=1783974446; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oChlt5PI7hqOmBWkKHtP/HUESYJfDlQ3GdOhaCXRieo=;
 b=SZ26LWiFi6S5gDkFKsCT0SNBOtyg3KqDoy7CkW85pYKsNpOzh0tBgMXSFVzzBUMcgW
 U6t+3tY1G6VSaHkOZd+aJBBvM8sQ/qjbqy78Si3r8h0Xsld68HP0/FBr2xFbxKA5UzN6
 1qDQqTIjPSaMyJVjfTL+EsUPZtf8MBvpfBnlta6iLHz7wifVlQg/7w9bGniyR/rUz1Wq
 zSQaZ3D/3LVooDs0tasU1WQHMSJTk16WzSZ6O9e9osSXR9THmkurwyljSg3b3kzy7+ks
 T0/DlOvOj8I8A1hLemHKV31JM59gNPZEf8puvVbB3iUDsfdLUf5R5mSDD/C4iFfnIn4o
 WWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783369646; x=1783974446;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oChlt5PI7hqOmBWkKHtP/HUESYJfDlQ3GdOhaCXRieo=;
 b=sIDcD5qfOx6xltj1i+CPn8U/SIb+ZsgRJLgPk5lsFf1ktM9Ptj9wxSr3weXhTjSiBB
 oirj8g1A+EBIjA7fcuqp3POssbGQ01nzsHDc26tenTZZgDeCWTI3cDhzJNLtJuUDsquH
 uWXmO7Dxa7q02Tv6/E0cV35Uy6ytDQAGLnw2vfw89rNmA2y3H2mjcGEDB/N9JbH8xzm3
 41Z3mobpL4IbXhVYA9P1MA1dfeh0UG/ch3/vdy96CoXMvrnUrR9SRuBBJJIBV7OgUP2N
 ugoDaU3m3tc4Cr6iFuXnrz0yKb4uKDYiK5BzHdh8dTjb6MYCnEkOJlQfRKZjwLIcKg7d
 Y/xw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRZ6Cqs9HbbPDwWxdUIHw6/DpFYhyc82QXtchrKyjNOJDFB3JlkOD1PibZyV66ZxW4JG+tE4rqDuDx81E=@nongnu.org
X-Gm-Message-State: AOJu0YxX1QYl7GL3nEMUcYm5A/nwaJZVgOZIyO2TZBNACYXlrQ/PAy/O
 cBivrDY5uMiMxqueRJC7eVZpmcgia+elQxkHk9CB3y6KlBKSYRohQdAbcp4GrkzwhMd8pA3yL3B
 O6bjq9YTgAEcAer6LYB5XCoYh2I+UdJ/Xwdf+sEwzlVPlsxk8/13N6/cp8RGU
X-Gm-Gg: AfdE7cm74K4v67wzUGYE7DYJF09YB2IjAmL/Sz1ehGAbCKgVSLrRQsqu7lOoicGLCmR
 pxw5KB506DWV6tPkvkbDuaUB44mtwjUjGLg0sb2I2xnrTrUclXjUwQTsZgO2EcXTk3sdKfYR5Qz
 KPvG0zwPU4NxjlNZqW6GeBK0bRVdFvd+CWG8l/0IrOayadnWdQz9UKatPcN/RLU+D3DLjPFqnPM
 +PwyC18YgDtNMGsY1kFGHfMC2MTB5aWnEnRYcA2ZFIRT6K+PiYPgV0XLT07Xv2TKe9DRqv/l6cr
 AbWa5QqGLL9aH4EJUxZ+ksF/DlUdaHekwGcloZOTwFLAXHPwruAHsnvxlOVCZlIsQihWlDu1OAU
 dcru6eL0/3jc9w+tmTOIdHwJsV3c7914voa3u+Pm2qsiERffRw0yOGCuk1cjVbQ==
X-Received: by 2002:a05:620a:29c6:b0:92e:9b26:a6a3 with SMTP id
 af79cd13be357-92ebb5f284cmr289186285a.49.1783369645585; 
 Mon, 06 Jul 2026 13:27:25 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:9b26:a6a3 with SMTP id
 af79cd13be357-92ebb5f284cmr289182585a.49.1783369645119; 
 Mon, 06 Jul 2026 13:27:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039ae44sm26332818f8f.23.2026.07.06.13.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 13:27:24 -0700 (PDT)
Message-ID: <1aa71446-d211-46d6-b4eb-7bc0fea36de1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 22:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
 <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
 <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
 <c0cd50bd-e054-48b6-af54-1050e13bb720@ilande.co.uk>
 <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
 <CAFEAcA_oFFEyRfXjRZR7+nLOE5fgzDi1kHQop=s1Q4EzYvaVxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA_oFFEyRfXjRZR7+nLOE5fgzDi1kHQop=s1Q4EzYvaVxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZVu_Zjgot4McbFVf4-BV9aKVewbCDj6c
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4c0fae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rgW-2i5bGiGgzJwfBSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwNiBTYWx0ZWRfX8g1cxCN2cGWw
 +pNIWIZjssnkuw8q5SXmYBC8WKh8gnBOyS0MRAqc518y8kRX1c1i867J6ulQe0F9JHMZPmzXYbN
 5y+gpNKOlbr1I7PMNa9FoqloYWkk2rs=
X-Proofpoint-GUID: ZVu_Zjgot4McbFVf4-BV9aKVewbCDj6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwNiBTYWx0ZWRfX2lK51ir2YCvo
 JXmQUKdFlji6kpDU/0ieJ21Vw9Bo7qeGiPJ3ppUYgUPm+jiFe3J94nfATPJZpMMF+PKJKZ7SSzn
 HtoUrPK+hI82Wbm/2k5NujWztDdYKHUF41FGlyx+LWknxSxjQvGA1mHoCRMlT5al9sxxfhwHEDR
 RUcSr+esmRaa/VDTqTHCawttrS8pJl/eS/BCN9kVGcfK9rctCSS+7Pbg35+6NyhDn6rVp0b+3HA
 BWNB7Ez6gncshbc9+bUEgRQOuBKIXIrmC1eQ77Ia+PA6sw9x/7td/n2WIKu5Xf5QS1kJNy7EAs/
 SLkhhAaphBTH0wkfebbEABHnGSH3qOf3zpkjDsxZB/SHBuPzXSozdUnaDD1csXzlhXQiE43H9gv
 WFicyEN/cg6tXujT6e/BnkopyOMdHMvcS4bsEKmscgfn5ty2cVPTzdel0I2E88fGmKFLZnWsUJO
 nyvmHeZ4KRXfesFdhXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060206
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

On 6/7/26 19:53, Peter Maydell wrote:
> On Mon, 6 Jul 2026 at 18:29, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>> - Bus capacity is odd. We have a generic Bus-class @max_dev field but
>>     do not use it with PCI variants. If set, it limit the instances
>>     capacity. The capacity is tracked in the instance state, and when
>>     no @max_dev is set the only way to mark a bus full is using the
>>     qbus_mark_full() helper. Then if we remove devices, the bus remains
>>     full, and there is no helper to restore available slots.
> 
> The qbus_mark_full() function is intended for the use case where
> a machine has a bus which in real hardware is entirely internal,
> so you have something like an I2C bus which has some on-board
> I2C devices connected to it, but there's no external socket
> that the user could add more to the bus for. The idea is that
> the machine model creates all the devices for this bus, then
> marks it as full. The devices never get removed from the bus,
> because they're hardwired in, not user-unpluggable.

Are you saying, while this happens to work correctly for the
Ultrasparc Sabre PCI host bridge, this is not the appropriate
API to use? I understand the I2C example when the lines are
populated within a board but can't be accessed outside of it
(like our CLI -devices), but what about this Sabre case, the
bus is internal to the chipset; can we consider it a full bus
or should we use the BusClass::max_dev property instead?

