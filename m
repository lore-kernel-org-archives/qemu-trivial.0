Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE6BFF886D
	for <qemu-trivial@archiver.kernel.org>; Tue, 28 Apr 2026 17:51:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHmaY-0000YW-Mz; Tue, 28 Apr 2026 13:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wHlTN-0005XL-H7
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 12:39:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wHlTL-0002in-TP
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 12:39:45 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63SFsPXJ2843872
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 16:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WdcEna9mnBH51rmACdpP9JNnw5U2jmIq2W4cuNBCUvk=; b=jaFGovVj6f+YPM7s
 yKPOVAv1kRMuJ+Mn39jGIZfJTJoW4jISRwtQqqoT3nYxWRo+X1e02fjAeHds/UZd
 9wCq+cIdAA+XOg/iQd5E8D0IUqOPaXJsOqR74zc64tpslQcMBlKK9OLlu440dhzE
 SAZfvPZNP2s3AyNSStx84S+l5riLkJNjDDEA6HS+yBQ9KfVTpHADau5A/9tGHlt5
 /k26rMQIgtNebONKGPELH/ZBdnqiNbFAFN8lZE4NcL0Ud6Osb31BeylMbCuZFyFk
 o0QIIYNmlUk6IC0AiuAdrU91mFDt213YV+C9KLhM5EvqGKNcqFjkmNcYEU431OOt
 TNNJXQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryda58p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 16:39:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-12c8ccc7593so14930823c88.1
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777394380; x=1777999180; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WdcEna9mnBH51rmACdpP9JNnw5U2jmIq2W4cuNBCUvk=;
 b=YzW8LIFke7q6z7ChFFRTGRxm1LB9TVKI+Ouq/kytfK4sF/jIPAj/hK3TC2imFeImXK
 pB8m9zPRvfF5rqEGACkZClSyQ+tJ5ooREQ7J5mK4u+oym8AUwlfa9CEU30iGZkA7Mcyr
 6mpX0zslOmVIZim6H5Q2tqhh0aQI36RPwXIHJXSY+erBb45Pk5Sr/1MN1hKuBdR12yIb
 7UCHqL8vjuTYAU0AUvpBG284Sj7BlA+x3TvJn6HUQSVpXl3oFUKBcIuqS5yse9+nVelx
 Ztb69HlFHedTrI7w3x2Vse6EIh/3T4ZL33S0Tug2O1nf1N9BLy6a7veJoSgHC0rC1AV8
 bhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777394380; x=1777999180;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WdcEna9mnBH51rmACdpP9JNnw5U2jmIq2W4cuNBCUvk=;
 b=VnNji1n6AcEduMm0QujyDzffjZEMPoSv3ee6n4Z8RAZB1pqUAsvpDhVy8zBldcPVsN
 BQVwX6tD5Vz4SqfuLTqCrFj9vfVZgQF/nuZraW0JcCzZCjOPJhxDteXApXtO3KhZk6Lb
 MStoRvkfXQo3ptqw6ObpwcqSZpBb9ifYxZB9kPi95mG0znO56YIWFuKmvnj1cIg1HVGQ
 46k1DlrceptYr8QXiLbF25nHzQ/OXRlVj7Y0AaG4stW7PRanwN3/K58A1SXLJI8hSX2m
 myxDWY4uXyh8GWgwiA/UKfbCwcYWapkocXoAC8WroSK79wQ7PLfD3kNS55k4/y+40NYA
 upeg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OkNVmuy/gcZT5k78eQtxKZC9D1MFV+GrKq7InlJDWTYLQPXn8IXOrvDRpRvkUedTt5I4ZrslTfYWMHHs=@nongnu.org
X-Gm-Message-State: AOJu0YxitaI4JweccZctHgVY9FDzJ7ZwFKKact87Odt9lMLcViRmLQZX
 oNHrMgsAZRzdVG8CO8PZ59wHVqXI38BptUnShN3WyFsLfrW5qm8JdVcQVt3RTk/addL3i96o0hh
 uGzjIUGlzVAbfmZwrrIRAMnCMfkSu6UtRtNG2HF5WvPhkc2zeveNSDGlZP3Qq
X-Gm-Gg: AeBDiesR48BdtvyBFb2QyfodIVps/FyL7Dty64HXM9dwkpOgSQxhtrt+tFEzNjqpGLm
 XoWvGMqGV02zeIuGX/kpBZ8+aY/3IPamPDwlX1A8USVaAkHMJVSxNRfg9GoILkQlMyQOpMVF/Cz
 pfLTzrghkEsDo+IXznVPX/863bD/SKGDewN3I+yRX2MG29GAz/SeK1oTpUEZUdAuQWjK3vd0Ou2
 Icd/3EsqEqnp8zO0CdjX3F0lkFfSTckpIwGoS91jSnBjmTMN4lT3khZYKLt6VfUqs8i1xnA8Rd8
 WwGF950s69hLkzv7Jlfn+RIfziOJZ8zSvXnMwZxWzjkB3r+lRbWvhkru+MU5k33yTerr7BIaa+A
 KVLibbV5sqmCDHN5YJiHqmec5FLjsZElfYcOHtIgokABcJD9UfDmUVmDfd+v1PokR5KLQy6x1bR
 6z4n2QGUM6AeBIK7vA6fa/lL3m
X-Received: by 2002:a05:7022:128d:b0:12d:ca31:f1b4 with SMTP id
 a92af1059eb24-12ddd9e2a7emr1583539c88.24.1777394379665; 
 Tue, 28 Apr 2026 09:39:39 -0700 (PDT)
X-Received: by 2002:a05:7022:128d:b0:12d:ca31:f1b4 with SMTP id
 a92af1059eb24-12ddd9e2a7emr1583506c88.24.1777394378910; 
 Tue, 28 Apr 2026 09:39:38 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed09fb6b8asm2570105eec.8.2026.04.28.09.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 09:39:38 -0700 (PDT)
Message-ID: <ae19852b-a1b1-4239-8f93-e1f051b12673@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/vfio: Drop superfluous inclusion of hw-error.h
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>, Tomita Moeko <tomitamoeko@gmail.com>, 
 qemu-trivial@nongnu.org
References: <20260428163702.3224323-1-thuth@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260428163702.3224323-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ACFWz78eNEuA7oZVwxUPihn9FpKwdext
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX+yuW8cctOwcr
 O4hzb+trYonL78EXYBbpYNZsqNW0qTpTwupFBe2+tOup1RFGAU+AElnQiORSiH1idxmDLG5mdfu
 F4xRwDRT0zjvuBCoYh7shaSr+/PGT3nh8s59nCzYks3iL6Mv61hE3WmgWzijFgwFGb2pta1Erv/
 rU8NJIDc2MbnYrBD/BVk4ut7EEmNg4q3Pf9sARE41FztrBDIQuvZN8zSRGRA3tmmmqEwYG6MbTD
 cfI52zqGIxFtAGIQL29Qm34XzSeMmK7NaSaUOPW+RSmA8uL2puiCrWaUFiUvAms+w2lap3QzoU0
 cs6kluCPkxVjIQvTLW9NRk+nr5R9SrUShlPYu5omgdCCsno+VxrxvgQgux0Xg7nXfKh0ibH7N1Q
 kZD2RMd6NDx14Sb3HltQqH9WCbAsEdqb+B+Kft4rP984qgUTnx3yPzxMlCUv+/WLp0JqIyIPUvi
 dp8+CgHQCUhQ4i5FB5g==
X-Proofpoint-ORIG-GUID: ACFWz78eNEuA7oZVwxUPihn9FpKwdext
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0e2cc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=nNKS-znRAlsCiEQLjRkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280160
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Apr 2026 13:51:07 -0400
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

On 4/28/2026 9:37 AM, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> None of these files use the hw_error() function, so there is no
> need to include hw-error.h here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/vfio/device.c      | 1 -
>  hw/vfio/helpers.c     | 1 -
>  hw/vfio/igd.c         | 1 -
>  hw/vfio/kvm-helpers.c | 1 -
>  4 files changed, 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

