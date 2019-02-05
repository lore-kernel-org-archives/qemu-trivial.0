Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqrbq-0006Td-Jj
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 22:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqrbp-0006Sk-7P
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:41:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqrbn-00026v-Vw
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 22:41:17 -0500
Resent-Date: Mon, 04 Feb 2019 22:41:16 -0500
Resent-Message-Id: <E1gqrbn-00026v-Vw@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gqrbl-00024N-B4; Mon, 04 Feb 2019 22:41:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1549338052; cv=none; d=zoho.com; s=zohoarc; 
	b=EUqH931HOPDuWh+OE+M8+6S+/zOqj4mZiVjicpp503rmdgxgXNIpdkJ/VItnT+zMFBoTbUC5B9w+nDiWWkJmnNR9MTpqi9VNj6ar6Pf347/FLer2dCmdAsQdZHzh2+vzXYQnwmbXDv+AE8k44stXV/KCEq2AK1hMEO8DWv7HWpw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1549338052;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=V1SnWbESE702Da0Lix46G9KOzZT2HqiReq7m3cE9TSA=; 
	b=UvVPUkFhqGOHoFViOcys+XIEDcbZbthLKP0qNZm6uOJetzzXdUutyQsaEm9whOapgYAsJu65fQ4WH2C32oQi6RPF6g29EFqG/6X6ym+EDaUJrvGzybDDyLY9x4tEdzavqv0D4v7D7cGlysf2BntfVeILZ/uzx3gF45j1m+xfJNQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1549338052002606.9976558775517;
	Mon, 4 Feb 2019 19:40:52 -0800 (PST)
Message-ID: <154933805079.29184.18258525948726025756@ebba9967afc0>
In-Reply-To: <1549336101-17623-1-git-send-email-thuth@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Cc: fam@euphon.net, kraxel@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, dirty.ice.hu@gmail.com
Date: Mon, 4 Feb 2019 19:40:52 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] Clean up the SDL audio
 code
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
X-List-Received-Date: Tue, 05 Feb 2019 03:41:18 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTQ5MzM2MTAxLTE3NjIzLTEt
Z2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1p
bmd3QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTU0OTMz
NjEwMS0xNzYyMy0xLWdpdC1zZW5kLWVtYWlsLXRodXRoQHJlZGhhdC5jb20vdGVzdGluZy5kb2Nr
ZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


