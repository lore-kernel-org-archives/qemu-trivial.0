Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRa8t-000591-RY
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 04:58:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amarkovic@wavecomp.com>) id 1gRa8s-00057P-5h
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amarkovic@wavecomp.com>) id 1gRa8q-0005xT-Kv
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 04:58:54 -0500
Received: from mail-eopbgr710132.outbound.protection.outlook.com
	([40.107.71.132]:51698
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amarkovic@wavecomp.com>)
	id 1gRa8j-0005qx-4U; Tue, 27 Nov 2018 04:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ICBJ9kWl4POGYXfzC0yBXlISKAG+Wh06oAkAXN9jLf8=;
	b=dLhp4jeEFUWR/CPqooBKSCY7OS/XNrnK51y4cZDQ99/eCZ4e/Yi0OxVh/XHeAp1YqbDI6x1XxAQKRQRMURyigWUPE291r+bZJLUu8CKBcF/j0HTN4MmLi876It694TLjZ9CP9wR6En0VKcrKS7OJdaflVxTRE/X2QY0/bK49+TM=
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com (10.174.81.139) by
	BN6PR2201MB1636.namprd22.prod.outlook.com (10.174.85.165) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 09:58:41 +0000
Received: from BN6PR2201MB1251.namprd22.prod.outlook.com
	([fe80::7488:a500:daaf:3897]) by
	BN6PR2201MB1251.namprd22.prod.outlook.com
	([fe80::7488:a500:daaf:3897%3]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 09:58:40 +0000
From: Aleksandar Markovic <amarkovic@wavecomp.com>
To: Thomas Huth <thuth@redhat.com>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
	<philmd@redhat.com>, Stefan Markovic <smarkovic@wavecomp.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH for-3.1 07/25] MAINTAINERS: Add a missing entry for the
	Fulong 2E machine
Thread-Index: AQHUhQCyPHS2LFEa10OdUNip9xKPd6VjYvaAgAABLhc=
Date: Tue, 27 Nov 2018 09:58:40 +0000
Message-ID: <BN6PR2201MB12517471D0B4ADEE146C1414C6D00@BN6PR2201MB1251.namprd22.prod.outlook.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-8-philmd@redhat.com>,
	<19bfc512-65ac-9968-3930-8b423efde241@redhat.com>
In-Reply-To: <19bfc512-65ac-9968-3930-8b423efde241@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=amarkovic@wavecomp.com; 
x-originating-ip: [79.101.13.23]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR2201MB1636;
	6:x24oGfPaa+MTNNeWxyS151eBRm8E8RBzG5Nj22yLd5Xo9qGyz4In8A2atMuTIDk0A7NTB07QiU2UMsXqLxY+qVuhRXUnFIgS45pODnZUGegbP+8kidXsywmILLnIrCb5F5xpO3vWng47cygsdKzEWgui/Xkihxrpng+H18qHsCZKFiIVY2qUUYS36XPINQBrh7xirmJ7Wu1ooitVzYXOePC/V2dzuZGM8NuGcbUbamqKYdhst2I+ypfpQqyU0wKRQ8CB8nAxuoNQhDk5wDnqoe5g+ZvFSxffaDy5Z2aOA86PFskm0gRMWZQpoLsqT/p1y4CcW/irbHCET10th7Sk3h3Y5K0XdvJZwq3b5M2kVUW1JWCz2AYamkuymClNwnqVjxvhFGtLsOO2MYWd6fquY7MSSjTJleeB7FPi4PEWuMs48Oez3V9oSvHonzpdNuwbMYEzYB4KaoqL+INa9I3uuw==;
	5:W/QbCHt2CrkTw6Gas4DyUJxzYxqn8BkrxQZq6uRcG+u7m+CWmWla8SRf4UAv1Rk/8r81+gfALc3k7DhV0HKSNGVkW9YbmZh68W2sPVC7ilz/NEW9I2gBBKluT4c1TJ0+pISO6j+GXyfRVYX1TODyBf8C+yEIIqo7c7kOowKnsq0=;
	7:1iOwg27H4J+zn1JQmgpv9AgGyabKbzEfwcxdwMkCfC5U7mJXFwaQ+qCriUAMTF6E14Ew8wLYmNA4KRkjV4LUqK18ZEwRv6zuc0mn4xJD/Eo/ceyFLj0OxRzgKjpNGykDxaCJX3k4RSLTdpmP/h6d2w==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10019020)(39840400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(3846002)(110136005)(186003)(6116002)(54906003)(7736002)(7696005)(68736007)(2906002)(316002)(305945005)(8936002)(26005)(508600001)(25786009)(486006)(6636002)(86362001)(229853002)(33656002)(6436002)(66066001)(105586002)(102836004)(4001150100001)(8676002)(966005)(76176011)(256004)(446003)(106356001)(6506007)(81166006)(81156014)(53546011)(55016002)(71190400001)(71200400001)(99286004)(9686003)(74316002)(5660300001)(6246003)(476003)(11346002)(4326008)(97736004)(14454004)(6306002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR2201MB1636;
	H:BN6PR2201MB1251.namprd22.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 170e1688-45f0-4f45-78d9-08d6544ee8af
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR2201MB1636; 
x-ms-traffictypediagnostic: BN6PR2201MB1636:
x-microsoft-antispam-prvs: <BN6PR2201MB1636081930D3030881F41F55C6D00@BN6PR2201MB1636.namprd22.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(2016111802025)(20161123560045)(6043046)(201708071742011)(7699051)(76991095);
	SRVR:BN6PR2201MB1636; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR2201MB1636; 
x-forefront-prvs: 086943A159
received-spf: None (protection.outlook.com: wavecomp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /k/Yl2AjBT/8TeAVa3XIS6GM7k8frs/NGL85whJuPXZ1te/C0LU4Gt50iyrwoPHf7ODH2AdLj8c3xhWoNAjl6RdPjpIPdXARk9PCD4Rvre2Htk30BD3qAEx60zYNyz1Xy98SuV6iATpXQu7r4ekn1CoWgmt1RzguHccpQnz402maDf6mR8xZfVeiLj9B8exTemRn9a3nO10Z82n2jCv1yxxKI1s2gOsr3iD+Mp0R1vZdXLO7Pv1qHMg4NkMqYzsdvq+T3EZs7wqAXLcKxT/tKRvP1KGog59QeyHLsfYxgqdik2lBekehXYkD+9f64JykY8KuN707zl029fJcXvelyhSTHgaxKx39mz+RluhqJRo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170e1688-45f0-4f45-78d9-08d6544ee8af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 09:58:40.6718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1636
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.132
Subject: Re: [Qemu-trivial] [PATCH for-3.1 07/25] MAINTAINERS: Add a missing
 entry for the Fulong 2E machine
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
X-List-Received-Date: Tue, 27 Nov 2018 09:58:55 -0000

I like better the patch that Thomas linked to. I think Philippe should have=
 included Thomas' patch, rather than creating new, overlapping, patches. Co=
nfusion about straitforward things! Aleksandar

________________________________________
From: Thomas Huth <thuth@redhat.com>
Sent: Tuesday, November 27, 2018 10:49:27 AM
To: Philippe Mathieu-Daud=E9; Aleksandar Markovic; Stefan Markovic
Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org
Subject: Re: [PATCH for-3.1 07/25] MAINTAINERS: Add a missing entry for the=
 Fulong 2E machine

On 2018-11-25 21:49, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa17e9bbd3..81a22b2ccf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -864,6 +864,7 @@ R: Stefan Markovic <smarkovic@wavecomp.com>
>  S: Odd Fixes
>  F: hw/mips/mips_fulong2e.c
>  F: hw/isa/vt82c686.c
> +F: hw/pci-host/bonito.c
>
>  F: include/hw/isa/vt82c686.h

Please remove the empty line between bonito.c and vt82c686.h - or we
could use my patch here from last Thursday instead:

 https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04526.html

 Thomas



