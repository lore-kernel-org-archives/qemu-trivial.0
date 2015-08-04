Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMatJ-0003bB-RM
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:00:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMatE-0003Uv-Pv
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMatB-0005Ko-JW
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:00:16 -0400
Received: from hall.aurel32.net ([195.154.112.97]:38966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMatB-0005Kf-Er
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:00:13 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMasx-0006W2-5g; Tue, 04 Aug 2015 13:59:59 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMasw-0001k1-0O; Tue, 04 Aug 2015 13:59:58 +0200
Date: Tue, 4 Aug 2015 13:59:58 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804115957.GA6574@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
	<55BF6F68.1090103@redhat.com> <87k2tblcxq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87k2tblcxq.fsf@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	crosthwaitepeter@gmail.com, qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
 /tmp/perf-<pid>.map files
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
X-List-Received-Date: Tue, 04 Aug 2015 12:00:18 -0000

On 2015-08-04 08:39, Alex Benn=E9e wrote:
>=20
> Paolo Bonzini <pbonzini@redhat.com> writes:
>=20
> > On 03/08/2015 11:14, Alex Benn=E9e wrote:
> >> This allows the perf tool to map samples to each individual translation
> >> block. This could be expanded for user space but currently it gives
> >> enough information to find any hotblocks by other means.
> >>=20
> >> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >
> > What happens if you encounter a tb_flush?
>=20
> At the point of a tb_flush all bets are off as we will re-generate all
> the blocks at potentially different locations in the translation buffer.
> However for most analysis cases you are unlikely to cause the code
> buffer to overflow. Most other uses of tb_flush are the result
> debugging.
>=20
> I could add a printf when --perfmap is enabled to flag when a flush
> happens to signal to the user? I guess some more caveats in the flag
> description wouldn't hurt.
>=20
> We could consider truncating and re-starting the JIT dump at each flush?

You also need to take care about TB invalidation. When the last
generated TB is invalidated, the code pointer is rolled back to the
end of the previous TB. In that case the last entry of the dump might
should be replaced by the new value. If the invalidated TB is not the
last one, it is just left in the generated code.

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

