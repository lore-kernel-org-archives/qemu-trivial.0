Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZLzI-0006TM-2c
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2019 16:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iZLz9-0006Om-JL
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 16:33:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iZLz3-0003Px-LC
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 16:33:27 -0500
Resent-Date: Mon, 25 Nov 2019 16:33:26 -0500
Resent-Message-Id: <E1iZLz3-0003Px-LC@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iZLyz-0003MD-1w; Mon, 25 Nov 2019 16:33:21 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574717586; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Bxs81lrMRsMjv0ZS92cHzCwW84EWa6IlpkbZpu98siJRDZznjmcNOFHJdCIxr7s8UP6gfV54Na5KjSQN0i8Jf3ojzG77MLyV37q9uRHZGsRlbQV6Vy/ZlEvqBq0E4DKP+XMXVTEu50fHzhaqPa8NpFCSwDsHethdJ+gALe4zaAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1574717586;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=P09jt/NKVXeu/RFmc24GG83y+kuLChnmWhIvGcpLrrA=; 
 b=UMCxLbXDz2x4zTn6S3axvwD+7J+5XSNTPts+1rwnoUshML0Oaob5+LuPisFb7e+G5DhJyGqXnwDWwMUG3Q5CqHfGBhBjBj9FpshdDAAJmmRBEuSA6MOVQl+A6lXA5f3wxsWB9abYVgP6BkOLEVc7F+WMZB2pi41KZVpxmPEr40I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1574717584595140.59556692739864;
 Mon, 25 Nov 2019 13:33:04 -0800 (PST)
In-Reply-To: <20191125133846.27790-1-armbru@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/2] Minor integer parsing improvements
Message-ID: <157471758359.28656.8987702310062604783@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, tao3.xu@intel.com
Date: Mon, 25 Nov 2019 13:33:04 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
X-List-Received-Date: Mon, 25 Nov 2019 21:33:35 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEyNTEzMzg0Ni4yNzc5
MC0xLWFybWJydUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUEFUQ0ggMC8yXSBNaW5vciBpbnRlZ2VyIHBhcnNpbmcgaW1w
cm92ZW1lbnRzClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDE5MTEyNTEzMzg0Ni4yNzc5MC0x
LWFybWJydUByZWRoYXQuY29tCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNo
CmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRy
dWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpmNGE1MGViIHRlc3Qta2V5dmFsOiBUaWdo
dGVuIHRlc3Qgb2YgdHJhaWxpbmcgY3JhcCBhZnRlciBzaXplCjFiNzRiYzUgdXRpbC9jdXRpbHM6
IFR1cm4gRklYTUUgY29tbWVudCBpbnRvIFFFTVVfQlVJTERfQlVHX09OKCkKCj09PSBPVVRQVVQg
QkVHSU4gPT09CjEvMiBDaGVja2luZyBjb21taXQgMWI3NGJjNWJjNDVhICh1dGlsL2N1dGlsczog
VHVybiBGSVhNRSBjb21tZW50IGludG8gUUVNVV9CVUlMRF9CVUdfT04oKSkKRVJST1I6IHRyYWls
aW5nIHdoaXRlc3BhY2UKIzM1OiBGSUxFOiB1dGlsL2N1dGlscy5jOjUyMzoKKyAgICBRRU1VX0JV
SUxEX0JVR19PTihzaXplb2YoaW50NjRfdCkgIT0gc2l6ZW9mKGxvbmcgbG9uZykpOyAkCgp0b3Rh
bDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDI4IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvMiBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi8yIENoZWNraW5nIGNvbW1pdCBmNGE1MGViMTU4YWYg
KHRlc3Qta2V5dmFsOiBUaWdodGVuIHRlc3Qgb2YgdHJhaWxpbmcgY3JhcCBhZnRlciBzaXplKQo9
PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhl
IGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MTEy
NTEzMzg0Ni4yNzc5MC0xLWFybWJydUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==


