Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDAC606A32A
	for <qemu-trivial@archiver.kernel.org>; Thu, 19 Nov 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbGbOIt1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVKFCbtX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xUAJB-0003IE-Jb; Thu, 19 Nov 2026 17:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUAJA-0003Hs-Ny
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 17:08:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUAJ9-0006j6-7p
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2026 17:08:44 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJLecgp3538378
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 22:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=nEWTAAfa30Ig6V13cvboEk
 fpgLWUCWgLhReYA+uMs4o=; b=WbGbOIt1cdjS1X6ziJKchW7bQLOdstfXbNFeLE
 k2EZBOGjrebIHgo1T1NrKddUjP0eQosoxE15fET2o7XRJY0WmrKtYiRiCOvZ33qO
 arzmCokl5VjV9OU9vdNRMKsuYpCjmgLd6XdyklKEYJVXJCYqwTsKqBTdUdfrnbWu
 ljXX2G0tloV1hZOdNhcXsgSo44thVB+lbbixmdtRFmq1sRa2dPvn4Z/ZACMt7XWL
 IEsMPtdzSOuu3g2o0dfvxw2isyfR2jAMx+vA6NaQ1HkMJBHf1gxVWNRIMHQLQoUS
 xEREEy5bLqI8jdzBawEZDfogErHeumIAE5gCWE3gKwm1kpzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fygmw8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 22:08:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-94960131b4eso60715585a.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Nov 2026 14:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795126121; x=1795730921; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nEWTAAfa30Ig6V13cvboEkfpgLWUCWgLhReYA+uMs4o=;
 b=UVKFCbtXUYE/ioMofOf9y3G6mBnpgdRKKGZ9N1qUcZp3epvjPD4+dgz0EJkMP6VqjL
 0eHhXZhlX0k6tTLsU5Lt6e2MobpD+Kbki/o5gzdh1UvEDkSfhpCQjPoyA8Ct7TkIl0T4
 BAU1jaVLGPUg+v/1dQ91fOiGHAY8cBrRTzsGsdkAKE7zF7q5eMNK+dPDLgxSDDDWyaDI
 u8ZbW1vpqdMM1g7yIfoakRx6NfU0KL/uvUorlTkqbhglLzcFjvkWMDh68cwkGtAsgKUk
 kKTCcSmC2Q8fRH4VsKoOMETC5mVs+JsAMUCqZL/n4X1ehbeUc4lDWB2ekjz7ICgd+I0F
 OQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795126121; x=1795730921;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nEWTAAfa30Ig6V13cvboEkfpgLWUCWgLhReYA+uMs4o=;
 b=NapDzTPVSwvMo80wf765M0h6k4U4lsTg4xPJkN25OWNBmooILbvODbBaAP7rSvGMDR
 tNa9VBlag2sq7hLAkER9Kf6lea6rx7u17DeuVp89Tmbh+zOEj7F0otU2FczZh8vIhYJU
 kEH1THfs8jWaJUemWbDpInP/3wzr0hxSmrS5H2SQi1Wdz92o8q5F3aOMYx9PwDjFNvQ+
 t+p0FnrCtq6vI1Co08PRxUiAQyMrOplUk0C96Ey2v4ZVhaXSBV6G0iosQ7sL8Ec2e/uV
 NOe5fhehGa8qPsBoy32dc9C+Xmq5HR50uiTb3FCMz6D+THc1KM3CaNv9dHYDZPgqHt8s
 hjOg==
X-Forwarded-Encrypted: i=1;
 AL+hErHdkounVz+E86nV3NdBaAuaiSpeYRajCxjzv+EsNdNDgKchW4mklHbDNNuk8+Bpd3WwWIO3g2F0Bxb8mNk=@nongnu.org
X-Gm-Message-State: APuU4Z9PoEb/oZEjKvx8mEt9XwPMog5SavPN8shBiBYeWPjpuBkwt0Dy
 bXuGLoHcEBMID6cVPZjPXfQl1+OA47QUfLWh7rav5BruLCYQuFN5Wzv3qG3Z0vShYTYUxYTwQ9p
 r0tHKDSFj+Iz/AErDJlnpws1SDYm3drPj7LXO1jAEW/4CFohvwyyG6dA8xvAT
X-Gm-Gg: AYBFou0BO4+wLFz4wScjrvVnUU25CYojro+JEdaaJ4MS3dmJ5WEqDbqORBPhwHaCUGf
 1ZjGs1iAJ4uVf3VwTxOtzZxwRam3jEK9tuZhkf3V5LvmXekitUibetgY6fA9nD+JYbZt2tD5A1F
 4YbJReWWm0J+WgRFs82BSEMlpdy5UJpZ0++wjvd08YVg9TurYj6XSD3ZEMmZ71VGfKiYtGC+fa1
 8CNGTeAz3fnEC2oMPPetOc3Ns0MfpNNUktPQ5DBePbsrpCwHjaA7jgxgsc7ZOPoSnAafjomcz53
 9YwhwOiNS9K+puFiBw2fEDRtfEU29nclAaXZrp/w4jErDxH55eTdGJlVYuZRJhlIuOn1CBf7oQv
 syPLOib8JZqk6Jo75GOjzPqkmBky/MMLezhJQSCDOnkT9kvQf+4Oz+/dTQe1BQRQBnx0nsIhfcW
 Z1/B6MWxUdAQS5Rw==
X-Received: by 2002:a05:620a:4628:b0:949:8acb:5df5 with SMTP id
 af79cd13be357-949ba9ffe09mr184108185a.37.1795126120731; 
 Thu, 19 Nov 2026 14:08:40 -0800 (PST)
X-Received: by 2002:a05:620a:4628:b0:949:8acb:5df5 with SMTP id
 af79cd13be357-949ba9ffe09mr184103485a.37.1795126120272; 
 Thu, 19 Nov 2026 14:08:40 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm29227475e9.7.2026.11.19.14.08.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 14:08:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Subject: [PATCH 0/3] hw/dma/i8257: 3 trivial fixes
Date: Thu, 19 Nov 2026 23:08:34 +0100
Message-ID: <20261119220838.52034-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA4OSBTYWx0ZWRfX0HUh3OR9iEws
 iAy+i2YtEJLS/VhCOPHkNVwKFZeuJgfmJHmCEU6pzQo2kue3lmTeLjr9mWAVVtZaow8qET2eg/l
 ocYrgGfoQOp9oEcXQSY5Sq50rPYJPgk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA4OSBTYWx0ZWRfX9PjPaNGAHS6f
 IYbqSEeYMM2A0WACMZ8e8qMY06bSYljH38+tXsF0XbJkiFhHGor8DM+r/sl+eXoVE5dWoZUlK5K
 S6nssbdGR1crWHEfUbTKBEoB+ESV1sz9J550nyEUuvxE5zBYIF0vgEsu9UNBgNyp8mqdNCHgsgd
 W+12hypWKhMShoL4i6m7+tEU3LPZXmUJ898FYCEZLrD/NkAxbAIZIm/rfnt2+aL5inmHR2cmTMH
 PreFlNp97m6xT/vZZFSCScb2Rx4ESssUK0b0tT7a6BV1YAmNlsy6W3eKh78CrGVoxs+wjuUa+5B
 +zwXusrEU09EWb+SFahdzLhxAAGx3s68c0GXE2J9XCzOAXFaR1Vne6y0FlMGoaq5+LB1eYal+bQ
 XUE5QEQAnf3HMGPCUkKuUcIAFpTh3WRG7PAw/1wDVVnnRslJjKtQbIM6HSYtNHfyxaAtBCuQDr7
 1FN8nrpzGWKBHwpVdiQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6aff7369 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4RAH2LTXIgW29PtErd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: zDV35kszFCVkcBxX6MnI4x29HD2CNJ7x
X-Proofpoint-GUID: zDV35kszFCVkcBxX6MnI4x29HD2CNJ7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190089
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Trivial fixes related to the 8257 DMAC integrated in
the PIIX southbridge, helping with sound on Malta board.

Philippe Mathieu-Daudé (3):
  hw/dma/i8257: Read the mask from the RWAMB port
  hw/dma/i8257: Zero the reserved bits of the mask register
  hw/dma/i8257: Honor the command register group-disable bit

 hw/dma/i8257.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.55.0


