Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kH3yv-0000tV-Ph
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 07:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kH3yt-0000pp-EV; Sat, 12 Sep 2020 07:46:11 -0400
Resent-Date: Sat, 12 Sep 2020 07:46:11 -0400
Resent-Message-Id: <E1kH3yt-0000pp-EV@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kH3yq-0001Bq-7E; Sat, 12 Sep 2020 07:46:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1599911138; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NpyK+xZKx70DXbTovQXVmXJODBe0HKQcrnE9WHZhp2wJyrUbgWDi1pp75pqaJWyhVJulEJ9gZQE4abc4G7UQ++l0wtfbDjs0V6/QyD35ZcRbhUjKw10s81PvcEr4c6Vl3FEyn171spU8AAV3GpdrqEVje3twEmdynK16cB1yjDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1599911138;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=aCxoM4AXWk57R1bBJOAV77lsW4swUVKiN7ytiTR6I1M=; 
 b=k7kuz3rulU54Y7ZQOo4K6Z2hCbMVq4hVX7ObPVVMSjZ+xyDB3eQO7LFYzTJdFTfgsyw0yjkx0C2twd/fH/VVOZnP9wcpjgOmk5siuIIKs3YM3vpCtq6U45ovcrD1SuvV6A1KM4jiaYldYFZMs/sUgQK8RFfOlsnbJdGFv1V4oes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1599911137707498.56034969088284;
 Sat, 12 Sep 2020 04:45:37 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] hw/char/serial: Housekeeping
Message-ID: <159991113647.32613.1847386236215843361@66eaa9a8a123>
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
Date: Sat, 12 Sep 2020 04:45:37 -0700 (PDT)
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
X-List-Received-Date: Sat, 12 Sep 2020 11:46:11 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxMjExNDA0MC45MTg0
NjQtMS1mNGJ1Z0BhbXNhdC5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxkIHRl
c3Qgb24gRnJlZUJTRCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBiZWxvdy4KCgoKCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MDkxMjExNDA0MC45MTg0NjQtMS1mNGJ1Z0BhbXNhdC5vcmcvdGVzdGluZy5GcmVlQlNELz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

