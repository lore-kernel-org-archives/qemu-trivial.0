Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5uk-0006Ph-HD
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 13:18:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5ub-0005z7-QR
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:18:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5uW-0003Rb-3d
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:18:33 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:57905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Ry5uJ-0003OK-Ut; Thu, 16 Feb 2012 13:18:16 -0500
Received: by qabg40 with SMTP id g40so4564102qab.4
	for <multiple recipients>; Thu, 16 Feb 2012 10:18:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.134.196 with SMTP id k4mr2517772qct.29.1329416295497; Thu,
	16 Feb 2012 10:18:15 -0800 (PST)
Received: by 10.229.35.1 with HTTP; Thu, 16 Feb 2012 10:18:15 -0800 (PST)
In-Reply-To: <4F3D3EF2.4090503@mentor.com>
References: <4F3D3EF2.4090503@mentor.com>
Date: Thu, 16 Feb 2012 18:18:15 +0000
Message-ID: <CAFEAcA8=m-Ftutqem4H-xcdL2VTe2rJSa2RFkJpfQD8T+zxHxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Alexander Barabash <alexander_barabash@mentor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQlYH3oHz1lzWo7IIGwKeQHy+u2UfMoowpFzyK12LpYHL7YXp+xUq5TPxIjvkwDDaIjOyiNu
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [TRIVIAL] Removed unused
	arm_sysctl_init().
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
X-List-Received-Date: Thu, 16 Feb 2012 18:18:40 -0000

On 16 February 2012 17:37, Alexander Barabash
<alexander_barabash@mentor.com> wrote:
>
> =C2=A0 =C2=A0Removed unused arm_sysctl_init().
> =C2=A0 =C2=A0Renamed arm_sysctl_init1() into arm_sysctl_init().
>
> =C2=A0 =C2=A0Signed-off-by: Alexander Barabash <alexander_barabash@mentor=
.com>

This also is textually identical to a patch I just submitted
this week. Are you sure you aren't somehow laundering other
peoples' patches and resubmitting them?

Anyway, please don't commit to qemu-trivial, this is in arm-devs.next.

-- PMM

