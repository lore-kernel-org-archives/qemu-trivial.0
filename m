Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDlvW-0000Of-Ea
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 04:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iDlvR-0000Lq-O9
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 04:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iDlvP-00052X-KQ
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 04:48:29 -0400
Resent-Date: Fri, 27 Sep 2019 04:48:29 -0400
Resent-Message-Id: <E1iDlvP-00052X-KQ@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iDlvI-0004lX-9Y; Fri, 27 Sep 2019 04:48:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1569574073; cv=none; d=zoho.com; s=zohoarc; 
 b=b01vVfBmTjiUGBTPgfn+ElbF4Ha40+l90n/haaOrESGKmfFoIW5L2D9zVXpOg8Vl0q9Pm5Jdv+tWfU26KuCytP28LDdNfg6yXVa/p9+PIXJrLXEDozihHHXdzGoHMBLjERN9nVP4TbrvQRrLGGg+PWSGWGgIud1efwqObu9ZzCI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1569574073;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=qLAhqghTWq6YFE6Flc2F5Dineb8XVo7pHtR/7Bwca+E=; 
 b=Fte8XC9pxndvSdKjQ+RSLX8N+ZFWDIs1iKFcaSiZuTsHKMo0y6RaJs4oV4XpfSHRLjAaoS3KBqWz9XH6F/MqsPs8hEhKRIdIdUK6I31YDNBPZubY3FMv+EJJo1c8es73NGJTDjUk/TvnbHapjFOUOpn+P2yMA1W4kBQCbV5UdTU=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1569574066534414.1317831310863;
 Fri, 27 Sep 2019 01:47:46 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
In-Reply-To: <20190926151733.25349-1-philmd@redhat.com>
Message-ID: <156957406466.27524.17475823540618772663@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, damien.hedde@greensocs.com, peter.maydell@linaro.org,
 amarkovic@wavecomp.com, qemu-block@nongnu.org, mst@redhat.com,
 qemu-trivial@nongnu.org, jsnow@redhat.com, arikalo@wavecomp.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 edgar.iglesias@gmail.com, imammedo@redhat.com, philmd@redhat.com
Date: Fri, 27 Sep 2019 01:47:46 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 08:48:32 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkyNjE1MTczMy4yNTM0
OS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWlt
YWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRv
cmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxv
ZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA5MjYxNTE3MzMu
MjUzNDktMS1waGlsbWRAcmVkaGF0LmNvbS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=


