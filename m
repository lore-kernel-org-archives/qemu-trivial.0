Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRxmw-0008Gf-Dv
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 09:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <David.Leonard@digi.com>)
 id 1kRs2W-0003oK-08
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 03:14:36 -0400
Received: from outbound-ip24a.ess.barracuda.com ([209.222.82.206]:54778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <David.Leonard@digi.com>)
 id 1kRs2T-0007CX-MP
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 03:14:35 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109]) by
 mx1.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 12 Oct 2020 07:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULe1pyCasmOdevMQofQj0aze2Yrt2rtiUrtwGxi7U3xBgd6grzwpvHFtudYgQJaZBJ2bAsHfsP5+2ifK6aGXh79MOnw8j9JTRwIOFgLwcYrlbzgA2L7725KKkPi7gkKnBNi6pfigCnNMV3CaCldkgXXh+GT3/UtfZZ8f4lEE661eTuLO8ZZ/IknFeWuIdsNoQnYyhqqDoECummBA9uZq5OWLx250DRByru2m+nwuN7AVKfAbWyeGppU4FpOKajIlEA3rWLklsaKWLxoDRelx7pohBu8YMhHfJOwK8tOrdtUaMQTBhSWDyLAMCYwo8DKq4+dZhZLjoLwAhZ7+fbeflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQbmjC0ukHnkKE2PqW8lDwA/BZ7mDGCZoOz/pqE++TY=;
 b=JtlYUVd9s8b7QIYHbqNuG6zLNN5nmNJW6f7v20+MuyZLzWehTkX9DYrgZtGGhlZXXf7l6NW1gjuBqfputYiuAW9xxc1kSpSMu0cgarN9uV3Xpc3WxiPSjR/T5zcCSZFPCDT06m0zQTRKmxBZQ7y6oaOkPMXavBd2Nm4IIrB48tI0SexQpawh2zN5BMz/0rj8Q+B7l+c3pzKMgRHqH8xAqDoJOLqALG5P86fXPUjDSTI267Uq05BrV5ofnOXJ1RnqLPYLX6+riGrDEBuzZkok1pcjuDdcNUQgQBDqo32vi0NGaGQWe2dIUmBVFaLJEf4pzFrQHHEv2B6tfL44r4B+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQbmjC0ukHnkKE2PqW8lDwA/BZ7mDGCZoOz/pqE++TY=;
 b=ds26ZBwphah/Ilj6cJZQOdkTfViHAaLAEDzYdjJO+2OpK+tg4edWO++vG89dDPSivSKLf8tj3R/N6eU44hp8ayBHI4WwYuFXHEvCGBo3iOEJXe0HdkqvjZZxq5FGeCF7uE06zsFS+GCQ1RCgOEsWYhSCx1md9883h1eFMbN6n5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=digi.com;
Received: from MN2PR10MB3791.namprd10.prod.outlook.com (2603:10b6:208:1bb::26)
 by MN2PR10MB4077.namprd10.prod.outlook.com (2603:10b6:208:182::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Mon, 12 Oct
 2020 07:14:30 +0000
Received: from MN2PR10MB3791.namprd10.prod.outlook.com
 ([fe80::d8dd:acff:b0e1:9d8c]) by MN2PR10MB3791.namprd10.prod.outlook.com
 ([fe80::d8dd:acff:b0e1:9d8c%4]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 07:14:30 +0000
Date: Mon, 12 Oct 2020 17:14:16 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] linux-user: Add support for pivot_root syscall
Message-ID: <alpine.DEB.2.22.394.2010121712560.2113823@davidl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Opengear Digi
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Originating-IP: [2406:3400:41b:89b0:329c:23ff:fef3:d412]
X-ClientProxiedBy: CH2PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:610:50::26) To MN2PR10MB3791.namprd10.prod.outlook.com
 (2603:10b6:208:1bb::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [2406:3400:41b:89b0:329c:23ff:fef3:d412]
 (2406:3400:41b:89b0:329c:23ff:fef3:d412) by
 CH2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:610:50::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 07:14:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d0b4d41-120b-4b38-ee84-08d86e7e760d
X-MS-TrafficTypeDiagnostic: MN2PR10MB4077:
X-Microsoft-Antispam-PRVS: <MN2PR10MB4077EC8A7CDB8652BBD551EC99070@MN2PR10MB4077.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6xbBIwr+1kEZW2XExkDIWBSNVonXMV87iC6iJkaMcQKgtgbv0SMLDmRXTXxz+d24BcHQVOOkbFj9Z6IsmECUj7DjSrISnAV6nbfIOT7s0nowBCHRA6r26rU6lZKkeO9JYyFhClm5zJVirZuWxiwgLx6xgw/9pYXxIT1OPM+lQ4rdsvQqQd+cAkQbpcacEPDjM/NpOLbVv+bhcoIqIdcOeoI0frHtB7kmvDiV8vDzJxXuifpkzDwqWvAo0aNyl+lqtTtvvkY2CgBLQbys0TwsDC3x+N3691jWZZvqllz9BDbpch4ORcILlctKHreRYN3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3791.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(16526019)(5660300002)(33716001)(186003)(6916009)(6486002)(36916002)(316002)(8676002)(9686003)(52116002)(8936002)(66556008)(66476007)(478600001)(66946007)(86362001)(83380400001)(6666004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: XTdoU42ab4luEcfT8dwG9JvuisiZo/Vp/QHRmbkiJwIc7G/t600P/u4IaBe0IH+iDfF/r25MpmczJ1rSwJug1wEYkfj16qb3L0odKUH1YgjGjcrdp5TtHr8kwLogBreFn/cfkYIF4p/lgahaUfXWB0tOFy6f7i31tFpP19d1Sm3mnJe3BQTJP0C+OI6tQnoAXVmVOXW7UafuwGu/Pe2gvAH3y/s+wgpBzhYmqtW/LRixxJ1SemnxRp6KdeZY44Ow7gT2TyaNK5Sy6ptOBTXIb4wV3VE0cw2GnWgEqGEHAaUogwytoMq2iysjpKIUhjgKTYZ9GDQMZSvhjwJYVmCMRlX9pdjMvKeHF7H8tlqzZLuh5XEiN8zpzX98jXIqGvYSc8XgYYRx2IypxhnbYRLZXeEbg9Bo/HmDKTvQIpUrEJcdwZ0RKlsgd3ldOtXCbKb0NAyIDvAPCk8P24+dlJBx1TZcR5KcOzobRXWAlznJcRu5MsrlOM+REaVBi9gnlpK9qlB97zEfk+jGKQY49FrCu0h/bf5txAm76ELoiAU3/2sfYTAz8pCj814Y+RgSOvMxPGHOcyWnUgctk0drMKL9EJ7IKCejO8VjiHlbP67d0mtPUdb5NQyoqkjF6PqUPvuTVz/4n0t5BOKxd4kce2wzqi/I10amqRSixYGDZuXWEIKMTclwSJFq2Om1bSH54iULD6NQAFzWBQFnsrLKDiGaMA==
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0b4d41-120b-4b38-ee84-08d86e7e760d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3791.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 07:14:30.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpEoBbUiuNauTvtLZwKUEYtJMHK/DxGXxVwK9kKfF+EoDOBCa3ncvoUjlFU2BhINnsw54gzqhhDwLh4BUqSBZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4077
X-BESS-ID: 1602486871-893000-18761-149197-1
X-BESS-VER: 2019.3_20201009.2239
X-BESS-Apparent-Source-IP: 104.47.55.109
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.227497 [from 
 cloudscan11-64.us-east-2a.ess.aws.cudaops.com]
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------
 0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
 0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of
 KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, MSGID_FROM_MTA_HEADER
X-BESS-BRTS-Status: 1
Received-SPF: pass client-ip=209.222.82.206;
 envelope-from=David.Leonard@digi.com; helo=outbound-ip24a.ess.barracuda.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Oct 2020 09:22:52 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Oct 2020 07:14:36 -0000


Tested on Ubuntu 20.04 x86_64 against arm-linux-gnueabi toolchain.

Signed-off-by: David Leonard <David.Leonard@digi.com>
---
  linux-user/syscall.c | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 897d20c076..8143c8c280 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -345,6 +345,10 @@ _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
            unsigned long, idx1, unsigned long, idx2)
  #endif

+#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
+_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
+#endif
+
  /*
   * It is assumed that struct statx is architecture independent.
   */
@@ -8834,6 +8838,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
          ret = get_errno(umount2(p, arg2));
          unlock_user(p, arg1, 0);
          return ret;
+#endif
+#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
+    case TARGET_NR_pivot_root:
+        {
+            void *p2;
+            p  = lock_user_string(arg1);
+            p2 = lock_user_string(arg2);
+            if (!p || !p2) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(pivot_root(p, p2));
+            }
+            unlock_user(p2, arg2, 0);
+            unlock_user(p, arg1, 0);
+        }
+        return ret;
  #endif
      case TARGET_NR_ioctl:
          return do_ioctl(arg1, arg2, arg3);
-- 
2.25.1


