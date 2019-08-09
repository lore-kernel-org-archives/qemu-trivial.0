Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvwtC-0003Ld-Re
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2019 00:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hvwtA-0003Gt-AD
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 00:52:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hvwt9-0002KB-4D
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 00:52:28 -0400
Resent-Date: Fri, 09 Aug 2019 00:52:28 -0400
Resent-Message-Id: <E1hvwt9-0002KB-4D@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hvwt6-0002H2-Ec; Fri, 09 Aug 2019 00:52:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1565326336; cv=none; d=zoho.com; s=zohoarc; 
 b=E87/PysUjd4KlHtRnqXcmGwd+lG0gGH+exfGxyicFtdI0aEazVvFfgs3e6pMA9fnMsMLoEBnJ6dYZ/lp/NenMMtbqbXeCZFoubJZrJxqOIrczOIibU/9tEQVbPglY9uORBYZyerE0+qbGidItdG6dMBATxnyEwdo6XG9pxjomrk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1565326336;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=cyCaOyeYAAKyIiohxyN4foswcRbCGOq0h57FAmazftw=; 
 b=Hdz6hDizK4nbv92QRKEqw0qLSoMMBFMySwQ8Z9ayzN8Vh1J8IUa1I3JV98JAJWEwT2wyDQcZljlqJrGOn+MmD0WGe5bm+emobJqxFoPNwIE9Ge/UOSs0XLKiqokolxm3Ah03uZGqCiUp/MbJh643qGACv4Ban+wEaE1Oiwccbs4=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1565326334093260.07771065423503;
 Thu, 8 Aug 2019 21:52:14 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20190809041952.57302-1-rebecca@bsdio.com>
Message-ID: <156532633286.12874.928655968593675018@b08f24806b7e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: rebecca@bsdio.com
Cc: qemu-devel@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
 qemu-trivial@nongnu.org, rebecca@bsdio.com
Date: Thu, 8 Aug 2019 21:52:14 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update the avx2 configure
 test to be compatible with clang
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
X-List-Received-Date: Fri, 09 Aug 2019 04:52:29 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDgwOTA0MTk1Mi41NzMw
Mi0xLXJlYmVjY2FAYnNkaW8uY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgYXNh
biBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIg
b3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2Jh
Ymx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2Ug
ZG9ja2VyLXRlc3QtZGVidWdAZmVkb3JhIFRBUkdFVF9MSVNUPXg4Nl82NC1zb2Z0bW11IEo9MTQg
TkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIENDICAgICAgdXRpbC9xZW11LXNv
Y2tldHMubwogIENDICAgICAgdXRpbC91cmkubwogIENDICAgICAgdXRpbC9ub3RpZnkubwovdG1w
L3FlbXUtdGVzdC9zcmMvdXRpbC9idWZmZXJpc3plcm8uYzo3MToxMzogZXJyb3I6IHVua25vd24g
cHJhZ21hIGlnbm9yZWQgWy1XZXJyb3IsLVd1bmtub3duLXByYWdtYXNdCiNwcmFnbWEgR0NDIHB1
c2hfb3B0aW9ucwogICAgICAgICAgICBeCi90bXAvcWVtdS10ZXN0L3NyYy91dGlsL2J1ZmZlcmlz
emVyby5jOjcyOjEzOiBlcnJvcjogdW5rbm93biBwcmFnbWEgaWdub3JlZCBbLVdlcnJvciwtV3Vu
a25vd24tcHJhZ21hc10KI3ByYWdtYSBHQ0MgdGFyZ2V0KCJzc2UyIikKICAgICAgICAgICAgXgov
dG1wL3FlbXUtdGVzdC9zcmMvdXRpbC9idWZmZXJpc3plcm8uYzoxMDg6MTM6IGVycm9yOiB1bmtu
b3duIHByYWdtYSBpZ25vcmVkIFstV2Vycm9yLC1XdW5rbm93bi1wcmFnbWFzXQojcHJhZ21hIEdD
QyBwb3Bfb3B0aW9ucwogICAgICAgICAgICBeCi90bXAvcWVtdS10ZXN0L3NyYy91dGlsL2J1ZmZl
cmlzemVyby5jOjExNjoxMzogZXJyb3I6IHVua25vd24gcHJhZ21hIGlnbm9yZWQgWy1XZXJyb3Is
LVd1bmtub3duLXByYWdtYXNdCiNwcmFnbWEgR0NDIHB1c2hfb3B0aW9ucwogICAgICAgICAgICBe
Ci90bXAvcWVtdS10ZXN0L3NyYy91dGlsL2J1ZmZlcmlzemVyby5jOjExNzoxMzogZXJyb3I6IHVu
a25vd24gcHJhZ21hIGlnbm9yZWQgWy1XZXJyb3IsLVd1bmtub3duLXByYWdtYXNdCiNwcmFnbWEg
R0NDIHRhcmdldCgic3NlNCIpCiAgICAgICAgICAgIF4KL3RtcC9xZW11LXRlc3Qvc3JjL3V0aWwv
YnVmZmVyaXN6ZXJvLmM6MTQ4OjEzOiBlcnJvcjogdW5rbm93biBwcmFnbWEgaWdub3JlZCBbLVdl
cnJvciwtV3Vua25vd24tcHJhZ21hc10KI3ByYWdtYSBHQ0MgcG9wX29wdGlvbnMKICAgICAgICAg
ICAgXgovdG1wL3FlbXUtdGVzdC9zcmMvdXRpbC9idWZmZXJpc3plcm8uYzoxNDk6MTM6IGVycm9y
OiB1bmtub3duIHByYWdtYSBpZ25vcmVkIFstV2Vycm9yLC1XdW5rbm93bi1wcmFnbWFzXQojcHJh
Z21hIEdDQyBwdXNoX29wdGlvbnMKICAgICAgICAgICAgXgovdG1wL3FlbXUtdGVzdC9zcmMvdXRp
bC9idWZmZXJpc3plcm8uYzoxNTA6MTM6IGVycm9yOiB1bmtub3duIHByYWdtYSBpZ25vcmVkIFst
V2Vycm9yLC1XdW5rbm93bi1wcmFnbWFzXQojcHJhZ21hIEdDQyB0YXJnZXQoImF2eDIiKQogICAg
ICAgICAgICBeCi90bXAvcWVtdS10ZXN0L3NyYy91dGlsL2J1ZmZlcmlzemVyby5jOjE4NzoxMzog
ZXJyb3I6IHVua25vd24gcHJhZ21hIGlnbm9yZWQgWy1XZXJyb3IsLVd1bmtub3duLXByYWdtYXNd
CiNwcmFnbWEgR0NDIHBvcF9vcHRpb25zCiAgICAgICAgICAgIF4KOSBlcnJvcnMgZ2VuZXJhdGVk
LgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAxOTA4MDkwNDE5NTIuNTczMDItMS1yZWJlY2NhQGJzZGlvLmNvbS90ZXN0aW5nLmFzYW4vP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=


