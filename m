Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DD5C61DB9
	for <qemu-trivial@archiver.kernel.org>; Thu, 27 Aug 2026 08:42:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wzVg9-0001ni-NZ; Thu, 27 Aug 2026 04:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVg8-0001n5-M5
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:41:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVg6-0006kF-0a
 for qemu-trivial@nongnu.org; Thu, 27 Aug 2026 04:41:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6RBXZ3835103
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=; b=J55oBVw/f35P30EL
 IC+gIz26L1ZloGtBz+LikeppJmtlnBeFHIVmTX7OqeX7oVs7+EavvEhRD+7EoiKB
 YxYBxrgxeF5bcAET5foJEf6+9z2+u0oRTUkjWVf2nm0Cjfz7daYiEgjoME5VoCzA
 riNRXYxQ/RW5lLj1iY57mfJWbF6Jsivz2NA9BI0AYu0Yaygn2mUsP2Gxd+ZtJ/K+
 JGo2nFl/SRmp4P7fMSKDcB+G1ehtaKU0ndRoAjo0T0ch71GajPNlCOqnPfJ6rNfu
 XA/hRGdPW9UkhctDS7OTrKcmS/V49GzAbws4bdBTDczcrYiFbvgPZi9l6EGa6o43
 Vz92kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbutty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 08:41:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52ef04756caso13344131cf.1
 for <qemu-trivial@nongnu.org>; Thu, 27 Aug 2026 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820099; x=1788424899; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=;
 b=Zv2c37GbM7EVM2G9JJSL5QBSS3IhU7e9vlQq9iNTUw1qTtiw+78+puZyc1ZnUO9IOj
 iNaHLhiOFTzWmBV1hCsxti/mEvhopY78AKuHO5FXAFn2OGrYxm0q+mn8LVFkOLgp+OgJ
 QvLVnZkEw7Ry02RMD6S9wQ+U4ib+DsG2+WOU6QAcHD+dgDECnZySBqRl/KDDGmJ0/ibD
 CC7hPU6MgUqpAKfmfxDEiMUl0yS6OImFa0ugJtT8YR02nWhQ747kSlopKDsNzm9qI92r
 bAOQ2McjN5RYozOW5B+Aq6GBPoxOaXG1CO+VOxSEWLK8VXAVMIaHIeSYL3+vzW542Fgl
 lNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820099; x=1788424899;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SmOBVBiGsHolNU8PiQp4XF/NOueJObjNbn6UN13+F2g=;
 b=pJiJeNIh6qjooPXWt5xvBuj3TOwzWZuLjQ2vIqDrhF83IICT5phjFmp0JMD5Qpvkch
 DZlfIU4LfQClVsB0SZBtViZsqBwiUkO/x6aT4ypYsSe1Kqs0TycBSLF/nCvR7uDeK+o2
 l731ehmq19z31nC/nU/NfjPtwsHvIhvirE6FcOwsfOWm9wd96r/R5uj5HLfWk0MPRsyY
 NDpphSXWe1C1kv1q6V5Ges2anQctepr84lvGUdP4tDUbrZQ7oD9ZXFbfJqlNWJvoCldG
 hi7DyKo3n7GPN09zi1P6v1+SjKL6VI87YIcmmeDOsfY8Iak5ufvIcMBUAMAQaxoHi7nh
 Wt9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPCqAgaOSz+bqgBfURy3Q+zSqaC4j7JcSblgmO9qbWfLaru1ck7kdzCSoeYls9hFTohvQFLc42zeyWNsU=@nongnu.org
X-Gm-Message-State: AFuF++kIO/hhHqr9sq0EB97VOazKD6sbzWK1yn36NVS2RMAcaJ8/ivpY
 qrHehdQHG/aN6pABhKzJMMWGgAUmSSBOa0igBqCpbmYejDo5uOMhImjUA/I9byx4eLAri3+k2x3
 tV72mTEIPqDbUwuMv3rfn01vbjW7IIfRl0iYjIlTkq4l9WpvDohtqdB7hRGm2
X-Gm-Gg: AR+sD12nSHWY4rkM0rLWGJjwjdUyiJvbqdRemhX6LWylAjMpvSKUDMRhpf8Ytzlw/mu
 RfJCDEXGXAvIk7D3x/5Hem+b8h2i5dwPTghiOsxu006OOgcRjl96tXg34QCcbN/osbXL/wyUKB/
 /PgSgwMdLdkGQKbytU+JJp5PXb37C83ft/T01AWRgaKp670kAQtbIRgrVE2VG/QAHHDDknZGp/b
 sgWCded//9knxCcWEnWbOdJKC9U3R+pCeteXp+pfyV9CZj+A/FgEvtceUjvvEy61GwuX3HHBR/x
 THvQ8MHIfcllZcIAi9XWoe1ZlCX0Py6tvHEjqUxTIt+DZPV6XMHjlU1EvHS2CJJc7r0p1z8SqSK
 /A8dg9YqOuneyHoq4ZfmegG6+VpJbFr03aMNhbZy7TqXcDTJq
X-Received: by 2002:a05:622a:1914:b0:51c:22c5:daee with SMTP id
 d75a77b69052e-52e4234e4c1mr140036691cf.29.1787820099495; 
 Thu, 27 Aug 2026 01:41:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1914:b0:51c:22c5:daee with SMTP id
 d75a77b69052e-52e4234e4c1mr140036341cf.29.1787820099116; 
 Thu, 27 Aug 2026 01:41:39 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49610170sm83255455e9.6.2026.08.27.01.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:41:38 -0700 (PDT)
Message-ID: <693accd8-abe2-4cde-ba61-0a33adb4c7ff@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 35/43] qapi: convert trivial intro sections for
 run-state.json
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
 <20260826193840.2152000-36-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826193840.2152000-36-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WahVkpoqxLGeIVA6mwfS4uqO1Dh_P_m3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX2+kjw2dlB5Cu
 KGUTUtOnHXkm98OeR1nE/sutBAZAHIW5fufpWUcv8PhIk+bahug0L9j+kL7675ce0dCnsAqC04f
 J8j3gKS25SP9tDmAQpNR2jdskPFviRc=
X-Proofpoint-GUID: WahVkpoqxLGeIVA6mwfS4uqO1Dh_P_m3
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ff844 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UFf3ptpOQOAA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX37CoTmxs4fMH
 hscbg/7KTqgGEnRQXngYutNu73PIKdKF/qfT2tNWJIl4NtEwPtT0+oqgN4oLW6m+B1ToEJhCPuH
 JbN+gvOkwE99C6+5LGRkIaM5/2SzEdnIcu+jWTtUn2MdATVbciOzpyfRMUq9Mu3OcoLjOTf32FE
 vUY3qF1ogs8KE3u4Bjn0wYH+39RMs5o47AVvzSdgtYs1qK9pIH3K9cZzjsH8TCEMbYgHXklRxFI
 tZU+aJSnwoVKKbmgDJC5y/CSVLavrcm9CgUFF0DdB8cv2hiO0a3G77upPfnBMry18Qw4rJZ9KjV
 u6VP7zF1xxgW6YSPvDnYZmKP9n/MyNLGD5cupfUSsUwG/fDMS5dtJ0Um75RNv4CUBNoVEnOaqCX
 Zx5/uCJCjAj+UsPfFV8fHGZUw44rMHfxICRjgoi6Gke1f/Km4DgXinkvFA52Z+8GriSMm29HWpD
 221dX5KfHx5XGSWLKyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071
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
>   qapi/run-state.json | 113 ++++++++++++++++----------------------------
>   1 file changed, 42 insertions(+), 71 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

