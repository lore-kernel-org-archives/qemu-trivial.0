Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF9AC61DC2
	for <qemu-trivial@archiver.kernel.org>; Thu, 27 Aug 2026 08:43:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzVhq-0002y7-CY; Thu, 27 Aug 2026 04:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVhp-0002xT-6A
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:43:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVhn-0006uT-I1
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:43:28 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6RItj2708680
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwEnIvKejSYNsZw2U2+fayxSeMSAewks083pgmQCYBU=; b=ELNsoZc9ihe9RR+t
 obuyPbV+BoO4+WDjqn8qfbN1FSyP9xNgJghbb73hYprwW2ahD0J0epXrO1LLyEhC
 ldm7wxvpTnFCtoCL+u5/Tm6UYBQ7aJB0vbp+esznHyYxpHbKp1xl8vegiQgwMRG7
 gBXgZsPCJEbiBjge478V/cIfYz/YjXwZpZDJfSIHOBw1bzj2Iodwno9JddMyLUpN
 jB0c7IE7JP+lUtx5M/H7PEv0wn0K2pafx984jmsgJKFpkDCZ/0BKgcX+GE+91Njc
 8NvoCFtXipk4f/nZVOlAN1XDxgJTj/+MiG4cAdnhBZuQ3EpzFgoZoUAwXkYhOAq/
 x8jscw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4fwjxpy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:43:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0e702df8so6493711cf.2
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820206; x=1788425006; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AwEnIvKejSYNsZw2U2+fayxSeMSAewks083pgmQCYBU=;
 b=UqgRRxMo3MbK02aCWAC8A/rVfmNEPUMU7dBRliZYHjZx/O7bYMvfiCTyOm+DOe1F+z
 NKlRXedXq/agM388feXyiOcl51nQWHqbObNi5vuvdxPkwesRnb9v33SVsSXIorw4z05V
 u85YSR0zIgUJEJNZ23HUJ6YHzZjxjFoEv3+MLyURGZ2ErNR0ZHyd2TZb1D7k2fSI7eZ5
 pE2wWq7yRSkCC4hsMD2gAAVbhy7pjOtEdOQbGq2UeI0mgpMvlHfDbIQLaaIzl+4xvHzO
 m1ZUOPNxWOMkBv4M0Miuu9UeslsPfgIuFpv0TijjPnBy0DxZe23iPK/+WyCSPXnrGCvB
 iyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820206; x=1788425006;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AwEnIvKejSYNsZw2U2+fayxSeMSAewks083pgmQCYBU=;
 b=Yp/MbYNVCUEhOMUGUzzHhEW2yDmLmHNnseZ9g7QvD9IGL+xaqOOShfY8H2UKgP2FSN
 JE6MBrR5AoKnvQBnBzK+jHBnAECTw/gxr1zjyHg78+SISuli4MeEcR+YgAb1YT9JXH6V
 hpl/iAEqDvKdW514Uq7BhQ3bREAR/VN0mpI4iZJ8X0c8MzA/RH7X85Lm5hLG8faXzi3J
 G9RsFRSN/UMZVNFssumq5A8yQoN8X9II4rOEMt3IBz4mVKdEs21ROW0Vg2bnq8HbZOAv
 aNGpVRnUfrvSBjXTVXp4v9IRk8wVT/KlTAO6/fzRoC9UbiAEB1RM78QvsW6yhF+Qr1BK
 AjlA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTANTG9BQSGxiKjz0XwbzgCD1mzQnw2oA5bOnclcSDps7LgcuFUse9ZO7zyZqaNAbD+PNcIGYRbwP39Yg=@nongnu.org
X-Gm-Message-State: AFuF++lSva+Cdrayeo4f0U66c5yPl68gdsvGyzLd587ZkAqxvlly64qh
 r9glA9IuRnTe8j4Pl733DDMqs8kVkwer62nZKmRBYj1ERQZcafXeWGwvbezLpbM3c0114BZCtYf
 iEZuK5ix89gIQyvHHltUzL8hq1/Zf4HvAnKi5WMLfX+vPLUBW6h1nZc8Osj//
X-Gm-Gg: AR+sD11nJc3ztsplB9YBB2UTUKumj/6aqu0/HkfEeI1chmqahOACTh4KV2vNGLt3UhF
 51U/JfygalzGnz0lL5SW4nkPcb6pO+DyXdVGeiuGIXQtPnSbq7k9lq9xWA3iLT/Gc9f8EokexYJ
 IR4/oQIBKE9vuMV7W/JvnfITBZ3qLool3bVwnfLQZZIYo/LAgvJwq2NKZo6KgoHaOBRnrQwdbrD
 u8h4/7O5TcAVbGd2xM5RrbhJ1s+srnBlHP9u7NQzyvwt0HA04dKxs8wZPaAW+DdxzjbGEUIZmKu
 91V7g67ZNmGwWG2lQPpCuQlIdGHDN4b5GNU9f984t2N+AZsafJdABB6whj5lwXV9ys6Wpo8oQIm
 NfYNcz9ANocSWL6+TN6sso4FjEZMIO3m6aWmL3Mq4rqrXco3f
X-Received: by 2002:a05:622a:15cd:b0:52c:ce3:6428 with SMTP id
 d75a77b69052e-52e422cbdb4mr125107371cf.16.1787820205790; 
 Thu, 27 Aug 2026 01:43:25 -0700 (PDT)
X-Received: by 2002:a05:622a:15cd:b0:52c:ce3:6428 with SMTP id
 d75a77b69052e-52e422cbdb4mr125106791cf.16.1787820205377; 
 Thu, 27 Aug 2026 01:43:25 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942298fsm36548445e9.1.2026.08.27.01.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:43:24 -0700 (PDT)
Message-ID: <a18dd511-2be8-43b7-9f3e-c4248a5d70de@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/43] qapi: convert trivial intro sections for
 error.json
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
 <20260826193840.2152000-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VJOZuUcy1u7lzbqGcR-MhHBZ_vAs7V5m
X-Authority-Analysis: v=2.4 cv=OtZ/DS/t c=1 sm=1 tr=0 ts=6a8ff8ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VJOZuUcy1u7lzbqGcR-MhHBZ_vAs7V5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX9nMasgRKTN+p
 crRnVzk2RzjgfVm3OhMEOmgo+sbEIcBrfJx/c5EFiTumKDUt5JaAL5J9PslwPIWRHIUSLmQrL/w
 IlTV6ZzH73S5Dzr3uiv4aJQNcVc4fb/IXGtKxuT6Bmiru+qBOQM+2d/5tZ1qiVMpnS0pMESBkmj
 mywjV5n8r1bpIvjDhRRsjrG+1YDp0tari2N6hw03q5cvsS4IQn8r9fgi+qI9yVNaSvkWcqiU0ni
 qo5RP5/GE0u82xNiMgIO9gQSgxdfJmwFd3MH20kwVwadkaiinhK4NHmcJ2CGHAzJn2vq2c+x8xy
 aS2gecO9mL1SVQOrzMPHnpjehsG41R6CVDcSGNgFLJ+RlGVG8q8MUPMW1vEsDbEPKM73crG0Wdt
 6ey9YASs9a8BbHIscre3Gtm2tMZDJE48ij20GiRHS/IsJ/GtDUEtecr4TBq517ggnAGOx7P7nHY
 PCRharaXF6rUethcybw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfXzbZLUEbkYakp
 tes1HL1Ph84gf7k/qf3F7RKX0zQpCH/a6iRqvR0NqlcMSu+ixXCyFYvXbCeRLfn+GjWCCp2cYoJ
 9LLLgE2woNPNfao1nV2DTgyl34Ls7wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071
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

On 26/8/26 21:37, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/error.json | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

