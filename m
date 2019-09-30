Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iEzLI-0006uE-TA
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2019 13:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iEzLE-0006pj-TD
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 13:20:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iEzLD-0000QQ-Rq
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 13:20:08 -0400
Resent-Date: Mon, 30 Sep 2019 13:20:08 -0400
Resent-Message-Id: <E1iEzLD-0000QQ-Rq@eggs.gnu.org>
Received: from sender4-of-o58.zoho.com ([136.143.188.58]:21826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iEzL9-0000Ou-O3; Mon, 30 Sep 2019 13:20:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1569863967; cv=none; d=zoho.com; s=zohoarc; 
 b=Yg3N6bcNKhInCXqTjEqgY3r0PWSSx/LyliEPmKXoG/RxDc+5KKPLcbgLzLI7EGYTcIyBKGTMAQaQjen5UycGambU5FIzGXf3187bNfGEbrZRcHPVYQJZfyDSTXCInLTGfBiuT/lpXXDf/sAIgLvMNqvzw4TxN7hgyLXwL3zwPkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1569863967;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=quW1jKyQbrCHORj2wrrXVoQbtI9aPT7ArqeZkSzySLM=; 
 b=Pd7uqHNXxeMUqKdw1+vF2S1fvqJpDzFFYdhnNrNSoMeAsHb8YJHKQ7kKdYDybLysNdE8PNdl6ZIqqGTh13/+8X93ZKqJ0mU74H7IbQ/d1dvYc1oIAUYbp/L0WgqE1TGacB4c3ennLbHgmZ7UwpbsVo4mSLElKyhjdde6L9rxq5E=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1569863965488316.47336312751486;
 Mon, 30 Sep 2019 10:19:25 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/isa: Introduce a CONFIG_ISA_SUPERIO switch for
 isa-superio.c
In-Reply-To: <20190930150436.18162-1-thuth@redhat.com>
Message-ID: <156986396389.27524.5625558969416986785@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com,
 qemu-trivial@nongnu.org, arikalo@wavecomp.com, hpoussin@reactos.org,
 amarkovic@wavecomp.com, aurelien@aurel32.net, rth@twiddle.net
Date: Mon, 30 Sep 2019 10:19:25 -0700 (PDT)
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
X-List-Received-Date: Mon, 30 Sep 2019 17:20:10 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkzMDE1MDQzNi4xODE2
Mi0xLXRodXRoQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhIC9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1h
Z2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3QGZlZG9y
YSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDkzMDE1MDQzNi4x
ODE2Mi0xLXRodXRoQHJlZGhhdC5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t


