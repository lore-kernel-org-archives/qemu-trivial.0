Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1Bk4-0005fd-BV
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i1Bk1-0005c3-CO
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 11:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i1Bk0-0002io-GW
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 11:44:41 -0400
Resent-Date: Fri, 23 Aug 2019 11:44:41 -0400
Resent-Message-Id: <E1i1Bk0-0002io-GW@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21574)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i1Bjx-0002d2-Ne; Fri, 23 Aug 2019 11:44:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1566575066; cv=none; d=zoho.com; s=zohoarc; 
 b=grAvuAmXrNkc57IdX0O8Zy4IvGE3DBA3vPVzXlt+5HXFjoRI2pHZ2V7wkNn8RmmWjFfGxpxhI+9T9eefUkQ5lCA3fT4IdE7MbzN3O58VAKgGzmiDcXSgwcdza5aZnMiH3FMK/E9z6UA1aqkJMGku4h1PQAbXuiFNID+I0hq2cg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1566575066;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=0KzeNnAtAdQOEnJTPME0MRCWmXptYvj+zWH1kexVZVw=; 
 b=OGranP9EWLRa3FX5s+KUxLnAaqkgKqY0UBVxWDqNz2Q7Cx0cOfzwuAT5sDY4tLYB12oi9OATqRB4SutE0SaM3rjX85pC0K15oEMd9KniyRCXERfjnVhXrui/H0JzcByim9sMeiB8ktHBt07kjnp6EqPq47YE2ZLvP11TBi04LYg=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1566575062217372.82944311143376;
 Fri, 23 Aug 2019 08:44:22 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20190822231231.1306-1-philmd@redhat.com>
Message-ID: <156657506005.1709.11989095096032401678@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, philmd@redhat.com,
 alex.bennee@linaro.org
Date: Fri, 23 Aug 2019 08:44:22 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] contrib/gitdm: Add RT-RK to
 the domain-map
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
X-List-Received-Date: Fri, 23 Aug 2019 15:44:42 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDgyMjIzMTIzMS4xMzA2
LTEtcGhpbG1kQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhIC9iaW4vYmFzaAp0ZXN0ICIkKHVuYW1lIC1tKSIgPSAieDg2XzY0Igo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRw
Oi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDgyMjIzMTIzMS4xMzA2LTEtcGhpbG1kQHJlZGhhdC5j
b20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


