Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09Go-0006uS-MH
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:08:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09Gg-0006lr-S0
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:08:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09Ge-0005XA-V4
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:08:14 -0400
Received: from mail.avalus.com ([89.16.176.221]:60072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b09GX-0005TH-5d; Tue, 10 May 2016 11:08:05 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 13642C5607D;
	Tue, 10 May 2016 16:08:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462892880; bh=s4zak7UGE06uCD7qxXnE9OPC7gRkyzDyI+WAnG1Pefc=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=4wDmILaS6ZNul50R9qLkgaQPtCkTRRSjKJ5BUPe/dJOexDGUn8S8gswxX2PnxBkn0
	gR0tMH+btFEUj40KrqfiHqQCRJcixXFWbfyYuvJnubrCvStGWfoa9cjauUV3ssk5O1
	X1mTs87S6KOniZ7OcbdLIhrD5YqEga0boD7lapqc=
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed;
	boundary="Apple-Mail=_941C196C-D8DC-41CA-9C45-A3C4C462D19A";
	protocol="application/pgp-signature"; micalg=pgp-sha512
X-Pgp-Agent: GPGMail 2.5.2
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <5731E99C.3000108@redhat.com>
Date: Tue, 10 May 2016 16:08:50 +0100
Cc: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-Id: <3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
To: Eric Blake <eblake@redhat.com>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.16.176.221
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
X-List-Received-Date: Tue, 10 May 2016 15:08:21 -0000


--Apple-Mail=_941C196C-D8DC-41CA-9C45-A3C4C462D19A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Eric,

> Hmm. The current wording of the experimental block size additions does
> NOT allow the client to send a NBD_CMD_TRIM with a size larger than =
the
> maximum NBD_CMD_WRITE:
> =
https://github.com/yoe/nbd/blob/extension-info/doc/proto.md#block-size-con=
straints

Correct

> Maybe we should revisit that in the spec, and/or advertise yet another
> block size (since the maximum size for a trim and/or write_zeroes
> request may indeed be different than the maximum size for a =
read/write).

I think it's up to the server to either handle large requests, or
for the client to break these up.

The core problem here is that the kernel (and, ahem, most servers) are
ignorant of the block size extension, and need to guess how to break
things up. In my view the client (kernel in this case) should
be breaking the trim requests up into whatever size it uses as the
maximum size write requests. But then it would have to know about block
sizes which are in (another) experimental extension.

I've nothing against you fixing it qemu's server (after all I don't
think there is anything to /prohibit/ a server working on something
larger than the maximum block size), and ...

> But since the kernel is the one sending the large length request, and
> since you are right that this is not a denial-of-service in the amount
> of data being sent in a single NBD message,

... currently there isn't actually a maximum block size advertised (that
being in another experimental addition), so this is just DoS prevention,
which qemu is free to do how it wishes.

> I definitely agree that qemu
> would be wise as a quality-of-implementation to allow the larger size,
> for maximum interoperability, even if it exceeds advertised limits =
(that
> is, when no limits are advertised, we should handle everything =
possible
> if it is not so large as to be construed a denial-of-service, and
> NBD_CMD_TRIM is not large; and when limits ARE advertised, a client =
that
> violates limits is out of spec but we can still be liberal and respond
> successfully to such a client rather than having to outright reject =
it).
> So I think this patch is headed in the right direction.

I'd agree with that.

What surprises me is that a release kernel is using experimental
NBD extensions; there's no guarantee these won't change. Or does
fstrim work some other way?

Alex

>=20
>>=20
>> and looking at the kernel side implementation of the nbd device
>> (drivers/block/nbd.c) where it only sends the request header with no =
data
>> for a NBD_CMD_TRIM.
>>=20
>> With this fix in, I am now able to run fstrim on my qcow2 images and =
keep
>> them small (or at least keep their size proportional to the amount of =
data
>> present on them).
>>=20
>> Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
>> CC: Paolo Bonzini <pbonzini@redhat.com>
>> CC: <qemu-devel@nongnu.org>
>> CC: <qemu-stable@nongnu.org>
>> CC: <qemu-trivial@nongnu.org>
>=20
> This is NOT trivial material and should not go in through that tree.
> However, I concur that it qualifies for a backport on a stable branch.
>=20
>> ---
>> nbd.c | 8 +++++++-
>> 1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/nbd.c b/nbd.c
>> index b3d9654..e733669 100644
>> --- a/nbd.c
>> +++ b/nbd.c
>> @@ -1209,6 +1209,11 @@ static ssize_t nbd_co_send_reply(NBDRequest =
*req, struct nbd_reply *reply,
>>     return rc;
>> }
>>=20
>> +static bool nbd_should_check_request_size(const struct nbd_request =
*request)
>> +{
>> +        return (request->type & NBD_CMD_MASK_COMMAND) !=3D =
NBD_CMD_TRIM;
>> +}
>> +
>> static ssize_t nbd_co_receive_request(NBDRequest *req, struct =
nbd_request *request)
>> {
>>     NBDClient *client =3D req->client;
>> @@ -1227,7 +1232,8 @@ static ssize_t =
nbd_co_receive_request(NBDRequest *req, struct nbd_request *reque
>>         goto out;
>>     }
>>=20
>> -    if (request->len > NBD_MAX_BUFFER_SIZE) {
>> +    if (nbd_should_check_request_size(request) &&
>> +        request->len > NBD_MAX_BUFFER_SIZE) {
>=20
> I'd rather sort out the implications of this on the NBD protocol =
before
> taking anything into qemu.  We've got time on our hand, so let's use =
it
> to get this right.  (That, and I have several pending patches that
> conflict with this as part of adding WRITE_ZEROES and INFO_BLOCK_SIZE
> support, where it may be easier to resubmit this fix on top of my
> pending patches).
>=20
>>         LOG("len (%u) is larger than max len (%u)",
>>             request->len, NBD_MAX_BUFFER_SIZE);
>>         rc =3D -EINVAL;
>>=20
>=20
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>=20
> =
--------------------------------------------------------------------------=
----
> Mobile security can be enabling, not merely restricting. Employees who
> bring their own devices (BYOD) to work are irked by the imposition of =
MDM
> restrictions. Mobile Device Manager Plus allows you to control only =
the
> apps on BYO-devices by containerizing them, leaving personal data =
untouched!
> =
https://ad.doubleclick.net/ddm/clk/304595813;131938128;j__________________=
_____________________________
> Nbd-general mailing list
> Nbd-general@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/nbd-general

--
Alex Bligh





--Apple-Mail=_941C196C-D8DC-41CA-9C45-A3C4C462D19A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXMfmCAAoJEBPm5K7i9iORQ5sP/110aCLlK1O7D2x4Got72Z6J
Y9qPVr7KX4vSb1Y4AMsR6i1v2Rp4si5SRZmlFcpGhC4YT06FOACcdYj8i/bv56yU
+O73LkabdhQZeTFNuxY6nAa81guStG3TYjnAnffoa/d4Ph1dmAlfLOAqRkHH40r3
7b4u6EDHvYKan2eNIp44lOMvvdBpgcHNzGOZ6S9GAdzesvd8gj32z1bUbbe58CyR
npK/bZOBiGm5QwsJjE6HCj1ue0YcsMr5vv5yf+e0XAdUI69vRoQzFwmn+ufVPZXn
JuXkE1u8THaL1GUll5njNpBPr6nq82oUYF282oOmKCPixiOJSc2aU5YyiLSVq8lu
/IjM16tUSYWms2zgCchvNUJCeMgAH9W9rQiVn6XGUPCzM35HmFhVgZFccVOMG3M6
t6hfZEPB9ISQAsFBqyyhtfpgC3LvO0yWyylo1meVlgwgSUKnHBJSG4rZZ96aefyb
FBXugK3TtVKGmUHdmdg6B2gVNgq20xqDPXs+Hh29Ny3y5ru58xIy/0kl4gVIf9Lz
SF5autHs0+hef+FrwY1PeazfVh3iekhJXa2IEGkAA164VsIhAPKk0yeOzsoKZI/a
6rxkyWtpT44GAzD7WA2sy/yrnvl3n6gVX6bmhvzg1jBo7o6kG8d9pJu4XDGiDkvL
TvmtV+Gw/535kau3Fehf
=PcN+
-----END PGP SIGNATURE-----

--Apple-Mail=_941C196C-D8DC-41CA-9C45-A3C4C462D19A--

