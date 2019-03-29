Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9nUI-0003GX-Rb
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 05:07:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h9nUH-0003GL-Fs
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h9nUG-00015i-6B
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:07:45 -0400
Resent-Date: Fri, 29 Mar 2019 05:07:45 -0400
Resent-Message-Id: <E1h9nUG-00015i-6B@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h9nUF-00014G-TJ; Fri, 29 Mar 2019 05:07:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553850443; cv=none; d=zoho.com; s=zohoarc; 
	b=MAvUilSkkBNc/uh8p+zB7fwK/3iJoYkwZ40+t3L0VPZZQoOcMJ3KIjZ7u+3o6piyyI5gCgvZJbaObP3McAEjaTqhEUtKRH19eoNpCWGjBcgWCQZN5i1nIFOgpGbESOnrns+5ZaZNSUwnYbLX4tIYmkBmAOT3P1+WjDyi8tIuScI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1553850443;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=qADwfL6dq1m3/hxj3ddwvXbLzXmSdulPdWS7Kd+1rb0=; 
	b=oJLF9LqzXesun0BSTTyggTkeu6x2ugL4+bVZ/IeoouXCAyQqGOSbIR0tSVFqsJjOEie+y64TjMEX85rLAPQ6Cjqzfn3Z6JYQ2es8qtJPKHy90jnsf0aOTy/No1Z97GZuaksCaAulVRm6CRR8UATjdKd0NnkQXTmsiP+lNAhmJt8=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1553850442668515.4018425937603;
	Fri, 29 Mar 2019 02:07:22 -0700 (PDT)
Message-ID: <155385044112.24.7332354302715369091@76452e4e88f2>
In-Reply-To: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: like.xu@linux.intel.com
Cc: fam@euphon.net, qemu-trivial@nongnu.org, ehabkost@redhat.com,
	like.xu@intel.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
	imammedo@redhat.com
Date: Fri, 29 Mar 2019 02:07:22 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/9] refactor cpu topo into
 machine properties
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
X-List-Received-Date: Fri, 29 Mar 2019 09:07:46 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUzODQ5MzI1LTQ0MjAxLTEt
Z2l0LXNlbmQtZW1haWwtbGlrZS54dUBsaW51eC5pbnRlbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJp
ZXMgZmFpbGVkIHRoZSBhc2FuIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNv
bW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxs
ZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1kZWJ1Z0BmZWRv
cmEgVEFSR0VUX0xJU1Q9eDg2XzY0LXNvZnRtbXUgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KCi91c3IvYmluL2xkOiAvdG1wL3FlbXUtdGVzdC9zcmMvaHcvaTM4Ni94ZW4v
eGVuLWh2bS5jOigudGV4dCsweDE3ZjcpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBtYXhfY3B1
cycKL3Vzci9iaW4vbGQ6IC90bXAvcWVtdS10ZXN0L3NyYy9ody9pMzg2L3hlbi94ZW4taHZtLmM6
KC50ZXh0KzB4MWIxZSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG1heF9jcHVzJwovdXNyL2Jp
bi9sZDogaHcvaTM4Ni94ZW4veGVuLWh2bS5vOi90bXAvcWVtdS10ZXN0L3NyYy9ody9pMzg2L3hl
bi94ZW4taHZtLmM6KC50ZXh0KzB4MWIzZSk6IG1vcmUgdW5kZWZpbmVkIHJlZmVyZW5jZXMgdG8g
YG1heF9jcHVzJyBmb2xsb3cKY2xhbmctNzogZXJyb3I6IGxpbmtlciBjb21tYW5kIGZhaWxlZCB3
aXRoIGV4aXQgY29kZSAxICh1c2UgLXYgdG8gc2VlIGludm9jYXRpb24pCm1ha2VbMV06ICoqKiBb
TWFrZWZpbGU6MjA0OiBxZW11LXN5c3RlbS14ODZfNjRdIEVycm9yIDEKbWFrZTogKioqIFtNYWtl
ZmlsZTo0NTA6IHN1YmRpci14ODZfNjQtc29mdG1tdV0gRXJyb3IgMgpUcmFjZWJhY2sgKG1vc3Qg
cmVjZW50IGNhbGwgbGFzdCk6CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8xNTUzODQ5MzI1LTQ0MjAxLTEtZ2l0LXNlbmQtZW1haWwtbGlrZS54
dUBsaW51eC5pbnRlbC5jb20vdGVzdGluZy5hc2FuLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


