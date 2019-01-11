Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi54B-0000qb-W5
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 17:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gi549-0000p7-JT
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:14:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gi548-0002Tj-Os
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:14:13 -0500
Resent-Date: Fri, 11 Jan 2019 17:14:13 -0500
Resent-Message-Id: <E1gi548-0002Tj-Os@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gi548-0002O1-GS
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:14:12 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1547242111; cv=none; d=zoho.com; s=zohoarc; 
	b=kgn6SnpLKmkXVBom4O8t3VKcX+Fovg1j+JKHIEm+eQOPfgGD27kBpLcqEIz5CZmytRSJnKJdDHuYoemYK1sAI+UgwuoM2FzFnQEeZyy/yfC3TuzWqEXkg0wqMKEw5IUJ27gc271frA+saR5PJ9vzb4+AhEe5qOM4sf9ewOBuDjc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1547242111;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=eyYaEVDu2344n5JZIM7iZAJzvfz0jwyVD2N/DDQq6vo=; 
	b=HNOZoBV+/+mlruePfdTXtk9BpU3b7xTBbESwWPHJdqq0fjy7GkMPwxAY2gTuIu7wHwGS5CbVjWEFfHcn93cjmadhR+fByU7ggCkHwkpZucwSQY2J0pUnUmd1K6nyGwiTJ7ifOM8t2p7BWWyIlYhD6SuRPQIfGW+hx4c8rVRjn1E=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1547242110281252.60766564724202;
	Fri, 11 Jan 2019 13:28:30 -0800 (PST)
Message-ID: <154724210898.37.4367801081630939892@2d170d368aaa>
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
Date: Fri, 11 Jan 2019 13:28:30 -0800 (PST)
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
X-List-Received-Date: Fri, 11 Jan 2019 22:14:14 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDExMTE1NTU1NS44Mjcw
LTEtcGhpbG1kQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKCk1lc3NhZ2UtaWQ6IDIwMTkwMTExMTU1NTU1LjgyNzAtMS1waGlsbWRAcmVkaGF0
LmNvbQpUeXBlOiBzZXJpZXMKU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSF0gY29udHJpYi9n
aXRkbTogRml4IGEgdHlwbwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLS1jb2xvcj1hbHdheXMgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYzk5
NWY1ZiBjb250cmliL2dpdGRtOiBGaXggYSB0eXBvCgo9PT0gT1VUUFVUIEJFR0lOID09PQpVbmtu
b3duIG9wdGlvbjogY29sb3IKVXNhZ2U6CgogICAgY2hlY2twYXRjaC5wbCBbT1BUSU9OXS4uLiBb
RklMRV0uLi4KICAgIGNoZWNrcGF0Y2gucGwgW09QVElPTl0uLi4gW0dJVC1SRVYtTElTVF0KClZl
cnNpb246IDAuMzEKCk9wdGlvbnM6CiAgLXEsIC0tcXVpZXQgICAgICAgICAgICAgICAgcXVpZXQK
ICAtLW5vLXRyZWUgICAgICAgICAgICAgICAgICBydW4gd2l0aG91dCBhIGtlcm5lbCB0cmVlCiAg
LS1uby1zaWdub2ZmICAgICAgICAgICAgICAgZG8gbm90IGNoZWNrIGZvciAnU2lnbmVkLW9mZi1i
eScgbGluZQogIC0tcGF0Y2ggICAgICAgICAgICAgICAgICAgIHRyZWF0IEZJTEUgYXMgcGF0Y2hm
aWxlCiAgLS1icmFuY2ggICAgICAgICAgICAgICAgICAgdHJlYXQgYXJncyBhcyBHSVQgcmV2aXNp
b24gbGlzdAogIC0tZW1hY3MgICAgICAgICAgICAgICAgICAgIGVtYWNzIGNvbXBpbGUgd2luZG93
IGZvcm1hdAogIC0tdGVyc2UgICAgICAgICAgICAgICAgICAgIG9uZSBsaW5lIHBlciByZXBvcnQK
ICAtZiwgLS1maWxlICAgICAgICAgICAgICAgICB0cmVhdCBGSUxFIGFzIHJlZ3VsYXIgc291cmNl
IGZpbGUKICAtLXN0cmljdCAgICAgICAgICAgICAgICAgICBmYWlsIGlmIG9ubHkgd2FybmluZ3Mg
YXJlIGZvdW5kCiAgLS1yb290PVBBVEggICAgICAgICAgICAgICAgUEFUSCB0byB0aGUga2VybmVs
IHRyZWUgcm9vdAogIC0tbm8tc3VtbWFyeSAgICAgICAgICAgICAgIHN1cHByZXNzIHRoZSBwZXIt
ZmlsZSBzdW1tYXJ5CiAgLS1tYWlsYmFjayAgICAgICAgICAgICAgICAgb25seSBwcm9kdWNlIGEg
cmVwb3J0IGluIGNhc2Ugb2Ygd2FybmluZ3MvZXJyb3JzCiAgLS1zdW1tYXJ5LWZpbGUgICAgICAg
ICAgICAgaW5jbHVkZSB0aGUgZmlsZW5hbWUgaW4gc3VtbWFyeQogIC0tZGVidWcgS0VZPVswfDFd
ICAgICAgICAgIHR1cm4gb24vb2ZmIGRlYnVnZ2luZyBvZiBLRVksIHdoZXJlIEtFWSBpcyBvbmUg
b2YKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAndmFsdWVzJywgJ3Bvc3NpYmxlJywgJ3R5
cGUnLCBhbmQgJ2F0dHInIChkZWZhdWx0CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXMg
YWxsIG9mZikKICAtLXRlc3Qtb25seT1XT1JEICAgICAgICAgICByZXBvcnQgb25seSB3YXJuaW5n
cy9lcnJvcnMgY29udGFpbmluZyBXT1JECiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGl0
ZXJhbGx5CiAgLWgsIC0taGVscCwgLS12ZXJzaW9uICAgICAgZGlzcGxheSB0aGlzIGhlbHAgYW5k
IGV4aXQKCldoZW4gRklMRSBpcyAtIHJlYWQgc3RhbmRhcmQgaW5wdXQuCj09PSBPVVRQVVQgRU5E
ID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMg
YXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwMTExMTU1NTU1LjgyNzAt
MS1waGlsbWRAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==


