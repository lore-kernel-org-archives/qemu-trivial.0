Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1eLD-0002oO-SZ
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 15:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1eLB-0002oH-Mn
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 15:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1eL8-0005k1-Io
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 15:03:21 -0400
Received: from mail-co1nam03on0082.outbound.protection.outlook.com
	([104.47.40.82]:54158
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1c1eL8-0005jc-7s; Tue, 01 Nov 2016 15:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=L3i46HHFNRZkKO5csAFAImmAhl/tVGb2y8/P7tpG83U=;
	b=d9WNfv4D9B4kucE3VK9Gq0VBrtiERC6B7k8JiL5fx+Wro4R2Q/SGmrGb3azMZth/vgaCao8Dyv8UzCPM8j7eEBBCwOO4nOxxx+xwDUl3lA7WiU421iORfz2RZKqL0DRYUBCTk5+e0hXPQA26rkbLvpPGojnEbyNqkP9Ns0Qhc64=
Received: from CY1PR0201CA0003.namprd02.prod.outlook.com (10.163.30.141) by
	CO1PR02MB158.namprd02.prod.outlook.com (10.242.165.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Tue, 1 Nov 2016 16:29:09 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by CY1PR0201CA0003.outlook.office365.com
	(2a01:111:e400:58b9::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Tue, 1 Nov 2016 16:29:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Tue, 1 Nov 2016 16:29:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1bvu-0000RA-CP; Tue, 01 Nov 2016 09:29:06 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1bvu-00032g-8a; Tue, 01 Nov 2016 09:29:06 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA1GT5qD022197; Tue, 1 Nov 2016 09:29:05 -0700
Received: from [172.19.131.25] (helo=XSJ-PVEXCAS01.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistai@xilinx.com>)
	id 1c1bvt-00032K-KR; Tue, 01 Nov 2016 09:29:05 -0700
Received: from XSJ-PSEXMBX01.xlnx.xilinx.com ([fe80::c4cc:6661:8e92:58bf]) by
	XSJ-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0319.002;
	Tue, 1 Nov 2016 09:29:05 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: Edgar Iglesias <edgari@xilinx.com>, Paul Kennedy <paul.kennedy@samsung.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to
	form 64 bit word
Thread-Index: AdIX+ou+0S8wToiLQGaBGTTodgmXmwARkEMABwb6r3A=
Date: Tue, 1 Nov 2016 16:29:04 +0000
Message-ID: <74004942B5DA03468B2B76399A14BF2EB648054D@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <CGME20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92@eucas1p2.samsung.com>
	<D569458AC1CB644E8734594DD4D187440108853281@ex1.seri.co.uk>
	<20160926145614.GA3958@toto>
In-Reply-To: <20160926145614.GA3958@toto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.161.206]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22672.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(13464003)(377454003)(24454002)(189002)(51914003)(2920100001)(81166006)(33656002)(586003)(7736002)(46406003)(5890100001)(87936001)(102836003)(5250100002)(92566002)(55846006)(305945005)(7846002)(3846002)(11100500001)(5660300001)(8746002)(6116002)(23726003)(7696004)(50466002)(8936002)(47776003)(5001770100001)(626004)(97756001)(356003)(8676002)(50986999)(2906002)(19580395003)(76176999)(54356999)(2950100002)(63266004)(81156014)(189998001)(4326007)(2900100001)(106466001)(19580405001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB158; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT036;
	1:tpzQ03UQDAsM2c5ZI0+xB9IpVuq6ss+a/7lPfd8LQ1yLBMNlPIJD0oxMBF6M1IG7Z66KzYSHxrrnhgfpEW5M9g6SpPkzL+VFKJihN7R5OKy1cP/tVZmx2cSS7tAeYXeP4Ql/PQ8AJCljhPWxm+mYGmAezH08NGYalzbMDoRf63q6I8RoF4gRhxp1eosiypjpIp5x6xiJzu9gEn3QkxNLClRZWguW1peW31X33gKc9dUgxaLYBEZ50VVbfXU31lAnp1dgCwQAhT37mPy4TaMR08gGc0/WKTk/RmF8FRExwAG4NY3PXZpj7y5fxhcdXhYh9p8t9goHBUA7/af14I8y6YrwPMGGilALQqLRLXjeqTLBoFCDnrOpdCh09odz0+2XNQ7D02cxqVWR3MJh3xGY7nCXKpsEvu0QL7tdq32V4H8hiDpzaA7L71hGrYSA0WGFGTyuEYmIbcUWV+MHA2olZ8CmAdwNzY5Ifji2m97/8s5ObXQdTrAXIS81C7oZWRHBBHxWLuCfS5vrPMu+LuCOWE6GCFkGEGiLa6ZkkUHpjgubNp4Ivts3KSlhms2yKZvKtsHvZq8szStFQxFdWQnlzoA2rVK09Z0L4E2gelAWY/Y=
X-MS-Office365-Filtering-Correlation-Id: f1abca72-5e0d-469c-5d4b-08d4027434a1
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	2:eCBe7g7B/qZoEIGzKtq0J4ONmuagf/q1t6GLtaanvFnhdXf0GdyJVAwbTzG1lLHH+fdzQtPEnXWOTLE/pnvrLQuV5I1j7cNw0JD3CQ8V2OnbmaTfi2iRUZQtlsEbuyV2Yim/kdxpa/IRQF25uplTK8bOJlheHucUBESaPn/YT5elUooB03udNdNGsbNeXGN9WwoedK+XsQNJNlYeAqcSYA==;
	3:prqetwrTNJB06t9I/Zqkd9rgs6zrGywYwcQbM+gnZhmj79DhwSXdIOJYcStFi60Ged4SnJXWDoqFnWP8llgTHWJHl9z/Hbeu0DsI4kdmCQEJ1Wyf8qX7pbzk3zJFTVxjkN0Tnb9qqKEkLWJM0Jl0B6DUuZBdlgZt3OaNXQ3q9h4zaPmbBdz6UXvyCuvpMaQC7A9KT+BZ3mVQLA2kuusRithOZZZBfZt3Sl3nalFSVe+HJj7cK5qsEECatfKKe0uum8XMvnbgowBBPEQ5Zy40b+4wH3SZjAObhy4NHW+gWyw=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:CO1PR02MB158; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	25:lDDbFTHlhf9/Io3uIAAMdpONiuy3d77pFszZDS6Lqwfczis1XiFPzY63GlODdeGoH/9pJLNczmJ2Z3UCxKzu6umFCJQLdgQndIVFMJ8jd/YwSbYj10Bi1eNnN6FH8xRmlsXRJoTbpsGY8KZHgG5+SFQzskwJaBpuFKVZLppVAIRmEvPH/UTwdwMBOtkJ9fa78BkcEehjyQtVCE7hsUt9XBaaSyH6jYDie9AhbzqxtB5LmHWpOJ66T8aX+hYGtV64NwPF2wFLv+HkYfXFPqniaAliFda7IrkqPW+zqFKfBQzx9YJwbbHyNn4/3lLYmU5zttT51eVpmvL8WMIg4t/oDR0dZwSoHfBsGyZzNNtck5OvkC7uAsC6HN1p4M2KdWLP2Okv0St21vvbxvZITruF68eq+sLWFCGe5WNCizjaBiFF/nBEPx3x34wu4m8h/cEfaU9UwV+eON5Eu5Q8r9i37hpm/ycpOXM5ZlT+YSRzR+NKSyj5VcMOsdY+xnxaaTacQe2wT+xnt2dlyx2OLqiUC3JgZvsQRm77skD/b00rJu/zspj2r02QSgOPrh6E1+knly5XozKjAL7MkPV+J+L+X4jU+XoWICZupyKcYkjnxHfaS8z35mVt8G3CBIVRdgk/PFG3mi0ASVlMGdXMaEZM4oHf51ZhJSJukFiw+jQrEejYv8xcXTwyqwQlrwkAFsYN0t4o5pCQ2IDXTdzmOdj5xlrVkJZxmIfcL6JM4J/fZCqapt2GKKX0rQNc6da2YMMZeHj7n1iokRHkiYJeJf/oRUybXDgFPDKs5BVXO0wQsD+NBcBCtT5msg0YnIVkuNdc
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	31:AlJO1kd2rErQlehm9NS7aPv3Dl9wMYeFaeSRbR3zA8NqqFNEAHfEtd9M4GIse26UXj0usN4rhr4POWlaWKjP5DDyaEUTCCUYIq0rEKrckWoNRvXLLMEmbFB+DnNQhP2AFipE7L847gdEoDGtg86vFkoT4kwifoLeJ+24Tsw3fS99aW2GXVeoMz0G2mbh95Ik0TM6IjojnxPE1GpHx1qXvoDnzFz7MVd3c+XTP+uetV7RLeYF6ueggPKjZuTd6bxv;
	20:Quc20k20ATinew6HYcVjSuDDwJrFwIoKjMF6cVmBHB3l1xdThGwNBykD3XMepKXXFUqVnuqH3zlviQ+FFFuNj7wxXWypLiDvefXX9P78f0/nNVqP2E8EaCy0RKX66G/RIJ88GOiTqr8fDXU0Ht/H/JhYgkv4KTIC/aJOepzGLnmOw+Aa9x+VWcy3ZpaynON3O9LtER/lX56n/xt4jPU8dlYBv3j4rXjl2SuZ4ZID6cNa5Po5S/Wo6qdKHDx9d/CEhl4OT5gDd05BhgKify/IgCSCQJVw7kw2wYO0AsX3MYe5k0iiY+KLABAJ4MB20Y11F9Lel8U2oAg7znhP5iJhuZGfcJLIws39oYvCGJsNFR6Il8+Rinxf+94ghmGIFyvkldVN2rlGG1XfLYtQO1g1kOTEsE+FmG8z/htnQyh+1qMa2n5IruL6Em5+p8uFcqYgYQupXbU4bOGq0hKHTuVNNgYVPaRedZ66UAJKM5r4Fk4GT9zClBBa3PXH/OK7PawL
X-Microsoft-Antispam-PRVS: <CO1PR02MB158D535E6C89D1250FFB035DCA10@CO1PR02MB158.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(7411616537696);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(13015025)(13018025)(13023025)(13017025)(8121501046)(13024025)(10201501046)(3002001)(6055026);
	SRVR:CO1PR02MB158; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB158; 
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	4:Ed0Ere8xx/kCz7HvxSo7d8UpcMIM8s9JBkCLYlNPo+Ve0D/ArsGscqPgarcwhewGHyhAj+RLNzrPLG6TfwyVszVmhYOerFTg8AdZM3tdH+5G7Isf4MInb08YawFtaO40lLuK++D61/zGS0Ap58fKWyDvIneP7Ug/3jN+2AJUH0DIbqvTjueimXe9tC2Gz29D+NXrg/mejCYxMhx0fAQDUWCYl3laUibJbFId0umEgz/iAG2HOGCLvYgZPgtI1/tPLTVBp5jKrH+IAQr2+nr4MOOJg8PIzDJB+u335Pcxml/JuBB20IpiKueWFHe67qk9TfYTTACyyk5FvKwm2jTuw13K1UMkL2lEGwfe2QztQ2rkOFMJnqbtvGlGddr9a2VqBmS0bfou+Hp5oi0N7U1sWnu2d3AuAwfEOugl5+IKuY9BCe9qssvtX/s3yoheb0en10rk8upWMddiYBWhpUqrCTvrVHVK5BwEuaC3eR8Hvp9OgUXwVdrPGeJYNMCTiIkvUpOV4QVhXdj26RpX8aPMigQ/98ubu5OqnJaWy148B0VXAa5lD1YZ/itE2AWuaXmFOzeGIW74GECjyjrUoen6bQ==
X-Forefront-PRVS: 01136D2D90
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO1PR02MB158;
	23:d3N7aL8wWgjUl834P59B4wXo+YasRVikhcKO8RdZKv?=
	=?us-ascii?Q?utJaf/YMOFHT1o16WZSWTvVH61YPFwCbvv70eb+PZMdQbb8LYwXhtqUw32V7?=
	=?us-ascii?Q?72v/nMANSWr9mVisPVLh8+HWEbX+f5eg8lnhPAqnZjmChGr41HFhjUkVhqIS?=
	=?us-ascii?Q?RF7FM5zu5S43iLSSe+IEFHrhbFGXUVyiXE6zSsa7L32UHRWRhcGinUZ+UzoS?=
	=?us-ascii?Q?bCuqpF/I10dVQ9LyYJBcNXM+P/33cd7Lp+O31yG21WyH4WteJi36M1d3fdzH?=
	=?us-ascii?Q?DxFQcM+uLzm9RdP9/a9rJ8dIIdlcgRRRJPyMEcDSeZMKkudZJqgONtloM6XL?=
	=?us-ascii?Q?G3NEG0Qwup9p7LFftqdU/9ZiyzYJzvNYEOCKQ8spVWLQ2l9x0byYx7mY9lwc?=
	=?us-ascii?Q?9oCmHvs6oBUe0Von44e4G8chE9QdBENG2CjS5ctX57DeVBLjfVn8ggIXG/db?=
	=?us-ascii?Q?/tApRiuYaVwiN2R/i3BExcz7zErt0WcTaVLn2xNm7DALW7atzdyiwKROrUj+?=
	=?us-ascii?Q?BmrGN7qsqo64CQ+ibzkeisYbZe17oEfKoFqH/FnjPGKDgR+/kl0M8KxiVKN1?=
	=?us-ascii?Q?nvIJQUlU/LRHItO19DfWOAQx1/p3N3KPP6joJ6wE15jRVGIdntw1l1gNFhix?=
	=?us-ascii?Q?3P40UbxkAAWhyyEQBYobtOi6BKAx1jylLBJqDj8w63jhI1qdVWXo+uqCXkB1?=
	=?us-ascii?Q?RNgS97G1GJJ/VOL4QyD8Ckj805bwcKUUc6SmeqUyHL3USMTQIHLzoj/6++Cq?=
	=?us-ascii?Q?83YgxifDGuy8TErDujbiop5nxhOn2iZJITizL8nrCnbgCIJy4VnPdk0BRuQI?=
	=?us-ascii?Q?IQ74cZMwrVw4oTaIgGSbqEf/kiZDGPtrKkZPtdDlDGHlIymL/+bf4SIPHeBj?=
	=?us-ascii?Q?iMJT9onkowt1O9fPDJG5pfT+HorezjJjjdxL5YfTWf39HVw9uHm9+HeFqTda?=
	=?us-ascii?Q?IWrAfGtv2thbBI7XSqHT2izY5MoKJRuKzRHiKt+2ClPMe1f+gH1hp9qA4oqQ?=
	=?us-ascii?Q?vEw/+T0jaMK8UNiW6gAXb4+2RNoOFGDgFycsFuqVEZnOqTz2zOxiTZa/QBpy?=
	=?us-ascii?Q?/yjVDGDJ0A3mGNDvlIy5lDgL0w3nIhsRf8WuBhrx4hGMJVD+RlLERQQ5+kLX?=
	=?us-ascii?Q?t3ThsJCwlopQE/HIr4yQfFg4MA583Dk0aluE7CfW9KIRKGYgchnCc5059gqa?=
	=?us-ascii?Q?bQ3qGnhwQ5BHEpUCSbxR/xFhZRUNq+Yh5Sr3EfSOM4qqQVP0E1YFnDwFhfbZ?=
	=?us-ascii?Q?9gcG0Rp2ffs1L2aWlrbSn/LguJXH21Bu+WYOjZ?=
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	6:fgCGhIlNSgoMeV1nUAZkwgJd7tGN6UpTzfXaUXQZVbuLBjRF1rkw4yMmQE6t4IpSAIlimqP1UegSGqiFg/oQ6izW4lPEmlZmmOaKPKmXDurT0PUDsYgCL0RLoFtmGgTaeQ7JGNdUtqfbwQ32H8U7Cf07DnWZCRw6xJ8yZxUpdrfdBBT8WJc72qHhMbzmsAg4ajVH9xaqK5xoEheYfa2S/3Vqif50kswefrIRAPtXcd3kQkvPSDk2xso/+dfcKvKJWuQdPUO6Y1NJOXJTEdVIZzlAcGbbVQKgy2MVrD8BTHtgPRncp3PCIMzOyRVhTZoymcS7Q13Jmi5BF5WytLX7U4ZGpa6/YypVjkjofQs7LBM=;
	5:fqCPbwtgCaDMOXwPXbyddtYpbbL+Ej2vxTShMB2CF0SSTDSMK2UwLc9t0+N0LV/+dBPYvOZzZy8hMbzCO3kbmPMdFe/O1B76S875R5YniLTgcDYM+wklSu54Dx0AGIq8Ml/RQpEPRdDmsuHjT2otkQ==;
	24:bQwKOiq1FpXKy1s80I6MyGB6RDgVMywU1+PI2TBtjOQmLAHyt/I2jzWwHHzdW5XehrYUbFZZyyJ9P03Zu74PYXWljnfKYkHfsiv8BJtr64A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CO1PR02MB158;
	7:3evOYfT7oyT5uHvhjtOeyrUkfU2CkC8kFIFIFcVAHKQiSNCnZYtklNFcu4Y/qpZXOhNH0RUmNYjhFDsoIxOC+uMS12bDmwcarNkJK7Qd0uUXd0xLNY5QDkJCQEeBTPMxGpJOHTyBgSASSbAfLa5MfpREE+tdEHNiHMv7syiSvlYd7jlLfhiDEVgUc8lrOY87pkdGQQ8EY9btkjfj0ZZCQxx3E+JV5+macAVxgfBNBTAw2oFFoqoYrJofGrgMOySuvjMFoINGWiJFALhbTq4Ze2xK2lRBQWqzyVge6R6YIMZzXzKUrKq9hFpWvtCBrH3kTSrpZHgwaYM3LIj1ST9OqlLnGaogxrHidTRBDcllfs0=;
	20:oDdPyYRMP4NqNq7BJSBF/f24nkdvFJRTQE2pRFIJe7YgSuXeZpi9aADa5BbO5WuUb6r/BjLRs5k6Y61g79Gnp7oqfo8ZeNwwrlpAaKNWVHtf0lH0hdhcqoexyihvPr8T/HDRWb8F17ZAj8E71SZl3GRTfDzdhSUcdSyK3HLNGj0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2016 16:29:07.5565 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB158
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.82
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
X-List-Received-Date: Tue, 01 Nov 2016 19:03:23 -0000

> -----Original Message-----
> From: Edgar E. Iglesias [mailto:edgar.iglesias@xilinx.com]
> Sent: Monday, 26 September 2016 7:56 AM
> To: Paul Kennedy <paul.kennedy@samsung.com>
> Cc: qemu-devel@nongnu.org; Alistair Francis <alistai@xilinx.com>; qemu-
> trivial@nongnu.org
> Subject: Re: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to
> form 64 bit word
>
> On Mon, Sep 26, 2016 at 01:52:22PM +0000, Paul Kennedy wrote:
> > From 7bf015d76a5b53cd061c91f91fea4427101b26fd Mon Sep 17 00:00:00
> 2001
> > From: Paul Kennedy <paul.kennedy@samsung.com>
> > Date: Mon, 26 Sep 2016 11:59:00 +0100
> > Subject: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to
> > form 64  bit word
> >
> > Fix bug where least significant 32 bits overwrite most significant
> > 32 bits of TTBR1 register.
>
> Hi Paul,
>
> Thanks for the patch.
>
> This code is not upstream yet, it's staged in the Xilinx tree.
> It probably doesn't makes sense to CC qemu-devel@nongnu.org and qemu-
> trivial@nongnu.org yet but there's a git@xilinx.com for future patches to
> staged Xilinx code.
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>
> Alistair, can you merge this to our trees?

Yep, applied!

Thanks for the patch Paul.

Sorry it took so long to apply, we were getting ready for a release.

Thanks,

Alistair

>
> Cheers,
> Edgar
>
> >
> > Signed-off-by: Paul C Kennedy <paul.kennedy@samsung.com>
> > ---
> >  hw/misc/arm-smmu.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/arm-smmu.c b/hw/misc/arm-smmu.c index
> > 7e7acd8..8255f3e 100644
> > --- a/hw/misc/arm-smmu.c
> > +++ b/hw/misc/arm-smmu.c
> > @@ -6566,7 +6566,7 @@ static bool smmu500_at64(SMMU *s, unsigned
> int
> > cb, hwaddr va,
> >
> >      req.ttbr[1][1] =3D s->regs[R_SMMU_CB0_TTBR1_HIGH + cb_offset];
> >      req.ttbr[1][1] <<=3D 32;
> > -    req.ttbr[1][1] =3D s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];
> > +    req.ttbr[1][1] |=3D s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];
> >
> >      if (req.s2_enabled) {
> >          req.tcr[2] =3D s->regs[R_SMMU_CB0_TCR_LPAE + cb2_offset];
> > --
> > 1.7.9.5
> >


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


