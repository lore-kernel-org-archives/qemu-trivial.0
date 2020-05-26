Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jditZ-00056j-BW
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 19:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jditX-00056Y-Kr; Tue, 26 May 2020 19:22:03 -0400
Resent-Date: Tue, 26 May 2020 19:22:03 -0400
Resent-Message-Id: <E1jditX-00056Y-Kr@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jditV-0005KP-Sa; Tue, 26 May 2020 19:22:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1590535313; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jFv9uNDUiHEU3QaTM7yo4Yp0k0rLl+kIVuXFmskPqinYO0IQqUckBbHfop60lqy6si4j9OIg6yksiVW4mbY8ikzQwCKyQs0Y1yv+AAcpv3MkikXnivb7jQMicvzmhhIAgYObAx159EYgQYaopsWJmyAACb6CrkjTGmSUQyoGyXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1590535313;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=d8DeGr2CnG78yWuvBKjczgDPzkoAN+OOg9+FLkCDQcg=; 
 b=ObNi3W0AAc+ZmD93hhy47hm976Fn5H/9/yfdRrHrueZThHX4hpOWtgoOWB18ih/lFJxhm7mQuz4aN6K5lLaCMLVma1SkUpuPkJipbFj3JbFbqFxXtdmYDW/IubPxVebTHpbDGbzQiL2gN/AOn00F0DoXFWshIJCyukaSOBtbVUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 159053531055082.80740704803623;
 Tue, 26 May 2020 16:21:50 -0700 (PDT)
Message-ID: <159053530937.12401.10203156196787167758@45ef0f9c86ae>
In-Reply-To: <20200526185132.1652355-1-eblake@redhat.com>
Subject: Re: [PATCH] or1k: Fix compilation hiccup
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eblake@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, shorne@gmail.com,
 proljc@gmail.com
Date: Tue, 26 May 2020 16:21:50 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 19:21:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Tue, 26 May 2020 23:22:04 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUyNjE4NTEzMi4xNjUy
MzU1LTEtZWJsYWtlQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKCk1lc3NhZ2UtaWQ6IDIwMjAwNTI2MTg1MTMyLjE2NTIzNTUtMS1lYmxha2VA
cmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0hdIG9yMWs6IEZpeCBjb21waWxhdGlvbiBoaWNjdXAK
VHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCBy
ZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkOTZkMmZiIG9yMWs6IEZpeCBjb21waWxhdGlvbiBo
aWNjdXAKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5k
IHRoYXQgJyonIChjdHg6V3hWKQojMzM6IEZJTEU6IGh3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5j
OjEzMjoKKyAgICBxZW11X2lycSAqY3B1X2lycXNbMl0gPSB7fTsKICAgICAgICAgICAgICBeCgp0
b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDggbGluZXMgY2hlY2tlZAoKQ29tbWl0IGQ5NmQy
ZmJiYzVkYiAob3IxazogRml4IGNvbXBpbGF0aW9uIGhpY2N1cCkgaGFzIHN0eWxlIHByb2JsZW1z
LCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRp
dmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlO
VEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29k
ZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xv
Z3MvMjAyMDA1MjYxODUxMzIuMTY1MjM1NS0xLWVibGFrZUByZWRoYXQuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

