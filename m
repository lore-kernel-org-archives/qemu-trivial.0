Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1icTE8-0004P2-Kq
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2019 06:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1icTDx-0004HE-1d
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 06:53:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1icTDv-0007Y2-PK
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2019 06:53:40 -0500
Resent-Date: Wed, 04 Dec 2019 06:53:40 -0500
Resent-Message-Id: <E1icTDv-0007Y2-PK@eggs.gnu.org>
Received: from sender4-of-o50.zoho.com ([136.143.188.50]:21073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1icTDn-0006Jf-Rh; Wed, 04 Dec 2019 06:53:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1575460400; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F8jypdx9V1X8Re6q6iTZdKFL6EJcmHmmIaDVovi1rq2vtQvPZsV8VghNTv6OlNB0gRWF5Qz2rvofWBJuGxus73Oc1WexYOhYexh+Zo5mI0OS0XRsWoBzaRedPG2X0W0aSGF5waEWQIFDf+6h7JDPSrsOtQ4/vRVoIFcMfU+P8P4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1575460400;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=hFMsxS+ExnFRVxRW7VzE+YkEb9qWfXcVwGFKkSZdJJ4=; 
 b=YiF/aPV4TV6srsEpKFih62vBEhXAc48iOx4gXuqjmbwCrI7f2tAuncvKfyfdgranXc/P/CSxsyopG535rf9nd5b/B6vWZoAyqZLgLAgybZ58xR8XUPjxFJngdwpxG7FZYCtPuedob7cKSF0e+pd28jvZcL4pFqj4CWBThcKZ51s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1575460398468289.67097072103354;
 Wed, 4 Dec 2019 03:53:18 -0800 (PST)
In-Reply-To: <20191204085628.2892-1-hhan@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Revert "qemu-options.hx: Update for reboot-timeout
 parameter"
Message-ID: <157546039706.18804.4103010064190588655@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: hhan@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, hhan@redhat.com,
 laurent@vivier.eu, dgilbert@redhat.com
Date: Wed, 4 Dec 2019 03:53:18 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.50
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
X-List-Received-Date: Wed, 04 Dec 2019 11:53:44 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwNDA4NTYyOC4yODky
LTEtaGhhbkByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAicWVtdS1vcHRpb25zLmh4OiBVcGRhdGUg
Zm9yIHJlYm9vdC10aW1lb3V0IHBhcmFtZXRlciIKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIw
MTkxMjA0MDg1NjI4LjI4OTItMS1oaGFuQHJlZGhhdC5jb20KCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNjgwMzMzOCBSZXZlcnQg
InFlbXUtb3B0aW9ucy5oeDogVXBkYXRlIGZvciByZWJvb3QtdGltZW91dCBwYXJhbWV0ZXIiCgo9
PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMp
Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDEwIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA2
ODAzMzM4MjIwMjYgKFJldmVydCAicWVtdS1vcHRpb25zLmh4OiBVcGRhdGUgZm9yIHJlYm9vdC10
aW1lb3V0IHBhcmFtZXRlciIpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElm
IGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkxMjA0MDg1NjI4LjI4
OTItMS1oaGFuQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t


