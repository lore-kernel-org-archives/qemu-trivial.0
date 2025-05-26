Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJe3v-0004oD-EV
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2025 16:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1uJbVd-0001bL-VS
 for qemu-trivial@nongnu.org; Mon, 26 May 2025 13:21:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1uJbVa-0007VJ-4M
 for qemu-trivial@nongnu.org; Mon, 26 May 2025 13:21:08 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q86FqI025530
 for <qemu-trivial@nongnu.org>; Mon, 26 May 2025 17:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YKC2HrSGo1jy2Us+JCQoreoI9BZNqqBSVAN
 PHiq5xLQ=; b=RvOi3nNpLkYh9xOWPSvIpCI6DJrps3kmRKAP64KtyWYRbUuytHA
 Ucv3jbivFSmT9O9R5PJ4aAd4yipkmkJvHvaGJlgmsw48TjT3DcPBh7noL8+Tzq9o
 lxQ7cEueuxq+4izA0s4HGmzWJX+9x68LTf6418psEvgcza65se/UjJCmb/4wtqgZ
 7BADGvHWztPvXXUv/m/8xwLP5oUeXWGW3auwbkCjAnHfxFmrzIzoWKPHs0BVeqCz
 273cIr3eOCv10etodca4PS/CPUaOpyE2khalQ8L3T2luvjmsX67F1ywRE9D8KoEM
 nhaHkOs1a9LdAGAHFAZUWypeLVecJyP0GlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcs808-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 26 May 2025 17:21:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b26cdc70befso1409818a12.1
 for <qemu-trivial@nongnu.org>; Mon, 26 May 2025 10:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748280060; x=1748884860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKC2HrSGo1jy2Us+JCQoreoI9BZNqqBSVANPHiq5xLQ=;
 b=jbHXbdm5TTK7zpPsFelJ7ZAyn2ATjpqCUA5LynOu/ZTzxxfUFLJUc75qgGwaDkIyhn
 4cMIrCVvarV9bjhUd9mX8kJZMuNGmbh4UC7VFRKTGFnyV4Sb9D42XtBpLUynPrMXxc1H
 awsg33ze79Lq4TYWHSr58NbdZGZxRiQO3Bcnl5F+424zXQW2o3uAnptjDdYGydOCT38T
 kUTyx6KwwVCDJQ0E+oZ+9XUrkjP6R+eJ3nVqNH+w3R1ZHGYn2hLmH/8hFXwEtOE3oTjz
 1DYIxO9cw/B7LLulsm3IAKbXYHrXyWHlAkg2QN9CMXFSAhRAu6c3j+mphBByVx60Y0zI
 6TqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnt9bt04n8H1rYEx1S+xMx8jB41OZamaSq28/CXI42sxFlAioUIedVZYG8oCiSB04j+epZv5ClKg7ZvWg=@nongnu.org
X-Gm-Message-State: AOJu0YxDwpv0trlA3nVKUUwLM7o/Yyx3dZ8iDdhxfXfOCvJngcJYElNp
 Pn6HmVl+CZ08Vx8TKNfl/FK8KYxUivrC5iPPZUvyL88JyAT+Q85vsvUDsRH9xodVbs4Inrhvu4W
 +FywA3Xv80RVJYHOidvcg7lN9yr6AGoAH5+wsZYlXKDUzQT1NhtxHGmi40T4V
X-Gm-Gg: ASbGncudOdB5Qxd0tUbm8M70+FnROjXabVJpEz9qLXPxF13gTf9eaLqvSeJiPzDbfQd
 X6fppT+w/DoppjstpbDnF8oBvk7lbv7l5CnxIiq2sFITvTmYuvjSf0JSCYdavGhQ0M9hZSlT734
 H2jtyCwmKDqZzF/OAPYKvrcupMcIBAFpcHq4lZecIjeNr5EuelxBovQLsKrUtkW+Cx3k5u1L+s6
 Vv1cjri6E7EdeWZHC1Vi6R5skzU5onm12nCw9n35ma52n6pCP9PIC5j2noKHNjzryOXe8Bl9HYL
 vMGrxw42MHcuN8LlNop8leFhkkTMLCZaxRWUD+38VdAqDehD01B1WM0dYw7mTjfTO9CG2nzKyGo
 =
X-Received: by 2002:a17:90b:1d51:b0:310:cf8f:6724 with SMTP id
 98e67ed59e1d1-311106ac666mr14887609a91.30.1748280059487; 
 Mon, 26 May 2025 10:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr6L5GtrOL2DkxCR6A5kzmxi4bMPRdZAFKS3cucGrWe8SnDWHz05PTmRcHArWsRiICk+h/EQ==
X-Received: by 2002:a17:90b:1d51:b0:310:cf8f:6724 with SMTP id
 98e67ed59e1d1-311106ac666mr14887576a91.30.1748280059050; 
 Mon, 26 May 2025 10:20:59 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234488fde35sm27244545ad.225.2025.05.26.10.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 10:20:58 -0700 (PDT)
From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: jmarcin@redhat.com, qemu-trivial@nongnu.org, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, brian.cain@oss.qualcomm.com
Subject: [PATCH] tests/unit/test-util-sockets: fix mem-leak on error object
Date: Mon, 26 May 2025 10:20:55 -0700
Message-Id: <518d94c7db20060b2a086cf55ee9bffab992a907.1748280011.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UmL3Iv0XySIcaPcJMvr5d334kA04EGq-
X-Proofpoint-GUID: UmL3Iv0XySIcaPcJMvr5d334kA04EGq-
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6834a2fc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pkkCeIeTIf0A1w3mICsA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDE0NyBTYWx0ZWRfX9WolBaUiDbyW
 A8/K1ehZ4MhDY3ZZqD5M43m9ww82g+gDq+BLhiuguF2uy1pMiFqTua2N7GjmK6JkO2RoLRCvQnD
 +upYJLVq9mPHkEBMehYi+G7TuaBAIygGTLTRFMnifZi+KUoge5/vzBxiAObTd+R2SK8RGCuIdCE
 Fu03KCTknvpn1Dv2vaeRdTATMN4SgoJKXOX/LiAfpg5+pGyEhAyhDVrn2r/mMAe9Y/6FKGPzDP1
 0tGLAuPGb0vUjw+yVx/Y1QtJJLkkfM8rfWscuWjyIq2bky8i0an2F+PB+ZkeaQQ1YAkD4uUrbbc
 fabdeJuv8+fwA6QLSe1arjd9H3R4No8FzdxDKznyCV0UMcIQly/rj8pYBT51hVlpYfev1XkTzAb
 pHqR80nCI4lsJSEs4DxWZV70waKqz4ercjRjxGDGGiRjXRp3oW5n+4MdTzDk5xa2Y8aNvWet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260147
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 May 2025 16:04:41 -0400
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
X-List-Received-Date: Mon, 26 May 2025 17:21:13 -0000

The test fails with --enable-asan as the error struct is never freed.
In the case where the test expects a success but it fails, let's also
report the error for debugging (it will be freed internally).

Fixes 316e8ee8d6 ("util/qemu-sockets: Refactor inet_parse() to use QemuOpts")
Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
---
 tests/unit/test-util-sockets.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 8492f4d68f..ee66d727c3 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -341,8 +341,12 @@ static void inet_parse_test_helper(const char *str,
     int rc = inet_parse(&addr, str, &error);
 
     if (success) {
+        if (error) {
+            error_report_err(error);
+        }
         g_assert_cmpint(rc, ==, 0);
     } else {
+        error_free(error);
         g_assert_cmpint(rc, <, 0);
     }
     if (exp_addr != NULL) {
-- 
2.37.2


