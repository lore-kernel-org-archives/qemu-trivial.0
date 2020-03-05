Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9qsD-0005dE-Od
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j9qsA-0005Zk-6b
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j9qs8-0000XX-9c
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:49:09 -0500
Resent-Date: Thu, 05 Mar 2020 08:49:09 -0500
Resent-Message-Id: <E1j9qs8-0000XX-9c@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j9qs8-0000QI-1X; Thu, 05 Mar 2020 08:49:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1583416129; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hGk/DaUALwh59qEQniUMpJTcuJpPjZt6F62BgaMoJ++HRmZZGlxwu1JLhaKeRm5rfpfIcfAwzDF+KGrsE7DCP11QkdqMzUhsA9jJR28oIvE0j5wfn8heBqKOsUNdU6pofHP7L2xZyP2a4B4PS4X8oYJB1ol1gIcl7HqvRbe4Yqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583416129;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=cu9Fntvcmj1XKOAANApQ+dlFitNbYGQXVl9cXXBy/f4=; 
 b=gsEkZ6Yegs0saajGJ6Byu7r7nZV68E9UKYhxcGFqjkXheGxTmdhDnCnQqXTOXWDBWxfRKlhs+mja/oqeF0gmmEFCxsAgoxznCncinfqJ0tL8M73SJDa9qxspeQs+FAzeSHamMVmRcs3EtZ4CU7q+hmqbFDrk8247e6qKT24RZzw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583416126968756.1003468228693;
 Thu, 5 Mar 2020 05:48:46 -0800 (PST)
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
Subject: Re: [PATCH v2 0/9] hw, ui,
 virtfs-proxy-helper: Reduce QEMU .data/.rodata/.bss footprint
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <158341612542.357.12817601365546101963@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, dmitry.fleytman@gmail.com,
 jasowang@redhat.com, qemu_oss@crudebyte.com, groug@kaod.org, kraxel@redhat.com,
 philmd@redhat.com, sgarzare@redhat.com
Date: Thu, 5 Mar 2020 05:48:46 -0800 (PST)
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
X-List-Received-Date: Thu, 05 Mar 2020 13:49:11 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMwNTEyNDUyNS4xNDU1
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnZHRjJyAoaHR0
cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ2R0YycK
Q2xvbmluZyBpbnRvICdkdGMnLi4uCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogNTM5NCwgZG9u
ZS4gICAgICAgIAplcnJvcjogUlBDIGZhaWxlZDsgcmVzdWx0PTE4LCBIVFRQIGNvZGUgPSAyMDAK
ZmF0YWw6IFRoZSByZW1vdGUgZW5kIGh1bmcgdXAgdW5leHBlY3RlZGx5CmZhdGFsOiBwcm90b2Nv
bCBlcnJvcjogYmFkIHBhY2sgaGVhZGVyCkNsb25lIG9mICdodHRwczovL2dpdC5xZW11Lm9yZy9n
aXQvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnZHRjJyBmYWlsZWQKZmFpbGVkIHRvIHVw
ZGF0ZSBzdWJtb2R1bGUgZHRjClN1Ym1vZHVsZSAnZHRjJyAoaHR0cHM6Ly9naXQucWVtdS5vcmcv
Z2l0L2R0Yy5naXQpIHVucmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwptYWtlWzFdOiAqKiogWy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC11eXJ1MzYwZy9zcmMvZG9ja2VyLXNyYy4yMDIwLTAz
LTA1LTA4LjQzLjEzLjE1ODBdIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC11eXJ1MzYwZy9zcmMnCm1ha2U6ICoqKiBbZG9ja2Vy
LXJ1bi10ZXN0LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwgICAgNW0zMy4zOTNzCnVzZXIg
ICAgMG0yLjcwMnMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjAwMzA1MTI0NTI1LjE0NTU1LTEtcGhpbG1kQHJlZGhhdC5jb20vdGVzdGlu
Zy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

