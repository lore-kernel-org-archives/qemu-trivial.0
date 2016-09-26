Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boSOA-0003Hm-7t
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 05:39:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1boSO5-0003Dh-D8
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 05:39:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1boSO4-0006D8-FG
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 05:39:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1boSNv-00069X-Im; Mon, 26 Sep 2016 05:39:39 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7BB87F36F;
	Mon, 26 Sep 2016 09:39:38 +0000 (UTC)
Received: from [10.36.116.43] (ovpn-116-43.ams2.redhat.com [10.36.116.43])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8Q9da4L022487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Sep 2016 05:39:37 -0400
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
References: <1474646996-30421-1-git-send-email-thuth@redhat.com>
	<8d0e6f92-a114-2f08-c789-25265e6abea9@redhat.com>
	<20160926082214.GA6093@noname.str.redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2e3398cc-def0-8ed6-e558-cdb58aec91eb@redhat.com>
Date: Mon, 26 Sep 2016 11:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160926082214.GA6093@noname.str.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fVUHC7Ocu2sGIv5UdKtL7b3xS0JtvraxS"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 26 Sep 2016 09:39:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] MAINTAINERS:
 Add some more headers to the IDE section
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
X-List-Received-Date: Mon, 26 Sep 2016 09:39:52 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fVUHC7Ocu2sGIv5UdKtL7b3xS0JtvraxS
Content-Type: multipart/mixed; boundary="B2HIBWjXG3BxE810hgXqe2dTC9oKWcsCQ";
	protected-headers="v1"
From: Thomas Huth <thuth@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Message-ID: <2e3398cc-def0-8ed6-e558-cdb58aec91eb@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] MAINTAINERS: Add some more
 headers to the IDE section

--B2HIBWjXG3BxE810hgXqe2dTC9oKWcsCQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.09.2016 10:22, Kevin Wolf wrote:
> Am 23.09.2016 um 18:42 hat John Snow geschrieben:
>> On 09/23/2016 12:09 PM, Thomas Huth wrote:
>>> The folder include/hw/ide/ belongs to the IDE section.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>> MAINTAINERS | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index d8a0cfc..acf6d6c 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -791,6 +791,7 @@ M: John Snow <jsnow@redhat.com>
>>> L: qemu-block@nongnu.org
>>> S: Supported
>>> F: include/hw/ide.h
>>> +F: include/hw/ide/
>>> F: hw/ide/
>>> F: hw/block/block.c
>>> F: hw/block/cdrom.c
>>>
>>
>> Ah, yeah. These got missed when they were moved over. Thanks.
>>
>> Reviewed-by: John Snow <jsnow@redhat.com>
>=20
> Who is supposed to merge this if you only give an R-b?

I've CC:ed this patch to qemu-trivial, so I hope it will get picked up
there if John does not want to apply this directly.

 Thomas



--B2HIBWjXG3BxE810hgXqe2dTC9oKWcsCQ--

--fVUHC7Ocu2sGIv5UdKtL7b3xS0JtvraxS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJX6OzXAAoJEC7Z13T+cC21nU4QALCbo3ueEILwKmvGCzUzi1yQ
hSEmVUxlF3Kv1FXC8UbtFGnqHHjwqlLF4MtEX3ckxG6soieiwl/J9QS+NXkWawGx
1GcxvNdoXG2GTItVPTa7MxqakNJkiTVoG8NPXUsqFA1pAyl8q+sIe7MA29XrtIx+
XnVIES5w7NCBdyrIeJTfWpqddDgrnmVo4fN2OFP8jY+DKAoWjwSI9haxVUGMHeJ/
rlXXdCRdasKCxhIfuhyX2REf9XxGI020uGPU1vHfLGt8Ju5u4iRh79GFdUPyi4Ic
wx+ktkA23JIizEdQxdRwurJYUZmX6llnKVMu7fXjrPIRbqXQSfe3tS5JPv6J80K5
3uvhaHo7LzXaR7BKwlU5HAE7qzB9ASgBiiz9xFxoVfQmGWfeCtpsfbhbRicnlkje
nizqwugZ9cx900zFtJBmOptfMEjT/tMbKOLtMAUrTdNRQfUQC1nsw0ah6og0u+Do
uEhC+CnqBLjllfCvrbPTBc29jhT/+x64d19lySfEVmarentdoBfMe5IuZAL/0WUj
jOY1+QpOYKMnaqfxOQ7tt6cgPnOn8qdRLf7Lq9dYAZf/N/pVg1C0i8qv2e9c13sj
ZkvcfRqcp0cTLcdGTaFZq4cN1itxCkE/0KHDTCUxO9uEU+SYUQDmhXFhjtoKnHWm
HXv+OiRApJWyMhqATNA9
=nm1U
-----END PGP SIGNATURE-----

--fVUHC7Ocu2sGIv5UdKtL7b3xS0JtvraxS--

