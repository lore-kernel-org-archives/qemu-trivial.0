Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09ji-0006HO-Al
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:38:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09jb-00065N-Ev
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09jV-0005XU-Jb
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:38:07 -0400
Received: from mail.avalus.com ([2001:41c8:10:1dd::10]:55336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b09jC-0005Ra-Lm; Tue, 10 May 2016 11:37:43 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id A2E0732A6005;
	Tue, 10 May 2016 16:37:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462894660; bh=b5Rgjwkus4OWE5ASYt4AX13/KX+vp+qJa3l5LHd+GtA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=LBuYq5E82h436wc1NE404yO6sUrKP+sDG3MyfDPhl5oyRwlSQtcJBawB1NYnp1RtU
	/3krEY5C3ermvgyxw2ZOKEGb8xCKVb1pkAvdjxGVYRfC5eHqR2jBcXiPyjx9iFMmAR
	lZ4UPUrJ9T73v3HEFrr6KMMeWChbNqOX5hkCgJKc=
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed;
	boundary="Apple-Mail=_473693FB-BDAF-4FB7-A451-1239C2269A18";
	protocol="application/pgp-signature"; micalg=pgp-sha512
X-Pgp-Agent: GPGMail 2.5.2
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <5731FE53.6010602@redhat.com>
Date: Tue, 10 May 2016 16:38:29 +0100
Cc: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-Id: <672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
To: Eric Blake <eblake@redhat.com>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2001:41c8:10:1dd::10
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 15:38:13 -0000


--Apple-Mail=_473693FB-BDAF-4FB7-A451-1239C2269A18
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Eric,

On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
>>> Maybe we should revisit that in the spec, and/or advertise yet another
>>> block size (since the maximum size for a trim and/or write_zeroes
>>> request may indeed be different than the maximum size for a read/write).
>> 
>> I think it's up to the server to either handle large requests, or
>> for the client to break these up.
> 
> But the question at hand here is whether we should permit servers to
> advertise multiple maximum block sizes (one for read/write, another one
> for trim/write_zero, or even two [at least qemu tracks a separate
> maximum trim vs. write_zero sizing in its generic block layer]), or
> merely stick with the current wording that requires clients that honor
> maximum block size to obey the same maximum for ALL commands, regardless
> of amount of data sent over the wire.

In my view, we should not change this. Block sizes maxima are not there
to support DoS prevention (that's a separate phrase). They are there
to impose maximum block sizes. Adding a different maximum block size
for different commands is way too overengineered. There are after
all reasons (especially without structured replies) why you'd want
different maximum block sizes for writes and reads. If clients support
block sizes, they will necessarily have to have the infrastructure
to break requests up.

IE maximum block size should continue to mean maximum block size.

>> 
>> The core problem here is that the kernel (and, ahem, most servers) are
>> ignorant of the block size extension, and need to guess how to break
>> things up. In my view the client (kernel in this case) should
>> be breaking the trim requests up into whatever size it uses as the
>> maximum size write requests. But then it would have to know about block
>> sizes which are in (another) experimental extension.
> 
> Correct - no one has yet patched the kernel to honor block sizes
> advertised through what is currently an experimental extension.

Unsurprising at it's still experimental, and only settled down a couple
of weeks ago :-)

>  (We
> have ioctl(NBD_SET_BLKSIZE) which can be argued to set the kernel's
> minimum block size,

Technically that is 'out of band transmission of block size
constraints' :-)

> but I haven't audited whether the kernel actually
> guarantees that all client requests are sent aligned to the value passed
> that way - but we have nothing to set the maximum size,

indeed

> and are at the
> mercy of however the kernel currently decides to split large requests).

I am surprised TRIM doesn't get broken up the same way READ and WRITE
do.

> So the kernel is currently one of the clients that does NOT honor block
> sizes, and as such, servers should be prepared for ANY size up to
> UINT_MAX (other than DoS handling).

Or not to permit a connection.

>  My question above only applies to
> clients that use the experimental block size extensions.

Indeed.

>> What surprises me is that a release kernel is using experimental
>> NBD extensions; there's no guarantee these won't change. Or does
>> fstrim work some other way?
> 
> No extension in play.  The kernel is obeying NBD_FLAG_SEND_TRIM, which
> is in the normative standard, and unrelated to the INFO/BLOCK_SIZE
> extensions.

My mistake. I was confusing 'WRITE_ZEROES' with 'TRIM'.

--
Alex Bligh





--Apple-Mail=_473693FB-BDAF-4FB7-A451-1239C2269A18
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXMgB2AAoJEBPm5K7i9iORYDwP/1pleCK01UOUSWKZ5jFbiBYR
bsknov3ch2gWZaKHVrUAq7Grciwn7RNTJ8WhsHyZzniuDXmB2jn6aBMcevoN8tEW
HZ7x+1RR91YbOMq+H89kXcuFCYTa5dHtNLeT+MNEax4R4gO3run/qr4lmwSzjuhX
stvV39vLns+/BP6La1MNa3DPH2YKM+P4QjAOEXbKRRzn0y8SV6PdpmCVFD9SS04q
/C1ZAuNaP1+MCTwyy3+mVWKbbMtqK1j3ermsqvV8adQkHQCkfvQjKk7Y4c/faiG7
wdQT7dVU/72C26hnPlPFny8rPPsw4lgpk/Tu3W6AVRJokyfSmUHhsqXQ/TDWdSc7
CaUESCLiTSAcmYRyhdvVCQNuUY9XAPRzmzu2ObfeKWqB04xU9YyXM6Xpcl4OJoGe
S6Oq07RzV7p2ZlTibWdRDzRWNcbmGG0ILAqhBajyRi68o0rCA4nZi1ZJi8kfGa7j
a/PjHgpLCNBchT8Y2c2RTuHVaoLe8eNr5fNp+4xoq4IRkSTEcw5R6ByqScLZAugt
NgQs4cJFduWZ3xP4Im1G6Z+85aK8catQ+BFPo7GJ8pPLsxh4E59id/JUAoxi7aJk
tgTAQ+bhM7ItoVcHK5611mXOGVENRfTxMrl58r9qJtA8x/BteRWwcR57wrh+Beoz
svB25PE3veQsGF2AJeWI
=zYoj
-----END PGP SIGNATURE-----

--Apple-Mail=_473693FB-BDAF-4FB7-A451-1239C2269A18--

