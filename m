Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNo-0002AN-Hh
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNl-00027q-R6
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNi-0006uL-IS
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:09 -0500
Received: from mail-cys01nam02on0058.outbound.protection.outlook.com
	([104.47.37.58]:13120
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNi-0006t4-9h; Mon, 13 Nov 2017 17:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2y/qtDdnIb4vnoQ0y+hbz7TjtdSf+BtmCQbNIDVDax0=;
	b=5AUThQOW9Kws0XOrt6Xb8pQw1JYCh3j/fDJZnV2DteaWMsHlc8uG/8HGWiu9u7xY1zUzIeK5OuVEkocDwVF6K9NnAkGallhAScKreOFoU4V5dCD4zcjC10mAEtT//J2XQwavejLDecqAIiCvnWhSpLgBev7+fYvkuf+/BBew+7A=
Received: from BLUPR0201CA0010.namprd02.prod.outlook.com (10.163.116.20) by
	SN1PR02MB1341.namprd02.prod.outlook.com (10.162.0.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:03 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by BLUPR0201CA0010.outlook.office365.com
	(2a01:111:e400:52e7::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=temperror action=none header.from=xilinx.com; 
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNc-00048v-Hl; Mon, 13 Nov 2017 14:39:00 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNc-0000Md-Bk; Mon, 13 Nov 2017 14:39:00 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcs7w012485; Mon, 13 Nov 2017 14:38:55 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNW-0000Li-M5; Mon, 13 Nov 2017 14:38:54 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:34:54 -0800
Message-ID: <96f96c11a00a303f4dc8c1fa7331470736e0f221.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(189002)(199003)(5660300001)(118296001)(106466001)(305945005)(189998001)(356003)(8676002)(2870700001)(81166006)(81156014)(23676003)(50466002)(2950100002)(47776003)(63266004)(478600001)(36386004)(8936002)(50226002)(106002)(4326008)(316002)(5820100001)(76176999)(50986999)(36756003)(2906002)(33646002)(54906003)(77096006)(39060400002)(110136005)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1341; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:02TmbouIWasCU7sv378V/jIeBrRkYuqAIfIHhtirEIFqOMUVxq+nLIbBK1VKAzKoUU4wFsVMsKfhlaFmxVSv++W1v+fQFvVfpSkaWCn4D9Wb8IREFPt3dkMcz+QHy9BN
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f98092e-5a2c-4d99-f158-08d52ae75663
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	3:wrkBkyexR7ekz+W6vg5zN9D5g0dg9uMEwLssatiCHDkrkWTs1Zb+S8Ai4SdWgS+nzbAKAI1Smbq96oLfqrEijGFwzJreIohVrjdewWcvSnghcbyW16Mywp41iHWAZYEFjL4CM8EaBFMzn5Air85HUBhB6JBOHkQXcK/3oN10qLW+4/yTcyQk7y5BIdGMVmHqFJ3cfB1ABlFGFC2PeN7sDlpQtlkxxEvwDOVz7WvLn6kdzELfFOsZTen8z3LwtW1lfAysdQuSUWJAGnGPICkjPgGAKbeYXy0F0eq1TsXOl4pxB8CQU8WqbpBo4njHPuwo94g0vD6BbXFvn0QEoUqSh3KKZs8LWgUa0wpNXoy1riM=;
	25:bFY8P9wrcqvlQXdDgGycAlZxK51O1vbtfwYdNhor5BlE8PMNllRbwavH8G9T21XUOKRUWOrTs9gnG661s67OY9qmj9p7bLTcGT1mzStNLKLWca4/E8TcGb4VX0EVv4wur8kKLheHsr+TXLtknhxnMnMFk5pc/Ca8VrdpekgmvQDpDmXeEw9kgks+jlIyj+sNVccKr4hd5Vkr87+4mRSabZ/KIeVtueIgs+caXVloZpjYwdH41Veh02v4TBppLMTjiJW3LlAfmYOJ2nPpxlfvk779DpS8+tOdhSC/Lili9VrgIH4caX6mKtDocCMXPJ3cOjMuorv9/ic0EXKsWEuwHIQyPr9bAqo6B5YHRs2CZU8=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1341:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	31:P2yd4QOXuWD4smRsMqiWNGfadnM2lxQ2ogfypowpyRsKGZIPK28+G/ujilrk1tl1AKGN9ex5Pckp+yS4B/q9tlQz2F4zZOARj/PF1kj4ieljeRzNzan3BNRy+adEg4yJPhEmzyQtdl9Kib/yPrkSEslq96SHEKvYK8UxrLjX5InSzvbPLqWgDdaTL7ZNxEgRglltrRCPywdF13y7fznuAf2rMXxU00R8U+i5eh0cmTs=;
	20:adMH88DIdmNtLdGZ+V7Wfn7zse6WsT3XnFWCccJJJJpla/8Ko9r/rHFKPwX3d1DcCXlV6kQ/M4UQCxrab5PgLrIPhFOGVrWKYrp5cXQXTwK9Bc+RUIXnFPwiegverJHZFkiuV7sH72XSsm1xH+NS1Mc2ypPUXdA/MJ4zqoWs82vlcI9hdrQm6LIu1Lk82mMst5+kp/Ma6iiDLw1nw9sbbMaNURsdgM6G1EidQvh2iYsZcCfgezpvJD164o0fJPKyi3vmy9UR9nnN4iZ1CJ6Y1iCf03cf+R+w+jAzvO4cyDq04vQx10VCy/yd0pJSwmKXXWA9OPJRNmOBxDL5AbtlOq8ESr42cTexsw536cw3AfZUbwKga4lkx+W/u6HbU+vIpOZMeT3wJ0+l2L1Ulyqe0Lz0q5JKkDJ3DONxyMGpyJs9SLn9OuxrXN0FVH7OJFyY2BKNU55ZlF5kgyTLn/oCnqi2TVC7GAsYaSsn3zVh7bkPFQfJLeVv3vmjWJJYMKTS
X-Microsoft-Antispam-PRVS: <SN1PR02MB1341B0244379921C5770191DDC2B0@SN1PR02MB1341.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(3231022)(3002001)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:SN1PR02MB1341; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	4:APJgsD5ubc5jyQXqHBSDlFirOqoo17UxLZfcjUpjwxmZ74qPF3GqUq+ebPQ6lCYDEvzQPWtfCrMLkNd4C4gdfUnojdJ57zM3CAMtfdJl1mcLSYQUA0PsElKeMLfTzuMxCu2gJPcvHjuEO2y1uTKFoG8Mw5ebZTJE3APgxGebhXvY/q/MKfj+m4N3dztgHOqr38BzRxKbaoWglNL2fktvz/azRMWX86EYVZovSvHpmyAbdno9ZS1fQkHeCxgB+F0Rf+M+VC79WX/SbtvX6HgLQeNXs0XKPm69CF0tiHrUiUXofocMAgXe+ewhxYma7KDW3HLxMmA/pz1U9M7mNMJE5A==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1341;
	23:mT/X9QhvYnBZgSC24rXaFKolMGlMaey0swNOjmEq8?=
	=?us-ascii?Q?ICKx9W30Mrq1QSC/z5jvG0B0xjpftQrM6KW//v5aTuaMc4AzD3LNi/cjB1mO?=
	=?us-ascii?Q?uv53cIlcKS0KEZRQJUh+BVosFlbWHNiXHbVFyLbVjY8H2Mi3USm3Wk2QOZ+e?=
	=?us-ascii?Q?IqT81NviHnaOJa3brrUxvvS4RW8bQ7mafQ+mP6XrKs7M0Ao4EGfwJQPXNrU2?=
	=?us-ascii?Q?A1Md1bbEVA5HCzn2tKJo3F+ad9iXKf7OdvLW4IchpTKSxXsmo8GA6vwOHQQl?=
	=?us-ascii?Q?/XcWFY20hrk/yZ4jjzW/8k31AB4TuDwtKFzzaZylX+Fj4XV1XThXp5M37Dq9?=
	=?us-ascii?Q?Z5zDRHsZDEuKXmZu6T307VL/+J4UYU1oGuxOA82byy6VlUenVh7wGRlcqdYk?=
	=?us-ascii?Q?HinI7c/cfGmUxtpbPKH+ILLW2XZwzUe58zcczW8WwRPi3nmj/7zkREhC2JeE?=
	=?us-ascii?Q?bwoCRztlyhVj0AdyXQwzaXjSmrI2UXVj2UZffUGdfENzu4yiNYLWtn0gtIRM?=
	=?us-ascii?Q?lZIx1AjfMc6JmnKvM5Qua9ShfEiypZD4m/v3fiZgl2UQ38RHorhzNNCbimYn?=
	=?us-ascii?Q?PMQC90iWF3V37Et3SMaHXqb9RRsB1EnyThYaMVGKcCURN2VIRz9Gx2ph8Thx?=
	=?us-ascii?Q?CpTRb3qJTjB4EEnWCfzwSfdfRoTHKn/tEeAsizcGRBcpJqJsX5+1xVwQQKoT?=
	=?us-ascii?Q?d21MtyifvIzHjbaaIfA6hp1EyeLVfgZWFZklkvJTj5vwZ6TFKpMaxgc6pval?=
	=?us-ascii?Q?W4XWJZkxCPwmkB41eVAcHL6Lw8DlLveKJkI46UgOW6utFawe11JwLw4SE5/a?=
	=?us-ascii?Q?r3VIzFL2L6z9ZPm/V6M+XvZ1zAev3WorZY0XGbv2tqb/3N36G1mvdSm9HQ8X?=
	=?us-ascii?Q?Bb660T4AJzB9QTlvIeVosM0reQ6zSAq8BzPoPNYNWNB0RdMFEroTXSw0Q0Dk?=
	=?us-ascii?Q?FiabA2BYVIhvdBKdrgUWW6yqRCQSA3SGsocwBGUKpZomUJIPPjUHS1cPStXx?=
	=?us-ascii?Q?6xdv6QZQStXoQ51/TBghxsR?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	6:nfHN2+nPzXKG3ZihzJBQtHVGS5jNQYfM0tRrvFLVdlTit9/U9oTegSjwWvEPIUSCZUXG5I1lKTEU9UPmV/I+yDyc6PWB7Wp0V8NS6+LcSD3pgRWAvVXIGIwXaK2JU172t1dCbFNg6TdmxEA4+bFk/3FQxJmH1QYKMhOxcIUQlHHMihwUlzyJG4ZvCzcUij2m99EHyscXpeJrLewNwo/eYttRsuwO1SrVvOyO8ICyFUcLbwFOiQcHdfE8PPdDITcW8rU4I1IfNmI7l6BCB3aTWqz/20Xmldpi2lEhh2F89z8VTZXHwBwcZLrBxans7CYwI22x5YFJ0WJq+PLlQnQlOrlRwSq/hx3I4eRH7V8K1b4=;
	5:JnIB5NANpcnwFsLqRN2EpAYFDvtiuxvKeUl/27/GbFRD08bNVaY9C8PNQq72kd3TQjzY1Rik1Y3w9ooabch4mT9vXzaDp++dyVebh8BeSpbbjmoWgfuGEAhUzhBwY/u9bnAeWhRn62cWO2Yxz02FGLs1S8B/4dPxpGRynaZmdHU=;
	24:p0PD7W02MHhMniFw5nHV4XcVmTO1zjT87qwl4qYqvZO65dlz0wyp95xxM6TLyGDd5dRjTg6/VheVE629bEDtxs3mZaQg9WdJbynq8R8JcnI=;
	7:YMwt6DNXy5Zz2Nn1LJWWx/GOhF0aBo84SSy5MZYaHyUBqnkBQUo2XFV6kfZxIBdPxr2KDtkDR19EpvuZETHSKetxGRNUtAMhOjB8Yy/ZrfiCYcCohmsC5hFbY3pgRZs0k/KoPX+t3ui9tWxH8T0d6W76egZUVxmiOkoB5YFTsYwvk0Prg+5+7tqHa7StUg31IZA/oGNsyvkP42s/frARHKKq/bh9v2DLkkWiPSzJ+E4mhV2mOYRS5OM5dY7qM5Fm
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:01.2839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f98092e-5a2c-4d99-f158-08d52ae75663
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1341
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.58
Subject: [Qemu-trivial] [PATCH v5 06/29] hw/gpio: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:11 -0000

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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/gpio/omap_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 08472193b5..57aa2e54f5 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -399,7 +399,7 @@ static void omap2_gpio_module_write(void *opaque, hwadd=
r addr,
=20
     case 0x10:	/* GPIO_SYSCONFIG */
         if (((value >> 3) & 3) =3D=3D 3)
-            fprintf(stderr, "%s: bad IDLEMODE value\n", __func__);
+            error_report("%s: bad IDLEMODE value", __func__);
         if (value & 2)
             omap2_gpio_module_reset(s);
         s->config[0] =3D value & 0x1d;
--=20
2.14.1


