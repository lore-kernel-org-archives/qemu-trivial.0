Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eeqBd-0006in-6M
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2018 17:40:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Babu.Moger@amd.com>) id 1eepW3-0006Cb-ES
	for qemu-trivial@nongnu.org; Thu, 25 Jan 2018 16:57:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Babu.Moger@amd.com>) id 1eepW2-0003E5-Ih
	for qemu-trivial@nongnu.org; Thu, 25 Jan 2018 16:57:03 -0500
Received: from mail-sn1nam02on0052.outbound.protection.outlook.com
	([104.47.36.52]:25376
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Babu.Moger@amd.com>)
	id 1eepVw-0003Bd-AX; Thu, 25 Jan 2018 16:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=I7gYhMb984r3oiBSgOi9ATHd8mgYLoLp57GxHGxyNxs=;
	b=zedhxApcuHYFvyEiYt4F6U/zddfRUpB8YthqEUeQoa3I4jf/x8PHZ5ZhK9+CwKCUxJH/MhoVdWmP1sksL4Ukw8DJcsxkG/Cpb9LrA5o48xpeh0L+3kgXWucBWgMvcxlD6879sCaftZrEPBTVqKAvxbyDsviLu38tpw/jUqaa9j0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Babu.Moger@amd.com; 
Received: from linux-pyp0.amd.com (165.204.77.1) by
	CY4PR12MB1765.namprd12.prod.outlook.com (10.175.63.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Thu, 25 Jan 2018 21:56:53 +0000
From: Babu Moger <babu.moger@amd.com>
To: pixo@polepetko.eu,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	babu.moger@amd.com
Date: Thu, 25 Jan 2018 16:56:39 -0500
Message-Id: <20180125215639.73485-1-babu.moger@amd.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20171103173037.17012-1-pixo@polepetko.eu>
References: <20171103173037.17012-1-pixo@polepetko.eu>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: MWHPR13CA0016.namprd13.prod.outlook.com (10.169.208.26) To
	CY4PR12MB1765.namprd12.prod.outlook.com (10.175.63.7)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d14a5b2-2de0-49d6-c185-08d5643e8baa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:CY4PR12MB1765; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR12MB1765;
	3:UOi/0yOrV5mqnGeqbRZgg5jWgmRDfucm4RFy2ai5PCvNgLYuOBA8wbbZScru0MlYBasHeIiG4RCkFGxQB363WcbjxYNFm7zbYcAFmR5z3/pueG77BNg1+TKGe7nujVGntpkk1CMjZ+o8cNFthR67zz/bPm/edeZCqzQ/BCukUFCEGyCLAJtal+LxT9K5BsNyShvBiAxtfanqpaUMcRm5QL4Ab3+kn7IteIQmGHJQClLSjLTCw3ChfgB+ZCPCIMzd;
	25:ur55IEaC2lmRNpLe+2WVc2QOmBwY94lEVBFOP4SFnq2+c1qpYBydlINhRUOYYZt2iJoCm0/ELWVXbDumWnOin1keEang89qLquXqGyAB8UaPYYzgamkkVwV+uOI21hiIMUXoWYIyHrvzx/Pd1t6BkI5cXGuRfoJtHfgjHbGNoOdveRptDfr7B3NlpwAdDwISEzt4pD6gv+Hq6VYRjQdZ9dbgsED5zND0ck/smIyAPn+tGtbtGXXrmx/OXCOagDu3sKOEjJFrAuMJgM5dAPEMRmb7he7nl1sswSblSowy1igbxFurJ7dntJcKtNgTJDg80skqugxEabvUVkLNrAXIDA==;
	31:cFQq+/qrbeYxK9rfjPWhK43yNBPvDseFOHZ6sMAdl1n67QUK/Sjc3zLfa+S2jkEuhrtyNZjgOoWB51XlSnU55FXAMxY09lZ8jzNAtLYqDs5o0qkfph7q8LIxLPd5SGINMYXfXo9eC1/i7Pm3lmtUjKmOcflGx+Msh2kTxizjGSqXVb2iUP5IAMgV7x/tF6X8CKxepB0DqqcAMvQyby2DIcc+jcTsW6XWIYKUd/74kCg=
X-MS-TrafficTypeDiagnostic: CY4PR12MB1765:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR12MB1765;
	20:SSluEJ2Bk3OSyIG3CREdVRWqGX7I2EobIwyq43FnAs41Aq/9JO8jWwkI/NznUiTHtxM+sKi96YjH3puOFq7Ss6amUZ2BT16w7CblS4MUWot8X3Z64waOANuBVuFpgbbSPtsa9EfWq7ko79XCFtkSBcAnnEKHwqyqxT5V2jiuu9/n9hGgMAsEZM9X1TFKNqyWmCPHQP5nDUBngurNPN6/CK9PzHQbGLtlaHq7DP71Rv/lLslkZKMsgQxM4MS9JH1cBEqDJMXtgwGYg+raRGSnSvw8N2DFYZ6K5RHKUG45sijyGymZqbWDToYI6NVpzYRaU3yS320LvW4tE+OHTOoOpB7SrvDsWauV3qF9F8/n5By13aEXJnu+SQiNn1MLWRkPmOSOWPI9LZJcEgB4LnE5t1x087Gp8ctxG/uIwJPz9vkEhkO+tMs4v37RrNK+eDhIpNCaNp+4FjwPki7oujIQ0ftfBJlRkaljQD+t14Axfuy/n0VK7nbhLnY/PSzQ5hjL;
	4:HfDoxt1RU44WTJmN9X+oRTJgb/Sx/hoqjXBEENhYDGln8cIRnadNjli08EMlPAFmaScAcjOlMBFjqeojmOqPacrNZ76BlPCnyIagpz2OvDNhQ/s7H1L5B3yGm3mp4IKVWBU98Ix/81DxFyik6emqHumvhKNjVND/UO6x+9gi+5oU7t7zIwD75VGNY4qogJ2UC1DpBBM2a+CfgPfR9eU08XxFh4DeSQD9GoUSYez82BNNrUF7EXnSrBQB6jrzh8nAa+mcjDl16Lou76YHBjEa3w==
X-Microsoft-Antispam-PRVS: <CY4PR12MB176512F7833A021CD654384795E10@CY4PR12MB1765.namprd12.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231061)(2400081)(944501161)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041288)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR12MB1765; BCL:0; PCL:0; RULEID:; SRVR:CY4PR12MB1765; 
X-Forefront-PRVS: 0563F2E8B7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39860400002)(366004)(199004)(189003)(36756003)(558084003)(6666003)(81166006)(68736007)(50466002)(48376002)(966005)(72206003)(229853002)(50226002)(6486002)(66066001)(81156014)(2950100002)(478600001)(86362001)(4326008)(186003)(97736004)(6246003)(26005)(1076002)(47776003)(76176011)(316002)(52116002)(51416003)(3846002)(53936002)(6116002)(6306002)(7696005)(2906002)(305945005)(105586002)(16586007)(7736002)(8936002)(53416004)(5660300001)(386003)(25786009)(106356001)(8676002)(16526019);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1765;
	H:linux-pyp0.amd.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR12MB1765;
	23:76MvB4/l/QhG14vf7PZyga/ZECANkiXZkrG49++YI?=
	=?us-ascii?Q?vRv6fXMi2BIu0qEiptlHZUmr5Ed3lPOXYqpNeZQO7e2eJ0WpFBFV16iERt89?=
	=?us-ascii?Q?8lR9gxJ5XaSFun2faDwRcKPOEVhMAICPciCs4RYhDfgzexzsSkjcv6X9fulJ?=
	=?us-ascii?Q?16iaDF/ZMufDnrhxB67EBRfK5QSA6jvNCe7tL8GC0yx0UG1fW1DKgNJiKYEK?=
	=?us-ascii?Q?aLWhFrNksScYI0UAd7DFiY3BDW6ApoctQuJtm1Ghr4qbyR88TMVw7feyBgXc?=
	=?us-ascii?Q?FYfI6PH+N8izuTCLdK76b52wp/Ud0cgPXzMo0HhDC2a/zJ9gMUeZLk5S8cCh?=
	=?us-ascii?Q?mHYED60tJHZiOmezIGooKA1MPPBwS+SHZyIaK51Imn/Rt89cVVdk/InDQM+c?=
	=?us-ascii?Q?0EM4Ni5sdgM+BEk3gGjFrMoimgHObz7MpkHkVYyVj8m8LSnz0u0AUfsWVoUn?=
	=?us-ascii?Q?P7E34458yC/mG1ulqaJuuBKsXeuwFm+puqtK1O8lDdEgsJyIboc2xOSQ0MFX?=
	=?us-ascii?Q?+ovyCpE7tkAW9vmz3jF3kl1zkCIs7+cWxWq5KQzjAkTan4buXXZmI7zUwj71?=
	=?us-ascii?Q?B13edaGZMuZN+t4noOq51hSGFJOSFKlTDsknLKdpPoMgfvLC5pKUngU5Yn/W?=
	=?us-ascii?Q?CrZJKd2A7Vz3IVL8Ug1H6AzsuW54zHMpCv+oik8rqLGL8KIVWeiEBOwtu2Nn?=
	=?us-ascii?Q?Mre52PDqMsEF3XGP2CWSzqV0QR1zA3O6kNKTJoOSP5xqFqD6Fv4d27K+t5vE?=
	=?us-ascii?Q?ohHO0+y02wYXHzP6EcWZ2y6JiN3CNf3/G1lI0BnUHnCodEAG+1wRlnNATNj3?=
	=?us-ascii?Q?ho6rn/TBSqHGmgwNkPUwXgdstlBhKJ2JzXtpJxUZBpCUCQza3lX55gFi6wTg?=
	=?us-ascii?Q?QE7qlyA6f21FIcUHjxZ4fXzMPhY04I6eu/xrSUrK2jGH+vlUWu6wMxUflvX0?=
	=?us-ascii?Q?8bdz9bTMpbXbOpdvqQ0AjyMh5TaH57urgAofTgCkoOtaI5WXWAJMV2shHXfV?=
	=?us-ascii?Q?U2z9pr2m2mFFGGvctAo0afiOcKFMGT4JsjXnmaJH3yMBja385Qqe/AAfVUqc?=
	=?us-ascii?Q?iDFl8v0tym+kjqla9hEctZ4VlRBazA7aRGnO0O8vAEruamkzG2zemOLyKur5?=
	=?us-ascii?Q?x5yZa2PugaDOZ3hjVTmYfQbJZdxypMqkqDweHokL++k2J13nVbGC3RvlkRT6?=
	=?us-ascii?Q?k9CzEaJJNHTS+2GhH6tn0has365DmyZyJQTNihawrcaivqc3JUzLgSU1Q=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR12MB1765;
	6:t3ygR/9y/JwAneXBtaPG8nmEAL9PZKw6JTwZAE+7++AK/nrrD1q6+7YxrZN2UiSpcnHu+D9F92f+17+5BI5Ju6yLIEWzx2rUqrmyKFSp6KYiX23VF0F5DvlGEO8j9wDpy86VwSqDCsrTXy5DP6ZuMXKs+04pej4mRNNaa1LZauhO2eDLit35oKRH/evqI6JkoYnXQsc1A4K58slsy3b/vuzNgR2eW1ciQOV750hZXbOn6evhejOyfnPqzFIReFOhpDjrQuYX18VLmWnIDpNmc68c7dauf3v6v7ecmT43zvBeOXfGmJt3oioNSvYCpimHrP4VaU+xyGyP141UC/HG5sBwZ7kplfvJIvTLkHMggQw=;
	5:Q6Y8xK8fG0qc5bCJSEzbi/Ijd1HvjKeu7AjW1seiMPWs7byGgguCnx4ZsWTLcv/MnKnHS2V36CTfn30cZfi7HM1JQxaACaaqAdCbf3DqG2T1MZ1pSxF14MecnqbqlURmJ5obmUFjCl/wzomFdRkUvdaIJdTZV07Dq7ALV0Uskr0=;
	24:AThLzZ8tza4WiHrM1qwKbVS4aRVNlhSNFlW6xqtIJtjiAZ7iD9U/34zt6EAswSUZ//eqcY+1z3OQYQL9H85kmw8GZ9zIB3AyCfQKsKpMWjM=;
	7:ZypDJ4QM88YPrjbq2GSfc7MaLi5YEqsneGxnn2czZZONM4i4tgTrm9zHpTATd6FrNFggOIIa5Kn5jPMjTe58LgUsI2z4lIynK2Ttbr2lajXd503Ntfjzd18fFB4R25yIjYnvHDesYkbGhXFVD3CwQX7hvvWd8oTxBC2WtmIMHBIZShLMwFlr5vVFIn9qwd2IDfi0ogD6R/ISkXfS4z0pFb0WCpLArmrveIWsjpvkS1WjbLBZtCujYNabYxHtp0eP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR12MB1765;
	20:KNPP9jXS6FmdlEX8b1P4gRoLhLDRy6NKYFH3im/QazdnH6PIAQFw0yg2N5G0IuoNpV6hn0OKJDn7yuvLJf/O+LFwslecBoxfVm0wB7TrM0c4Dc82eDeDsG2ssP7Ei2/kMcIrBcf0+Of0Z9itQJGmCCroImPl3UuRJPduCSbRJMjF3ZC5Qq134RYg3YpZ3qE6I77rvZhCwK6TBPPgdj2MqJf/2LUJKBc16Us/hkMWxjMc6TandmzZJOAjUVoXRlvt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2018 21:56:53.2235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d14a5b2-2de0-49d6-c185-08d5643e8baa
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1765
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.52
X-Mailman-Approved-At: Thu, 25 Jan 2018 17:39:59 -0500
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] AMD Processor Topology
 Information
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
X-List-Received-Date: Thu, 25 Jan 2018 21:57:04 -0000

Hi Stanislav,
I am working on to support hyperthreading feature on kvm/qemu guests for
AMD EPYC family of processors. I saw your patch series
https://patchwork.ozlabs.org/patch/834022/.
I am planning to refresh these patches with few changes. Let me know
if it is fine with you.
Thanks
Babu


