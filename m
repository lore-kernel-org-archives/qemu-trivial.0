Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNh-00023r-4F
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNb-00021S-AY
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNW-0006n0-Qs
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:38:59 -0500
Received: from mail-dm3nam03on0049.outbound.protection.outlook.com
	([104.47.41.49]:20208
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNW-0006m0-GX; Mon, 13 Nov 2017 17:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jsxv8zsstxXnU92Gf7+yAgPz1B7TBVMqgvU+kSDMx6I=;
	b=QSJge3u3Nmfdjb1xrTlji3I9jzQiGO+9cQcp02Zc+prllH+Ya+6LuWRFqcjWX4aENNvPJhNys3PlIRfJVKQbBkIPk6lDnby7h1hXLttz/wo0KBJ6+aRbqmgRDTmZ8PBJuFzECWlNRh0bBB1T2BRbz4dqUGwGVpZF7ta7oAlB8gU=
Received: from CY4PR02CA0034.namprd02.prod.outlook.com (10.175.57.148) by
	CY4PR02MB3383.namprd02.prod.outlook.com (10.165.89.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:38:50 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by CY4PR02CA0034.outlook.office365.com
	(2603:10b6:903:117::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:38:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:38:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNR-00048X-KM; Mon, 13 Nov 2017 14:38:49 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNR-0000Km-HO; Mon, 13 Nov 2017 14:38:49 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcdnj012402; Mon, 13 Nov 2017 14:38:39 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNH-0000Je-Nv; Mon, 13 Nov 2017 14:38:39 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 13 Nov 2017 14:34:39 -0800
Message-ID: <1743d21d4c073ae4f8aabada57692bd2e536aa8e.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(2950100002)(118296001)(4326008)(9786002)(16586007)(110136005)(36756003)(47776003)(54906003)(5003940100001)(50986999)(36386004)(106002)(76176999)(575784001)(50226002)(77096006)(63266004)(5890100001)(50466002)(189998001)(478600001)(305945005)(39060400002)(316002)(356003)(81156014)(5660300001)(48376002)(8936002)(106466001)(2906002)(81166006)(8676002)(33646002)(21314002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT012;
	1:CljZWwoqL/17zEvnAb8ha2To8cv40VPWUNyeEYrlNGL52jDO6j2sbMBTpiKHdovIH2+k1hCNTCW0O4PHJ1ELbvzrLngfapq9ynsd2jNDnqzSUjRgXpkd0s4evye7QJU3
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a71132e7-03bb-4a4c-584c-08d52ae74fbe
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:avodihhHkMe1g9ScGkUqP7Jeq84H9t6+IBJ2pGdygoDIEO+6Tw/qSVSYmE8QbNQ7eCSWYsyJH+pIbtPzfiJ70tKjQFaPNrVEwJG2LIB2boCHk0RkpNeoyBkeZIfpAhX7kpSrTnNm3c8Rrj/WsLjvlI9nJxPmM746CXKZ2gJtPG8XlnKwkgQaImZYWbhx1Qaw950KRFbi1p9WW48/tYxK3o4qAdHT6GcLxHwN33CBO0TOulGHgso9gnRvdlpXOJKjtMbS7H3XC7rYaeQyL9Du55Ps8k84ArRf0kx1XggaP7OYi8jaKJooFG4H7qsMbmKx8lHHiFDKKa5V2pUzcHpHACxteAPzupp9Y0u7UB7/x0k=;
	25:K8LNtwhelP61V7bZ1KB0oO2JuBKL20+VpFom6VgR8dYqpFadbmMy9qfNK9qADTJCjLticqolDWuxhoJtSfO8Ufpb2HF3PiBbb4X3m3dKWKfzHD+8Zq7GDOnXmGkMpMz7x3TnBycQI614DqHuF8B5eRxHCj3TgvMm1t6GlGNpSTfywUABe+VsFc0Srxc/PBbVJcz3z0uFKCB+O+h12x0JQXNp6+B4SQ0sygQK93lY9N9XImk7XQiKbe/mkAwiQ0/apuBAbLPX4jJfjmgOcBsj7+jTK0R1+A3lsUE7Z+Etn4rtfEJ0yTxgf/o9p7ucmqtDWJjX5J1pwcekyC95CP61qQ==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:ohMFz4KKsa4WeaT+A2Z92ewt9QNVHpbgaDbaA09ilL5BY/YQGhTTI4kz4E69deu5Ed7UPuGXva9IPyrOfKtr2YY+WRR8N2Ca0U22QzXsHoZ8sxjn1ERIwWolRE3XqZBRJ2iMz+bDRKcsEzqoKHDkm5CpcsP8CyTMuMb2mtNw+udULrHpHEL+YQu2+qfsq7uA3RV8c482Ich2l4eGkaTPBeZMZ6MyfCuFp1+LY8Sc3+g=;
	20:hQmTZcSGdkw7+fN+ttycElIWUHyB3DcHkmM/9NDQ7800dUhZ6FKFjWmb1G9/GPn9P07LpYI3cPNzKvs2XX8+3tQTu62152nTeDpT/ucHsbqXIXv1V7yCd+nln4mMzoIo9nsPt5ZMNYiE0Pf3P8x1CJnH3iHJPJxd9+PNXBrkgedHpIRT61vqAdxtsX5Ipo6dz7+W+oiExGc6V1c/NHR9x7Tu+wVJBceFE0YoOG6eM4ogumYU5JB/P+6KXd2Pn950jvvZ++GzxB7yrdvutWsHF3XojjHxGYrRbKt63uTuY2sNvOisP5HudsQjCC31NPFWtq9xm/LSC4iktTMb+lf0sZJnmkZaVLukEiwxviqG1EQ+0/L398EFooOxKuZj5Yae/aBNOOIuY+CFnnNJPbIPltYy5DN+Jqp3N9v6lV344AnMZudDkjVSGjSfJjpBVX7b+SDaPpBBPqyG6/nBZdcIbTATSmJKelnQSRxPpct6md9yl48V3Q0HTVQgIWEpO6rn
X-Microsoft-Antispam-PRVS: <CY4PR02MB3383F4B9328A329C3478DE1FDC2B0@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(3002001)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:uJnSr2zb+DC+FpUb7eBn8evzw3vRco0lqF8oTpCWe0H8pnvUMI2p9Hq+d+SDehBkV6XdRRh46hRXkguGQe5oQPJyFTcNd1fPpkuhtuMf1ClUoXrvdgxv4AvfDGAK7JHp7bZNmcRfAID4rjztMdGb1sm4n3uFjJ6gbE4wQvRCz+fBzr4PkcFjcThAj6gVSoRPZv5kwJiBoedyH0O7QPWnS0LlI1FKh0MAqlRZk24hHddYiMCCXDUzqEWrnANq0gaxP7oTUxnlaBLHA26dCob1dE+zNF3nmapdqfPSvwPRx5aOl0kk7Ln8iyA58sgQt83FP+u12G3IjrQ75JXYclFuZA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:/4jWLJ6BRUGuv9RRD5T/KmKdbpfR48VcsenVpsGkr?=
	=?us-ascii?Q?ftNwz7pIrM7HKmRZfs6Re2XZRjAdpvaXLq3DWJZ8I5v58ZVBvaPz4jQ5JTem?=
	=?us-ascii?Q?mNgMIg+UxdZkMyoXi7YsBPRV4ID5LG91nSyl+kfjzbJvUCPm00DCMUUK2sY4?=
	=?us-ascii?Q?IalW5ejN4te2u3EP0rE2o1x4pmUkRhOxDryOsXuwRRuFiZNwmMd8TzauuYI+?=
	=?us-ascii?Q?ETvefQw8tZuwBcps2FVASa2FnjCpRn//VIh1WsolIZZBaPq4OPCchpY/1krs?=
	=?us-ascii?Q?mS37FCujCe6Z4kOIO5bkoP4oPUFcjIDWHIapct5tCYbdcGMeROGr+JxtqxPZ?=
	=?us-ascii?Q?GebhKw9g4v1Zqq3S3WoOLFxQKNe+M49alXoVk8VZXXhsFZgeMEMmUymSdG60?=
	=?us-ascii?Q?5HEJhQ8PRjkJz721caJeI0Z7nGm3c5msRfCGxXPD8LlMJBKAWYplYkudNDGS?=
	=?us-ascii?Q?NzmJ2eFIF92mgi97teGMUSiaRLg6zKgQ6wxRkoxlja7LCzUtdtfn6aHrQdqz?=
	=?us-ascii?Q?5zPCG0Go6ZC1TAAcSZnqpnPMRIG9V3+MlAa8TAe7rLJCOfdiqdu8awojTmhU?=
	=?us-ascii?Q?ySfDihUZw9mgXHwOO0b/X4axedGNgfazfnh45IqaCZFO4UUKWvD7fwHqtjj0?=
	=?us-ascii?Q?7LyWSe+Dr8tnd4Erewz+OhU7ykStQ4XTi2YSXjaaj2dz1RMVo7Mk98F1tg4k?=
	=?us-ascii?Q?eWAjfRM2xkzly1fix0fXijNEZxBdLrPWzw1AO5bV1zNkma64TP3wgxQGSoA+?=
	=?us-ascii?Q?H7A2b/RE0vYJnt8sKJHAsWoRRfVDLSlzIto25sGNv9YQ54oo9zDWt02fGdlu?=
	=?us-ascii?Q?FIW7e/faLaG/kn4eqdL8emlEWl2OG2TgkV/sOCsfaSRTTdVVQDZOHnF0BYDi?=
	=?us-ascii?Q?7bL/whwkwHw2DEWCQOiBuhuTmfV5GcZydNrHC7nXxhJCaBIuVOPgEubrLyLv?=
	=?us-ascii?Q?W3fQalljSLBdNnYw5L0SNJ+dcCnhjhYuCp31ZGyQmwKGWzCM/oEWXtYJL5zs?=
	=?us-ascii?Q?C/hSO6pO25VNYAvf7LY6s2Bcmt/xQT7jo3WvFFZ9cPe8/yPbwKxH7L+uOtYF?=
	=?us-ascii?Q?4Q44ZlfP6h9rTTA+92tvAVQ7iUkDX9qwZJaNr00n5FTH+ny8w=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:VXIdJVzwzL+Zd/nBLP67eDrr5k44WMuAxFWMq7J3EGNeS7Xga+gnxqz11/pIxwuBG+/S08+djpIkxbifEdn9Hig2yRj0qNHFPcBlPJcsHNLCq/xNc04HJ0wUuumVwDsaXS54LfYoWmApNDeGHDo7tyk4SnvdC+GxPTSdcZ5aD8EVtFe49gsm1QqIpJW+3xSA1UrJJRqdtZtRVcbWXBMFqNA6EMGkPLo/JDiFHsn99/lDjxwmX35FhCLWYH9CX4QAu2a5OFWVhx+3rY9phNg7DfL9YSyH1IBLKVuBpP4bVRv6umgEwcLSljRcL6z/h4fbwVqNqLwLrW5Up2DJni3A7z69/u6PtSBHiStYOyHM5Qg=;
	5:EQVEm7ZuPhbqxxU+akolYmC1j64yr47X6CaykL6gFgHyV2JukaBXnMuzuw1cmkbjALNQbEer3+AHZPzaXU2nJwcbFMjwL9UkrlDng71r1IPlxPNMtGg+KlpW6mu9R6kDEiKY3JSq2tmJIgzA5qoESWPLw2A1fNsBSEUmUHBknos=;
	24:pOoNXwkVQsgMmIgdBf5Dt+4mndYD3KKFAMSvCuDtXvQQAO1T9lQ4kWb16CY3XrVRB58i7He3DObBnFBGwb65RhJgewQAmePfhz41G1rfG0c=;
	7:h8RFjjGqkc0OVh0xQ2xxqG9LfodKqsoYUx6hEfRIEBp32IyOSAPnWNREgEeBlMHqTGOCYuKoUVycdSZo5S7BT38GRWKUH9RYg4Y0z61FwmWjOmgCBhy0nklW2JHla6CUBSPaXY86VcuXNBKplhd1wfO+Ex2xuf2nb3iyBwjm6m43AplQ+6W+yVmyH+Z4IuysGazkBZL+i0atSPiDf5LHqMH1YnvUoXZnCB2DkQ1yyLIQWxOkz+W0v0e0QOryf7a3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:38:50.2729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71132e7-03bb-4a4c-584c-08d52ae74fbe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.49
Subject: [Qemu-trivial] [PATCH v5 01/29] audio: Replace AUDIO_FUNC with
 __func__
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 22:39:04 -0000

Apparently we don't use __MSC_VER as a compiler anymore and we always
require a C99 compiler (which means we always have __func__) so we don't
need a special AUDIO_FUNC macro. We can just replace AUDIO_FUNC with
__func__ instead.

Checkpatch failures were manually fixed.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---

 audio/alsaaudio.c      |  4 ++--
 audio/audio.c          | 40 ++++++++++++++++++------------------
 audio/audio_int.h      |  6 ------
 audio/audio_pt_int.c   | 28 ++++++++++++-------------
 audio/audio_template.h | 26 +++++++++++------------
 audio/dsoundaudio.c    |  2 +-
 audio/mixeng.c         |  2 +-
 audio/ossaudio.c       | 10 ++++-----
 audio/paaudio.c        | 56 +++++++++++++++++++++++++-------------------------
 audio/sdlaudio.c       |  2 +-
 audio/wavaudio.c       |  2 +-
 11 files changed, 85 insertions(+), 93 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 3652a7b5fa..92a96f8b2b 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -823,7 +823,7 @@ static int alsa_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc (AUDIO_FUNC, obt.samples, 1 << hw->info.shift);
+    alsa->pcm_buf = audio_calloc(__func__, obt.samples, 1 << hw->info.shift);
     if (!alsa->pcm_buf) {
         dolog ("Could not allocate DAC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
@@ -934,7 +934,7 @@ static int alsa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    alsa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!alsa->pcm_buf) {
         dolog ("Could not allocate ADC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
diff --git a/audio/audio.c b/audio/audio.c
index beafed209b..7658d2af66 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -424,12 +424,12 @@ static void audio_process_options (const char *prefix,
     const char qemu_prefix[] = "QEMU_";
     size_t preflen, optlen;
 
-    if (audio_bug (AUDIO_FUNC, !prefix)) {
+    if (audio_bug(__func__, !prefix)) {
         dolog ("prefix = NULL\n");
         return;
     }
 
-    if (audio_bug (AUDIO_FUNC, !opt)) {
+    if (audio_bug(__func__, !opt)) {
         dolog ("opt = NULL\n");
         return;
     }
@@ -792,7 +792,7 @@ static int audio_attach_capture (HWVoiceOut *hw)
         SWVoiceOut *sw;
         HWVoiceOut *hw_cap = &cap->hw;
 
-        sc = audio_calloc (AUDIO_FUNC, 1, sizeof (*sc));
+        sc = audio_calloc(__func__, 1, sizeof(*sc));
         if (!sc) {
             dolog ("Could not allocate soft capture voice (%zu bytes)\n",
                    sizeof (*sc));
@@ -848,7 +848,7 @@ static int audio_pcm_hw_find_min_in (HWVoiceIn *hw)
 int audio_pcm_hw_get_live_in (HWVoiceIn *hw)
 {
     int live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -886,7 +886,7 @@ static int audio_pcm_sw_get_rpos_in (SWVoiceIn *sw)
     int live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     int rpos;
 
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -909,7 +909,7 @@ int audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int size)
     rpos = audio_pcm_sw_get_rpos_in (sw) % hw->samples;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live_in=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -935,7 +935,7 @@ int audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int size)
         }
         osamp = swlim;
 
-        if (audio_bug (AUDIO_FUNC, osamp < 0)) {
+        if (audio_bug(__func__, osamp < 0)) {
             dolog ("osamp=%d\n", osamp);
             return 0;
         }
@@ -990,7 +990,7 @@ static int audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
     if (nb_live1) {
         int live = smin;
 
-        if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+        if (audio_bug(__func__, live < 0 || live > hw->samples)) {
             dolog ("live=%d hw->samples=%d\n", live, hw->samples);
             return 0;
         }
@@ -1014,7 +1014,7 @@ int audio_pcm_sw_write (SWVoiceOut *sw, void *buf, int size)
     hwsamples = sw->hw->samples;
 
     live = sw->total_hw_samples_mixed;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hwsamples)){
+    if (audio_bug(__func__, live < 0 || live > hwsamples)) {
         dolog ("live=%d hw->samples=%d\n", live, hwsamples);
         return 0;
     }
@@ -1263,7 +1263,7 @@ static int audio_get_avail (SWVoiceIn *sw)
     }
 
     live = sw->hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > sw->hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > sw->hw->samples)) {
         dolog ("live=%d sw->hw->samples=%d\n", live, sw->hw->samples);
         return 0;
     }
@@ -1287,7 +1287,7 @@ static int audio_get_free (SWVoiceOut *sw)
 
     live = sw->total_hw_samples_mixed;
 
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > sw->hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > sw->hw->samples)) {
         dolog ("live=%d sw->hw->samples=%d\n", live, sw->hw->samples);
         return 0;
     }
@@ -1354,7 +1354,7 @@ static void audio_run_out (AudioState *s)
             live = 0;
         }
 
-        if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+        if (audio_bug(__func__, live < 0 || live > hw->samples)) {
             dolog ("live=%d hw->samples=%d\n", live, hw->samples);
             continue;
         }
@@ -1389,7 +1389,7 @@ static void audio_run_out (AudioState *s)
         prev_rpos = hw->rpos;
         played = hw->pcm_ops->run_out (hw, live);
         replay_audio_out(&played);
-        if (audio_bug (AUDIO_FUNC, hw->rpos >= hw->samples)) {
+        if (audio_bug(__func__, hw->rpos >= hw->samples)) {
             dolog ("hw->rpos=%d hw->samples=%d played=%d\n",
                    hw->rpos, hw->samples, played);
             hw->rpos = 0;
@@ -1410,7 +1410,7 @@ static void audio_run_out (AudioState *s)
                 continue;
             }
 
-            if (audio_bug (AUDIO_FUNC, played > sw->total_hw_samples_mixed)) {
+            if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog ("played=%d sw->total_hw_samples_mixed=%d\n",
                        played, sw->total_hw_samples_mixed);
                 played = sw->total_hw_samples_mixed;
@@ -1513,7 +1513,7 @@ static void audio_run_capture (AudioState *s)
                 continue;
             }
 
-            if (audio_bug (AUDIO_FUNC, captured > sw->total_hw_samples_mixed)) {
+            if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog ("captured=%d sw->total_hw_samples_mixed=%d\n",
                        captured, sw->total_hw_samples_mixed);
                 captured = sw->total_hw_samples_mixed;
@@ -1924,7 +1924,7 @@ CaptureVoiceOut *AUD_add_capture (
         goto err0;
     }
 
-    cb = audio_calloc (AUDIO_FUNC, 1, sizeof (*cb));
+    cb = audio_calloc(__func__, 1, sizeof(*cb));
     if (!cb) {
         dolog ("Could not allocate capture callback information, size %zu\n",
                sizeof (*cb));
@@ -1942,7 +1942,7 @@ CaptureVoiceOut *AUD_add_capture (
         HWVoiceOut *hw;
         CaptureVoiceOut *cap;
 
-        cap = audio_calloc (AUDIO_FUNC, 1, sizeof (*cap));
+        cap = audio_calloc(__func__, 1, sizeof(*cap));
         if (!cap) {
             dolog ("Could not allocate capture voice, size %zu\n",
                    sizeof (*cap));
@@ -1955,8 +1955,8 @@ CaptureVoiceOut *AUD_add_capture (
 
         /* XXX find a more elegant way */
         hw->samples = 4096 * 4;
-        hw->mix_buf = audio_calloc (AUDIO_FUNC, hw->samples,
-                                    sizeof (struct st_sample));
+        hw->mix_buf = audio_calloc(__func__, hw->samples,
+                                   sizeof(struct st_sample));
         if (!hw->mix_buf) {
             dolog ("Could not allocate capture mix buffer (%d samples)\n",
                    hw->samples);
@@ -1965,7 +1965,7 @@ CaptureVoiceOut *AUD_add_capture (
 
         audio_pcm_init_info (&hw->info, as);
 
-        cap->buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+        cap->buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
         if (!cap->buf) {
             dolog ("Could not allocate capture buffer "
                    "(%d samples, each %d bytes)\n",
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 5bcb1c60e1..5b25da0a37 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -252,10 +252,4 @@ static inline int audio_ring_dist (int dst, int src, int len)
 #define AUDIO_STRINGIFY_(n) #n
 #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
 
-#if defined _MSC_VER || defined __GNUC__
-#define AUDIO_FUNC __FUNCTION__
-#else
-#define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
-#endif
-
 #endif /* QEMU_AUDIO_INT_H */
diff --git a/audio/audio_pt_int.c b/audio/audio_pt_int.c
index 21ff9c5803..3fe56d8514 100644
--- a/audio/audio_pt_int.c
+++ b/audio/audio_pt_int.c
@@ -31,7 +31,7 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
 
     err = sigfillset (&set);
     if (err) {
-        logerr (p, errno, "%s(%s): sigfillset failed", cap, AUDIO_FUNC);
+        logerr(p, errno, "%s(%s): sigfillset failed", cap, __func__);
         return -1;
     }
 
@@ -57,8 +57,8 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
 
     err2 = pthread_sigmask (SIG_SETMASK, &old_set, NULL);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_sigmask (restore) failed",
-                cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_sigmask (restore) failed",
+               cap, __func__);
         /* We have failed to restore original signal mask, all bets are off,
            so terminate the process */
         exit (EXIT_FAILURE);
@@ -74,17 +74,17 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
  err2:
     err2 = pthread_cond_destroy (&p->cond);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_cond_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_cond_destroy failed", cap, __func__);
     }
 
  err1:
     err2 = pthread_mutex_destroy (&p->mutex);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_mutex_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
     }
 
  err0:
-    logerr (p, err, "%s(%s): %s failed", cap, AUDIO_FUNC, efunc);
+    logerr(p, err, "%s(%s): %s failed", cap, __func__, efunc);
     return -1;
 }
 
@@ -94,13 +94,13 @@ int audio_pt_fini (struct audio_pt *p, const char *cap)
 
     err = pthread_cond_destroy (&p->cond);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_destroy failed", cap, __func__);
         ret = -1;
     }
 
     err = pthread_mutex_destroy (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
         ret = -1;
     }
     return ret;
@@ -112,7 +112,7 @@ int audio_pt_lock (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_lock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_lock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_lock failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -124,7 +124,7 @@ int audio_pt_unlock (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_unlock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_unlock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -136,7 +136,7 @@ int audio_pt_wait (struct audio_pt *p, const char *cap)
 
     err = pthread_cond_wait (&p->cond, &p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_wait failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_wait failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -148,12 +148,12 @@ int audio_pt_unlock_and_signal (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_unlock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_unlock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
         return -1;
     }
     err = pthread_cond_signal (&p->cond);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_signal failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_signal failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -166,7 +166,7 @@ int audio_pt_join (struct audio_pt *p, void **arg, const char *cap)
 
     err = pthread_join (p->thread, &ret);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_join failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_join failed", cap, __func__);
         return -1;
     }
     *arg = ret;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 99b27b285e..7de227d2d1 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -57,13 +57,13 @@ static void glue (audio_init_nb_voices_, TYPE) (struct audio_driver *drv)
         glue (s->nb_hw_voices_, TYPE) = max_voices;
     }
 
-    if (audio_bug (AUDIO_FUNC, !voice_size && max_voices)) {
+    if (audio_bug(__func__, !voice_size && max_voices)) {
         dolog ("drv=`%s' voice_size=0 max_voices=%d\n",
                drv->name, max_voices);
         glue (s->nb_hw_voices_, TYPE) = 0;
     }
 
-    if (audio_bug (AUDIO_FUNC, voice_size && !max_voices)) {
+    if (audio_bug(__func__, voice_size && !max_voices)) {
         dolog ("drv=`%s' voice_size=%d max_voices=0\n",
                drv->name, voice_size);
     }
@@ -77,7 +77,7 @@ static void glue (audio_pcm_hw_free_resources_, TYPE) (HW *hw)
 
 static int glue (audio_pcm_hw_alloc_resources_, TYPE) (HW *hw)
 {
-    HWBUF = audio_calloc (AUDIO_FUNC, hw->samples, sizeof (struct st_sample));
+    HWBUF = audio_calloc(__func__, hw->samples, sizeof(struct st_sample));
     if (!HWBUF) {
         dolog ("Could not allocate " NAME " buffer (%d samples)\n",
                hw->samples);
@@ -105,7 +105,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 
     samples = ((int64_t) sw->hw->samples << 32) / sw->ratio;
 
-    sw->buf = audio_calloc (AUDIO_FUNC, samples, sizeof (struct st_sample));
+    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
     if (!sw->buf) {
         dolog ("Could not allocate buffer for `%s' (%d samples)\n",
                SW_NAME (sw), samples);
@@ -238,17 +238,17 @@ static HW *glue (audio_pcm_hw_add_new_, TYPE) (struct audsettings *as)
         return NULL;
     }
 
-    if (audio_bug (AUDIO_FUNC, !drv)) {
+    if (audio_bug(__func__, !drv)) {
         dolog ("No host audio driver\n");
         return NULL;
     }
 
-    if (audio_bug (AUDIO_FUNC, !drv->pcm_ops)) {
+    if (audio_bug(__func__, !drv->pcm_ops)) {
         dolog ("Host audio driver without pcm_ops\n");
         return NULL;
     }
 
-    hw = audio_calloc (AUDIO_FUNC, 1, glue (drv->voice_size_, TYPE));
+    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
     if (!hw) {
         dolog ("Can not allocate voice `%s' size %d\n",
                drv->name, glue (drv->voice_size_, TYPE));
@@ -266,7 +266,7 @@ static HW *glue (audio_pcm_hw_add_new_, TYPE) (struct audsettings *as)
         goto err0;
     }
 
-    if (audio_bug (AUDIO_FUNC, hw->samples <= 0)) {
+    if (audio_bug(__func__, hw->samples <= 0)) {
         dolog ("hw->samples=%d\n", hw->samples);
         goto err1;
     }
@@ -339,7 +339,7 @@ static SW *glue (audio_pcm_create_voice_pair_, TYPE) (
         hw_as = *as;
     }
 
-    sw = audio_calloc (AUDIO_FUNC, 1, sizeof (*sw));
+    sw = audio_calloc(__func__, 1, sizeof(*sw));
     if (!sw) {
         dolog ("Could not allocate soft voice `%s' (%zu bytes)\n",
                sw_name ? sw_name : "unknown", sizeof (*sw));
@@ -379,7 +379,7 @@ static void glue (audio_close_, TYPE) (SW *sw)
 void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
 {
     if (sw) {
-        if (audio_bug (AUDIO_FUNC, !card)) {
+        if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
             return;
         }
@@ -399,7 +399,7 @@ SW *glue (AUD_open_, TYPE) (
 {
     AudioState *s = &glob_audio_state;
 
-    if (audio_bug (AUDIO_FUNC, !card || !name || !callback_fn || !as)) {
+    if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
         goto fail;
@@ -408,12 +408,12 @@ SW *glue (AUD_open_, TYPE) (
     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
             name, as->freq, as->nchannels, as->fmt);
 
-    if (audio_bug (AUDIO_FUNC, audio_validate_settings (as))) {
+    if (audio_bug(__func__, audio_validate_settings(as))) {
         audio_print_settings (as);
         goto fail;
     }
 
-    if (audio_bug (AUDIO_FUNC, !s->drv)) {
+    if (audio_bug(__func__, !s->drv)) {
         dolog ("Can not open `%s' (no host audio driver)\n", name);
         goto fail;
     }
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 516846eb80..bc39cb9b4d 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -543,7 +543,7 @@ static int dsound_run_out (HWVoiceOut *hw, int live)
         }
     }
 
-    if (audio_bug (AUDIO_FUNC, len < 0 || len > bufsize)) {
+    if (audio_bug(__func__, len < 0 || len > bufsize)) {
         dolog ("len=%d bufsize=%d old_pos=%ld ppos=%ld\n",
                len, bufsize, old_pos, ppos);
         return 0;
diff --git a/audio/mixeng.c b/audio/mixeng.c
index 0bf9b5360f..2ab22df2aa 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -344,7 +344,7 @@ struct rate {
  */
 void *st_rate_start (int inrate, int outrate)
 {
-    struct rate *rate = audio_calloc (AUDIO_FUNC, 1, sizeof (*rate));
+    struct rate *rate = audio_calloc(__func__, 1, sizeof(*rate));
 
     if (!rate) {
         dolog ("Could not allocate resampler (%zu bytes)\n", sizeof (*rate));
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 0edd7ea5fe..a0428881c2 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -582,11 +582,9 @@ static int oss_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     if (!oss->mmapped) {
-        oss->pcm_buf = audio_calloc (
-            AUDIO_FUNC,
-            hw->samples,
-            1 << hw->info.shift
-            );
+        oss->pcm_buf = audio_calloc(__func__,
+                                    hw->samples,
+                                    1 << hw->info.shift);
         if (!oss->pcm_buf) {
             dolog (
                 "Could not allocate DAC buffer (%d samples, each %d bytes)\n",
@@ -705,7 +703,7 @@ static int oss_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     hw->samples = (obt.nfrags * obt.fragsize) >> hw->info.shift;
-    oss->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    oss->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!oss->pcm_buf) {
         dolog ("Could not allocate ADC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 65beb6f010..8cf19c51d0 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -206,7 +206,7 @@ static void *qpa_thread_out (void *arg)
     PAVoiceOut *pa = arg;
     HWVoiceOut *hw = &pa->hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return NULL;
     }
 
@@ -222,7 +222,7 @@ static void *qpa_thread_out (void *arg)
                 break;
             }
 
-            if (audio_pt_wait (&pa->pt, AUDIO_FUNC)) {
+            if (audio_pt_wait(&pa->pt, __func__)) {
                 goto exit;
             }
         }
@@ -230,7 +230,7 @@ static void *qpa_thread_out (void *arg)
         decr = to_mix = audio_MIN (pa->live, pa->g->conf.samples >> 2);
         rpos = pa->rpos;
 
-        if (audio_pt_unlock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_unlock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -251,7 +251,7 @@ static void *qpa_thread_out (void *arg)
             to_mix -= chunk;
         }
 
-        if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_lock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -261,7 +261,7 @@ static void *qpa_thread_out (void *arg)
     }
 
  exit:
-    audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+    audio_pt_unlock(&pa->pt, __func__);
     return NULL;
 }
 
@@ -270,7 +270,7 @@ static int qpa_run_out (HWVoiceOut *hw, int live)
     int decr;
     PAVoiceOut *pa = (PAVoiceOut *) hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return 0;
     }
 
@@ -279,10 +279,10 @@ static int qpa_run_out (HWVoiceOut *hw, int live)
     pa->live = live - decr;
     hw->rpos = pa->rpos;
     if (pa->live > 0) {
-        audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock_and_signal(&pa->pt, __func__);
     }
     else {
-        audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock(&pa->pt, __func__);
     }
     return decr;
 }
@@ -298,7 +298,7 @@ static void *qpa_thread_in (void *arg)
     PAVoiceIn *pa = arg;
     HWVoiceIn *hw = &pa->hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return NULL;
     }
 
@@ -314,7 +314,7 @@ static void *qpa_thread_in (void *arg)
                 break;
             }
 
-            if (audio_pt_wait (&pa->pt, AUDIO_FUNC)) {
+            if (audio_pt_wait(&pa->pt, __func__)) {
                 goto exit;
             }
         }
@@ -322,7 +322,7 @@ static void *qpa_thread_in (void *arg)
         incr = to_grab = audio_MIN (pa->dead, pa->g->conf.samples >> 2);
         wpos = pa->wpos;
 
-        if (audio_pt_unlock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_unlock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -342,7 +342,7 @@ static void *qpa_thread_in (void *arg)
             to_grab -= chunk;
         }
 
-        if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_lock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -352,7 +352,7 @@ static void *qpa_thread_in (void *arg)
     }
 
  exit:
-    audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+    audio_pt_unlock(&pa->pt, __func__);
     return NULL;
 }
 
@@ -361,7 +361,7 @@ static int qpa_run_in (HWVoiceIn *hw)
     int live, incr, dead;
     PAVoiceIn *pa = (PAVoiceIn *) hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return 0;
     }
 
@@ -372,10 +372,10 @@ static int qpa_run_in (HWVoiceIn *hw)
     pa->dead = dead - incr;
     hw->wpos = pa->wpos;
     if (pa->dead > 0) {
-        audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock_and_signal(&pa->pt, __func__);
     }
     else {
-        audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock(&pa->pt, __func__);
     }
     return incr;
 }
@@ -579,7 +579,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = g->conf.samples;
-    pa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     pa->rpos = hw->rpos;
     if (!pa->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
@@ -587,7 +587,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         goto fail2;
     }
 
-    if (audio_pt_init (&pa->pt, qpa_thread_out, hw, AUDIO_CAP, AUDIO_FUNC)) {
+    if (audio_pt_init(&pa->pt, qpa_thread_out, hw, AUDIO_CAP, __func__)) {
         goto fail3;
     }
 
@@ -636,7 +636,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = g->conf.samples;
-    pa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     pa->wpos = hw->wpos;
     if (!pa->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
@@ -644,7 +644,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         goto fail2;
     }
 
-    if (audio_pt_init (&pa->pt, qpa_thread_in, hw, AUDIO_CAP, AUDIO_FUNC)) {
+    if (audio_pt_init(&pa->pt, qpa_thread_in, hw, AUDIO_CAP, __func__)) {
         goto fail3;
     }
 
@@ -667,17 +667,17 @@ static void qpa_fini_out (HWVoiceOut *hw)
     void *ret;
     PAVoiceOut *pa = (PAVoiceOut *) hw;
 
-    audio_pt_lock (&pa->pt, AUDIO_FUNC);
+    audio_pt_lock(&pa->pt, __func__);
     pa->done = 1;
-    audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
-    audio_pt_join (&pa->pt, &ret, AUDIO_FUNC);
+    audio_pt_unlock_and_signal(&pa->pt, __func__);
+    audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
         pa_stream_unref (pa->stream);
         pa->stream = NULL;
     }
 
-    audio_pt_fini (&pa->pt, AUDIO_FUNC);
+    audio_pt_fini(&pa->pt, __func__);
     g_free (pa->pcm_buf);
     pa->pcm_buf = NULL;
 }
@@ -687,17 +687,17 @@ static void qpa_fini_in (HWVoiceIn *hw)
     void *ret;
     PAVoiceIn *pa = (PAVoiceIn *) hw;
 
-    audio_pt_lock (&pa->pt, AUDIO_FUNC);
+    audio_pt_lock(&pa->pt, __func__);
     pa->done = 1;
-    audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
-    audio_pt_join (&pa->pt, &ret, AUDIO_FUNC);
+    audio_pt_unlock_and_signal(&pa->pt, __func__);
+    audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
         pa_stream_unref (pa->stream);
         pa->stream = NULL;
     }
 
-    audio_pt_fini (&pa->pt, AUDIO_FUNC);
+    audio_pt_fini(&pa->pt, __func__);
     g_free (pa->pcm_buf);
     pa->pcm_buf = NULL;
 }
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index e8d91d22af..e92135bd2f 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -277,7 +277,7 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
             return;
         }
 
-        if (audio_bug (AUDIO_FUNC, sdl->live < 0 || sdl->live > hw->samples)) {
+        if (audio_bug(__func__, sdl->live < 0 || sdl->live > hw->samples)) {
             dolog ("sdl->live=%d hw->samples=%d\n",
                    sdl->live, hw->samples);
             return;
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 341eec3121..068a595732 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -139,7 +139,7 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &wav_as);
 
     hw->samples = 1024;
-    wav->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    wav->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!wav->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
                hw->samples << hw->info.shift);
-- 
2.14.1


