Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kH44O-0006Pa-Bu
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 07:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kH44M-0006MP-0B; Sat, 12 Sep 2020 07:51:50 -0400
Resent-Date: Sat, 12 Sep 2020 07:51:50 -0400
Resent-Message-Id: <E1kH44M-0006MP-0B@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kH44J-0001xP-2U; Sat, 12 Sep 2020 07:51:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599911499; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YlVyhdjcXf4EkZvKuwv38WmUUvcJqtlkzlSrJ8Zfbjx4XfvDDEDooqlNV5eLUkINnXRSPzxrcWQwy47ydcUU7nyJcONfXA1gAPTXciloz7Jakri7wYXYML1hk5WFcz5LELXh/RNkdWmvc32kQ0HK41r8w1KSt6m+SiptQlkm2+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1599911499;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=sN/AFpJCetBpDvrWs4ZQ7Hg2+jCKnzjH0XS764mkfww=; 
 b=JX1EkmmazZ6rf0JtmPxW+tdm6MTy5K8dlFmlK14UMJ8msHezDh3r+9O8D9qq8PEOzMtxDsrAY2QITjxT9bLtDgxz5muD6BPYKLtqQx8DsGgzEyuU+980YIxyNbzZ96yU4gp9X+Xit9Awj2lryQpQgLaoxFz4yuuZO7PRoz6h30w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1599911498853626.8770697356559;
 Sat, 12 Sep 2020 04:51:38 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] hw/char/serial: Housekeeping
Message-ID: <159991149749.32613.12575399331176448998@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200912114040.918464-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 marcandre.lureau@redhat.com, mst@redhat.com, f4bug@amsat.org
Date: Sat, 12 Sep 2020 04:51:38 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 07:46:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Sep 2020 11:51:50 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxMjExNDA0MC45MTg0
NjQtMS1mNGJ1Z0BhbXNhdC5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKCk4vQS4gSW50ZXJuYWwgZXJyb3Igd2hpbGUgcmVhZGluZyBsb2cgZmlsZQoKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAw
OTEyMTE0MDQwLjkxODQ2NC0xLWY0YnVnQGFtc2F0Lm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

