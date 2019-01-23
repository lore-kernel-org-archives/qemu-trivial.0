Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmIwl-00080I-HJ
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 08:52:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gmIwh-0007yN-1L
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 08:51:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gmIwf-00033Q-N8
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 08:51:58 -0500
Resent-Date: Wed, 23 Jan 2019 08:51:58 -0500
Resent-Message-Id: <E1gmIwf-00033Q-N8@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21725)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gmIwc-00030n-UB
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 08:51:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1548251483; cv=none; d=zoho.com; s=zohoarc; 
	b=bMP+/tsqX0g/APev0avxsKWZGj3kcRWxoyMC0hpB+V2wyZ9KLjqz/m6cKGi90kdunGt3Lr/B5weMuaJAzi1tos6zaWD6pJL1NUDaEwxUGj3khuqOnhScQbo+JMF6SnPMqMksKCt01OW+JLm5e68OOIiycmzl9JqFp8X25PcVJAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1548251483;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=M8xpVTr/6XL9I8wmwp5w9cAYAb+8pnmjUffEo6pHMJ8=; 
	b=ZbxDrkFbYkKMILu99GovX5xx4+99ytNhb7p9pfcACEXKzHqkX4m7SHAA+qssTkVKAbRUvdyzVNhfDowdSspGsTSLPXkSGniKuBU1mfstXc7aTRBHeb0mgzEolelZtbvVw8fEBlU4N3doRlfme58IBTGDOMgtr+M8SFAQ3d6VwOU=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1548251478591998.0829985044195;
	Wed, 23 Jan 2019 05:51:18 -0800 (PST)
Message-ID: <154825147722.21.14321288500008236231@ebba9967afc0>
In-Reply-To: <20190117153338.11820-1-alex.bennee@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: fam@euphon.net, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, ehabkost@redhat.com, crosa@redhat.com
Date: Wed, 23 Jan 2019 05:51:18 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/replay-dump.py: fix
 utf-8 mangling
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
X-List-Received-Date: Wed, 23 Jan 2019 13:52:00 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDExNzE1MzMzOC4xMTgy
MC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRo
ZSBkb2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5n
IGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0
YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0Bm
ZWRvcmEgU0hPV19FTlY9MSBKPTE0Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIENDICAgICAg
Y3J5cHRvL2Fmc3BsaXQubwogIENDICAgICAgY3J5cHRvL3h0cy5vCi90bXAvcWVtdS10ZXN0L3Ny
Yy9ibG9jay9zaGVlcGRvZy5jOiBJbiBmdW5jdGlvbiAnZmluZF92ZGlfbmFtZSc6Ci90bXAvcWVt
dS10ZXN0L3NyYy9ibG9jay9zaGVlcGRvZy5jOjEyMzk6NTogZXJyb3I6ICdzdHJuY3B5JyBzcGVj
aWZpZWQgYm91bmQgMjU2IGVxdWFscyBkZXN0aW5hdGlvbiBzaXplIFstV2Vycm9yPXN0cmluZ29w
LXRydW5jYXRpb25dCiAgICAgc3RybmNweShidWYgKyBTRF9NQVhfVkRJX0xFTiwgdGFnLCBTRF9N
QVhfVkRJX1RBR19MRU4pOwogICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVy
cm9ycwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xv
Z3MvMjAxOTAxMTcxNTMzMzguMTE4MjAtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnL3Rlc3Rpbmcu
ZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


