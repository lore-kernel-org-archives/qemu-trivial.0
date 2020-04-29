Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTkG3-0003ft-Jx
	for mharc-qemu-trivial@gnu.org; Wed, 29 Apr 2020 06:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jTkG0-0003ez-1Z
 for qemu-trivial@nongnu.org; Wed, 29 Apr 2020 06:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jTkFd-0005m6-OG
 for qemu-trivial@nongnu.org; Wed, 29 Apr 2020 06:47:59 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20300
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jTkFd-0005lr-BG
 for qemu-trivial@nongnu.org; Wed, 29 Apr 2020 06:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588157256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JmaF49+2XkE5jx1mNGs4ziIPkaQ6pCQJJJHqX+MBvkM=;
 b=LvsdqzQeGkW0qsXP7mDEJotrofiLz6dv2YA0K4A4ZPEr/iuVZBkTc4b2bC+s7QBs2VFYlM
 T+wQFwE7hBhInCqmxKTkLSCc56e+PJRG9CrjTlinmw4qAXpPSAne6c82HMQOc2yRCFZ/bs
 FdB6Uzx4Sla3CeYrhgIV/sDBlNdzK/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-FhORc6geORew8tQJvP4ALw-1; Wed, 29 Apr 2020 06:47:26 -0400
X-MC-Unique: FhORc6geORew8tQJvP4ALw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F5BA835B40;
 Wed, 29 Apr 2020 10:47:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-19.ams2.redhat.com
 [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8EEC60C18;
 Wed, 29 Apr 2020 10:47:17 +0000 (UTC)
Subject: Re: [PATCH] block: Comment cleanups
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, berto@igalia.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
References: <20200428213807.776655-1-eblake@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <e91db87c-0bf3-1679-1a42-05bde67b4ad1@redhat.com>
Date: Wed, 29 Apr 2020 12:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428213807.776655-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="10BNzb9KnCxZwUiSOKDwDsFiYFGdI8xHA"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2020 10:48:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--10BNzb9KnCxZwUiSOKDwDsFiYFGdI8xHA
Content-Type: multipart/mixed; boundary="wegqop5tLcPw4Jg6CkYGC1Brf3n6MJb18"

--wegqop5tLcPw4Jg6CkYGC1Brf3n6MJb18
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28.04.20 23:38, Eric Blake wrote:
> It's been a while since we got rid of the sector-based bdrv_read and
> bdrv_write (commit 2e11d756); let's finish the job on a few remaining
> comments.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Hmm - I started this in Nov 2018, and just barely noticed that it has
> been sitting in a stale tree on my disk for a while now...
>=20
>  block/io.c             |  3 ++-
>  block/qcow2-refcount.c |  2 +-
>  block/vvfat.c          | 10 +++++-----
>  tests/qemu-iotests/001 |  2 +-
>  tests/qemu-iotests/052 |  2 +-
>  tests/qemu-iotests/134 |  2 +-
>  tests/qemu-iotests/188 |  2 +-
>  7 files changed, 12 insertions(+), 11 deletions(-)

Thanks, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next

Max


--wegqop5tLcPw4Jg6CkYGC1Brf3n6MJb18--

--10BNzb9KnCxZwUiSOKDwDsFiYFGdI8xHA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6pWzQACgkQ9AfbAGHV
z0DbBgf/fRz54etkkpBEi2aK9d1g13PkSCq+pN0nb/2CWYWRuw4f+2iaRe2x7QIL
ggYiagRBaiLly/BRfKHDnnrrguHlGQLsSqYmoAMI3VR62JrkNRFjri8v3UO3Udfa
ez244+d/g15OZolhhrSgaUhMXo8EusQQnvFWnazcOP0zY7X7Umqc5zYK0KRAVQRq
h+g4g8FwFY+LMZjnShWteYrksusiwnwUWjUGu/j0vJqOO45lhNlRGlWEt2ZyCid1
UTQk3lcJlFE5B5D2Z3lPJVO/1Yk6z37qSR9IXiBMDLcbN/8PuYc+QvLbpGbTLr0d
U5hslVqgaKaX/MTjsHqNFdR5mSdRlg==
=khkp
-----END PGP SIGNATURE-----

--10BNzb9KnCxZwUiSOKDwDsFiYFGdI8xHA--


