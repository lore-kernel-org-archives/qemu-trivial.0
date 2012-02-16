Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5yx-00029x-26
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 13:23:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5yp-0001jj-O8
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:23:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ry5yk-0004gr-7g
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 13:22:55 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:33426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Ry5yY-0004e8-J4; Thu, 16 Feb 2012 13:22:38 -0500
Received: by qabg40 with SMTP id g40so4569401qab.4
	for <multiple recipients>; Thu, 16 Feb 2012 10:22:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.136.131 with SMTP id r3mr2452575qct.129.1329416557647;
	Thu, 16 Feb 2012 10:22:37 -0800 (PST)
Received: by 10.229.35.1 with HTTP; Thu, 16 Feb 2012 10:22:37 -0800 (PST)
In-Reply-To: <CAFEAcA8=m-Ftutqem4H-xcdL2VTe2rJSa2RFkJpfQD8T+zxHxw@mail.gmail.com>
References: <4F3D3EF2.4090503@mentor.com>
	<CAFEAcA8=m-Ftutqem4H-xcdL2VTe2rJSa2RFkJpfQD8T+zxHxw@mail.gmail.com>
Date: Thu, 16 Feb 2012 18:22:37 +0000
Message-ID: <CAFEAcA99s19hGH1HV4p15-uWZZyxVRzD=8D8-1mrp3rm2PwbkQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Alexander Barabash <alexander_barabash@mentor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQnzwnVmTW9hyT28QNsDrIbrYv48hFkLyvDY1LfKbxpZ90HAB7ncbXYcn/FB0UceSUA6cYs1
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
X-List-Received-Date: Thu, 16 Feb 2012 18:23:01 -0000

On 16 February 2012 18:18, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 16 February 2012 17:37, Alexander Barabash
> <alexander_barabash@mentor.com> wrote:
>>
>> =C2=A0 =C2=A0Removed unused arm_sysctl_init().
>> =C2=A0 =C2=A0Renamed arm_sysctl_init1() into arm_sysctl_init().
>>
>> =C2=A0 =C2=A0Signed-off-by: Alexander Barabash <alexander_barabash@mento=
r.com>
>
> This also is textually identical to a patch I just submitted
> this week. Are you sure you aren't somehow laundering other
> peoples' patches and resubmitting them?

For the avoidance of doubt, this last sentence should have
included the word "accidentally": it is a suggestion your workflow
might be broken, not an accusation.

-- PMM

