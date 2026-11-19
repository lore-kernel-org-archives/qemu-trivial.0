Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDA7606A320
	for <qemu-trivial@archiver.kernel.org>; Thu, 19 Nov 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Haa4NNvC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCHCZ/sk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xU0gZ-00043L-Jz; Thu, 19 Nov 2026 06:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xU0gV-00042X-OR
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 06:52:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xU0gS-0002WK-KC
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 06:52:10 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJBkujw2685438
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 11:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6L1awVFHnc47newONQa9idSQGjI5CKhtHK/3iZ74hS0=; b=Haa4NNvCIH6TagGF
 SqzLFMd9SkBiJf+8VXJ5CcjHdjCZdanIi5psFGeZMRXqePVCsAbs5wZsDVSrBQCz
 TbIqV3H/RY8i7RPgIDkbhBP5ia6l2oJ4oH00VQMgEnr3p/zhQyCVFvn851R6qJUi
 nrQK2BSYYO3OY7vNI0V70b4HZ/X3505AOWREReVgYRPaeKdaY8ZZfeHFT9zg/JU4
 bUGIu9+dy51WoLXRSS/U9hybdCTg6C3L66EozAwbFad2jmuIqgeCwTpgxFlQzux6
 WFGWT2hH9VmcwYYJ6rfkBGQGz+Fb8vyKV+8NeSrZ5NpBGFSiS4ohofPi3gak2Xza
 BgMisA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu80u7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 11:52:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f2373e9b4so272083885a.1
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795089126; x=1795693926; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6L1awVFHnc47newONQa9idSQGjI5CKhtHK/3iZ74hS0=;
 b=dCHCZ/skZArs0lanDNLDHHXR4KxKplivM4rKa0EOjSp5f2q9A7EyuJzNbk6tzACjDN
 T3BEuFVeY6a6BXJvvTgp+jaSbldf47Yvco6dw5q4Tr72Hv0CLvfnbqrz+nf8vJQNwOg+
 SCtL2fTel36jfKdbBPwOTkT8mNhXzYXZaI62SV06R+hCFjtLkrdvDoloPmDgFtcxtFvc
 zGX5XcntKPl2Z+zYcdabRMxuvv8EtqM5FRgknT0jCdZdB9kZbo32ZbcojG8sfC4ofQ2R
 SWAaGBjgPHFW+WgGRot3ixzLIk4zmbWVXABeU8cm+Qp8ruN7QlAHQPZo53SEkFYsgJcu
 J25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795089126; x=1795693926;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6L1awVFHnc47newONQa9idSQGjI5CKhtHK/3iZ74hS0=;
 b=BnOeUB7x2FIaJAE2zuP2cQoc4U7bDMWOEeUTBNIkLkHf7lQ1Aq4Etk8v02ILYcns7p
 DMvabBcOLgDg1vsuw0a9cz9it0Hk3lWEJlj2VlITzci6LqwDVhK55/ArH7PKPFtCKUfB
 aiacGP/lbYUFSzld4XMDxM2l+KhbGElh3m7QHFNI3fE3X5zs9a7WsroQtX7Hu47V8417
 3exmQXxr/0Y4hCmFQjglsBNTa7sm342rJGCBJ+QZX2HDRhHfJeXbVio5PbrwHYQ0EZ4s
 qsb6Rl6xzrO+RFJjhWt/zcSHPTutw+0cBbxa2kgh0uQJ4e1AsAwYdV51bdy7by4UyPVD
 BHZA==
X-Forwarded-Encrypted: i=1;
 AL+hErGv3JpaMp9ofosBh6WArDogsnf5rn/+nEJA2WKZ/lLVE9dhXRZafsdUPKZ9lvEEz1tBxJuymqEXEncQqNQ=@nongnu.org
X-Gm-Message-State: APuU4Z9ZF5OL+gjvtQOLayk4XKf3u9IWUVeRKBOWr7yU5LmZCwVmk7Md
 71MBnYmkJ6hbXRfs8UMzyYieFZVHdRHp7VffRnu5OcztK+d6qLkIHwUQOUNiApjxC1A5zAdtDbH
 BNCckXveWCFBE9L3nmqghMpghv3NhhGv9kK1Mtf60MoGDn/vgo238321E1Lj+
X-Gm-Gg: AYBFou1ntBSjOeGQccjEfBm5j0ZUdBKubJCzrpoLtEbRVmYRM6wKlekdBue/znSH721
 lzW/WuX11Dpe+1w+3lcFImkpFCXcg68GTj64EL4AoE5KO4b9O1Qg87GozmqUBjZvmOM/ql/y9F4
 ibk6php6T08Q7Um/RmekiNNcKJseZKMObAODR0vUD75uegSCdToCV/lIYxSMCN7U5VdPL34dX64
 XfKsorWgAtHzXOPcboOk5Ah20JvdpzswasH1m8QWNJojsMHShN6Sy8K5neOXXFizJ/aJRheFkla
 2EYzXHRsaUIXNITqqc3dVAnDKMM5St+CHaTTFDzOmUCpTQ4Wts2+Ob8uL+ulTUIE9lLB7FuNKm+
 lMpElIcdPGWsYuhvDDm5kj7TbM4mt7SK+CNTkRDSbAi4/YAuLy64n2jKZyMYhJI4kSNnz
X-Received: by 2002:a05:620a:710b:b0:93e:c12c:fbcd with SMTP id
 af79cd13be357-949996676d3mr1021738185a.73.1795089125983; 
 Thu, 19 Nov 2026 03:52:05 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:93e:c12c:fbcd with SMTP id
 af79cd13be357-949996676d3mr1021735285a.73.1795089125539; 
 Thu, 19 Nov 2026 03:52:05 -0800 (PST)
Received: from [192.168.0.4] ([79.127.134.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6573baa9fsm10936066f8f.57.2026.11.19.03.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 03:52:04 -0800 (PST)
Message-ID: <73a21e12-6d5c-4a81-8e7d-c7e8be8004ca@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:52:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/tcg-ops: Rename cpu_env to tcg_env
To: Chinmay Rath <rathc@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, harshpb@linux.ibm.com
References: <20261119102319.2618086-1-rathc@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119102319.2618086-1-rathc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NyBTYWx0ZWRfXznakasu8QoKH
 nolOB3EfZX7QMeN1oMd9C0Bu1ySuk2Q8EwL0Y8L/6Ke7u1NJd+YVTtABvgFY4oFeu7odwlTTYSR
 JMUFdWyteolSAGqUUqyvXVDHbVi311A=
X-Proofpoint-ORIG-GUID: jwWzZpt9gg321L9qrGmoUsl2KPkw6i3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NyBTYWx0ZWRfX+MIJndOL19Sr
 +csoTU0xFehNISxXDhqodr+hNTIU+X+ve/IM+yz40rUe1aDaPO/+BP2P82xKppPXw7GO9pFyoOT
 Hlo6Kffj807aN3cqn6hE90QSfTeXyecFP3LYtfSxzWTXlclifcOzmFnrf5611K/DygNXMhvZaJc
 GhV9+aYYFj+6umxcYIqopJMXv6VOPdEtq4lmWhKvZTKpUlCzMab9BKvFrcWE8uA4KBjp8ZrSGEi
 aB3PTUlWByfIkLJYnyZpQO5DquQaE5niWmHoh4dV4ftt7Ec5hXQ50rxOQid31Vb3YdSCR5Yso1v
 vLUOdFk+BLz4N3fPLgseMej8sAqyvp2Ncc2FMB4IMxHEVRXWZ/166RiEpn+4HS2Nv4/aeRyICy1
 44P7d2VuGBCBN/S4yXcp8n6mcWjHw68Dl1RZXxEc3sA5sPzYze7cQr4FJVn6TzkC7/duvaZUyWo
 PGob9SGLCBjrxamyTXw==
X-Proofpoint-GUID: jwWzZpt9gg321L9qrGmoUsl2KPkw6i3A
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6afee2e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dMDxPF1GtEdq01UuaR/ERg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VnNF1IyMAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190047
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-19 11:23, Chinmay Rath wrote:
> Commit ad75a51e (tcg: Rename cpu_env to tcg_env) from 2023, renamed
> cpu_env to tcg_env. However the same was never done in the docs.
> Updating docs with the necessary renaming.
> 
> Signed-off-by: Chinmay Rath <rathc@linux.ibm.com>
> ---
>   docs/devel/tcg-ops.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

