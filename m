Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvNo0-0008Fn-3U
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 02:53:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TvNnv-0008Ab-63
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 02:53:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TvNns-0008Ht-Ti
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 02:52:59 -0500
Received: from mail-ie0-f178.google.com ([209.85.223.178]:47560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TvNns-0008Hc-OQ
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 02:52:56 -0500
Received: by mail-ie0-f178.google.com with SMTP id c12so1875010ieb.23
	for <qemu-trivial@nongnu.org>; Tue, 15 Jan 2013 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type; bh=iDOyGirGivNkPCokLIbrRdVtPVH1AG8fgrWhRb4W3Qk=;
	b=D622LnLb8v/CHcq5d0EAdfqvcKwWnXYoEbzvZrSBgtEPegae7I+2cRQKOSapkJNau+
	cY4vpCgxSisf2WG7MwNJtc7J8i9Gh82BGz9iuHwfuC5UK2/AI9r/FU1MoyEdZ0nO+r0t
	IJa++/kS4S6bs5AoR6vktAbGDqA7o3wZJyquW8cmAcF5/m5hownOiVcsD1/sbolVkNCl
	+UM8Lu/FnSC6Eb6BdcDR9bBy50iiQylN8FO+2H4HVnnKvXcQbYC9ObX5DvVHwhzVyeXu
	3InymoY8yAi8lkeI58CKkxX7PmWlbegfMYMc2ldtKvrF1o5KluUa4Jy8nZ3449ZSKq4b
	6pRA==
X-Received: by 10.50.15.138 with SMTP id x10mr4140456igc.16.1358322775726;
	Tue, 15 Jan 2013 23:52:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.219.169 with HTTP; Tue, 15 Jan 2013 23:52:35 -0800 (PST)
From: Jason Stillwell <dragonfax@gmail.com>
Date: Tue, 15 Jan 2013 23:52:35 -0800
Message-ID: <CAG0b9_jOiRwSik_Np5ym=_LOiAPhuMtZOJ6kCMv+WrftnX1LAQ@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary=14dae9340bef899bbd04d3632ad0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.178
Subject: [Qemu-trivial] trival patch to master to fix osx build
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 07:53:02 -0000

--14dae9340bef899bbd04d3632ad0
Content-Type: multipart/alternative; boundary=14dae9340bef899bb904d3632ace

--14dae9340bef899bb904d3632ace
Content-Type: text/plain; charset=ISO-8859-1

symbol isnt' defined when __APPLE__
this moves the symbol to the right place so it doesn't break the build.

--14dae9340bef899bb904d3632ace
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">symbol isnt&#39; defined when __APPLE__<div>this moves the symbol to the right place so it doesn&#39;t break the build.</div></div>

--14dae9340bef899bb904d3632ace--
--14dae9340bef899bbd04d3632ad0
Content-Type: application/octet-stream; name="0001-fix-for-osx.patch"
Content-Disposition: attachment; filename="0001-fix-for-osx.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hc06a60f0

RnJvbSA1YmZlNjU1YzEyMTlkZjdmZWZlNTgxYzEyZDE4NjM2ODg4NWM2YjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYXNvbiBTdGlsbHdlbGwgPGpzdGlsbHdlbGxAemVuZGVzay5j
b20+CkRhdGU6IFR1ZSwgMTUgSmFuIDIwMTMgMjM6NTA6MzUgLTA4MDAKU3ViamVjdDogW1BBVENI
XSBmaXggZm9yIG9zeAoKLS0tCiBibG9jay9yYXctcG9zaXguYyB8ICAgIDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Jsb2Nr
L3Jhdy1wb3NpeC5jIGIvYmxvY2svcmF3LXBvc2l4LmMKaW5kZXggNjc5ZmNjNS4uOTJjMjA5NCAx
MDA2NDQKLS0tIGEvYmxvY2svcmF3LXBvc2l4LmMKKysrIGIvYmxvY2svcmF3LXBvc2l4LmMKQEAg
LTE0NTUsNyArMTQ1NSw2IEBAIHN0YXRpYyBCbG9ja0RyaXZlciBiZHJ2X2hvc3RfZGV2aWNlID0g
ewogICAgIC5iZHJ2X2Fpb19yZWFkdgk9IHJhd19haW9fcmVhZHYsCiAgICAgLmJkcnZfYWlvX3dy
aXRldgk9IHJhd19haW9fd3JpdGV2LAogICAgIC5iZHJ2X2Fpb19mbHVzaAk9IHJhd19haW9fZmx1
c2gsCi0gICAgLmJkcnZfYWlvX2Rpc2NhcmQgICA9IGhkZXZfYWlvX2Rpc2NhcmQsCiAKICAgICAu
YmRydl90cnVuY2F0ZSAgICAgID0gcmF3X3RydW5jYXRlLAogICAgIC5iZHJ2X2dldGxlbmd0aAk9
IHJhd19nZXRsZW5ndGgsCkBAIC0xNDY0LDYgKzE0NjMsNyBAQCBzdGF0aWMgQmxvY2tEcml2ZXIg
YmRydl9ob3N0X2RldmljZSA9IHsKIAogICAgIC8qIGdlbmVyaWMgc2NzaSBkZXZpY2UgKi8KICNp
ZmRlZiBfX2xpbnV4X18KKyAgICAuYmRydl9haW9fZGlzY2FyZCAgID0gaGRldl9haW9fZGlzY2Fy
ZCwKICAgICAuYmRydl9pb2N0bCAgICAgICAgID0gaGRldl9pb2N0bCwKICAgICAuYmRydl9haW9f
aW9jdGwgICAgID0gaGRldl9haW9faW9jdGwsCiAjZW5kaWYKLS0gCjEuNy4xMC4yIChBcHBsZSBH
aXQtMzMpCgo=
--14dae9340bef899bbd04d3632ad0--

