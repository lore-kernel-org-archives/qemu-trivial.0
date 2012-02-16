Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5tR-0004Hm-Kr
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 13:17:21 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5tL-0004AI-DP
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5t8-00036j-Id
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:17:15 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:50160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Ry5su-000357-Q8; Thu, 16 Feb 2012 13:16:48 -0500
Received: by qafi31 with SMTP id i31so2619472qaf.4
	for <multiple recipients>; Thu, 16 Feb 2012 10:16:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.136.131 with SMTP id r3mr2440227qct.129.1329416208020;
	Thu, 16 Feb 2012 10:16:48 -0800 (PST)
Received: by 10.229.35.1 with HTTP; Thu, 16 Feb 2012 10:16:47 -0800 (PST)
In-Reply-To: <4F3D3F67.9050506@mentor.com>
References: <4F3D3F67.9050506@mentor.com>
Date: Thu, 16 Feb 2012 18:16:47 +0000
Message-ID: <CAFEAcA8LbVRGFFrETjomr+YrNgSeq2Bnbq=06=8myuQbYPFQ7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Alexander Barabash <alexander_barabash@mentor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmr9nPHcKsosclIc9zhXuOZfSmeFP4JzPBfN988YYoZ6b87IL0Wg0WFmtAOFuVDgLB7irLU
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add
	object_property_get_child().
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
X-List-Received-Date: Thu, 16 Feb 2012 18:17:21 -0000

On 16 February 2012 17:39, Alexander Barabash
<alexander_barabash@mentor.com> wrote:
>
> =C2=A0 =C2=A0Add object_property_get_child().
>
> =C2=A0 =C2=A0Adding a direct accessor to a child property.
>
> =C2=A0 =C2=A0In the existing implementation, object_property_get() must b=
e used,
> =C2=A0 =C2=A0with with a visitor, implementing the 'type_str' callback,
> =C2=A0 =C2=A0receiving the child's canonical path.
>
> =C2=A0 =C2=A0In the new implementation, the child is returned directly.
> =C2=A0 =C2=A0Link properties are resolved in the same way, as they are
> =C2=A0 =C2=A0when an absolute path is resolved.
>
> =C2=A0 =C2=A0Errors relevant to the operation, QERR_OBJECT_PROPERTY_NOT_F=
OUND
> =C2=A0 =C2=A0and QERR_OBJECT_PROPERTY_INVALID_TYPE were added.

Not trivial (look at the length of it!).

> =C2=A0 =C2=A0Also, in the new implementation, some common sense refactori=
ng was done
> =C2=A0 =C2=A0in the file 'qom/object.c' in the code extracting child and =
link
> properties.

If you find yourself writing a commit message with a paragraph
starting "Also" this almost always means you should split it
into more than one patch.

-- PMM

