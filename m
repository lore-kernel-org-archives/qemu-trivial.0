Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boafj-0007O3-Sy
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 14:30:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1boafh-0007Mo-Fs
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 14:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1boafe-0002eY-6c
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 14:30:33 -0400
Received: from mail-by2nam03on0079.outbound.protection.outlook.com
	([104.47.42.79]:33696
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1boafd-0002bG-QX; Mon, 26 Sep 2016 14:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EOtx+iFn5zPfyIqqozomC8A3IfuzCoQ9/7nk4vXE2Js=;
	b=2xDS7njTyZmwhowWadecpL7+Sh3GAD2SgzshJOboTm+Pa1nKAU+Tz+tqfBV7/kxdEl23k4sjgB2RckQBkV7M88FXf4dsj1MNVHpVYRgelZYoeaJYsTwmpqjQ4ccz7EcRb8KwdXj1chiuwToYoijE5db1R1yny+XdEkRhS7m9M64=
Received: from BY2PR02CA0110.namprd02.prod.outlook.com (10.163.44.164) by
	CY1PR02MB1979.namprd02.prod.outlook.com (10.166.189.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Mon, 26 Sep 2016 14:56:28 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by BY2PR02CA0110.outlook.office365.com
	(2a01:111:e400:5261::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via
	Frontend Transport; Mon, 26 Sep 2016 14:56:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Mon, 26 Sep 2016 14:56:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1boXKQ-0002J0-Pj; Mon, 26 Sep 2016 07:56:22 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1boXKU-0000Ax-N7; Mon, 26 Sep 2016 07:56:26 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u8QEuG3U032223; Mon, 26 Sep 2016 07:56:16 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1boXKJ-00008q-Qk; Mon, 26 Sep 2016 07:56:16 -0700
Date: Mon, 26 Sep 2016 16:56:14 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Paul Kennedy <paul.kennedy@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Alistair Francis
	<alistair.francis@xilinx.com>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Message-ID: <20160926145614.GA3958@toto>
References: <CGME20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92@eucas1p2.samsung.com>
	<D569458AC1CB644E8734594DD4D187440108853281@ex1.seri.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <D569458AC1CB644E8734594DD4D187440108853281@ex1.seri.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22600.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(24454002)(51914003)(47776003)(23726003)(586003)(189998001)(4001350100001)(50986999)(46406003)(83506001)(2906002)(76176999)(36386004)(77096005)(1076002)(92566002)(54356999)(4326007)(97756001)(33656002)(9786002)(87936001)(2950100002)(626004)(106466001)(9686002)(8936002)(110136003)(5660300001)(11100500001)(8676002)(50466002)(81156014)(76506005)(57986006)(81166006)(33716001)(305945005)(6916009)(86362001)(63266004)(356003)(19580405001)(7846002)(19580395003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1979; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT063;
	1:CQIe66p36n52K+WgUyGsvQBJlw1xMLMJE2Tf1qEKESTtYEjJjtDCRLEZ3PsTMCKPWoQVi27hNRAVjwmkDU6j4/bs0mv5ft2ym57yFM0+iDjpXoF6P9OhVLJnO0CSIUPcA3okl2pwyoVLaxK61S48w/Iq4ZXFC6Thltpa4Iwuc9p6ldQwaQg/9cmI21KRVapmZmXMRxMA5Y8+9Mrb382NdRqtxKXYUGs8ZaZWctW++3RbCroiXl/3cCoTjU56SXiuuZlww4ULzLT667WCfVMKXutoqe9rZz27W5pEC9IBB0BaqBJrUDCdHMtAXdWS4qAivHgqQG0X0vH5mpQinBh7sHl2aUkQCioW3pLJiLJb+TK371vrAFa6esvPdfOTnnRAC2ipPV2y3uH3KQZwyo5fkZT3EmFXOC2rEbcNmvWiaCSAWhbuKqWB1161FSVU9DZMCUMEtoXCqH0sfG9pofYIHopGkvtFApO1EK1DzGr4rrBPDeS9yrcjyjQht3H8og1+41JXFslBIdkmkZCD8wrDRtVuhpsiJfk77246960PchAxFU3FUpheC7Ac2Dq1pj2ScjgM+cdY7v8S2m8TyqxHa7LwbbGo6vYz3oXf0zxjrwU=
X-MS-Office365-Filtering-Correlation-Id: b7648992-5f8d-47dd-833e-08d3e61d4b10
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1979;
	2:ulph7KcisJGINKCI1rVQ0FxfwjvGxI/KBE9vH6tEEJDvwEWuR6cOR4zI3VxHil2oWosPaZgjXfnTshJzwqSQNKw+9XCSNl6mQI5MyurQn+ZIwMz3RV/LeFsO0dAJEMHGDo1kySm/5keLSMvEf3HfVEZ+KVZwrbOt0/uCzZHno6xTnLftmMlERA9h0OlC5zqe;
	3:/HD2ama2u1KDQNIiQbN4OGx/Z1cOFNkVl7qIJCkMHWKOBcUuz7JzH/3YJs+0RhaA/ivQMolAXxNBmylSIVlVZ7pocGBG2wrjLJmzyle/mrgqMgm3zKv377coRpD+JTCC4VIqKBJUr2byqDo9qe64Iinwh85+CpUQ2ZAzNeofBUZNPIN9wcSE8ECTjHpOZu1t2BpBmVTNAQBh2Wbo2F4FYwjwoQxMzsHHh66sRJQjE3No0ZwR8Ekq4XenJEol2vT3Z5noMnjOBH8HnmlD2mInsA==;
	25:0f8CYyJ/pUhoIRsVhRU/5t8GmxM8RLbTsKmoM8NHwcMot1WarZw9jeErGg6c+NU+OMLnkZ4SYELXeH8ji1MgqVFGGFc5DqnvTffuUtNE10e+5Sc0xAg1e0yJ3IptVWtmKJIBCZMKcVTqCPuihEmWX+24d2drG9IGUCKWZBY/kn8Qkt5NYx7u1WTlru2REZ8FYFqO26D4tjSuW8iHy8gsaESrJgGscusR9Fv+zGO0Ravpv93ur7KR04vpe37X8CFYHo39bLDVkVtS+PDKEFJr+bcvmR7lCb2CUU7S0rkHev4OElt1F9fuXgGqPlNS3bhUYHXK4IE3IHVUGNSpNQZ1GtP9bf9m3qmGpMEqCyDiKATdN+YWollfnZKOVO1xKphMDVJ4jUQ2wR08KvkupM04eXK74Habqvnq/CjfULnqsH0=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CY1PR02MB1979; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1979;
	31:/owqJ+myk3fT44KGwiaTr+qzKMOo3eYgf50uDte6UVwHqHRt/28m5fcLnA/hFbtZYmwTIoro9GpHdix6OdZYVY0J8o2fQlc04yIjynBLA7z5aRdEo2b5kCVBn9/CCqngeSgp/NNska13ptWv3CFS7WS6L9NVb92s7MgQKgWqdgCeCs59vBuf9P7Nb3zb+pgDVac7JsVvGJxvYLrm5vug+Vu4/1xobVJ4ksMaV0ZC3ZU=;
	20:jw2Vqz79VdYGvuh0msGxQunZnx2m1r6APRHs3ewzySmagKXeVdPdIwegypxQd/qA2xcYrdQrj19Pg+HWR/PJQZFU8S9AQ6yvrHYu4RLThidmfpjwU77C9RQHDvecM113Ot3KOdhsiQ64BTgARDKiYU45vR+YDdrLHOHbYPqyms1kSe1eoxEZpwmqH0XhVrtEhkLKRWZtxFikgd+CGGeY/lihjGYhzlUxu/dLiifCRuaLcHY+XUB3ClI3uBVFH1ciYt2IVdqR/DIXQHBUumsVfL8rtY91cjExyX3sEJasVI7FrgfoazATCyymFVrBFqASyFFO2zSR4D8hSf/nH72rxGBhnLXHxx3QUm8n1YUp+dBTEpzrFnnsNCLNbEaBtTEFV1DdQjEyfAOcSqI+tjdoxMOeZC8mnL3xDitm24dsvkbo6UpML4PpLlY9VfYSnAIBAz0wD7rs036I4THw2uuoKGb1AFn32P/N+p1opUdxVFD43c/iTflF/wN4nY3rS+Om
X-Microsoft-Antispam-PRVS: <CY1PR02MB19795D1C74B0CBCB915A7601E3CD0@CY1PR02MB1979.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(7411616537696);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:CY1PR02MB1979; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1979; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1979;
	4:5MPl4UUo/1fad+PJTkP1r6sXImmoalIe5pe+rQm1SQyhmpVvRNnxUOJWi5aUF3BPdhUOjL3GSI6hrJHgBkrB6xqb//fy/+kiARoxcV9xRGsnyq1PpovA5P5hgRoIyb2XCxEeEOCmuKzelasoum8HcT1234JKErecyFiqSOnY3QNutt/Fd3P6rwC7m0eyLtTSXLwkZxHN4PJgvLC/aWp/RzabWoBqVdRWmrFuFzKO1gl8DDMfuBBxXl+RxPAYsPBEiyUuFwXEJ8O0tJLn2tVb8OYKRZxuaxUzwa8LGb6ypSto43pTrOG+j+agn91sBis57IqHTF/aG9YXJCQfq3IKyZHR0IC9ySRFa93faFEsAOh3CmNj3ycI9IbY0die3bVmfpVy0ZGBaWke7iJ8jH/k4lhr9BDnRqZgpJg9ttTMS1FaXM7Es9GHn2KeESOskJZR3z7uYS9lj3ohhWu3QR8lj9wIJKFQJVUGZkKto8s/3QL+s2N3ECoLPEg0tLoi6dioNjCfLIQmOcjWieEiFTWiK896Q/TcfdLrzqB92M5hqeXLwY653r8xw4KTeRHs1EKN
X-Forefront-PRVS: 00770C4423
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1979;
	23:d0UWDq/K44IA5cIzAyufb2uBymmwiCLIP8zSVZmvx?=
	=?us-ascii?Q?gfn3A/aD4OpPK/H5bpHnWaeWnl5RV5pavloY2aTtHmN47YwsQ1RcQVXJ4cvW?=
	=?us-ascii?Q?j9gsnktjlki+FCsF/7MEJicaLEbmT4x1Xj6cARoRfZT7XyQIS2MMWEP00K99?=
	=?us-ascii?Q?Iaz1XpDI+wfpUSP9Kpb0p1IWAZacuPX34pOcr2abLIVYeAqRJPAFgN9I54pa?=
	=?us-ascii?Q?vKlpcHlP51E8e4/UaDCE9Zi1SdBz76P+wvheHJR574qBtgV735IF9QOPTjfZ?=
	=?us-ascii?Q?ECva+PrFElNh0y60D4MEbOBxBpAd6GYuOg6/LHUaJoJgLwU1MIkhvWsc3NcG?=
	=?us-ascii?Q?SsBR4jHrO/uh35V7Ox7uan5K2v/Mk94Fk7Wn6VnfAv8qxW6DqzTXiaxWf9cy?=
	=?us-ascii?Q?Q5m/g0VMsAFljAILMZT42+l+T6GJSao8Gd3gvuSCQc7aYoeXGOL6bqQ+JVWS?=
	=?us-ascii?Q?oQcXmookZyB5tfKDKotI/Qq0hEtEbPmviDSIiqR2pYWRyG1uCxB18zQMWrJO?=
	=?us-ascii?Q?jijUXhwzjTj9a1YVvW1NUd7MUEmQvlAOs7eFJb8nhiYcz+xbc+y+6ACu3qYy?=
	=?us-ascii?Q?PtjyroFAZSTuASEGFT1/N8p+yDWvGWHKKquT4uoLrLc7PYjjI3msdZEexpA0?=
	=?us-ascii?Q?38IJfwEN7BREUKFCOp5rXDGphRRB5JK2IcdX0Syj3HnvLDLEiyMWJPrXOmI2?=
	=?us-ascii?Q?NMbPxHngxQtX+EgxzFAN4GDOInaPEn6lsZ2jq8A8RT4scBqeexeD0fDJr+pf?=
	=?us-ascii?Q?CUty2Ddzvo3BMhALaDC2p22QORcigaqpBxu7RmbFB+mbzz9SJPXPRcHu0zVW?=
	=?us-ascii?Q?xTVesQUO12n8o6BfecjZ0QvqAd5ZBeRZKoaevDhhmua/ipVPzt3cz3tIxUqW?=
	=?us-ascii?Q?7HBLAjvMSAazK/+boIxbf/9PaFutTrRZEzAgjbo2UpEaoqEcPJGngm2i/upZ?=
	=?us-ascii?Q?KkQPveX3akC1dT7ItgxXclwSBc3HrYE4mdMZVe5jL4NaNTL6GJ94+fnoSGSr?=
	=?us-ascii?Q?PyKbAwsDGOsBgT+oxMVx2iUYNC6hGof1carZAT1ocrN0cJe7XDJ8GI6ibuKZ?=
	=?us-ascii?Q?fyrR0ZZMXKNzr5InCjsnP6vWdOuOatwzYJzZa0xKApD9lcEu3Xb54cyebhb/?=
	=?us-ascii?Q?yYwaY4J1jiaCTKkZ32XO/pkMNqo/XKJ1YeCraQtQiUmYj5ELZC2EdWgty0E7?=
	=?us-ascii?Q?tQlCzdsSwNQfgnnKM4G5hQ+O6sqsmA8JLaYho0jhm+25y/0AzqdHicIchDbo?=
	=?us-ascii?Q?bH9cCy1GrSfqbXtuxNFN6DYSFh35xWQD6/63vXM?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1979;
	6:PikcrcFbMdoE9H2UwE8YtHQ6+TXKpVOpNoTIS3ul991rV87NQr9eWRoxDPchesa1QxNZsx3UzPCiGwiIAzC4T7E43e/Na5M3t3VZgbP0q3uAlL+t3ZXXY/etz5MoY93B8uMvNi8+jhwAgHAig0Pu8L7DDtzf1cWBZeiTXv0azK0CUY1j3zob2AD4Wit4gtqOqVVBn3Z2Dw1z12MrXWuaRStXn4UKmP3VtRIx9/1GsKoAHRKo6PUiOxoz5+nhwt6+UbDKgCTIONaGVsy2v2dCNNwNH9ArY0QLiOuoBM5m1KuEz3sknVFIs+yRcbzP5VRdtDnSa9Bf2lkfeeVY4pikqw==;
	5:H17Y6cEfbc37SVOqIg71r0HzFTWwtkTu9AfdxluG3y7iXW7GL0rPKn75b8KfGt4Jdb18z+wJ9ns2dGSblm5jctG4ak+Dw9WVx9An3miXSDBMcUo33Zm9GCzF+rnlVGT+31GFsdR3BYbNmkha7PfaZQ==;
	24:QzXMk4RmCw0UJbKM8toRb/dnJUEtoZLL4vf2rL67lGjKHIQd0pkU6bSdqtL9Br5tBevhx5M93rCu4eMOZkiSA/9MB0DTUIJvcfQrIc4qEHw=;
	7:iSF7YtwhLqXkpzVVs2DwzugvUrnohJrVBgopD61TVGb25uF/QJECys3a9JlGQ/zVs+1a97cWOCDyhLA0hw/A2stASFXGqVcOStslsK3CRCSlrBCi81s2LLCzSdSfrYJiCGUTd0I3APhL9dsqREqXQu/tgcEjLO6QR5XTwfYLkB2m2LrAU3B38Us3EPM8ASnuRlegercIjQt8jfZ8bfF06WDQcBjsmskUrBuCzdDv9XPOcYaSZLViwZVfIw2dr43qywePCdxAv4JgMUXdycPKme5kDl8+qVSY3YSwKJV0SDdA0IMGXNglE9z183lr6b2G
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2016 14:56:27.4529 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1979
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.79
Subject: Re: [Qemu-trivial] [PATCH] arm-smmu: Fix bug when merging two 32
 bit words to form 64 bit word
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
X-List-Received-Date: Mon, 26 Sep 2016 18:30:34 -0000

On Mon, Sep 26, 2016 at 01:52:22PM +0000, Paul Kennedy wrote:
> From 7bf015d76a5b53cd061c91f91fea4427101b26fd Mon Sep 17 00:00:00 2001
> From: Paul Kennedy <paul.kennedy@samsung.com>
> Date: Mon, 26 Sep 2016 11:59:00 +0100
> Subject: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to form 64
>  bit word
> 
> Fix bug where least significant 32 bits overwrite most significant
> 32 bits of TTBR1 register.

Hi Paul,

Thanks for the patch.

This code is not upstream yet, it's staged in the Xilinx tree.
It probably doesn't makes sense to CC qemu-devel@nongnu.org and
qemu-trivial@nongnu.org yet but there's a git@xilinx.com for
future patches to staged Xilinx code.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Alistair, can you merge this to our trees?

Cheers,
Edgar

> 
> Signed-off-by: Paul C Kennedy <paul.kennedy@samsung.com>
> ---
>  hw/misc/arm-smmu.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/arm-smmu.c b/hw/misc/arm-smmu.c
> index 7e7acd8..8255f3e 100644
> --- a/hw/misc/arm-smmu.c
> +++ b/hw/misc/arm-smmu.c
> @@ -6566,7 +6566,7 @@ static bool smmu500_at64(SMMU *s, unsigned int cb, hwaddr va,
> 
>      req.ttbr[1][1] = s->regs[R_SMMU_CB0_TTBR1_HIGH + cb_offset];
>      req.ttbr[1][1] <<= 32;
> -    req.ttbr[1][1] = s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];
> +    req.ttbr[1][1] |= s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];
> 
>      if (req.s2_enabled) {
>          req.tcr[2] = s->regs[R_SMMU_CB0_TCR_LPAE + cb2_offset];
> --
> 1.7.9.5
> 

