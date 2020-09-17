Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIlF4-00039W-Mx
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2020 00:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIlF2-00038d-DV; Thu, 17 Sep 2020 00:09:52 -0400
Resent-Date: Thu, 17 Sep 2020 00:09:52 -0400
Resent-Message-Id: <E1kIlF2-00038d-DV@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIlF0-0002OV-1W; Thu, 17 Sep 2020 00:09:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600315778; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JJ6RBdua3hfejB6mSDdOVdIl9bwI61kWhCLHdWr+NYhrYhLI7FYXvgY48vYJE8o8p+RJHxNIhxUAj/2+RVqwjjmzb2LCHPWxZcU3BBs2Ju58wJaUGYnJ5t3Yp+OD5+3ko9lwYgKwuSSpafkC7cfYRF17rGTqWjYr/Mk4tNFaeUU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600315778;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=E9tCkNUsX1DwthyCYk2p4x6P//7uEPxB7C3zvyHHbrM=; 
 b=FW/bJw5b8/OAp5siouO6uxqIVXeF5IsCy84ef3qxwP+aT3CAvTtoDo9uQg7+qlfg4rjd56YRW2EClpVCIadtI5cZgBdwyFU4y7PLCa8gCSXh2qv0cToIac2c8jnsRpsKVtJMTpouhziEpchxFBytP50oQI/VpkImHX/6+Kkn34Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600315777535711.3123966288862;
 Wed, 16 Sep 2020 21:09:37 -0700 (PDT)
Subject: Re: [PATCH V2 00/10] fix some comment spelling errors
Message-ID: <160031577631.8478.3112365757373962378@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200917035413.701-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhaolichang@huawei.com
Cc: qemu-trivial@nongnu.org, zhaolichang@huawei.com, qemu-devel@nongnu.org
Date: Wed, 16 Sep 2020 21:09:37 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 00:09:46
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
X-List-Received-Date: Thu, 17 Sep 2020 04:09:52 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzAzNTQxMy43MDEt
MS16aGFvbGljaGFuZ0BodWF3ZWkuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpOL0EuIEludGVybmFsIGVycm9yIHdoaWxlIHJlYWRpbmcgbG9nIGZpbGUK
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIwMDkxNzAzNTQxMy43MDEtMS16aGFvbGljaGFuZ0BodWF3ZWkuY29tL3Rlc3RpbmcuY2hlY2tw
YXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

