Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KZ2-0002RH-H6
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:22:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KYd-0001kq-8d
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KYY-0003XD-Kn
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:21:46 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:46139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KYY-0003Wo-GX
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:21:42 -0500
Received: by ghrr14 with SMTP id r14so3591017ghr.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 09:21:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.85.227 with SMTP id k3mr2448247igz.17.1331140900131; Wed,
	07 Mar 2012 09:21:40 -0800 (PST)
Received: by 10.50.100.198 with HTTP; Wed, 7 Mar 2012 09:21:40 -0800 (PST)
In-Reply-To: <4F579778.5010609@redhat.com>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
	<4F579778.5010609@redhat.com>
Date: Wed, 7 Mar 2012 17:21:40 +0000
Message-ID: <CAFEAcA_tmpwCj8gqnFkTLuB-OxL9kE6BWTPgnrQUkevnEjBV3A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Avi Kivity <avi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmUcuRJMR6QNh4tBpB55mMtOtvOiLoaa4eCczhAmhF7m6IpLFZOMterfnwY8+yBLpSSIyx5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
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
X-List-Received-Date: Wed, 07 Mar 2012 17:22:11 -0000

On 7 March 2012 17:14, Avi Kivity <avi@redhat.com> wrote:
> This still breaks if an argument has a single quote. =C2=A0bash's printf'=
s %q
> deals with this correctly, but not sure how portable it is.

True, but we've lived with it for the code that writes to config-host.mak
since 2008 (commit fd69fe2b)...

-- PMM

