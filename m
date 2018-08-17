Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqbh7-0000Cv-Ty
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 06:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fqbh5-00009c-KL
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 06:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fqbdS-0003FR-KF
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 06:05:41 -0400
Resent-Date: Fri, 17 Aug 2018 06:05:41 -0400
Resent-Message-Id: <E1fqbdS-0003FR-KF@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fqbdQ-0003DW-Ne; Fri, 17 Aug 2018 06:05:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1534500318; cv=none; d=zoho.com; s=zohoarc; 
	b=PE0sKOBT9w8MhUkPNhQhxHXxre477L4NsWQWCoKcjXReuB90bKOAMxYkCv3LjRy0pptFQmbWGR7TeOjpKI85/DTS4xJeoO780zNq1M+lRFtQGoidktrSPPHljZnY4/0J/6svlnlC/s3pL/6iMX7cVlEhBt1eUizFtryjOTa6BHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1534500318;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=t8EaX5oUkzLkzoQ0GyvCc0e2bOLijhnno2xot9ZJAvs=; 
	b=okdcMWw3xD2hly18//v51RC+C0MZEBxzI9ZTk41m9pKnoy4bMvPs+n/GF9CE8twBDCMXwipFmJWaT5/SGFIkPm+Glxeau2w0POQl+PS5uvqfp40FCQ60WBQOoH2ffUAp7V+JrBD1go1R8JceDPBhed5f+w2Jjywog5Cyl3SReYc=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1534500315671226.05348531065385;
	Fri, 17 Aug 2018 03:05:15 -0700 (PDT)
In-Reply-To: <1534422540-18815-1-git-send-email-hans-erik.floryd@rt-labs.com>
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <153450031408.22457.16041227636962253331@502c9da6d61e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: hans-erik.floryd@rt-labs.com
Cc: famz@redhat.com, qemu-trivial@nongnu.org, f4bug@amsat.org,
	hans-erik.floryd@rt-labs.com, qemu-devel@nongnu.org
Date: Fri, 17 Aug 2018 03:05:15 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sdhci: add i.MX SD Stable
 Clock bit
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
X-List-Received-Date: Fri, 17 Aug 2018 10:09:24 -0000

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE1MzQ0MjI1NDAtMTg4MTUtMS1naXQtc2VuZC1lbWFpbC1oYW5zLWVyaWsuZmxv
cnlkQHJ0LWxhYnMuY29tClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIHNkaGNpOiBhZGQg
aS5NWCBTRCBTdGFibGUgQ2xvY2sgYml0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8
IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0t
cmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2lu
ZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAg
IGlmICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZp
CiAgICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmVlZWE3ODNiNzIgc2RoY2k6IGFkZCBpLk1YIFNE
IFN0YWJsZSBDbG9jayBiaXQKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEv
MTogc2RoY2k6IGFkZCBpLk1YIFNEIFN0YWJsZSBDbG9jayBiaXQuLi4KRVJST1I6IHN1c3BlY3Qg
Y29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0YXRlbWVudHMgKDcsIDEwKQojMzQ6IEZJTEU6
IGh3L3NkL3NkaGNpLmM6MTY1NzoKKyAgICAgICBpZiAocy0+Y2xrY29uICYgU0RIQ19DTE9DS19J
TlRfU1RBQkxFKQorICAgICAgICAgIHJldCB8PSBFU0RIQ19QUk5TVFNfU0RTVEI7CgpFUlJPUjog
YnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMz
NDogRklMRTogaHcvc2Qvc2RoY2kuYzoxNjU3OgorICAgICAgIGlmIChzLT5jbGtjb24gJiBTREhD
X0NMT0NLX0lOVF9TVEFCTEUpClsuLi5dCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDE5
IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t


