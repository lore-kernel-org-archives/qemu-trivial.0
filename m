Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePE1-0004zW-L8
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 11:48:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1ceOx6-0002pc-SH
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chadjoan@gmail.com>) id 1ceOx5-0005dT-I7
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:30:40 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <chadjoan@gmail.com>)
	id 1ceOwz-0005bn-Jh; Thu, 16 Feb 2017 11:30:33 -0500
Received: by mail-qk0-x231.google.com with SMTP id s186so20454059qkb.1;
	Thu, 16 Feb 2017 08:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=k0ZYHb6qP+vqYFCFwBFMEb/TbTsa1uYCnfwmPeGBGTw=;
	b=b3nUesGIoG3cVBIW9yZFznLDpaoqx7WaZPo+ytI8qTqsV5DWyzZapGd694yovzAltb
	MoPTC49NhCpx9+6o0CweY4zDEBfAgymKYPo1kUptORsHHx0J0sbdd8WVID/voFWWEgbh
	naxKIhIJo6g/0WzQbm7Im2BZjf3B09FHFRFrXOrOaURaHpfx7FnCRjrGxUCHhGjf0/SG
	y+MihhbCc049esGQ+7V8Xnj6vIXN+FW8ehw9e8PiW0g7DQERbtpIT22mmNiFTN5Q3m+3
	7r7La8W4wlbib0vtonDuwu4kcMmM2Dk9ZzmjCKcubqeiZLy2W4oheZbAQhE6nJQljVHH
	HjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=k0ZYHb6qP+vqYFCFwBFMEb/TbTsa1uYCnfwmPeGBGTw=;
	b=cfGMFBVeon56uzSbd0BFL1rEfsWOiXI5pEdeXNvTunj38psrYxeGdIbTlQdDsZjjMc
	5XQVVM7hh36FXfCtvQpHA9ksg2lx6XHnFeP7cdnSmYBPSZfLhh2TBdUcH0S3QrJznwbW
	urXH8UH44BMopPoPK/wypJUlAT6SYtSXgW9R8mLMjYxP2cOcHIDfGsGBT70JF6cZTAOv
	Axw0Es0Xw3Yp5qenkdUzKZ7wtU9khc//LUULg3gPRvL+lk5JenfTl2EGEoAqxJMcZ7rJ
	rGpjuKGmgeC5Nm6H23iU1HwFGR3bWeaFsxN7xGKfKHxJva5PQbI1XfKC+AC1Lubw/N/3
	PXqA==
X-Gm-Message-State: AMke39kPEuGTQp2tweuBhn+hRQC7LeF17Bp5I78zY0S7oTCLeq1NHFHEh225QIdVH5UcTfvt+/5DC9P41nQEHA==
X-Received: by 10.55.121.194 with SMTP id u185mr2913615qkc.56.1487262632268;
	Thu, 16 Feb 2017 08:30:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.148.225 with HTTP; Thu, 16 Feb 2017 08:30:10 -0800 (PST)
From: Chad Joan <chadjoan@gmail.com>
Date: Thu, 16 Feb 2017 11:30:10 -0500
Message-ID: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary=94eb2c05a196e29f560548a8509d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
X-Mailman-Approved-At: Thu, 16 Feb 2017 11:48:08 -0500
Subject: [Qemu-trivial] Fix build break during configuration on musl-libc
 based Linux systems.
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
X-List-Received-Date: Thu, 16 Feb 2017 16:30:42 -0000

--94eb2c05a196e29f560548a8509d
Content-Type: multipart/alternative; boundary=94eb2c05a196e29f510548a8509b

--94eb2c05a196e29f510548a8509b
Content-Type: text/plain; charset=UTF-8

Hello,

This is a one-line patch to the configure script that will allow QEMU to be
built on musl-libc based Linux systems.  This problem is only noticeable
when QEMU is built with --enable-curses.

Detailed reading material if you want to know where this came from:
https://bugs.gentoo.org/show_bug.cgi?id=609364

Hope that helps!
- Chad

--94eb2c05a196e29f510548a8509b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hello,<br><br></div>This is a one-line=
 patch to the configure script that will allow QEMU to be built on musl-lib=
c based Linux systems.=C2=A0 This problem is only noticeable when QEMU is b=
uilt with --enable-curses.<br><br></div>Detailed reading material if you wa=
nt to know where this came from: <a href=3D"https://bugs.gentoo.org/show_bu=
g.cgi?id=3D609364">https://bugs.gentoo.org/show_bug.cgi?id=3D609364</a><br>=
<br></div>Hope that helps!<br></div>- Chad<br></div>

--94eb2c05a196e29f510548a8509b--
--94eb2c05a196e29f560548a8509d
Content-Type: application/octet-stream; name="qemu-2.8.0-musl-ncurses.patch"
Content-Disposition: attachment; filename="qemu-2.8.0-musl-ncurses.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iz8lj9c50

ZGlmZiAtLWdpdCBjb25maWd1cmUgY29uZmlndXJlCmluZGV4IDFjOTY1NWUuLjlmODMxNzYgMTAw
NzU1Ci0tLSBjb25maWd1cmUKKysrIGNvbmZpZ3VyZQpAQCAtNjgyLDYgKzY4Miw3IEBAIEhhaWt1
KQogICB2aG9zdF9uZXQ9InllcyIKICAgdmhvc3Rfc2NzaT0ieWVzIgogICB2aG9zdF92c29jaz0i
eWVzIgorICBRRU1VX0NGTEFHUz0iLURfWE9QRU5fU09VUkNFPTUwMCAkUUVNVV9DRkxBR1MiCiAg
IFFFTVVfSU5DTFVERVM9Ii1JXCQoU1JDX1BBVEgpL2xpbnV4LWhlYWRlcnMgLUkkKHB3ZCkvbGlu
dXgtaGVhZGVycyAkUUVNVV9JTkNMVURFUyIKIDs7CiBlc2FjCg==
--94eb2c05a196e29f560548a8509d--

