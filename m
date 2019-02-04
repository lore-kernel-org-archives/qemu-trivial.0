Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqdOW-0004Yp-De
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 07:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqdON-0004TI-7U
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqdOL-0007VZ-C8
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:30:27 -0500
Resent-Date: Mon, 04 Feb 2019 07:30:27 -0500
Resent-Message-Id: <E1gqdOL-0007VZ-C8@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gqdOJ-0007TH-Er
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 07:30:25 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1549269875; cv=none; d=zoho.com; s=zohoarc; 
	b=V/q1/eFBrTx1VLOW1yfvnH78vrf50YcnUPmqUayLH4YO70Nw8+3YK6rJo72nsM1zAmH/k9Zo3AD9zCnUi/mTzchj3+KkEZ+6eLe4JEUgp/ycLa43AdL2D3s2e45qSmGjeHRn6q1siB6VvyOA4JYwIhjj9kA5PJPP8xjSNaPC8ZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1549269875;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=csHe975xgyabq5KAih7CK4TWcOTr4gzIGrNluLCmbeM=; 
	b=YepeDvOnTc5C35f4rkBiqklGNRPgEElS+iHbHrMYzujdZCeVwz4FHZtzHFTJSjuQYg15Njak0YFLZMULBa7dfEhrvidOlivyiSxBkSp68qabQgnCuV8/UViOr6dTB/G2DgBx6QKjjNaBB/zivqTZ+AtA40QfHYFMPYDNzLDHRfM=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1549269874405401.85127779911613;
	Mon, 4 Feb 2019 00:44:34 -0800 (PST)
Message-ID: <154926987318.29184.3633162370256851245@ebba9967afc0>
In-Reply-To: <1549268045-11861-1-git-send-email-thuth@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Cc: fam@euphon.net, kraxel@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 4 Feb 2019 00:44:34 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/sdl_keysym: Remove
 obsolete SDL1.2 related code
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
X-List-Received-Date: Mon, 04 Feb 2019 12:30:34 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTQ5MjY4MDQ1LTExODYxLTEt
Z2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1p
bmd3QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTU0OTI2
ODA0NS0xMTg2MS0xLWdpdC1zZW5kLWVtYWlsLXRodXRoQHJlZGhhdC5jb20vdGVzdGluZy5kb2Nr
ZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


