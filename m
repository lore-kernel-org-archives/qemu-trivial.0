Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGoSe-0007c7-Rp
	for mharc-qemu-trivial@gnu.org; Thu, 19 Aug 2021 16:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mGmkD-0006la-Vx
 for qemu-trivial@nongnu.org; Thu, 19 Aug 2021 14:26:26 -0400
Received: from mail-dm6nam12on20606.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::606]:59469
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mGmkB-0000JY-MM
 for qemu-trivial@nongnu.org; Thu, 19 Aug 2021 14:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZRbXGNwgS8kY6uHVhs23KpfgB0ENw2uV5mvbbf4oO+l7e+kFr6vMIAl8IJyF5UL7nH3MvwUEMKp4bqIeKRAnjMIN5k6QCwV7JMxGAgVW91ACZypEi/syHODPWoZ/fafsIXsrbGcdUAa2pp9F3xejaJe2NokCOAvxnCvxCXQk7YtcihpuzYdMqX1qYxJDBFZcZ+WUuxdzpVZpEmOsNalS6zZcPR2GLOVyFAxH9oFWjTB3CSbPCYlAlH2Q3/XdGZV4myVICu88+FXhFNB+/tZOoDZ5pZcGDXmMK+Qc3vds5jC12ugBjL67WyD4Deq4/U0AD6Ro8IJ3E9nYuT66LYSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl0EvZ8CasqpGL+S6YZkacvZmfF5LkwyRzvkkOi81V4=;
 b=MjvlzvoMq9WFzilElPSySHmN1w7+JRdXDbiAmTQmGEA480hxMR5CWrAqgEfkQ/vRoZoy+32vfdBr1bYZ9qC9nCFvaf6aVmVftShS2d5sj4BNNcYTPyIao9Keed90fu0s6fJ8ravJRNnlA462+/9O8N/ZcRckcNCTCsloaEfYqSYRSJPRlsT49n5TTDcrtsZ0Txvs+Y4moDDeCx6wCXpmc7Sk/gvnI/L+lJMkH4UVy06ZGJZ7AR5CvoGlB24cPCxBeKEFo/OlHOVlMVXJIHHnkGHwX6dpLZkR1FQNjZK+DZ4EfJ0ptEZ7SV/F/zDRM2jVyg/gb0VKNylVoTgiPGb5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl0EvZ8CasqpGL+S6YZkacvZmfF5LkwyRzvkkOi81V4=;
 b=bGZ84n5Cbl+MzSDrtYWIW5aI3EqNAlp2VUHUb8h+aITNHDMfC1N6XxJ+F1uLVujQM+lBM8bHUyulYlABO+icWJn6eUALQHG+lgYAm++T/rOU5Hj80VqTlLzgiefykriK9Lphjn6BXwRNyXhXGkC6T3GxQIY4j6XOXzp4Ag8n00s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 18:21:18 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 18:21:18 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com
Subject: [PATCH v4 01/14] doc: update AMD SEV API spec web link
Date: Thu, 19 Aug 2021 18:21:07 +0000
Message-Id: <3c88c509d6b96f8beaf5335b8c266714405cc09e.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0058.namprd05.prod.outlook.com
 (2603:10b6:803:41::35) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN4PR0501CA0058.namprd05.prod.outlook.com (2603:10b6:803:41::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.5 via Frontend
 Transport; Thu, 19 Aug 2021 18:21:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d5305e-e042-4875-9284-08d9633e2389
X-MS-TrafficTypeDiagnostic: SA0PR12MB4384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4384E2A1F9933070BBC6550D8EC09@SA0PR12MB4384.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZWJ7E4rn5BCRDDSp5z1tctp/kXm8F6aqquTOCgpTJMh6t4ep5vadIrlbA1kEFdJIuECOyju/HetTTn7d3Y/zOW0+SaxJtXzm5pqYbMy/ZyBp+QC3KZR0OzL+WR8MEt0/NhX2yUidnWWDg2KQqXd6hU/rIVZVD4AgceSj3ya6xa3n+LIwnG8wlq9dzN7pWqIsVdi1oXaitb65e7YxST8E4d7ERNSd2Wl+q+dtskFUDvZ6F/gtYy87vK5b7DyOwXe2ua46n5v0gqzxu4lmO4rF1wOcEG3xmYo2C9G1lVdU3Hx0Oa9ulQ6wqKpfJNGWJ7X1XjsY9NUOvW8khU97CXKA0sKgESheYqjiHmildp3S7EcDt8ZEDwM/uT35RB4NzFHyqPRvqT5aKEcA1K9l7+LS2iqMCXKIkiI48VUtC2U7ZuwrvprCoqjdtKsjJNPXuynYjg/f+67p+ztcHr1vJ+0A+oWG+9W1fmf8rYWx7YPrEi09VewlGUeRIXbnU98chjtcNPEwrB403cyC6ZfvBBswpxp2H1LKXdxRrQXQKZxisdyITQ5e8M1qinuCJvUYjD67kiLxnR/J2EwgMmm5Odp+HprYnQ1EjiqtDEd5jJMU2cReNnwK777X6Nx8QoEmipM6rZtIlR1JMs03oMuHjBypn6w63wXeNAqB2bw93lc1oDk7pd/t3wcg1d3ZPRg4S2qn6Wl1mXx/d2q2sy4C88YWzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(38350700002)(4326008)(83380400001)(66556008)(86362001)(26005)(478600001)(38100700002)(7696005)(2616005)(8676002)(6916009)(66476007)(956004)(6666004)(5660300002)(36756003)(66946007)(52116002)(2906002)(316002)(8936002)(186003)(6486002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQ1+5099x6Hg4x8m/3dZ/O9jmB1YlBLBYrgjN4fKHlLRUBmFSotCuGjxL39B?=
 =?us-ascii?Q?7oc6caAidocVJW6SAH5iDcCSMllypcgotqyFpgsfh40mX4ubtys+Sw5cRnQc?=
 =?us-ascii?Q?y9BI6ygpHhSykgyx7zDUN4WkGfxY7BRWSHcgLr69ZGM40Zajm0vtyoDuPnwC?=
 =?us-ascii?Q?fBNClennIfrPG5TlC6/mq8VejMrfEtaYcg8tB/HfPqSf/1tI/OYP3Lq1rFdy?=
 =?us-ascii?Q?GFGsJKrGR+YXKCyBjKlPU6oGcJAUSAGfNdR0wGlURCBLSy7TWFGrBMSeNP66?=
 =?us-ascii?Q?/34r772v3vVHtDgflYlMvvC7+c0DBWxMEg7eSDxR6iXghmkQjAeu5I36QUq7?=
 =?us-ascii?Q?NelXMY8PiIDBseC9WrArTP2D0H+AhsKnWrsO7ylunhofvWt23B7D7VLZs02Q?=
 =?us-ascii?Q?ZkCd0NzyEONGM2Eui6BK88nI20xfN+/EFALm0mUDr54MY0PdNxAJkA1FNVqH?=
 =?us-ascii?Q?w/f24p3ZB2MvCCemaBSQrVQiqtFwyH61DeT2O22SO6LXaVvjQ19g2aDNF+wl?=
 =?us-ascii?Q?oQvlhYrFtK9nC1fV6El0xVnimS3SvhLD0+flGmlrPgVZlXjI3+F0krPWZP4I?=
 =?us-ascii?Q?G2hSWa1J8kta1Leeyb5ZR3SboodwpSb19CIOdWdyzIG4V8yMvYN0MHejFbg8?=
 =?us-ascii?Q?FqQGkmJkYw6rgHM/12T0+JlJ3WyrjmNZHabyoWBMFE5xGgvH0zTQIdoFRO4d?=
 =?us-ascii?Q?43XfKkWOV4ZD8wietKXuk9+N3x/a70F7OqCvK/7yAMXi1aTa1/U32H7gpbsC?=
 =?us-ascii?Q?fkheFwxNJ6dM+8Gw97wUpWzMyCZX34C8KMEF6+flHTkR5DLyu/4ZgkiA3cUA?=
 =?us-ascii?Q?tfuNYuaCsp2IWTsN7l5DTzy5UdRUqQqJKdlm/fqW9l3LgHzrCFNUF160b1ZY?=
 =?us-ascii?Q?JMX4A8FXcQOl0pqg7t8Umbx6uch+bBW5GU3ID3jiab1heDv1THK8NK0zfLBX?=
 =?us-ascii?Q?7VYc/O0D5CKrvi3NuA7n88trznM6oWRbimdYU5EmBsTtu1wr+GDKaRYNNDVe?=
 =?us-ascii?Q?57jd6wrd+4wUc3uUFgGYcDSWcrH1ewlojn/12/yqC0nNXnDU/NhnRsHSmT7h?=
 =?us-ascii?Q?iRihpcA467wXiHRL/dF1uCUrFbx75PKK66y3XdSffzGDmKrucFlcYVLr1nZl?=
 =?us-ascii?Q?m+U2oszkJDuocOiKq/hR9zNEUx1COsOaP5yh+xxNqTcJhoH0VbB/L9ajO8RB?=
 =?us-ascii?Q?Gityxj9th9GXT9tZ77rkEgj2D7IUafR3XbrbzLUMogfuK6ojwOOVr7IO9e7F?=
 =?us-ascii?Q?uhhDSuE7EprMFxshEeTUvC5eL/nv1VkVbU/Zw55TKMBrVwh74qXFn/SPKMi3?=
 =?us-ascii?Q?jAi5Gh8ZOMPnfmzxkCvcd/Ai?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d5305e-e042-4875-9284-08d9633e2389
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 18:21:18.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/r25kz0mytf8qKWAghfmhuNEpBkopSKayBsFHysKVakb4dUvG0E3l/QEhIGcNrj1Yf9wA5ybzeoy243depI6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
Received-SPF: softfail client-ip=2a01:111:f400:fe59::606;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Aug 2021 16:16:23 -0400
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
X-List-Received-Date: Thu, 19 Aug 2021 18:26:26 -0000

From: Brijesh Singh <brijesh.singh@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 docs/amd-memory-encryption.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index ffca382b5f..12ca25180e 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -88,8 +88,8 @@ expects.
 LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
-complete flow chart.
+See Secure Encrypted Virtualization Key Management API spec section
+'Launching a guest' usage flow  (Appendix A) for the complete flow chart.
 
 To launch a SEV guest
 
-- 
2.17.1


