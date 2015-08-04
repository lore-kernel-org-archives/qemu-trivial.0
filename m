Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbcX-0007LF-PN
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:47:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbcU-0007KQ-RY
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbcT-0003NV-Sn
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:47:02 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:41017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbcT-0003NL-Mm; Tue, 04 Aug 2015 08:47:01 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbcR-0008Vx-NH; Tue, 04 Aug 2015 14:46:59 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbcR-0002jC-0R; Tue, 04 Aug 2015 14:46:59 +0200
Date: Tue, 4 Aug 2015 14:46:59 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150804124658.GC6574@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-11-git-send-email-alex.bennee@linaro.org>
	<CAFEAcA8--05_aOX7eYPmVhPa51G7Ba=WU-18o0uVWbL+f8DrFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFEAcA8--05_aOX7eYPmVhPa51G7Ba=WU-18o0uVWbL+f8DrFw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 10/11] vl.c: log system
 invocation when enabled
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
X-List-Received-Date: Tue, 04 Aug 2015 12:47:03 -0000

On 2015-08-04 13:40, Peter Maydell wrote:
> On 3 August 2015 at 10:14, Alex Benn=E9e <alex.bennee@linaro.org> wrote:
> > This makes it a little easier to remember how you generated that 100Mb
> > trace log you saved for a future date.
> >
> > Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > ---
> >  configure |  2 +-
> >  vl.c      | 18 ++++++++++++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/configure b/configure
> > index 704b34c..9cc6a48 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1445,7 +1445,7 @@ else
> >  fi
> >
> >  gcc_flags=3D"-Wold-style-declaration -Wold-style-definition -Wtype-lim=
its"
> > -gcc_flags=3D"-Wformat-security -Wformat-y2k -Winit-self -Wignored-qual=
ifiers $gcc_flags"
> > +gcc_flags=3D"-Wformat-security -Wno-format-y2k -Winit-self -Wignored-q=
ualifiers $gcc_flags"
>=20
> Why do we need this warning switch change?

Some locales might have the year on 2 digits only, so this triggers a
warning. That's also a reason I suggested to use a fixed date format.

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

