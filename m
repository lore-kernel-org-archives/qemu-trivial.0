Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iEvr7-00061t-ED
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2019 09:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iEvr4-0005wp-6P
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 09:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iEvr1-0004ee-O7
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2019 09:36:44 -0400
Resent-Date: Mon, 30 Sep 2019 09:36:44 -0400
Resent-Message-Id: <E1iEvr1-0004ee-O7@eggs.gnu.org>
Received: from sender4-of-o58.zoho.com ([136.143.188.58]:21872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iEvqz-0004aV-27; Mon, 30 Sep 2019 09:36:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1569850586; cv=none; d=zoho.com; s=zohoarc; 
 b=kaAGuN/zPRiiSnQkSJ/uRCjkf8ZevNm6u8biaRjSmSd02TjoMVrGPdoUZ2ytbFTDiLNjUqBcnEWDdg4qzDJAi8rjyKJoE88m/oQwmEZ8gc/ILuARQznu54cZqGsGQzsBYORrRMJjGf37RhxcUtInynjHJw5Q+mCr9rD2U5V8bXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1569850586;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=7YOtdzTbUmhyw61CWjioveVTZcO23ciSq+AlHDsWvzw=; 
 b=A5wTZ/07tdif0oddB4j0nG1XXKgzswE1kTxKo1VX8pXlJF+Ra8oArISf0ArkngYHBLRFqBx2DUWgGsUUfyIfqMYuwcWl7+ACk/HPE299En70htYeRo54Sp5YqeNZDllykfpf3SiSuGICajg5N/UOczMezzhk6b2InZTAIukQLjo=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 15698505840440.2914529937745556;
 Mon, 30 Sep 2019 06:36:24 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] Disallow colons in the parameter of "-accel"
In-Reply-To: <20190930123505.11607-1-thuth@redhat.com>
Message-ID: <156985058289.27524.2467247182936493897@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com
Date: Mon, 30 Sep 2019 06:36:24 -0700 (PDT)
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
X-List-Received-Date: Mon, 30 Sep 2019 13:36:47 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkzMDEyMzUwNS4xMTYw
Ny0xLXRodXRoQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhIC9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1h
Z2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3QGZlZG9y
YSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDkzMDEyMzUwNS4x
MTYwNy0xLXRodXRoQHJlZGhhdC5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t


