Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBjEZ-0006DS-J2
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 07:09:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YBjEU-0006DH-6M
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 07:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YBjEP-0006aO-69
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 07:09:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YBjEO-0006aI-Vf; Thu, 15 Jan 2015 07:08:57 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0FC8sLF010964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 15 Jan 2015 07:08:54 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0FC8oWV010140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 15 Jan 2015 07:08:53 -0500
Message-ID: <54B7ADD2.5080302@redhat.com>
Date: Thu, 15 Jan 2015 13:08:50 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9mrdbduNh909Lc3fj=BtL+3c+rVs1aiiYhxSwg7as-sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9mrdbduNh909Lc3fj=BtL+3c+rVs1aiiYhxSwg7as-sQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/12] Trivial patches for
	2015-01-15
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
X-List-Received-Date: Thu, 15 Jan 2015 12:09:06 -0000



On 15/01/2015 12:55, Peter Maydell wrote:
> > With the introduction of pbonzini's "misc" patches tree I'm not
> > sure current trivial-patches is worth to keep.  Paolo does much
> > better job in this area than me.
>
> I'll leave that up to the two of you, but splitting the load
> of review and testing seems to me like it would make sense.
> In any case, thanks to both of you for the efforts you've
> put in to this sort of patch curation -- I think it's really
> important for the project.

The trivial patches tree is still very useful.

The meaning of "misc patches" is almost always "I don't want to send a
separate pull request because this is touching too many areas"
(typically three or more among: qemu-char, SCSI, KVM, x86, and stuff
that I touched and got a Reviewed-by).

5-10% of the "misc patches", instead, correspond to unmaintained
areas---basically the patches that Anthony used to apply directly---but
luckily by now there are very few of those.

In any case, most patches in the "misc patches" pull request are not
trivial.  They could very well break something and if they do I
sometimes get to fix them... which is why I'm very happy that someone
else picks up the _really_ trivial patches!

So, the trivial patches tree is still as useful as it has always been,
and I use it myself relatively often for patches outside the areas I
maintain.

Paolo

