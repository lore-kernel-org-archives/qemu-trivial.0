Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aL1Aw-0006oV-G4
	for mharc-qemu-trivial@gnu.org; Sun, 17 Jan 2016 23:12:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aKzU5-0005Rl-NG
	for qemu-trivial@nongnu.org; Sun, 17 Jan 2016 21:23:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aKzU4-0005cz-VQ
	for qemu-trivial@nongnu.org; Sun, 17 Jan 2016 21:23:57 -0500
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:33664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>)
	id 1aKzU2-0005ad-VJ; Sun, 17 Jan 2016 21:23:55 -0500
Received: by mail-lf0-x22c.google.com with SMTP id m198so163657087lfm.0;
	Sun, 17 Jan 2016 18:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=ZTJ56HmoYvT0LKghDyDJ9YXj5T1A/nK7ylxyePWuJfw=;
	b=BRpgnVq2Sypklyr9jHLzqmodfCvNnyj1mWjdYFGi2MDJKBXLlQhG/Vo3J3j9n6mmqc
	26YL4HRAKpekv6sFAXDQBhM6Gx3rKPHPGBLdF9ZQFlPXZ2ZhxLimJKX88GjSKWEzYd/0
	GLe+KQ8HAnSzIvMAPNMcEqcztZ4afDaCpqDqSExKVmlj+ojSO3K2hj7Gh8dhNQvRC/U1
	/GvaEirH/ngYF7D15tkTi/Off4RldhJ52ShhAZeoN2axKqN4aLwayOCXbiHhI/a0ta0k
	maVrhvWrR/j9gq1R/yqbB04QMXAvScU3ErdF3s4qWU30EU4B7ihFMn2BC7GMJbzJGXbn
	aDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=ZTJ56HmoYvT0LKghDyDJ9YXj5T1A/nK7ylxyePWuJfw=;
	b=g93EJd7+YDaWexj4e7z/JJ8gTFDdRLxOVDsidWYQnEiHFY5lIOheIw5R3Qy3tLiswE
	GecWaLEmqt2NkaHii/NamR58Hj0WZl/A1lZKLy1+OhPmhepLXQf3Msbq5KJrqH7VTeOC
	7isWQ7tsK3KuZuV0C9pgn+MjtHZr6+Nv1XRvGzzpAVlmvkOu8jPZouLHntPkz+VQ5O72
	WVCc6ViRMXSlQOpuEVhtqnGXLr3B0rTindS3ey5zGJFoYhmGnwJXNKlHlZBuQ01gXf0K
	3xBJbAFRCqlT1zd0fL9AfoeysUtHqhk3n5urzQy0x/CALB7P0DJKqasOj/QqJRjbEqMG
	abEg==
X-Gm-Message-State: ALoCoQmA39brQGRJAYBmvFMQN5/dmnMJq1iB1bg8bUBntK22INP5aJLbtfg4CX9roLox7bfvq0piIDAGTT6j+wpvxbjXtJme0Q==
MIME-Version: 1.0
X-Received: by 10.25.152.199 with SMTP id a190mr7960731lfe.133.1453083833898; 
	Sun, 17 Jan 2016 18:23:53 -0800 (PST)
Received: by 10.112.78.4 with HTTP; Sun, 17 Jan 2016 18:23:53 -0800 (PST)
Date: Sun, 17 Jan 2016 18:23:53 -0800
Message-ID: <CAKWsRc2MyUByd3tjyZMx_q_3+Oy=D5kUtw7MLU6HP7h9xVAy6A@mail.gmail.com>
From: Raghavan Santhanam <raghavanil4m@gmail.com>
To: qemu-stable@nongnu.org, qemu-trivial@nongnu.org, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary=001a11403466bfa11d0529927133
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22c
X-Mailman-Approved-At: Sun, 17 Jan 2016 23:12:17 -0500
Cc: Raghavan Santhanam <raghavanil4m@gmail.com>
Subject: [Qemu-trivial] Regarding Intel IGD passthru support for QEMU/KVM
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
X-List-Received-Date: Mon, 18 Jan 2016 02:23:58 -0000

--001a11403466bfa11d0529927133
Content-Type: text/plain; charset=UTF-8

Hi,

Based on the Intel IGD passthru support that has been added to Qemu/Xen
code base,
is there any way to use/reuse the same logic currently to have a successful
passthru of an Intel
IGD with Qemu/KVM on a Linux host(Ubuntu x86_64) or will that require some
more
work in addition to what Xen code based already has for the IGD passthru?

Best,
Raghavan

--001a11403466bfa11d0529927133
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi,</span><div style=3D"f=
ont-size:12.8px"><br></div><div style=3D"font-size:12.8px">Based on the Int=
el IGD passthru support that has been added to Qemu/Xen code base,</div><di=
v style=3D"font-size:12.8px">is there any way to use/reuse the same logic c=
urrently to have a successful passthru of an Intel</div><div style=3D"font-=
size:12.8px">IGD with Qemu/KVM on a Linux host(Ubuntu x86_64) or will that =
require some more</div><div style=3D"font-size:12.8px">work in addition to =
what Xen code based already has for the IGD passthru?</div><div style=3D"fo=
nt-size:12.8px"><br></div><div style=3D"font-size:12.8px">Best,</div><div s=
tyle=3D"font-size:12.8px">Raghavan</div><div style=3D"font-size:12.8px"><br=
></div></div>

--001a11403466bfa11d0529927133--

