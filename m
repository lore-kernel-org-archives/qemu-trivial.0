Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3uuy-0003qM-TF
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 16:56:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luca.castelli.eu@gmail.com>) id 1W3qkh-0003P0-Lq
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:29:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luca.castelli.eu@gmail.com>) id 1W3qkg-00041q-JW
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:29:11 -0500
Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f]:40791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luca.castelli.eu@gmail.com>) id 1W3qkg-00041e-BB
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:29:10 -0500
Received: by mail-la0-f47.google.com with SMTP id el20so253181lab.34
	for <qemu-trivial@nongnu.org>; Thu, 16 Jan 2014 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rwiiV3VUUf4kJHJKn6DNoaawdsw/6B1pMX6WiOg3H9M=;
	b=wc+i4rY/pKohn21VADgy1Vdb4LqWtC8ReJLO4rKopGd18dhZbLW9Rx+JCRjtuLIJh1
	+NScWwYMlX+IjjOVCQWtybkFkq9cyd0UJFj+/TqSIYeTbJ/Am+uETDPUSbkkXhJ7J03f
	4DYGmhRaZMRK4tJM5UPIrBsBH0L9JNb/8ySpd++rzaEVR5iMDLh1fgqGr9UDMF9isKQl
	0XPrYduaDczE6VNlOAK1AxpVrDcy72ztclcwUPMy0Edo6I6nbyN96qLLBA2Xp5ksVAlz
	5w8AiMr3w4r7jZml8zDh73Y1v4QRXWpby22ml7rpnL8i6e4ZEIlBqmgEWQRDn6X/F0qT
	46Zg==
MIME-Version: 1.0
X-Received: by 10.152.20.6 with SMTP id j6mr5680301lae.8.1389893348345; Thu,
	16 Jan 2014 09:29:08 -0800 (PST)
Received: by 10.112.124.238 with HTTP; Thu, 16 Jan 2014 09:29:08 -0800 (PST)
Date: Thu, 16 Jan 2014 18:29:08 +0100
Message-ID: <CAMqpCi-q4vmZrZFfRBjWh+RMpx5tfPU+pkAPMaF-a2BN=K5qBQ@mail.gmail.com>
From: Luca Castelli <luca.castelli.eu@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=089e013d20344dcc3f04f019c341
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22f
X-Mailman-Approved-At: Thu, 16 Jan 2014 16:56:03 -0500
Subject: [Qemu-trivial] qemu blocking with system c signal
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
X-List-Received-Date: Thu, 16 Jan 2014 17:29:12 -0000

--089e013d20344dcc3f04f019c341
Content-Type: text/plain; charset=ISO-8859-1

Hi, I have to carry out a stop and start when running in qemu cpu-exec
function, by using System c.
My idea is to use a signal that communicates between the two programs, can
you tell me how I can set a signal that communicates with the outside world
that can realize this communication?
Thanks

--089e013d20344dcc3f04f019c341
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I have to carry out a stop and start when running in q=
emu cpu-exec function, by using System c.=A0<div>My idea is to use a signal=
 that communicates between the two programs, can you tell me how I can set =
a signal that communicates with the outside world that can realize this com=
munication?</div>
<div>Thanks</div>
</div>

--089e013d20344dcc3f04f019c341--

