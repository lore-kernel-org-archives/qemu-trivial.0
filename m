Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gidgG-0006Bg-Fe
	for mharc-qemu-trivial@gnu.org; Sun, 13 Jan 2019 06:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gidgD-00068t-4u
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 06:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gidgC-0007FF-4Y
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 06:11:49 -0500
Resent-Date: Sun, 13 Jan 2019 06:11:49 -0500
Resent-Message-Id: <E1gidgC-0007FF-4Y@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gidgB-0007E9-T9
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 06:11:48 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1547377870; cv=none; d=zoho.com; s=zohoarc; 
	b=HVxHwDaheRwsWMmcn33Bok1uvOlOCFkO4ysRpF+rAf/z9ucj1oXzfYeH73pPBUa8sd8aBZXhv12P54UFV4SJenuhcxw4a9k8N7rkMDjN8xjZEpg5hXqLdKI0EvFNt72RYQNW+E3FfyS5AqvYWpvRMOx9OsGB1AP1zqRS/XyQD8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1547377870;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=ctfYdCt1Sn0/EJXX8B7OJawjB75OvPp7hzYCoQFWnkI=; 
	b=MQLJgEVwfJALtm6VyNW45RZFprW0uOOIlJGAY6mGx5mBsFFQUAqhFdO4wpRh3d9fi5DorjHHGXNo6pGtRYHYPFKraw1XRsxcJqniUp6Y+ZdeRlH3H5gjOT0ZmBghi18qaXPovBcHMBrk/xGKhNXMGiGfpSjT8YuThaYlz8RWi18=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1547377868493798.2823464338925;
	Sun, 13 Jan 2019 03:11:08 -0800 (PST)
Message-ID: <154737786725.37.7712660050714925768@2d170d368aaa>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20190111155555.8270-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: fam@euphon.net, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	philmd@redhat.com, alex.bennee@linaro.org
Date: Sun, 13 Jan 2019 03:11:08 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] contrib/gitdm: Fix a typo
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
X-List-Received-Date: Sun, 13 Jan 2019 11:11:50 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDExMTE1NTU1NS44Mjcw
LTEtcGhpbG1kQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIGNvbnRyaWIvZ2l0ZG06IEZp
eCBhIHR5cG8KVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMTkwMTExMTU1NTU1LjgyNzAtMS1w
aGlsbWRAcmVkaGF0LmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLS1jb2xvcj1hbHdheXMgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToK
ICBGaWxlICJwYXRjaGV3LXRlc3RlcjIvc3JjL3BhdGNoZXctY2xpIiwgbGluZSA1MjEsIGluIHRl
c3Rfb25lCiAgICBnaXRfY2xvbmVfcmVwbyhjbG9uZSwgclsicmVwbyJdLCByWyJoZWFkIl0sIGxv
Z2YsIFRydWUpCiAgRmlsZSAicGF0Y2hldy10ZXN0ZXIyL3NyYy9wYXRjaGV3LWNsaSIsIGxpbmUg
NDgsIGluIGdpdF9jbG9uZV9yZXBvCiAgICBzdGRvdXQ9bG9nZiwgc3RkZXJyPWxvZ2YpCiAgRmls
ZSAiL3Vzci9saWI2NC9weXRob24zLjMvc3VicHJvY2Vzcy5weSIsIGxpbmUgNTQ0LCBpbiBjaGVj
a19jYWxsCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJwcm9j
ZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydnaXQnLCAncmVtb3RlJywgJ2FkZCcs
ICctZicsICctLW1pcnJvcj1mZXRjaCcsICczYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0JywgJ2h0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdSddJyBy
ZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAtOQoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxh
YmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwMTExMTU1NTU1LjgyNzAtMS1waGls
bWRAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWls
IGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


