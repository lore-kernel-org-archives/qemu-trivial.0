Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUUDH-00039x-6R
	for mharc-qemu-trivial@gnu.org; Wed, 05 Dec 2018 05:15:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gUUDF-00039Z-5M
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2018 05:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gUUDB-0001X6-C5
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2018 05:15:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43287)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gUU3A-0007Bk-85; Wed, 05 Dec 2018 05:05:00 -0500
Received: by mail-wr1-x441.google.com with SMTP id r10so18965695wrs.10;
	Wed, 05 Dec 2018 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qiOPlRcfQmkVUYQELVaXUf5Ul6gvfAAatsFPRbXQZcM=;
	b=ZDprmLtdI8vnNAKaOPUyEC5y8o51aSEMfczE3C8gK/7yTzM2Ee+b64QAgZ/22nhkpH
	3xSwgVh54d7COLL+ONv5k432ElTNQdc8ySgnHKt73R0XIJ8xrkIJvUF0CquwjtiKZW/Y
	tngF7RYNeO07vvFGZGuzldw5gYMABO/pt68P4cMJ6eGzPDFXWRlj7uo/nthd1LEJt2ns
	AjmDWwG3Zr0C2Z1zEoYnMe/GHPT7ODq+73GPKJvDtGtE4DtPLdYiWkos93ScWydgkvc0
	20MdkhKTWLS6+PAsyPYZKe2YQxDJKmhNZDz3HYKpn1dJgmrze7p2oOKuKdNBrMzjmyMb
	NT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qiOPlRcfQmkVUYQELVaXUf5Ul6gvfAAatsFPRbXQZcM=;
	b=rUElEiU/FXPW1qlL3iq0++4m5bdNU3T06KdtNpXockB5GlnebRiRJ6ykZ/OtQpxBjs
	ejejV/2pSNrJKeZOTUp21X9JFva6MZ3cXYYtMs6zAGaI9TLOOZ9d4HVnfvQYZq1OzIbf
	JcEpp91FxaFi8N1QNr2ulDBmhzarYbxJCM+d3AIedDlxZUMi+v2848fpC99mRLIzAewx
	pEmf6gx0G0fG0sJkzIgwpKITk9TJ7E+aNbY8v8LHgQ6NlAJ0+gRUU7aur7w2k8IEc9cY
	a3u0Qqw9EyXodcO6WApqMf2wkd5j2zws3bxcQ+CwhGZWVi+jZMSrJxWsGY9XIQo0dG2o
	Ke2w==
X-Gm-Message-State: AA+aEWaugsWcCEN00SskwDNmLPN2LZ+RmbIX3ku07kpFCyOkXErKs6Vh
	m5L+1bFDTsl04/o+tmUd1Eg=
X-Google-Smtp-Source: AFSGD/UhDPIwRh2Oz38IaraPC4qT+eDyDR96L9MCGqdwOvyB+OTtp8V2RILOWgmbZzzLRqivTbtD4A==
X-Received: by 2002:a5d:6648:: with SMTP id f8mr15693245wrw.117.1544004298712; 
	Wed, 05 Dec 2018 02:04:58 -0800 (PST)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	r12sm24338584wrq.3.2018.12.05.02.04.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Dec 2018 02:04:57 -0800 (PST)
Date: Wed, 5 Dec 2018 10:04:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com,
	qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
	mreitz@redhat.com
Message-ID: <20181205100456.GF20933@stefanha-x1.localdomain>
References: <1541479952-32355-1-git-send-email-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline
In-Reply-To: <1541479952-32355-1-git-send-email-dongli.zhang@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 1/1] virtio-blk: fix comment
 for virtio_blk_rw_complete as nalloc is initially -1
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
X-List-Received-Date: Wed, 05 Dec 2018 10:15:26 -0000


--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2018 at 12:52:32PM +0800, Dongli Zhang wrote:
> The initial value of nalloc is -1, but not 1.
>=20
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> This is based on git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/=
for_upstream
>=20
>  hw/block/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block-next tree for QEMU 3.2:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcB6LIAAoJEJykq7OBq3PIy6sH+wS3Y+lpGw/AaEPASEGCawJu
0RPav85ldN/MHDzCbX3EOROxmWylPUwLYLs2svg0XKqdfCtTF9yzlAwzVueq81Gp
+JP/L/zzUZbprEd0AF1g0Hs0Rfk52JTZPQkSfNn422Is49VpLXxvy92+ElH+MoiA
IqZs3CKniGtnGYPLgJ+PcH+doI+d83L7mk8iGrIJJRzkRcSHfcI7bidd1QfkdgMT
Om44lZXbnj9r1E75aRJOKElzvKwbejjGg8r5/r0MYxTCpG6UhUi/N5LJklTxcuIg
D3Mo4f8ZcBFdSrrIUQuBl8VBKJPBt5rfbeoDXhfIyDLiUA9ZHZXhJhjxwGw2YXQ=
=Becf
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--

