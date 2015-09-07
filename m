Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZ3jQ-0000eC-Rg
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 17:13:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZZ2Ke-0000KK-0V
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 15:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZZ2Ka-0003Tv-Pt
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 15:43:59 -0400
Received: from mail-bn1on0091.outbound.protection.outlook.com
	([157.56.110.91]:55360
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sai.pavan.boddu@xilinx.com>) id 1ZZ2Ka-0003Tq-Kn
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 15:43:56 -0400
Received: from BN1AFFO11FD017.protection.gbl (10.58.52.34) by
	BN1AFFO11HUB044.protection.gbl (10.58.52.155) with Microsoft SMTP
	Server (TLS) id 15.1.262.18; Mon, 7 Sep 2015 18:09:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none;linaro.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (TLS) id 15.1.262.18 via Frontend Transport;
	Mon, 7 Sep 2015 18:09:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59136
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ZZ0rZ-0005Ki-8B; Mon, 07 Sep 2015 11:09:53 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <sai.pavan.boddu@xilinx.com>)
	id 1ZZ0rZ-0008L4-3S; Mon, 07 Sep 2015 11:09:53 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t87I9Lwe032468; Mon, 7 Sep 2015 11:09:21 -0700
Received: from [172.22.159.26] (helo=XAP-PVEXCAS02.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <saipava@xilinx.com>)
	id 1ZZ0rX-0008L1-Ri; Mon, 07 Sep 2015 11:09:52 -0700
Received: from XAP-PVEXMBX02.xlnx.xilinx.com ([fe80::6c95:7dae:8014:5ca1]) by
	XAP-PVEXCAS02.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Tue, 8 Sep 2015 02:09:50 +0800
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH V3 2/2] sdhci: Change debug prints to compile
	unconditionally
Thread-Index: AQHQ6TjiIn8G+nl1NUah9LisqeKTK54wysIAgACTMAA=
Date: Mon, 7 Sep 2015 18:09:50 +0000
Message-ID: <4025671C58A6E340B47F5CA342BC783A42AAA3AB@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1441608340-26983-1-git-send-email-saipava@xilinx.com>
	<1441608340-26983-2-git-send-email-saipava@xilinx.com>
	<CAPokK=rKa8hYWbtX7DGkUySFx1496B7yOMHM2MRvS0-ud=o3sw@mail.gmail.com>
In-Reply-To: <CAPokK=rKa8hYWbtX7DGkUySFx1496B7yOMHM2MRvS0-ud=o3sw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.228.43]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21798.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD017;
	1:5IVZjDZGYDWkHHPW9I01lwRQcKhgQuTyKEzXiWoq9J4Mc2B5jVXtZligXDB76LX/WlWK4SYbRERY7MNs/T9MN6uE5l5m6JjVEwzhvNyHDVEIRGPsPHNpsxIFCWLUEdB4v/Ze5H6UAV9vGJzOC/u1aBr2AC27LvwP9O1yto5vIl7d4GdWg0H/rMvs0WPUlfX4thnJfjIeHkr05bgSf8ACSG9D1ICB6gehSjG8heUt87Qb+jocEgxalpBY3AalNTOJEiWT2YTSrpsejz1pfj09SLJODYb9bUTzgfDRKfQ53NsyRwEB1b/FXpWoP6dn/XMoz8wW4b3gb9OPaoouL1sbh+xxJPrFF0Q/mTGLXtjgA/QaVCnJIqWIb5gzTRzRGV0RZrpSjEBqC7fjSYx+rsFN+g==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(13464003)(24454002)(377454003)(199003)(189002)(102836002)(50466002)(5004730100002)(33656002)(50986999)(107886002)(47776003)(23676002)(63266004)(64706001)(92566002)(86362001)(2501003)(6806004)(5250100002)(5001860100001)(76176999)(5001960100002)(46102003)(19580405001)(19580395003)(5007970100001)(4001540100001)(55846006)(5001830100001)(87936001)(2950100001)(2920100001)(106466001)(5001770100001)(77156002)(81156007)(2900100001)(106116001)(54356999)(5003600100002)(62966003)(189998001)(107986001)(4001430100001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB044;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB044;
	2:u4XgThOGBxiz6m6P2+sADbXUz/fkEJcdN3tpC1ysilKfpaxTx0lPVNXr5YId26Aw0dtaxR+0aKHfz+isEc7uGE/W+uod4UtJkNSZOvpmYHCE6JLHrt4SCKFFoDGtVEcaT3Awd6l4bYwyTtq4lz6VHMBAAb0bCw6w4W/Jvf/SduE=;
	3:qevclajLwfm4TEQ0noF5k/6nONcpgZyGdY9DJX2ews2Aa+qbF0KxrGYSM4rQC30pDLueHjCjAYcBxRQBD7UMQPTaqCtEgHhLa0Oj+0424A9BH39tL0j10aZjw6IfnYd/hcxEmTu8u2MITwchBNS8UWijZeCerSkJEByZWcgoC7xz7xvacmyVITSEYPGvAB2gOUmYqrhvnH+OhKWjycN7SHr/1sV4d2Yigp3/qg3L3JzDuK7X4f0wvRWY6aqi9godjIZZL5CWKnkCCo5stVjM1A==;
	25:RnxtDVB6bU1iF8j20c4tpBevPIJ8kAYY5DEAfi2lpywiINDsxoA6Q64s9XWREn9I3CAWQYHJqnsebZN2d5zgKKtC5i9ePwriuzefGlHScbxY1ysAzNVAUPnZTNOruQTMoeRKFOSuGQYU0d0mucbsxUS6wrg/sRX1xwhHiaohT4I/OTVxsL1crHLF2+9OSnCqRdFmd4Ww01r0Afi9i2BNCv54wTo/ShCweQSaVMGRy5bIPEZ2b/4fpyd035N0pF7UMVYC46om9zlgamYQYCjVfg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB044; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB044;
	20:sCweSazcAo8rVDtd+XzEATT/BhYgsmxLE7bkhjCblXIdvuGoYH5iQuQNRwMrT8ce1x5jOXFTcFO7jS8pj4xOvbz28pi+YC/41epdfFRkSXhmwpob4QwhVwHLVdkVEF5Dxdm7YTsA9BY0ZmnNs51tTRaTqcpleonbnjBVk6gaqiz5VxWQ1Ku4J1cKAUV5qW08h/bBvuggNfQYEu8ZqCiA9F/6c5drquHBIgUXM0RTKR/1c++V9i4uiPrTMcD5+nSFa1hPSnzdadYWBdtFUTmK37PiI13VvxsO/xCvmh6EQqtUAPYkXTfgjRx4tfSFiKufQMFV0m2ZB5ECKTk65KPy27R47aKuc0V/6NRTLaNae58HATTDg/d0ggabSRmIIXKCQqF+RqJPc/7duDaV+9T3dXR6AhYruuzjp7FKr6d7PNo97Iy99+iqPPKidPVr00DOfiOGSuExpbdFcJfu4Q5z5Cm7riv/Tc2RdZ2+hYvS/D6t/Tvy2LBAKgY77UL6NVlG;
	4:b4ZGkeQwVeV7GvrydJ2W8/pyy9KfwkIIKOkPYeZpD3EYyg1g2HPFMFOu0p76cJWUWDwx51nK9sONoJkgNle7rgBSwbVtU0c/oq72GCgBqzB9EO8TbbPYPuB0So9zF/ythwHV5iLDwJs5gii8MpEzIc3Hg2WKYYVigdehhPYhbO5076yOuBPso+QEQhFLWocKWH9bkPBPO9V6G4SxUsLhJI+/EUcpNx3wDWB/TFBQRcvgOgeYKVTmM5kSovwD0ndYmgQ5Ov0bG3F9zOEz93zvTgA3K+X9Kp/xmLfjBxG41vP2aOEGz/BBXHppWXjoOJekIGBjgkIywZdCnElRwdn+cg==
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB044F4B8189BCFB5B07E9049DC540@BN1AFFO11HUB044.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:BN1AFFO11HUB044; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB044; 
X-Forefront-PRVS: 069255B8B8
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFBRkZPMTFIVUIwNDQ7MjM6dHAxUDk3amtqYjJEL0RWbzRNOEtNbkZ1?=
	=?utf-8?B?b1J6dEZ5YmtnVVlzSzZUU2p2Z0hnK0hKdWtVOHhOcy9tMVArT2M4MEN2c0JJ?=
	=?utf-8?B?eGwrWHg4Q0dTRmlUK3dmVjE3SmdyU1krYTA2K3RDZTNLRmZTRkg1bGtTYXA2?=
	=?utf-8?B?ZFlrNXRSTDlha1h5MjV0R2RJdnRSQlkxdXAzMmVVZ2dzbFdkcHJ1K012WDBI?=
	=?utf-8?B?MU1oQUx4cGxQNU5YNzlmWWpJc2xMd2FUSFo5SDRObGhGVHBPZDdsOGJYeDhE?=
	=?utf-8?B?V0F5SEFKT21KVDl5UlhYbUQ4OUh1YW1iTXZMTU9URDdublNWUW40Y3ZTSTZo?=
	=?utf-8?B?QXlQaVlSUEpOSnV0dXZHM2g2U3podEREbG1VZU5SNjJvSi9JRXRkKzE1ZFlG?=
	=?utf-8?B?TmowcGRRMDhSZWd4aHUwRWErbDZCRXRQcERsNCtFWkJvYU9rQWx2WktPd1B2?=
	=?utf-8?B?S1huNUFRcDFZcnlMems5Qk9zUmk0VWtsK2pYUHhGUTZXaDN1Kys1bW1XakQw?=
	=?utf-8?B?SU80VDRrRUtsK1VldGRqU2lidEtxMnpGcGNDNmdCY05mKzh4MTZoYng0Ny9M?=
	=?utf-8?B?WVQvU3lrTnhUcjNGWWNuc1FTNzl1TDlPUTNQRnBJK2R3VXlsbzB4N0JHbXVs?=
	=?utf-8?B?WDJpTFlHcS81U3JqZi9wUFA1Q0hHQjZVZUV5MkVCQ1pGTHRQYno2TkNpTVpi?=
	=?utf-8?B?TmJVOXJPaGpzWDN4VCtoUk51Z2JoeFB4a3gwdjNHc1o3cW5zZStDMTRaQThs?=
	=?utf-8?B?UndwRTRFSE5SS1UrSE96SE8ydTNBWlFnVHVJZVFScTl5TjVFMWllZHZlR2lC?=
	=?utf-8?B?aENYSlJDcW4wSHV6Qll3MWt4UXVMOFl2SzdycmpiWG1nWGJOSmR6akZ5Y1NY?=
	=?utf-8?B?ekVKWlBXMUo3VFBwVmRBRmZVWWkxMFhTRGVQdHNvbXExVWRpZ1lyUHZYdWtp?=
	=?utf-8?B?eEpCUjRpalh0a3lESmEvWE55ODU2aEEvSzR6aDE2cGw5Zk5McEd1WjZDaTAv?=
	=?utf-8?B?RGpocHpQZGxHUE5DcTh4REJ4MnVGR0phblZrMzhNVG51Vm9NWmU1RVAvQWxi?=
	=?utf-8?B?dlZwWWpRUVJSNGw0K29zaWgvZ3VNczIrSTR6YUs0UUYxdE5oRVVnOEE2YU9N?=
	=?utf-8?B?NDduTER3ZjQ5QzNqQStUVjVUZ3NydlBoWVk3RDZibjUxVjVoWkRGUTlrUDRL?=
	=?utf-8?B?ZU1TLzE4RGNrY1FrdElRaXBQMUJvdUZFUWpjVUF4aGVncTFRTHh0YzcwbCth?=
	=?utf-8?B?ODdmdkFNNVl2SFlhYmc0YTN3TG56MGp6RWowb21iaW9BRUNDZkE0YkIraXJh?=
	=?utf-8?B?Q2M4eWRNRW5HYXZjUzhJREFlS28vK0NlUkdUWnQ5Rnhrd082bGVsNmt5SEdx?=
	=?utf-8?B?Z2JMWWxpUFdsb1JsQ1hNWklJdnRMaDU5WnFoSXFmY0ZibzNQSWowVXBWb0FK?=
	=?utf-8?B?ekJVc2c0ZktDVGhzNHVJd2U2MzQyN2hMRDNxZjNvcVJNdTJMV050NU5abDY2?=
	=?utf-8?B?WVBkQlhxY0tiUmJqdGprbFFqVUdZSWM5NDBrQVdaYzBnSXdON0IxT1RvTEIx?=
	=?utf-8?B?UWFnYW0waG9XTWFBMUdHL1luTFdrd0l5dE9IZHJzYkZZVWpkMWNXZ1lXUDJP?=
	=?utf-8?B?QzZPSEVza25Rajd5QUxiSS8rKzBtVVAyYUhNalFiZXBucU1xVlY0cklVUEY4?=
	=?utf-8?B?RkxkMms1azlBbXVoNzl5Q1hpaGFvbDhERklMMGQveU1aeVJkc0RQNzdJTTZj?=
	=?utf-8?B?dnA1L1lmWjM1ZVI3RzFEbnRMU3Ryc2g3cElGK2ZlRWpPZ3lzK2JMQkpnd0hD?=
	=?utf-8?Q?fn13BqfhGQ5jkMF?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB044;
	5:Syh6D9iByl0wExNlf2x04I0OE1YnPDmtPyO/YSPPsjJXcyD7LSSnPInRhJcX9fI4anrHfcVG1P4c8Ixb4KjCKA1V72HeFzlzpGCWWssCRYBnSLmuBPnefgtGpNsP4aACEZTKXb0wrJ2DAFgU6ebvEA==;
	24:4DVAKWyMOVXSKjFG/hZc+HZ413ojdQ0o8l6nvqcjc7l0BFvghcyASINKME/RTSVqhkG7hNoWzGccvCJKITsuRBABr7TZwtmEpjlKrdzAMy8=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2015 18:09:54.2860 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB044
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.91
X-Mailman-Approved-At: Mon, 07 Sep 2015 17:13:39 -0400
Cc: Edgar Iglesias <edgari@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Alistair
	Francis <alistai@xilinx.com>, Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH V3 2/2] sdhci: Change debug prints to
 compile unconditionally
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Sep 2015 19:44:01 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2Fp
dGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NCj4gU2VudDogTW9uZGF5LCBT
ZXB0ZW1iZXIgMDcsIDIwMTUgMTA6NTIgUE0NCj4gVG86IFNhaSBQYXZhbiBCb2RkdTsgcWVtdS10
cml2aWFsQG5vbmdudS5vcmcNCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZyBEZXZlbG9wZXJz
OyBFcmljIEJsYWtlOyBQZXRlciBNYXlkZWxsOyBBbGlzdGFpcg0KPiBGcmFuY2lzOyBFZGdhciBJ
Z2xlc2lhczsgU2FpIFBhdmFuIEJvZGR1DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMi8yXSBz
ZGhjaTogQ2hhbmdlIGRlYnVnIHByaW50cyB0byBjb21waWxlDQo+IHVuY29uZGl0aW9uYWxseQ0K
PiANCj4gT24gU3VuLCBTZXAgNiwgMjAxNSBhdCAxMTo0NSBQTSwgU2FpIFBhdmFuIEJvZGR1DQo+
IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4gd3JvdGU6DQo+ID4gQ29uZGl0aW9uYWx5IGNv
bXBpbGF0aW9uIGhpZGVzIGZldyB0eXBlIG1pc21hdGNoIHdhcm5pbmdzLCBmaXggaXQgdG8NCj4g
DQo+ICJjb25kaXRpb25hbCINCj4gDQo+ID4gY29tcGlsZSB1bmNvbmRpdGlvaW5hbC4NCj4gPg0K
PiANCj4gInVuY29uZGl0aW9uYWxseSINCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2FpIFBhdmFu
IEJvZGR1IDxzYWlwYXZhQHhpbGlueC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBFcmljIEJsYWtl
IDxlYmxha2VAcmVkaGF0LmNvbT4NCj4gDQo+IE90aGVyd2lzZToNCj4gDQo+IFJldmlld2VkLWJ5
OiBQZXRlciBDcm9zdGh3YWl0ZSA8Y3Jvc3Rod2FpdGUucGV0ZXJAZ21haWwuY29tPg0KVGhhbmtz
ISAsIFNlbmQgVjQgY29ycmVjdGluZyB0aGUgY29tbWl0Lg0KDQpSZWdhcmRzLA0KU2FpIFBhdmFu
DQo+IA0KPiBDYW4gdHJpdmlhbCB0YWtlIHRoZXNlIHR3bz8NCj4gDQo+IFJlZ2FyZHMsDQo+IFBl
dGVyDQo+IA0KPiA+IC0tLQ0KPiA+ICBody9zZC9zZGhjaS5jIHwgMzYgKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9ody9zZC9zZGhjaS5j
IGIvaHcvc2Qvc2RoY2kuYw0KPiA+IGluZGV4IDYzOWZlZWUuLjNhZDZjNzYgMTAwNjQ0DQo+ID4g
LS0tIGEvaHcvc2Qvc2RoY2kuYw0KPiA+ICsrKyBiL2h3L3NkL3NkaGNpLmMNCj4gPiBAQCAtMzcs
MjQgKzM3LDI0IEBADQo+ID4gICNkZWZpbmUgU0RIQ19ERUJVRyAgICAgICAgICAgICAgICAgICAg
ICAgIDANCj4gPiAgI2VuZGlmDQo+ID4NCj4gPiAtI2lmIFNESENfREVCVUcgPT0gMA0KPiA+IC0g
ICAgI2RlZmluZSBEUFJJTlRfTDEoZm10LCBhcmdzLi4uKSAgICAgICBkbyB7IH0gd2hpbGUgKDAp
DQo+ID4gLSAgICAjZGVmaW5lIERQUklOVF9MMihmbXQsIGFyZ3MuLi4pICAgICAgIGRvIHsgfSB3
aGlsZSAoMCkNCj4gPiAtICAgICNkZWZpbmUgRVJSUFJJTlQoZm10LCBhcmdzLi4uKSAgICAgICAg
ZG8geyB9IHdoaWxlICgwKQ0KPiA+IC0jZWxpZiBTREhDX0RFQlVHID09IDENCj4gPiAtICAgICNk
ZWZpbmUgRFBSSU5UX0wxKGZtdCwgYXJncy4uLikgICAgICAgXA0KPiA+IC0gICAgICAgIGRvIHtm
cHJpbnRmKHN0ZGVyciwgIlFFTVUgU0RIQzogImZtdCwgIyMgYXJncyk7IH0gd2hpbGUgKDApDQo+
ID4gLSAgICAjZGVmaW5lIERQUklOVF9MMihmbXQsIGFyZ3MuLi4pICAgICAgIGRvIHsgfSB3aGls
ZSAoMCkNCj4gPiAtICAgICNkZWZpbmUgRVJSUFJJTlQoZm10LCBhcmdzLi4uKSAgICAgICAgXA0K
PiA+IC0gICAgICAgIGRvIHtmcHJpbnRmKHN0ZGVyciwgIlFFTVUgU0RIQyBFUlJPUjogImZtdCwg
IyMgYXJncyk7IH0gd2hpbGUgKDApDQo+ID4gLSNlbHNlDQo+ID4gLSAgICAjZGVmaW5lIERQUklO
VF9MMShmbXQsIGFyZ3MuLi4pICAgICAgIFwNCj4gPiAtICAgICAgICBkbyB7ZnByaW50ZihzdGRl
cnIsICJRRU1VIFNESEM6ICJmbXQsICMjIGFyZ3MpOyB9IHdoaWxlICgwKQ0KPiA+IC0gICAgI2Rl
ZmluZSBEUFJJTlRfTDIoZm10LCBhcmdzLi4uKSAgICAgICBcDQo+ID4gLSAgICAgICAgZG8ge2Zw
cmludGYoc3RkZXJyLCAiUUVNVSBTREhDOiAiZm10LCAjIyBhcmdzKTsgfSB3aGlsZSAoMCkNCj4g
PiAtICAgICNkZWZpbmUgRVJSUFJJTlQoZm10LCBhcmdzLi4uKSAgICAgICAgXA0KPiA+IC0gICAg
ICAgIGRvIHtmcHJpbnRmKHN0ZGVyciwgIlFFTVUgU0RIQyBFUlJPUjogImZtdCwgIyMgYXJncyk7
IH0gd2hpbGUgKDApDQo+ID4gLSNlbmRpZg0KPiA+ICsjZGVmaW5lIERQUklOVF9MMShmbXQsIGFy
Z3MuLi4pIFwNCj4gPiArICAgIGRvIHsgXA0KPiA+ICsgICAgICAgIGlmIChTREhDX0RFQlVHKSB7
IFwNCj4gPiArICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJRRU1VIFNESEM6ICIgZm10LCAj
IyBhcmdzKTsgXA0KPiA+ICsgICAgICAgIH0gXA0KPiA+ICsgICAgfSB3aGlsZSAoMCkNCj4gPiAr
I2RlZmluZSBEUFJJTlRfTDIoZm10LCBhcmdzLi4uKSBcDQo+ID4gKyAgICBkbyB7IFwNCj4gPiAr
ICAgICAgICBpZiAoU0RIQ19ERUJVRyA+IDEpIHsgXA0KPiA+ICsgICAgICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgIlFFTVUgU0RIQzogIiBmbXQsICMjIGFyZ3MpOyBcDQo+ID4gKyAgICAgICAgfSBc
DQo+ID4gKyAgICB9IHdoaWxlICgwKQ0KPiA+ICsjZGVmaW5lIEVSUlBSSU5UKGZtdCwgYXJncy4u
LikgXA0KPiA+ICsgICAgZG8geyBcDQo+ID4gKyAgICAgICAgaWYgKFNESENfREVCVUcpIHsgXA0K
PiA+ICsgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIlFFTVUgU0RIQyBFUlJPUjogIiBmbXQs
ICMjIGFyZ3MpOyBcDQo+ID4gKyAgICAgICAgfSBcDQo+ID4gKyAgICB9IHdoaWxlICgwKQ0KPiA+
DQo+ID4gIC8qIERlZmF1bHQgU0QvTU1DIGhvc3QgY29udHJvbGxlciBmZWF0dXJlcyBpbmZvcm1h
dGlvbiwgd2hpY2ggd2lsbCBiZQ0KPiA+ICAgKiBwcmVzZW50ZWQgaW4gQ0FQQUJJTElUSUVTIHJl
Z2lzdGVyIG9mIGdlbmVyaWMgU0QgaG9zdCBjb250cm9sbGVyIGF0IHJlc2V0Lg0KPiA+IC0tDQo+
ID4gMS45LjENCj4gPg0K

