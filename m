Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KNI-0004yb-Ht
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:10:04 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KNB-0004ik-3B
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:10:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KMn-0000Qt-J6
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:09:56 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:55619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S5KMn-0000QY-FC
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:09:33 -0500
Received: by ghrr14 with SMTP id r14so3579455ghr.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 09:09:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.5 with SMTP id aa5mr12630128igc.17.1331140171272; Wed,
	07 Mar 2012 09:09:31 -0800 (PST)
Received: by 10.50.100.198 with HTTP; Wed, 7 Mar 2012 09:09:31 -0800 (PST)
In-Reply-To: <CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
	<CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
Date: Wed, 7 Mar 2012 17:09:31 +0000
Message-ID: <CAFEAcA8gyck18p1q51N-z+=6Af09wj7y4EtO3kA6N6UFhpexjA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQnTeygkT8iJiJjcll+vZaKM1EE2SunKMN1WtdCgEMTdVXi+nmDYGf66qsolfbHfWuSn4R09
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
X-List-Received-Date: Wed, 07 Mar 2012 17:10:03 -0000

On 7 March 2012 12:40, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> +printf "# Configured with:" >> config.log
>> +printf " '%s'" "$0" "$@" >> config.log
>
> You use an interesting feature of printf(1)- it applies the (short)
> format string as long as there are arguments. =C2=A0I checked that this i=
s
> in the specification:
> http://pubs.opengroup.org/onlinepubs/9699919799/utilities/printf.html

Yes, I had to look up the spec to figure out why it worked too :-)

-- PMM

