Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIpJo-0007f8-Hg
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2020 04:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIpJh-0007WC-Aw; Thu, 17 Sep 2020 04:31:01 -0400
Resent-Date: Thu, 17 Sep 2020 04:30:57 -0400
Resent-Message-Id: <E1kIpJh-0007WC-Aw@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIpJc-0006Rs-Nl; Thu, 17 Sep 2020 04:30:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600331439; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GEYMrqdorjYOLyTgiWDbo4eL4+kmNxmCG1AH2XBvbTBYb6gjryrvd9QUSrsjk6iWhkxehEazcc+4oDCS2vHuFtRV+7fsrdt/pp+lLcmnyzM0nO22u4dzIBEup9srGOswP+E3Ozs0EwurSjSZCAyujvN4ZqCxT2+7pCx6M7eZ/aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600331439;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=QevXtWuQwPhv6vCPy3sGCxGVaGqfRIg2FXrSSC5XvKo=; 
 b=NHbWEw+Ujb8VRi0fXYGhOi+5eRDe/Jee3e/+qFoax5tAQ65VN2bEK0XNZ0VJIptdsj9qiTTUrwF/rAlqsJcBO1jQ/kbFSaBSzPIqVigd6cCHhaVFKqpU0EmLNnOLSswj3LY8Jsha9KdiSK+3h1igE2fDVWtmGyfI0ORzJWeNbEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600331437012815.4667183335949;
 Thu, 17 Sep 2020 01:30:37 -0700 (PDT)
Subject: Re: [PATCH V3 00/10] fix some comment spelling errors
Message-ID: <160033143587.8478.4571888972276921426@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200917075029.313-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhaolichang@huawei.com
Cc: qemu-trivial@nongnu.org, zhaolichang@huawei.com, qemu-devel@nongnu.org
Date: Thu, 17 Sep 2020 01:30:37 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 04:18:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 17 Sep 2020 08:31:01 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzA3NTAyOS4zMTMt
MS16aGFvbGljaGFuZ0BodWF3ZWkuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWls
ZCB0ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgoK
CgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMDA5MTcwNzUwMjkuMzEzLTEtemhhb2xpY2hhbmdAaHVhd2VpLmNvbS90ZXN0aW5nLkZyZWVC
U0QvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

