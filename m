Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS14u-0001Io-MY
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2019 10:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43681)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iS14q-0001EG-Ce
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 10:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iS14p-0005ct-1o
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 10:49:04 -0500
Resent-Date: Tue, 05 Nov 2019 10:49:04 -0500
Resent-Message-Id: <E1iS14p-0005ct-1o@eggs.gnu.org>
Received: from sender4-of-o58.zoho.com ([136.143.188.58]:21881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iS14l-0005XF-Kw; Tue, 05 Nov 2019 10:48:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1572968881; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eJ9z/nzx+qocDS1/hVg1RjdT5pPQayO8jfNG0wmC0ThRJYZ7P72l3JmRBJ1ZdZEHRmriiF84ijsvhPyPjJqnu3FDI416GgEuFIKs0IDYz24GDw8aTtxTuKshFaDquFNU1EY4xtdvFzHfJdbXIyrXMnwDaXm8gdlau9C+bf8tGgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1572968881;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Q4x+f/wmgD9+wgoUiUJ4DR7Cp7vYJwT7GTGmcDOH6zY=; 
 b=cQ0WAsCaFuOLBq8PNph0CEhyWq4TQi/q8CyUycWlbtuyZ3ie/cUDPvvSsVAto/LHkZ2kc5yN3MswAqA/Luu6uvrSvyC93CFjwGCyfC2jPPfOxJ7zfcY6dkIsIzMCOe2qGWFdkbjOlgc/RQJcf+IGU5XjcLKY2QEmblWT9Cae0PU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1572968880683579.3517686475908;
 Tue, 5 Nov 2019 07:48:00 -0800 (PST)
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PULL 0/4] Trivial branch patches
Message-ID: <157296887817.27285.13935693519835086344@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, sstabellini@kernel.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com, paul@xen.org,
 qemu-trivial@nongnu.org, claudio.fontana@huawei.com, crosa@redhat.com,
 mjt@tls.msk.ru, laurent@vivier.eu, chouteau@adacore.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, marcandre.lureau@redhat.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au
Date: Tue, 5 Nov 2019 07:48:00 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.58
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
X-List-Received-Date: Tue, 05 Nov 2019 15:49:06 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEwNTE0NDI0Ny4xMDMw
MS0xLWxhdXJlbnRAdml2aWVyLmV1LwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUFVMTCAwLzRdIFRyaXZpYWwgYnJhbmNoIHBhdGNoZXMKVHlw
ZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMTkxMTA1MTQ0MjQ3LjEwMzAxLTEtbGF1cmVudEB2aXZp
ZXIuZXUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJz
ZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCjg1YWM0NTMgZ2xvYmFsOiBTcXVhc2ggJ3RoZSB0aGUnCjlkZDdk
YTQgcW9tOiBGaXggZXJyb3IgbWVzc2FnZSBpbiBvYmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkK
MmI3NmI0NSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBGaXggOC1iaXQgYWNjZXNzZXMKYmRk
Y2ZkOSBody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcg
dG8gUG5QIHJlZ2lzdGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS80IENoZWNraW5nIGNvbW1p
dCBiZGRjZmQ5YjZiMjQgKGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdo
ZW4gd3JpdGluZyB0byBQblAgcmVnaXN0ZXJzKQoyLzQgQ2hlY2tpbmcgY29tbWl0IDJiNzZiNDUx
ZjliNyAoaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2VzKQozLzQg
Q2hlY2tpbmcgY29tbWl0IDlkZDdkYTQyMWJmYiAocW9tOiBGaXggZXJyb3IgbWVzc2FnZSBpbiBv
YmplY3RfY2xhc3NfcHJvcGVydHlfYWRkKCkpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0
ZXJzCiMzMTogRklMRTogcW9tL29iamVjdC5jOjExMDk6CisgICAgICAgIGVycm9yX3NldGcoZXJy
cCwgImF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBwcm9wZXJ0eSAnJXMnIHRvIG9iamVjdCAodHlw
ZSAnJXMnKSIsCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNDM6IEZJTEU6IHFv
bS9vYmplY3QuYzoxMTQxOgorICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJhdHRlbXB0IHRvIGFk
ZCBkdXBsaWNhdGUgcHJvcGVydHkgJyVzJyB0byBjbGFzcyAodHlwZSAnJXMnKSIsCgp0b3RhbDog
MCBlcnJvcnMsIDIgd2FybmluZ3MsIDIyIGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvNCBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgo0LzQgQ2hlY2tpbmcgY29tbWl0IDg1YWM0NTNkMTUyMCAoZ2xv
YmFsOiBTcXVhc2ggJ3RoZSB0aGUnKQpFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8gY29tbWVudHMK
IzI2OiBGSUxFOiBkaXNhcy9saWJ2aXhsL3ZpeGwvaW52YWxzZXQuaDoxMDU6CisgIC8vIE5vdGUg
dGhhdCB0aGlzIGRvZXMgbm90IG1lYW4gdGhlIGJhY2tpbmcgc3RvcmFnZSBpcyBlbXB0eTogaXQg
Y2FuIHN0aWxsCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDU2IGxpbmVzIGNoZWNrZWQK
ClBhdGNoIDQvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTExMDUxNDQyNDcuMTAzMDEtMS1s
YXVyZW50QHZpdmllci5ldS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20=


