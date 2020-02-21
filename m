Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5Hot-00069f-Gf
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 18:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j5Hoq-000689-KJ
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 18:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j5Hoo-0002Ia-Qb
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 18:34:52 -0500
Resent-Date: Fri, 21 Feb 2020 18:34:51 -0500
Resent-Message-Id: <E1j5Hoo-0002Ia-Qb@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21178)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j5Hol-0002Fs-3F; Fri, 21 Feb 2020 18:34:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1582328073; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aI55EWbh5b66yZxUDweMGCWrt1A1a3HOzDPGmoUtL7IMvk57o0GQYerG54xBSaEWwolwSmYF7hyfoMhoV5lGINj36MrcjWV8rdjEaX06RZhTst05kwvZFxEDfpDUGVA5tJu9LUlohespTbpdhVlfojqJ72qrgRTy9Fc8ISc/Z6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1582328073;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ghN4ws2uEXMObGqTvihPhKpJOiNkzVgGNdcU9XW+jHo=; 
 b=NMh875Arxms7XPI2MFN7sHhUTjPxuljnBqPb3sKkoA7RavYjuZdqVBLi47Ku5IF6xk+JhM2PcFh2exIubzh5AEUQe0WIZ2YYQ37c4ZPbLoW7ppFOukSQ9qefUAvvkGUQ0RIHF/2BuRc0o44Beu7F+rAOJxs9vj0gPSTsDzk3uIA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1582328071440653.6541397147328;
 Fri, 21 Feb 2020 15:34:31 -0800 (PST)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200221214614.165338-1-yuanzi@google.com>
Subject: Re: [PATCH] linux-user: Add an argument QEMU_MMAP_BASE to set custom
 mmap base address in qemu user mode
Message-ID: <158232807018.7375.14785893323426850227@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yuanzi@google.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, yuanzi@google.com,
 riku.voipio@iki.fi, laurent@vivier.eu
Date: Fri, 21 Feb 2020 15:34:31 -0800 (PST)
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
X-List-Received-Date: Fri, 21 Feb 2020 23:34:54 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIyMTIxNDYxNC4xNjUz
MzgtMS15dWFuemlAZ29vZ2xlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKU3ViamVjdDogW1BBVENIXSBsaW51eC11c2VyOiBBZGQgYW4gYXJndW1lbnQg
UUVNVV9NTUFQX0JBU0UgdG8gc2V0IGN1c3RvbSBtbWFwIGJhc2UgYWRkcmVzcyBpbiBxZW11IHVz
ZXIgbW9kZQpNZXNzYWdlLWlkOiAyMDIwMDIyMTIxNDYxNC4xNjUzMzgtMS15dWFuemlAZ29vZ2xl
LmNvbQpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gK
Z2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMzhhN2IwNCBsaW51eC11c2VyOiBBZGQgYW4gYXJndW1l
bnQgUUVNVV9NTUFQX0JBU0UgdG8gc2V0IGN1c3RvbSBtbWFwIGJhc2UgYWRkcmVzcyBpbiBxZW11
IHVzZXIgbW9kZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGNvbnNpZGVyIHVzaW5nIHFl
bXVfc3RydG91bCBpbiBwcmVmZXJlbmNlIHRvIHN0cnRvdWwKIzIzOiBGSUxFOiBsaW51eC11c2Vy
L21haW4uYzozNDE6CisgICAgbW1hcF9iYXNlID0gc3RydG91bChhcmcsIE5VTEwsIDApOwoKdG90
YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA1MCBsaW5lcyBjaGVja2VkCgpDb21taXQgMzhhN2Iw
NDlhN2Y4IChsaW51eC11c2VyOiBBZGQgYW4gYXJndW1lbnQgUUVNVV9NTUFQX0JBU0UgdG8gc2V0
IGN1c3RvbSBtbWFwIGJhc2UgYWRkcmVzcyBpbiBxZW11IHVzZXIgbW9kZSkgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAyMDAyMjEyMTQ2MTQuMTY1MzM4LTEteXVhbnppQGdvb2dsZS5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

