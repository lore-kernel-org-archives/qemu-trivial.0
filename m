Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAn-0007at-Hp
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAk-0007Xx-K4
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAh-0006nF-K7
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:50 -0500
Received: from mail-by2nam03on0075.outbound.protection.outlook.com
	([104.47.42.75]:38951
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAh-0006lI-02; Wed, 20 Dec 2017 12:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WXbfomMzgUB2dsNmIA+9dHKHGrTJafu1ZAkzBn0NHG8=;
	b=LPgze2NzN4aUlYj9yZe9Q0H4K3Vo2nOfrrVbDahHcXN7cju4lwuEOkCOgTMzFJX+kiyRRGzvMlA2IGQltw9lOMvkfjXbgIOO6MTvb8fUG/pjieb4kORzw0EMHQ/GrmxIgCzMdpRKCxX+J/9t6AF7UIRKiW3GY4A7dbFP+N38RtA=
Received: from BN6PR02CA0082.namprd02.prod.outlook.com (2603:10b6:405:60::23)
	by DM2PR02MB1338.namprd02.prod.outlook.com (2a01:111:e400:50c8::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.323.15;
	Wed, 20 Dec 2017 17:28:43 +0000
Received: from BL2NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BN6PR02CA0082.outlook.office365.com
	(2603:10b6:405:60::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; moxielogic.com; dkim=none (message not signed)
	header.d=none;moxielogic.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT005.mail.protection.outlook.com (10.152.76.252) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49826
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAb-0003sH-Oy; Wed, 20 Dec 2017 09:28:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAb-0003kx-M0; Wed, 20 Dec 2017 09:28:41 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSUHQ008386; Wed, 20 Dec 2017 09:28:31 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAQ-0003im-PD; Wed, 20 Dec 2017 09:28:30 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Anthony Green <green@moxielogic.com>
Date: Wed, 20 Dec 2017 09:24:12 -0800
Message-ID: <9aa072d1fc7269e42020cd31f4716efd71261187.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(47776003)(63266004)(77096006)(356003)(5660300001)(305945005)(118296001)(106466001)(5820100001)(8676002)(36756003)(81156014)(2870700001)(8936002)(2906002)(6666003)(81166006)(2950100002)(9786002)(106002)(39060400002)(4326008)(50226002)(23676004)(7696005)(316002)(36386004)(76176011)(50466002)(54906003)(478600001)(110136005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1338; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT005;
	1:9DwxgRdihcZbv3PT1/R+TXI8SddcT5E6Xx6YEV4tW/uF5c63YRn2f02NPTPfhQ3RsPNZvG7e4EThOBrMlUl4V2U930pY1t08NLmc5o/e/TPpguU+MrUP24RI6XfDYSRL
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98a7a7ab-7070-4100-152c-08d547cf1df2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	3:LcuvBT26BzqaLEIT2aFF+dVwzTGnbzoERsOKYcrlKRjHmyRqayrvHV4i1vxmfvrb7ngFVp7dgoOTecKtNboYYYAtKfyNW4Y+nAbFkkEO95w8RFRcRDAUO/ZmgwCk/4/MtyfzMRATJyUziMtGZ5A9w5vtKNhe3QMG0yVE4CCUDh6iaZg0HnhXCR0N4OsmEvuSDvXJtaECgFOGHv0btsLfxpRUP2fyqZFr8946uJpOmYs5hBCbCZ5gO9vrUmUaU4YXLhHgPXtA2GIhZtoBYj+hE17VPoUZ4rba6luQ8yCBYNfrjZsU3AoBQp276I15wRCCqfmpQgyxXT2eyboCFuC4jS47mF+AcqUECe80YkntAGw=;
	25:DxpJYaWmg4l5uF1wNqs82tzksjNkLWAkZintAn06hPUa8sfIM/JHLx6HaJjszHh11KnmFI0rxsqe5gnjQDBoB76rtWatJAOy4eFgQfKdH1BqC+QfGbk21wEkaIgZ+Cd8H3OA5Z3thTbzDAOPMR2aT5CpULxvxsX0j/9dU+Tb8PY6jioUW/WrwQMv/CUMgPAk20y+N3L7viRLvn9QddXh2DQu/P19f0Y8gcim2PjInpFShHTfU6ROp3tPLrP1uClw8nsByPfb4Wvz50KOVxfjZ0ZuR3ePu35qT/ppKNHALDsl4aebOUQOSjB9SODmMUWMX7zkWSyx9ChgxK2NdpghudML1MH5MhDivLc8/LSCYZw=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1338:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	31:hN1tx2lFIvGhDIzJfdVXHP64FKTVuk1i8p0uCqNBxKBH+GvFL4BM0ojui/Tt7NNKVP8Vap7FZW+BfY5dWMC9QUmstJafu/Fc/ZNAqWDbGvzkDIJY28lCiWw3Ok40jEgYZFNEo6+4cSPhvBUfHJXXizBljiAfkvW4bH9PykkYokJ4+ntfiOpHez9dLUOxtDnPuKcwB8+qu7YmAaxMBU6oHBZpPbP1KjMOCz7ZoEBGgpw=;
	20:Ufvh9tDuFKxDBKzeCGlYx+/l65S2Za5zq8qMQRkrJ1N4kRxfev5iFDaV9DlqONTaMQ5oUxw+bvBpjtMBv2XqOLif8Bg/tJesqZXIO3ZKbkMNaF+WOf/p8XcIip6UUj+7O8wGw8o+5UF49XZmZK3tuO096PkTOyLAk8n+fZyG+SYO09atzLsF4wyw74Bj2qVxcjo7mid1XxWbmB3di4EKrq9oR//pEOymB9O5ZwvAfRdiQYDXFejK6HcaO3iQDKqUka87QoUykQvL8quSD7gnh4YSlsx6t6ZVMwH6cn3AyrUZ837SwdX5hoE/anU35fdfV7JHosk3N0Zgr7vOQCCvkVraXpQ3rxZoYG8kxxbVPOf2i8R5u0XEML/qdnLd4BMYug3POxoPexSNkq5Hj8B/MV6+gljQ+Sv7sn95hWtP1QDAu2sip0saAwY7ImC4+g2lOQHNe82Z2ZRoc4ij3+Yokj7jOBXn098WdT8SKjNXtnTBsN0Bmtyyd/rI43PJwyP0
X-Microsoft-Antispam-PRVS: <DM2PR02MB1338C6A4FB52ACBD5DECBA99DC0C0@DM2PR02MB1338.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231023)(93006095)(93004095)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:DM2PR02MB1338; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	4:AMXtyEx9it/PYKYA8G/UATrUQrdSFs8CaZJG2nBRux8kCzNx1QH2Wc4YtPX3q/E+QJnUVXRnwAtIlnxWiUIgTrrkRHWQcVW7npXZ4ZDtathph+CpOeHaPI+Dd6HbdSpXdW+NuqcfTzcWoJTdFSeypGG9EnS2iNKFDN4Y5M/28fz2pZ9JEqAvxFEuECCnnZRFcOw9BYqYgCX+buBNl5nwaDb8Lh4YqKDfndN10FoIyuenhGZpxOy5XPKovouA8l0SpasdJzLLHOAYW3H+p7DOF8VU0IW1/TRDEWFPy6RcctOQZuccjV8UYFW3WBzCZhuedlMK1ZPRtcZ+j0kuMkz/8A==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1338;
	23:Jt2VehMlG/1gLGS8/1Eo/qjnahTzZc14LHCyXSWZZ?=
	=?us-ascii?Q?ZsdVuQtwr8PGKH1eoSYyocpiBwHszinJlGtHOJMdY05soQrKuas4nBYWzjxw?=
	=?us-ascii?Q?Ehr27sKj5U1wzcVvNM7Ws9GLcg4eczLJ24WhFcbPQfVzUyppmLjGi23xDoNF?=
	=?us-ascii?Q?WtKFJAV4sM78RTBbtLT9jlKnK9uprbw1qT2INzV/TlRBcoldXkybXxQ3MR5p?=
	=?us-ascii?Q?/NjYml1Ej8OdaKsERJHZ4mxHFkdWBpyW6cSGW7V5O43w16EguWEZ71mRSOkH?=
	=?us-ascii?Q?XV/JJkoJnrdd4tjZ1huMPEZo7XFy1wBbEK4YmBJ25zp7WWIhwYU+R5pqCBlA?=
	=?us-ascii?Q?SQGH0K63wgYocIqqs1U563iDYhNF1878vbcrE0LsAAd6rxYalQw2v7qC+BBr?=
	=?us-ascii?Q?2SGnMwrRKY90PuS9i1VPFU69+nrVxkh4Ur47B1+A+R5wFjKSP8QG5to/or1P?=
	=?us-ascii?Q?klysuGE7xhSF5QUSa0yblrzAkpEROWs04P3dgSS9ZQzWbjboKZEghPQh3UYU?=
	=?us-ascii?Q?jecF26+or/VolxWsgX7CM0RvwDJk1zrIfXRVDX9hVGE6p37xQ+Tv2IyQ8hsM?=
	=?us-ascii?Q?40DKB3Fa8kwTeOQJgSY6dGAMbcNi0d2nCk77L9hQ8yxLo2TQKMkbFCL55BBm?=
	=?us-ascii?Q?0XSNGk70IcsgyAxE/+Z+g/5ogGV/V0IUdsw5ze7mRmGu2t5PKdZ1qHeRNQrV?=
	=?us-ascii?Q?fuABFY6lsp+u+aevXz8zQAF610VrsBpsjEMzlAEfCgcpemQRj7EHcUHCaF69?=
	=?us-ascii?Q?iOcr3PxF6wHQj12K80dGNtZOB9xHBcBs4ejjSiPg16fo1SLPy0tZt2Lk/x+Z?=
	=?us-ascii?Q?8UR5UPTt5KhTjsnGvXeDX2EItIqybLfKs3fdWmdOmwiVTCv88kpvenRyjmrY?=
	=?us-ascii?Q?RKhArB6T2Pi5yCcbvZ6eDTxlEl3puOVZa6yb5pv66txWIbTyShIXa1c/j79H?=
	=?us-ascii?Q?Z7sFHMSxEkqdhzUVjyiwBycJ8ZD9Hre/Fpf98yORRbvlpkkNPZUrbJW2Cf2v?=
	=?us-ascii?Q?Njg6hzkw6H9AqUngcu0AJsYdPySkcS13iYe2vyzMP7AF/Qhof3e8RpstZNs8?=
	=?us-ascii?Q?DEVHek=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	6:oHUUG5kA9jTi2T63HdLGrWQkkq7iK7xypxNdSfRDYteVGaobp6SBx5JfIAeVGejbvsSl6Dj++cbpN+1iorZskAGH8cEX2stEJJvwt0LVelqh+0Vy7LCT51RAQ8GhocpTimbQ6gj4bq5/gqLjiU0X2Zq6R6T/XafPwdNpIi7bcQ2KFHx1EzqJfQvKyWPrBnqjLkCpQy0kA9+FpPP7auL+U/zEHZj3EPOM04AFKjqxAq5LdjW8VUFFiPmJS9iAH7h/ja5ldxbM0VJkGYryHSUndlEqgWEDoJq1eBza2as9uj6DKI4rhpu1VrXi41S/AH9coHb6OBJiOKj76qOKfRkPO5QMKTI+zG6Xm8ba5dJXokM=;
	5:IeQBEZ/XGsbpgScV5exeY9ILmaDqo4VTiqrxK/MlFfhXx/RznrjZkS45UXF7gJlwJlYCEcqBeH7R6KtySzXvKTPBP03laFYHElt2PNr6N+yJJjJv1ULM8NbmUvYCgLAN66xZC+L1lSGOhn+EXpF8+S9U44eMlWYuivVbcPCVNYw=;
	24:xFmp/gpK9cbz2+KhKXEJQPqqFR5v1dg4QaEKxHuRrv38q6BqWJuUzTX4QaeC5s9MuWnfFaGuS9W4OpUOEqiePX6p332XXw4SH5KQd7t9PbQ=;
	7:6i8jwaWiuj8A7q5YwitLHwLsjpGeJUSBofCARwgaFQzf7qhlMFaPjCghSY1VSNQZnOFdl55KE9vlYPfeSAPgHSbtWVj2DxKNE2iKOYOICKECjjpGt7VDTpcjYB1Thzoym0Vza1fSG/q35sdDp2GKVw3qcvl3JBy/pvs6D5Ku8zPrp+Q84yqpWzfXqiy1/qcAbhw9WKXYPIh/XxWokXjHdT7R+Vx0HkYFW9bx+dsmOWlS0pZilXXs0MbvAQ4eGHMW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:42.6343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a7a7ab-7070-4100-152c-08d547cf1df2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1338
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.75
Subject: [Qemu-trivial] [PATCH v6 15/29] hw/moxie: Replace fprintf(stderr,
 "*\n" with error_report()
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:52 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Anthony Green <green@moxielogic.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
V2:
 - Split hw patch into individual directories

 hw/moxie/moxiesim.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3c3ba9d8c5..4f8e84a149 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -25,6 +25,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -60,8 +61,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
                            0, 0);
=20
     if (kernel_size <=3D 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                loader_params->kernel_filename);
+        error_report("could not load kernel '%s'",
+                     loader_params->kernel_filename);
         exit(1);
     }
=20
@@ -74,9 +75,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
             initrd_offset =3D (kernel_high + ~TARGET_PAGE_MASK)
               & TARGET_PAGE_MASK;
             if (initrd_offset + initrd_size > loader_params->ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loader_params->initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loader_params->initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loader_params->initrd_file=
name,
@@ -84,8 +84,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
                                               ram_size);
         }
         if (initrd_size =3D=3D (target_ulong)-1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loader_params->initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loader_params->initrd_filename);
             exit(1);
         }
     }
--=20
2.14.1


