Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGATc-0000qc-QN
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 13:03:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YG9WQ-00055K-9k
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>) id 1YG9WP-0002Bh-Iv
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 12:01:50 -0500
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:44496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcfaracco@gmail.com>)
	id 1YG9Dw-0003eD-FQ; Tue, 27 Jan 2015 11:42:44 -0500
Received: by mail-qg0-f41.google.com with SMTP id q108so12501110qgd.0;
	Tue, 27 Jan 2015 08:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XQBLUmFw5X+C2e+nY9CrztUkBE3BnkUjurrq08o1Hg8=;
	b=dvBBtCzQ9U9UbqlbIl7/MgOqG1EJ+KGQIenViYHqhlmNoahA37/kSavr4w9p0942m8
	mN2shuE8UrD5K5HMONu6m7mbD/u+bIyp22gpWhFYGcpuSX8Nzqrz2XQi0eZkKs4OxyUK
	PbhxY8t+UkgKlnYVJPPR1S6QVek9stPEsOuwwVW3SWNYyvMTZ8AKnuVBgcKBIoLUzniU
	D7ZXzWxx+R8oZ9U4hX56giW2P2dUEaC1SwZv0vzGJLmHV0vHrLMfxenJw0PGXiXkR2fk
	FIiLElLIjoSXHtsQjTzFRK+i6dN3H97YD87eGv7lUc7fatZjHiIZSVNXUcvLFawK71HR
	Xr5Q==
X-Received: by 10.140.101.135 with SMTP id u7mr3505307qge.2.1422376963393;
	Tue, 27 Jan 2015 08:42:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.10.202 with HTTP; Tue, 27 Jan 2015 08:42:23 -0800 (PST)
In-Reply-To: <54C26703.7020602@redhat.com>
References: <1421978021-3609-1-git-send-email-jcfaracco@gmail.com>
	<1421978021-3609-2-git-send-email-jcfaracco@gmail.com>
	<54C26703.7020602@redhat.com>
From: Julio Faracco <jcfaracco@gmail.com>
Date: Tue, 27 Jan 2015 14:42:23 -0200
Message-ID: <CAENf94LRMOn0cFSsDRsg-Ck2XZmAarHvkqE1xKn=_bS2R0W6QA@mail.gmail.com>
To: Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary=001a11c1670ca3f053050da4f136
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::229
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qcow2-snapshot: Fixing
 bug of creating snapshots with the same name.
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
X-List-Received-Date: Tue, 27 Jan 2015 18:02:59 -0000

--001a11c1670ca3f053050da4f136
Content-Type: text/plain; charset=ISO-8859-1

Hi Max.

Yes, you are right! The main problem about this issue is deleting the first
occurence of the snapshot with that name.
Considering I have 3 snapshots with the name 'foo', you need to have the
option to choose what snapshot (what 'foo's) you want to remove or, as you
said, do not remove none of them.

Libvirt for example does not allow to create snapshots with the same name.

--001a11c1670ca3f053050da4f136
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Max.<br><br></div>Yes, you are right! Th=
e main problem about this issue is deleting the first occurence of the snap=
shot with that name.<br></div>Considering I have 3 snapshots with the name =
&#39;foo&#39;, you need to have the option to choose what snapshot (what &#=
39;foo&#39;s) you want to remove or, as you said, do not remove none of the=
m.<br><br></div>Libvirt for example does not allow to create snapshots with=
 the same name.<br></div>

--001a11c1670ca3f053050da4f136--

