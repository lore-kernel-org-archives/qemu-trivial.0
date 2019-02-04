Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqlBl-00076d-6c
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 15:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqlBj-00076T-4m
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 15:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqlBh-0005Y1-QN
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 15:49:55 -0500
Resent-Date: Mon, 04 Feb 2019 15:49:55 -0500
Resent-Message-Id: <E1gqlBh-0005Y1-QN@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gqlBh-0005Jz-GU; Mon, 04 Feb 2019 15:49:53 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1549313361; cv=none; d=zoho.com; s=zohoarc; 
	b=EyVY1+grBAv9bmiGNyYkJJctYauH6xtaHuaMTbG244mfB1g1Uoes7r9OdrXhX+RrwwM8ygEDsB/o0Q32aamz0l5NGU8gM3F+4lSSLuPwJhIZPqz/ZZNlqfzu9jTNh6EIlIQwjrNkVs771uO7k6sqLJ2sFrCieuOr4J03lCTna28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1549313361;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=6fC0fS7dr4mj5O9Vm3J85svUJxOU36frAMTV5Oi8L0w=; 
	b=fk7dE6nBkopKHuD5nqe51gb4KeaRfIMhNLxLeXACg9iF1HnyCGGhNsFvVS4k6ZPw0iryhrf4dlgXkJUgszSsTjU7t5xZfipvNjjgDqy3yJOcXZ7BdxL34sR7n0XE6gh5WJgRhYteWRLH+3LqbC92bEMtXaj0Hzi6qoEhHvWcRsY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1549313359536746.4178166486399;
	Mon, 4 Feb 2019 12:49:19 -0800 (PST)
Message-ID: <154931335810.29184.7999220470596987389@ebba9967afc0>
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: fam@euphon.net, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com
Date: Mon, 4 Feb 2019 12:49:19 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/input/tsc210x: Fix
 building with no verbosity
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
X-List-Received-Date: Mon, 04 Feb 2019 20:49:56 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDIwNDIwNDUxNy4yMzY5
OC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3Jh
IFNIT1dfRU5WPTEgSj0xNAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDIwNDIwNDUxNy4y
MzY5OC0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3RpbmcuZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t


