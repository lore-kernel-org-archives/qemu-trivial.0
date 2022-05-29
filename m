Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nvIkO-0006F8-Eq
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2022 09:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wendland@live.com.au>)
 id 1nvFIx-0002hA-DF
 for qemu-trivial@nongnu.org; Sun, 29 May 2022 05:33:48 -0400
Received: from mail-mw2nam12olkn2040.outbound.protection.outlook.com
 ([40.92.23.40]:54752 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wendland@live.com.au>)
 id 1nvFIu-0000Lj-G6
 for qemu-trivial@nongnu.org; Sun, 29 May 2022 05:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3C8cnsT1FSH2z2CH7icmyeyfiF/llTJ3OBHVNCb5jO8fdwvIS0EqtWjU66KocbYlx1BEHByxK89fC0+0y6jhl0WmWVxYkukPVyU/wFpdyDLz4OTfuIPK2G+tHyFebm4Ryg8YoSBM1SWN/YOgYaoaDGEtwB7LwaCpijXlpeJkByF0D4bW7ekmIX4mLSN7JYArTUGMFHG/wQIpfXlrcc7AGdM8GB+c5RYFPpnsnBJq5Ke1lhZzQ3zQuEj35P/+jsNCpZSJUTp+5gLvCKRoIS1c2PXCB0tNFPPi+zMJzEoogKOoVd0O9rEXp1fmoqBLfWlYSxe+FTBjvwUp4b9nG2gQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edhwCw93VTkmmSBbuHon2rEjCtP3J/Zkih2ALn0TnnM=;
 b=ml/m77EgaYcT1AiJN6bsi1ThLWeyJ1nx+/WX2XmbIU+FAi9HxPwPkBuXP1IDac122vMGA0CXtu9GNdSPym7hLWrx/yvkLK8v1oUm6XclLg2mH2ChbyH/FRwOsTqvDlrHd2uuuEDXA2ti3uuw29Xtr3o3lP4iGP7QLZ6RfjDyjjvLRJ8qQtYqWcm6k4w5pk937w59dOV7J+OqPxMiPcuc/wbDGmKE59uyYYUu1n7IXNegg+XJRzjgALZmtcos0+hFvleixPebmHjGxjvvptJFx1BR/nPdpGsN6wn8pMz2nnJYoTmsXPwqv+QKvoNu2M9tPxske3DiBgqj7YxF/WU5RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR06MB2510.namprd06.prod.outlook.com (2603:10b6:300:66::21)
 by SN6PR06MB6413.namprd06.prod.outlook.com (2603:10b6:805:f4::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sun, 29 May
 2022 09:28:39 +0000
Received: from MWHPR06MB2510.namprd06.prod.outlook.com
 ([fe80::88a3:25df:65a8:7684]) by MWHPR06MB2510.namprd06.prod.outlook.com
 ([fe80::88a3:25df:65a8:7684%9]) with mapi id 15.20.5293.018; Sun, 29 May 2022
 09:28:39 +0000
From: Ryan Wendland <wendland@live.com.au>
To: qemu-trivial@nongnu.org
Cc: Ryan Wendland <wendland@live.com.au>
Subject: [PATCH] usb/ohci: Set pad to 0 after frame update
Date: Sun, 29 May 2022 18:57:24 +0930
Message-ID: <MWHPR06MB25106D279E1BA0FA579E4CA086DA9@MWHPR06MB2510.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [pO64fhHlT9of1UEsjkOE1hqxFbJFJFzU]
X-ClientProxiedBy: ME2PR01CA0171.ausprd01.prod.outlook.com
 (2603:10c6:220:20::15) To MWHPR06MB2510.namprd06.prod.outlook.com
 (2603:10b6:300:66::21)
X-Microsoft-Original-Message-ID: <20220529092722.3032-1-wendland@live.com.au>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 550abb98-f6a4-49e1-6b08-08da41559cdb
X-MS-Exchange-SLBlob-MailProps: CaK+F7me6CmAWpFad70HnHl4r0LAX1ElMNgGpxXt55knpm/yee/yD0Ohhhfb+6sHyYVQLdxif56KbWu2m60p0dKOFhd225LURKzwykw29Hp7OW5SCQkRsGXieguwx36VweBAHdiUzicE2WONPcOxbzmM9dc0cEuGnvO+pDB2H/WeGWqIcZYy79IcXSPcstgFyoqFVVF1rSxu/RV6/emdbgNMx2My6f9xpLg+HRt8TgSlE9xxYGtCikKU7J4DGA6gLvDH5anYYOVF8WfaL2SHkTtnEMukAS8K9UWUmHRzSck5gBTfZqYWqmWIMJQVLETTZe6GfhtiWKJhMwTzdkd+o/nmxxUOm9VyXnBorh4bClsS9xl6Ys4B7xflVXIp/uXi1zZCf+kTCfLVBkAgedgCfQKnwc3SKcpiAU4YoCWhktT2EkRPCZExAvUX7qJ9KvEOJ2wjHHpz/mLmrkiWCj25RjfE8ANv+84YnRXPl8qSDe8kdxE0RnML2SCs2/Uae+XhAQf53BEDHPwLp6qhYe/GQlzVeyhxz2QIFnwTsm4IwgpsoWWT3GSotLRMwouZpQ/K33bO34+OJY70Lkibaxf6LXPmmI89Qers3k01yJFnA6FuIomH/KH45WoVTvi117/Fk0B+qobtSFvw455DFSWifnGTasTi2419hRvTUZLjmw1ZjX45FEEwh8UCCHyCT/jhjttF352S7jIZK+41w0JbufPbUWGVbVRajog8mtvsqmill0kNFJEQFw==
X-MS-TrafficTypeDiagnostic: SN6PR06MB6413:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7/HqlKDhYKdBFtE5IjaSKx1yi3Z4yOL4OmWOxp4a9DBSBTlfwaOPOvPMVxOs/1gl4TxK20pQRYNJ2vwKArL103AdRsMGGZgQxW0TAMm7qhx9seDaXcdtu2jCrKvU0mVd/U6afsfUKGuVG/bSEiODH91qz5f5lI8iYeYYNl+3dQ1YWJiRGUaGU/mRnoy+B0yVlLvzg8WfpgyMjLUoX9FIYzYPioU6L6jj4YUL2A+tiSQT53FsJT+6UblWgXQJohPns/U+BUu7Hc5wXuKkeJW9WAod3YKwg3roNpN0IDN+DzSdlOJhzb7djaXACfYAbn16PrcNdHmAVOh71lu3Qg0J7pvxKBHj9XkxBApqxdGm/NmyZnahVjVK56y5SkLzPDTpiWRkQiGNDFmbjpDrcbho2AkicjtHXij6yYwByMYQZQPB+xAbZ0QZCQjlI+cH27AYI8uz4NjT52JXW5WeX2ayLjMPZuUja4/xqIqeofRnvq0WObiv0/nfUybHsG7QjkbeUUgSW+NV3r7WqRUTbrfRMUs0G8efk3OLVs8+1CyPFH2A/CC9qCloDKDLv63cmreaLoJOQ0PBzJWvqmMQF2WpA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?irm+VwLA5BkEREdUsO22DLzQX15fjJOElqs9Z78Nd1Xr7qCHwwxCCspWe9j3?=
 =?us-ascii?Q?wruOFrYt0jj93hE5Mr9Bqq7L+n+ks72vk1OKYMDv7v5Tf+4RwtjSzVEbGgAK?=
 =?us-ascii?Q?yVuKMFh0iRbT8RSBgazBj2CtfCZ5jOR0rdW9Hi+M8WquTkPPKe6IC41WbjdI?=
 =?us-ascii?Q?ENxhtAXezW7hJJfjwLGTHqbZK1dA8tzbgt4BKCAWDPlfv6aCGgquPIjlraUt?=
 =?us-ascii?Q?AQ6xW2oGXorY3Rx2WczCZ38iohxXu18SPIVzD/vwVjxL1l6lw4PamveB+qMp?=
 =?us-ascii?Q?6L08y7xrXAgtkHHVxU69iIFg7/n5y+Y12CbgXaV5H8rbcpZWjB6+odYKv1Yq?=
 =?us-ascii?Q?XutuBIZm7LyuR9bqeaQsf8CZkIjmeLmefCOYnoEaR3YxUdfMHCPzFNVks4if?=
 =?us-ascii?Q?dztQ+4ZvuFrSpRLBdaSQJB/yLiZIxtwZSx2HQPoYyaic+sI2WNHWoLENKSmd?=
 =?us-ascii?Q?YykpaHxIFnIpeOE4BczoQz/fqAgkAqvOn3+93O2Ww6IsncoKrZf+ziAbgkYu?=
 =?us-ascii?Q?E3RS/qvOFwFIBqVGOc2ynvE611Vxpplvti+7j9YO08YN1N6LDEkiwt48AsiP?=
 =?us-ascii?Q?fVsTQJP5GEUpEQkzhPbGmxoYF1/8jGhivG774UxN12lXRHKboOIsrywMCOq+?=
 =?us-ascii?Q?kn4aJALXxL4GO1BHU7nmxkrK0OmVTsoXX/oM0dpesgSxvb24WGGCJb5XxfRI?=
 =?us-ascii?Q?A/N+8OwTrPGyoyX/rmFR12SLcWM6+bjNXMr3l0Hfh9s+hAHWBgcRd7kpbmMT?=
 =?us-ascii?Q?Zrnrj/yMpbNCAy7Mb4V0iqBlv1PklMSajO1QsFdbvlrL7RnxAXyOPD5AKohP?=
 =?us-ascii?Q?bkR7i9Iz7EF6oxYqIilknWKSzBKrc//RPFrSGr6jf7tLEhwyiI9V9C31hk9Q?=
 =?us-ascii?Q?h4IdIqMRqVP2OlHcTSHB/4V7G4U2UjNkF14mnzxHCy4EeKJJMy0W5QbovrQq?=
 =?us-ascii?Q?QhISVthGKa6VNc7X260nMFEEtMhDZjo+dopHaTXPQNkuzrX/vzNtjCREABW4?=
 =?us-ascii?Q?8EPje3THIJBTN1ZFtsZaI+cWUYI80IZR3QqCUuDUhz0Vz72/kfvQkjL7niRM?=
 =?us-ascii?Q?E3WVDb/al3QfvrWbT9XyRp9HSIxkHIE5P8uD7Y4FaCTJpxrcph2aFdFITAgl?=
 =?us-ascii?Q?sOPM6trtkSMfBUg6CETgJ/esUfFSNKazruJ3NAHBdPrEZJl05BHtU4JvonRl?=
 =?us-ascii?Q?kyseE6cHZKWBNJjTPeNIeCOL7iJwONwVHeOz5IIvb7Qs/FnhxQY6k0YUQPKX?=
 =?us-ascii?Q?ewdMSy64qosPeEQ4WgQ2R1nGNQYcmkAObyMD0zeZne0Kg3Ay/b6MilXsNZYT?=
 =?us-ascii?Q?Sunj0Xd8WxOtBH03i7t7zu6yYFdb3+EPFAEcMdYFM2z/YKSC+ax/8JiamZr/?=
 =?us-ascii?Q?g5UI6cjOLqAnFNX3l8/TYQ9GK/kq0q5ikpTPOBCJlvsMcwyXEAY4DJGJxgP9?=
 =?us-ascii?Q?u2ACKzHUyvY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 550abb98-f6a4-49e1-6b08-08da41559cdb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR06MB2510.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 09:28:39.3340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR06MB6413
Received-SPF: pass client-ip=40.92.23.40; envelope-from=wendland@live.com.au;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 29 May 2022 09:14:19 -0400
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
X-List-Received-Date: Sun, 29 May 2022 09:33:56 -0000

Signed-off-by: Ryan Wendland <wendland@live.com.au>
---
 hw/usb/hcd-ohci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 895b29fb86..fed364dcbe 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1199,6 +1199,8 @@ static void ohci_frame_boundary(void *opaque)
     /* Increment frame number and take care of endianness. */
     ohci->frame_number = (ohci->frame_number + 1) & 0xffff;
     hcca.frame = cpu_to_le16(ohci->frame_number);
+    /* When the HC updates frame number, set pad to 0. Ref OHCI Spec 4.4.1*/
+    hcca.pad = 0;
 
     if (ohci->done_count == 0 && !(ohci->intr_status & OHCI_INTR_WD)) {
         if (!ohci->done)
-- 
2.25.1


