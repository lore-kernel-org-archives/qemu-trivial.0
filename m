Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tORJ5-0006Io-W1
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 19:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1tORAM-0005OU-Nm
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 19:46:55 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1tORAK-0008Eh-Ux
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 19:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734655613; x=1766191613;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EAaE9JA10mdC/m1BmHb5wpQ/gUIimTY/4FOgw0Gku/g=;
 b=NxlOrqAitbicYGS6FWUJJzVO63KxI1RmBwZAvfsh2b3C4JBQ0+bavD1S
 mFO2X38FtHCn2c1hD3LLzdVUDXEqlLr46ENB/Z4H54y7Zff4PAWd/XGsI
 FYLwmuGCNOgCQa0Tk3v2h3B91DSHENRzwEs54cPsLW6tN7iQxNdzYw17u
 sidom2YWdX+on0FGV38apUia5WLA1OqwC1c4ATtCuHfRkPfOJUunFEUW0
 LeZdxsTW29nOo7UqmbkJB8AD86DjnOig9/wMDrumWDC+kJyS3vKGyJS6N
 ne8Coe03GJKCn6j88Ypm7EL/eh6cx0NdkMnvuZ1vNTV1jeqtYtQrcKTri A==;
X-CSE-ConnectionGUID: qhTCEA/ZQjWonP1ap1zENw==
X-CSE-MsgGUID: tx6EdnnhRZ6zZDTb96YnlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35360157"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="35360157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 16:46:48 -0800
X-CSE-ConnectionGUID: HUfb2G4tTAK6Hcz2Sb8l7Q==
X-CSE-MsgGUID: tvE9vK/vTLelcu1T6KdNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102488684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 16:46:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 16:45:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 16:45:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 16:45:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc6Y9fq4FeYQiXR0HljMQNxlY4/q3GiZ/yCXx0/lqqSRg2HFrZlpAP1sk/fgSbkP42kNGLN8GnA/0h040ybZtaIMR5M0OKuO+UL581RXEfvXvAvYNiYg1Ck9rmDLsvcrWUrWrHAsycG7FWEDca62gk/by1GNLs7HYurnygTvXga/hql9BGCHT3m/Ge7M7OQZz8kBVYJ1V7JGh3U2IvTcJOfPCVbt4lmj2I4YCK72TyNw+kyEX8wBi7w3X87LRetx1VrK84yh38ttK/Q7fwGtJJqzafEpgipVxp5JoneR8+WxI03AfoNYJu+XN/RCQIscFBB/2yT0CPq1mq0TUIfldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUfSJFZ9+andnL85/HAZY2jLOt8Kdd/AwSp2JQGhIc4=;
 b=GiYUMnM1eGTfRLaDXzrcYBspFbZFQAmrWnamWwreGD9YbzOcwYn6Ursp7Jbh5jYXCw02Xmtt1oGvwMdYqGyq34X8fSoV6wypm1LGqAkvVDo7VCd7PbI1naHxzPJ5UnH4fexSCLgrG3aEgwK5NFCsGTPmkjtYtfbr3uIB6xUvEr4gbNYH1iICMi8ak+hfNFsY1/dt8wpetnvwx+h5KQzYhJHBzGas9VNCf6eQQ6MQO+mC0RU+c2EN2uXVDZ2zsmCu3cGYkE88eJ2Upx8kbts8eYR+WrXwt6glSvmAfCc3j3RcVahpLu+DZ2gaXMCrOM+9dkgYdcA8cx3tN7oqbjpmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17)
 by PH7PR11MB6428.namprd11.prod.outlook.com (2603:10b6:510:1f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 00:45:44 +0000
Received: from CYXPR11MB8729.namprd11.prod.outlook.com
 ([fe80::680a:a5bc:126d:fdfb]) by CYXPR11MB8729.namprd11.prod.outlook.com
 ([fe80::680a:a5bc:126d:fdfb%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 00:45:44 +0000
Message-ID: <2d6b46cc-f603-4a56-a711-7cf2e5a6127b@intel.com>
Date: Fri, 20 Dec 2024 08:45:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/i386/cpu: Fix notes for CPU models
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Han Han
 <hhan@redhat.com>, <qemu-trivial@nongnu.org>
References: <20241219085141.1857343-1-hhan@redhat.com>
 <be91046d-dbe0-4701-9346-09521bdc5c4c@linaro.org>
From: Chenyi Qiang <chenyi.qiang@intel.com>
Content-Language: en-US
In-Reply-To: <be91046d-dbe0-4701-9346-09521bdc5c4c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CYXPR11MB8729.namprd11.prod.outlook.com
 (2603:10b6:930:dc::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYXPR11MB8729:EE_|PH7PR11MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 190711be-bca2-49e2-de8e-08dd208fa317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJIZW9QRXM2QXVNSDBOOW1zUm1ESTAvK1JYT3N4Z0kwM21qT2tHV3J2bTg0?=
 =?utf-8?B?VTNkdlpUSkcwU2RYdUV5K1VqY3RSN0ZtbThvbkFic1Uwc2l0em1VZHRQbG9H?=
 =?utf-8?B?dXZMU0toUmxDTFFYNFVaUmRvUUlGRmhIdzJFK0JIdnBzNTNCL2JMVmFONjU1?=
 =?utf-8?B?UCs5ZGZEK0J4QmorVEsvOUhGZW5PczVLSDBUL2kyWGNoRG5lTDVUVWJBM1BV?=
 =?utf-8?B?ZkM3MHBUbVRzZ1pSeURxUmlqVkw4ZjUvU01FRFBqeWpOeHgrZHNYa3BNd294?=
 =?utf-8?B?UDd3c2lhSjBjWGdxY1Bob1hhM3diLy9hU2FIa2dvbkhLSmFtOWp2dVJxeWFa?=
 =?utf-8?B?RW15TkkyV3VGS3BtdWxBNHRteUlVYThseEVXT0JpWHpCR0o3K1RONk9iT2pw?=
 =?utf-8?B?ZGdKQy90YjhTL2orYXNwL1VtQ29YWnJUY3U5emQ1RHJnMUp1M1RFbk5SR0V1?=
 =?utf-8?B?TlVlUmgwTkx1SnZaN1JkSlAvQ2RwQ1NSaEJoWk5HcWo4Rnd1ditFT1RETHVL?=
 =?utf-8?B?OXM3WkxPQ1B2aEd0RzcrTkV6elp6ZzB3Y2RTaWJ4ZjRsRnJmMDFzSFIrZm1y?=
 =?utf-8?B?N2M3Mk5OcmdsSmhHQk5BNmd6SW9WRzU5N2pvZDU1em5OZkFLaGRZRVZSOXNo?=
 =?utf-8?B?NjRESDZ4d0kzbGoxejcwUENiRUt3RURTYkl5MVVxUEFuVG1oMVpwV1A4eDla?=
 =?utf-8?B?bWFVVmM5Q1J4Rjl2cmMrVHdXMUNrYkRza3M4cW1hdkIzNEt6ZG1wTUhWaS9Z?=
 =?utf-8?B?K2FQQWJ4TVloUk5YK3FxTVBjdVMyNC9TMnJHZTlKNG4yek05b2o0S3BITEJS?=
 =?utf-8?B?VDg1bS9wMXd0WFZSZ1BIeTlTOFBsYXpLSjNGZEdWektvNkEvTTJ4VWNXZTRO?=
 =?utf-8?B?ZkJmdGpvU1ZKRXlENk0zL0NYZDZwQk5SOHNURFE1ak1TalB5ZzN6bkt6OFJW?=
 =?utf-8?B?d0hwS2F4K0gxbGo2cy8yVFZzTFZnVkdybTIrcUl3Zkh4STlWdEl4VVVWRnZ5?=
 =?utf-8?B?aGR5T3c2anJkZkEyT0RrRUluSm9WU3hIcG93TDFLWmllK1FIZFRKaDRaU08v?=
 =?utf-8?B?dm5BOHdsTVJ6OGpVbW05MGd4UzgzRVIvdk10TUN5VW1LUjkzYmNlU01VM2wv?=
 =?utf-8?B?NHN1T1psRm9CSTVTMGVNMWpTeU5wa0drQ0Y1RGg1ZkVzMGFtTVZBTnN5VkpR?=
 =?utf-8?B?NFpvbDVvc29UTUx3bU1JUGhLV21vc2FsQnZNMmowMlhLeWcvbWRWN24vZlF0?=
 =?utf-8?B?N0MxeGcxT1NBc2hpM2FlNHBJMWMzMndTUzZTNC9iY0o4NUxCTTBETUhnRDVz?=
 =?utf-8?B?R0EzbkFkQXArTXJjYllTVFNHMXZvcVdoMis4eWRjbDVqRm5qY1loeUZ2TlJN?=
 =?utf-8?B?Nk1OcjJqSEIyV2RMRVVNM1dNNHYrYTRVMzVnTEFscGI5MnIvMkl3WXd2YTZt?=
 =?utf-8?B?bzlPZUZDcTdYWlBObGc2T1hFVEZkVDNNL01UNlp2ZDI5cGxTQSs5bEtnM25J?=
 =?utf-8?B?cUd5YkJ1SG50QnBmUjJWUEV4em1kS3BxaHdRa2RCOFlzanFTb0JQOTF0VU9z?=
 =?utf-8?B?R1lnWmdPY3czK1R4WDduSGFPU1VtU0tIRzViZzU3R01xNWRCVGEvU2hjaEdJ?=
 =?utf-8?B?Zk5vRktuK2N1TFYvejk0L0FwaU9IVEMxWjdQeFRJNXR0OXR3TEV4ZzdnWS94?=
 =?utf-8?B?cllqUW9STTZEWHIwQzVFZ0F2eHpSZ3JFWkN3cmYrdlVsT3MydFNFMTJGeEFF?=
 =?utf-8?B?STBVSDVraDRjdmREOHBUR0diQzNOUmwzYlkzV3BPQVZwTVZjZ2FZVERHOEln?=
 =?utf-8?B?cG55TFJKZmkwSUtKZmc1OXNhdGgwcFBmNE9RdkptaDY3M2Jpa1JJRGZxaTQ4?=
 =?utf-8?Q?7jzgarx4xErp2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYXPR11MB8729.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZTLzFzOE5iVENiYU9jdW4vRWQ3a3JlSzFiMG5sbnBOWGhHSkVPYnBJMFkx?=
 =?utf-8?B?ZGJlbzVIRkFyQzRjZ08xNmQ3aDZ0RXdCNVBJTnlrWDdiZ3dic2d1K25mWjdP?=
 =?utf-8?B?dUZOV2Z3cjFtNGkrcWsyajFTaDJiWWdxRVpoMXM2b3hKUno1ZFBiaG41YitQ?=
 =?utf-8?B?NnFweDVHRUhuVXBLUDdQbnpCTFFOaFVsQU96SzgzdFlXNjYxTkUzV3lVQ1Iz?=
 =?utf-8?B?S09FRGN6eEFVeXdzZFlYNmxXWWtSS0JjMmpCdjk5Vmgwai80MEY2Z25HWWlK?=
 =?utf-8?B?Vk9wQkZUcDBSVG15NVRkbHR0VDUwZFNQekFBdHhHaFIvQnAxZlkrcnc5cWp6?=
 =?utf-8?B?czdqQ0FOcTR2a3pGZUt6cTVKQlIrdnpNVk5vSjEvQ1pUdUk2MjdvN1d1NXRr?=
 =?utf-8?B?bk9OWDd3bWFQWDIyQmZQR2tjbXNxcnNQNWhRUjh2dTc3Si83VzVuOSt2UFdG?=
 =?utf-8?B?eUxXUWhpT2t0R09TTEZDSG43aDVYNkplMHV2SnlyTDFIYmZxSENWQm8wMEFQ?=
 =?utf-8?B?RTM4T2hGeUtmc0RWOW4rK2U2bVdORW9DYS9rdjJiaXIyOHZCVDFyZEorYW1m?=
 =?utf-8?B?RDZTOGpUeGZiNlRCb3lPdHpCS0JXZnNHeWlVZ1hTVmVtcEhCcFI0cVFpd0Zz?=
 =?utf-8?B?ZU96MEtZaTVZLzJXQzRWZHdnaEJnTXlueTl1N1kwbTd3eUZkTnFXTjVuR2ND?=
 =?utf-8?B?UVFLMjF0TWRncHJWSEdhZDdCdm9NQko3SVhLK3ZybmM5UHFmNCtlazg5YTFt?=
 =?utf-8?B?cFU4amVzQXBpMmtYTGVoRnVONlVEL0RGYVI2SzRyajlHb3RPSmFXNXFqRTFK?=
 =?utf-8?B?ZlBhSzdrZnJrQVduNEJtK3doOXBLZUF1dm1nZ0pqZDR3cEFaKzFHKzYxbzF2?=
 =?utf-8?B?bk5FL1pHOTlXOEdlZ29Wb1RaUXVGMTc0K1BoclA1T2dWRG42YkhRb0huR0VK?=
 =?utf-8?B?Y2lrUnFKbXFCbjU3QytycjJVRVRmekc5UkNiT0tlWFhFSzBFZm5mY2diT2VD?=
 =?utf-8?B?SUFIeVBUckt6QVVobEtpdFo4UFdlLzlGMGt6OUxYYlFEWkUrT0lRaUFjMWVP?=
 =?utf-8?B?a3pzMUprQ3IxOXVrN0FIUG5oRjJmZ2YwMnkvMFF3aGZtOWhKSmdRdmZUZkhS?=
 =?utf-8?B?OVYydmRxaG02YUl5dXpneXNEazRsWkx2QVFDeklZZm54dVlFbVlyR0pCQVFL?=
 =?utf-8?B?QTlmL05EODlxR0dkNTF2ZnRGMDNRSG5CU2VqampmZy9EL1FUaTBhMmtyVVZV?=
 =?utf-8?B?Q1gxNVhNT0FkSzV3bVlJSDd4NThhV3p1RXJBNGpwV0tiMFZvOVhiUHdTUDRU?=
 =?utf-8?B?Qkd0cCtvRmtHVXo5YjEvKzJuZEVOSjZock51R0o2dHA2VHkzcHVjTVhYRGZJ?=
 =?utf-8?B?azFnOUh0eEp6OWx6ckFLeU5RcjhpTWZtMTJFN2pIelR1TG51TGlESHZhWFpE?=
 =?utf-8?B?TFQzSnlPQWIwclBYWTdJTVVSZmkwelUvQzh6cjNkQmQrN1pSZjdOYXN0Um5G?=
 =?utf-8?B?ZFhzWkgyUmk2dHBsTU16TTJQN3RxWS9hV1R3QlZ3RzBnL0RER1pwSXdQYXJ1?=
 =?utf-8?B?YkM0UmpGWXRtdkpGQm9HdzZ5TlhSMXFSdjg3VlRYVTcwQUZnUGpYNjUycHVV?=
 =?utf-8?B?OGZMQW1hTEdYSW1FcEg3V0w1MzBUZ01DMnh4ek53UkU1OURxUkpPaUVOVnNh?=
 =?utf-8?B?aERrb0VYTDJ3cnRiVnFqLzYyNU9jS1NBTVhzT2xWQUk0bGVnNEkvQk9VSEZB?=
 =?utf-8?B?S1V1VDl2K1dzZXpvemlvNlhDWFVvbDVaMWV3bitVY2JkRkVRK0FzTHdaUVB0?=
 =?utf-8?B?UkFyTm5EZjlwWkU3WXI3QWR1WGswWnp6VlQrT2FtMmZmVVpBcEpWZzFCSStt?=
 =?utf-8?B?M2ptWHNQK1JNQVpVaFJXWmExTHpzOXRYcHdkU1I1bXVFaHVkQmJwVUxSWVZa?=
 =?utf-8?B?TjV6T0xINnEwWGNST0x1N29URFRqVE00MjluNGd0djJNNVVQbGY4M3JoSmIz?=
 =?utf-8?B?SEdnbW04ZiszZ2VnUmh6NUhUSFpUa1l2OXZWUnVyaE81a09lUlRac2QrQWxo?=
 =?utf-8?B?Um9NcWU0NTFyQ3BLT2lsVTZhSExPTDJRYW4wUnJxNG9RLzdxUlNzYlRkanVC?=
 =?utf-8?B?ZERwVDRIYVI2cjFodTZhK1VnNlB2aCtJSFBoU0FvbzJ4M01JU1FHTWxwaG1t?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 190711be-bca2-49e2-de8e-08dd208fa317
X-MS-Exchange-CrossTenant-AuthSource: CYXPR11MB8729.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 00:45:44.8272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjaZF6ZVmJP0hiZ71aN7vsFAntxZL5/fZjFycoq7IXKFqRu85Wvp9YCpbLyk7/fO2lq3HhYalDSyQJF4FCTzEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6428
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.198.163.15;
 envelope-from=chenyi.qiang@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Dec 2024 19:55:53 -0500
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
X-List-Received-Date: Fri, 20 Dec 2024 00:46:56 -0000



On 12/19/2024 6:09 PM, Philippe Mathieu-Daudé wrote:
> On 19/12/24 09:51, Han Han wrote:
> 
> Fixes: 644e3c5d812 ("missing vmx features for Skylake-Server and
> Cascadelake-Server")
> 
>> Signed-off-by: Han Han <hhan@redhat.com>
>> ---
>>   target/i386/cpu.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 5253399459..820571761d 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -3691,6 +3691,7 @@ static const X86CPUDefinition builtin_x86_defs[]
>> = {
>>               },
>>               {
>>                   .version = 4,
>> +                .note = "IBRS, EPT switching, no TSX",
>>                   .props = (PropValue[]) {
>>                       { "vmx-eptp-switching", "on" },
>>                       { /* end of list */ }
>> @@ -3825,7 +3826,7 @@ static const X86CPUDefinition builtin_x86_defs[]
>> = {
>>                 },
>>               },
>>               { .version = 4,
>> -              .note = "ARCH_CAPABILITIES, no TSX",
>> +              .note = "ARCH_CAPABILITIES, EPT switching, no TSX",
>>                 .props = (PropValue[]) {
>>                     { "vmx-eptp-switching", "on" },
>>                     { /* end of list */ }
> 

Looks good to me.

Reviewed-by: Chenyi Qiang <chenyi.qiang@intel.com>

