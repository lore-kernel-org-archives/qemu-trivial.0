Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9b-0006Pl-2s
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9Y-0006Mw-J9
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9V-0005B2-Jv
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:36 -0500
Received: from mail-sn1nam01on0076.outbound.protection.outlook.com
	([104.47.32.76]:45028
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9V-0005AQ-Ck; Wed, 20 Dec 2017 12:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2y/qtDdnIb4vnoQ0y+hbz7TjtdSf+BtmCQbNIDVDax0=;
	b=UkA5NBRolAsZDAW8MmAYLig7v5P0HKRcV8+WO8qZb4mZVNQD9oakqWxm+aMwbWONvauXsTGHsjo8rLrRfmm1apIn7+dJFe0Z+DMY4fu5/D1NF+ssnkOYsbky7Kl46M/7wkn1rX+9cxq/S25gVjbjRlIBtVqSiWKPFsJPkPCKHpo=
Received: from BN6PR02CA0102.namprd02.prod.outlook.com (2603:10b6:405:60::43)
	by DM2PR02MB1339.namprd02.prod.outlook.com (2a01:111:e400:50c8::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.323.15;
	Wed, 20 Dec 2017 17:27:30 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by BN6PR02CA0102.outlook.office365.com
	(2603:10b6:405:60::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48736
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9R-0003qZ-HF; Wed, 20 Dec 2017 09:27:29 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9R-0003Xs-F0; Wed, 20 Dec 2017 09:27:29 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHRQdE008163; Wed, 20 Dec 2017 09:27:26 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9O-0003XV-4E; Wed, 20 Dec 2017 09:27:26 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:23:10 -0800
Message-ID: <1bf2b45441c9104a838d35c58971c0270c480e59.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(396003)(39380400002)(39860400002)(376002)(2980300002)(438002)(189003)(199004)(81156014)(54906003)(36756003)(81166006)(9786002)(8936002)(63266004)(50226002)(106002)(8676002)(2906002)(2870700001)(356003)(7696005)(77096006)(76176011)(23676004)(5820100001)(316002)(47776003)(4326008)(118296001)(39060400002)(50466002)(478600001)(305945005)(110136005)(59450400001)(36386004)(5660300001)(2950100002)(6666003)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1339; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT027;
	1:E7601vfBO3rv62sHoyKm5ptI0r1Zu094PfSQ/RVsp6E7tyWoS4nQ4/rSw/BFD7zdMyCw2+CL4cm8a09/rWj8HdyOA7gchH34C6DlraQNRlKbC6BoD7f9mqvnG+YvwyeG
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6177f400-b3ef-4821-7d09-08d547cef28d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	3:r2cnxVKmsQVJQM2i+RSgpmnprMGTAO4Iq2ONZICya45jDB1ST48Ol8OHkVcI2zv3geRBTfrPPy5KjcjdIOk+Q6vOWZUE/9ncMVjc0wdL2bpxdpzRtwbRd9+yAG7ANeA+nkFJE4+e2jA5UO5jOorTrXauJIQl+lBmEyFWwjUXX+laEXKNkhgpz0R9QhYr0BYwOLmqqYaTF4RvL7kdiKxCXADU35Z6ZQRocO52FiuJCiAyCV1fZJbTYA42C6aek/yYSjEiAp4HAtxF5vmeW7j59reOv7IUheIAWWQs31yCBL5NRZizJv1klG5fvo382odTNnBKyUXYWr4J1cWGhr5AnDdFszyHvvOHi8aegBszxjU=;
	25:UGM9X3HdoumN4zqmx0rDWiDDKA4cBhGPts8LWEcuonf7WHanBH/FcDpNih+kmAQ2LLVGHxIKD5tJoNMUZm5/6FUoJS14XzO5/ysKw8g0kzmDyABR8SyoT4jCNo2urj+KK8EjLzRaMA8A8LTaaQ53Kuz3yl733pa4I8ikdwTJ2ndOSUqvAKPKFdRLr+AaybzIRc8tmUstSfdkr2v/91Bwfwhv7u5eZ9wl8cdecjtrjFmO73WXvK3Wd6c6RINl67KXIZJyIjgX3f01643bQKx72rL86W0yJGiXMkBQi008Ym4FN+G09GhWsclV4DP6N9MzhMOByKMYKFLNz0cOet8K8cxQtuBSFLoHJ1JPpSWGi1s=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1339:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	31:I/rWPdqOgZVCZ/pXFf4XUdVmoMzCFSU24Gg09rmfLfee0afinhJvlrQAiS2gh/Pbt3m4SdMq3iD/o1/7MnwwCHOaDtAN804LrS5jv27QKFZqgHwcuF4YiuoENbbNNWv0fhpky8tuO3KBxGJdSDWqPDWHXi/z/uliBF0VLvB7EcjJ/yX4plGPuEL1ycg9p8PQqR1XNqB/ks8sg+tRs/jLq6n6CXYSBJhRWkQBwnmMTD4=;
	20:tcMqHZitZ8urMNgRQMvCUvlfyHIRFtAZr1qxWvRC7o2MZKCkrwM5nAx9VPsbvkAKaQemOnCIEfbE1So+gYW+e2E72Z2qw7ozGIgZXETdvZ2kjNuHe3RaZPF6eG46teJMUW6XfSdeUD5LlJKpsuTHNgWfzST6szq1UPblq9TEXSfXq1Sh7BiodRgQWKNjbFOP4614MJZDP4wiP1XpOmiFzp58zMQ5wDnRNwiJXyQOQN6MH7+qDMhEzyI5TO3ylJO77+jxysXPgITZi+hZS+aUEatdVYS4GYh+TT9HAG1OMj3ejKShmZkni26Ky5F/+HEgoTCaiJDfpC0wijZ42O6L/jqunUmkD4nz3O/EH6ltSocWX8UIZKX3tw70FgtcApA3eo4qjzi0JzXeOeKLQ9ZTf5h89MF/JilrKqrFS0tluSiVKqmlgwe0IwELARAY1ZelwL/9zWO90hqom15u8j3YE5gQL5lNiKa30zawO9I0vPG+0X310Ig0/0GnlYMxQpaM
X-Microsoft-Antispam-PRVS: <DM2PR02MB1339E0F36541A1E202431B1FDC0C0@DM2PR02MB1339.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3231023)(93006095)(93004095)(3002001)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:DM2PR02MB1339; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	4:kZVvMSokdfBn7vlTAzF6ufQux0kWuR0P2BDybCEntmwd8snNWsqMwmo9nUQ30aWnRvU2V//Kjkzw8eow/usBvlncedi5WBNxMhfgiQkZUg14Nm0VoBngHmBhWwyki4NDCUQn4pARtomSAx36ckkaOxebrE5OG7q62q9D6ZGWlZnfgsNW+NhnKPWg+YsB6O8/0OgQ4w4hGvFiTAubFK+5tTShGtgdF3qHULlprdGwXr+X4qtu9Fpp23NfAEc8tQNAo9nicuHTU74Ep044fBzdQY4DoXfDcI9ix+YiNPrPaLb5KE1OFhcw00NVaHTl+WvPOL9vxAOrj/wpwfB7tQbFPQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1339;
	23:f/jWO1mjX5DWDPux3kPuV8eMKygC8OyNYM6NqMC0Q?=
	=?us-ascii?Q?ztP0Tw+s94Z6L2IuTxrv02wo8QNEME8pfFkPuRc6NRY2tUXdt8PNiQuMgXvl?=
	=?us-ascii?Q?0znTF7x7IY/AUPm5rN4icZcbn/6BWMq6y7zUKxL4bxUYJ7vZmk19szvH1m+p?=
	=?us-ascii?Q?Rw94ltS8Q3OSGQQos2/GtSat3QBJ7J1xkH5dYHQbmZgpvhBMeNoYb5BNmGeT?=
	=?us-ascii?Q?XPB6JhPrggwc21hOUYNRgdELZja4Z6oKT5sgxT6nwc6y7f1L/91rbkr6VuMe?=
	=?us-ascii?Q?ZyrgyaKDCdj4S33xuonIEf8bL3296lN8txVV4FvO/wb7XJ4k6sW/NaSV1aEZ?=
	=?us-ascii?Q?TPyLWpVkpC9JLrvqCofczmklt48dD/sKBsj7s5C5cI38ernJJznUtdVa+nP/?=
	=?us-ascii?Q?fls3YduFt+W0PSSREf4SaiHlXvUj73Dufmz43ho/mu8khxenbaCxqQRIoeay?=
	=?us-ascii?Q?15Ey7cuvUTLwgd5glh7hV+Yiyl8F/I7dstF2bXF3W8FGkhdSVVllLalLMNnp?=
	=?us-ascii?Q?gbMoDRhbRlMjXlznYJuIb7eAHhD9W0CN6AbYMrYFsjh4lHvn6sul0aTGIfAi?=
	=?us-ascii?Q?7ayQs5hSUQVBNCWEFWsYHizrAZnhvm41crUGKnu/pk5c8HtIO69DtQ/Esbz/?=
	=?us-ascii?Q?w3HNkWtB4X9LPICXS+9gzae1NIPfv5P7VeH0nU1FO0A8HZUyWstSpe8hEWSQ?=
	=?us-ascii?Q?YN/OqRnstT/DVowRu1AUIPuoR3C+RQLTLkKPriNIUA1UJa0aE7KODcwqKOZU?=
	=?us-ascii?Q?oXxEumzXnikBcrNvf/kypUcRWWWWmqddYnRHQWLCEAfYw4FOBCFwSgVQFwMT?=
	=?us-ascii?Q?tqrvAZuhpy5micKGKpLDZdvyyOMDDB0GO8DolHN+vTzcDZoXScAeDrTBul+V?=
	=?us-ascii?Q?mK7HQcY1gFzWB5uhJ8EhtEV72jEGkzdIu4FAbWV+3UAMToDjXzJ0p6La5ZY1?=
	=?us-ascii?Q?qReNRVmUTZwmJCQcoLCAZLnsr4CpP4mhC2jhCo0as9EdLVPqzZ9LIq+To/sg?=
	=?us-ascii?Q?oM7NJ+AOTYdCkc40PFqO3JjftAXHCKRyzhxwI3o96WTNFTWFMHXXZqEAxipu?=
	=?us-ascii?Q?EQ/pHiJq0+/9eqLBDWfQcbcFxnF?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	6:zWBJOjcwVQiKtsyL0qcvq+8drsfc/RaQHrfV2jm8KlVmLA3ulQPn2GZBLu7b7b0iQdcLfVHGYFEll216PZFVXj0KWyHuM5y/4o1GU1sSsUlGq7Fuak9AbqF7atp09bZjV/SW/eRWlY3bzpht7LLMegGJp5ncyh0ekdDcixf0KsbTy1i2IvSPqMTRg/dRJCout6ztCB2Olwzx0gcVzhejKH/xjG4fezqB7PF8HQcBWQD09L9/6Fh2g5Hg2kpxQnIgJNuyRb9JdzfsuxUfQ3as6PjpIssbyKt4Aa6xQ1e+sT4cJQaWZJgLLez1ACb9JmzbB7an/4s4bCmXpsPWMu5HOTQ8GvY9T2EafYZPM+URLx8=;
	5:yCb1E1iVmQwyhorDSURmRqiPUE67jtyNujpK/VbAVx1cGpMMgmQBnyLsLpbgT3Ft/QMxiH2EL0dqPmbf6uptAjjh3MjKvfli718t7T2WcweTOF6EZsepfqq7OB9Q3ktQoA/4toFuEdYU70fqjrybSsTAXQHeRq6zHofcTk8EA60=;
	24:bvMAFWmsR1V3drSE0wQbJWaiCYwd8UepdKQS1EFuH68DRq4IgqyiSnj3BPJrffOZ72KWOmiX1zwG1vO4DzSH3PmpWqVsS3dvIfFuOCOSSFg=;
	7:MPd+83HtQvKcZAs1XTxPAE9YyOAutWFyPoxl0daXYrdbMAlrx1sT+9+3/3abCc+qd4KDzAlHPstixvhjRIZ+TJpOn+QT9zU+TFN3o3OlUnS2Q2xrx753gIeiKW7/gW2mu+usEt2v8OKt+ggUOYLuIGegHa2VMRetbbGlXucczk8BEubBZ094bZ5dFU0XWiJJFqQcYdYEx9vu3LNhum4SK9PTRe/yqcF2IU9bl0QgS2UL06O2jxU9zqkedO9xDqWO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:29.9112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6177f400-b3ef-4821-7d09-08d547cef28d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1339
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.76
Subject: [Qemu-trivial] [PATCH v6 06/29] hw/gpio: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:37 -0000

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


