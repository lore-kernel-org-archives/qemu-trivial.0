Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBKeI-00087D-D8
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBKeF-00085b-2N
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBKeD-00045h-0x
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:48:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50724
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBKeC-00044g-Ry
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583768931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTzvaWYpXAmYgOGjTaIaGIZhtWr/UkZXteo1ZOWQ76M=;
 b=KjEJLcmSRySGISsscsNW5OzSFBftZXuMPV+PVM8nqxBD/TEk2duDlWypW6LqYTetHl2Tdk
 FfqrwhGA/qSFpuSPtX1Ey50i+8vF7d2SqYBhjlDwqJQ3xJTaERMTQkXqWJxCm4y0WJEUsT
 jRN0AZZHqeSxm+2wuVdP5evCeamSmhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-UtQq4H23O4SclwClJRtZ5A-1; Mon, 09 Mar 2020 11:48:49 -0400
X-MC-Unique: UtQq4H23O4SclwClJRtZ5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64D3DBA7;
 Mon,  9 Mar 2020 15:48:47 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-162.ams2.redhat.com [10.36.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C104F7388F;
 Mon,  9 Mar 2020 15:48:42 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:48:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, pkrempa@redhat.com,
 mreitz@redhat.com, libvir-list@redhat.com,
 Liu Yuan <namei.unix@gmail.com>, Fam Zheng <fam@euphon.net>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "open list:Sheepdog" <sheepdog@lists.wpkg.org>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v3 1/4] block: Add trivial backing_fmt support to qcow,
 sheepdog, vmdk
Message-ID: <20200309154841.GD6478@linux.fritz.box>
References: <20200306225121.3199279-1-eblake@redhat.com>
 <20200306225121.3199279-2-eblake@redhat.com>
 <20200309152112.GC6478@linux.fritz.box>
 <7b7f12f8-ca03-12d4-b93d-2edefb51cb42@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7b7f12f8-ca03-12d4-b93d-2edefb51cb42@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 09 Mar 2020 15:48:56 -0000

Am 09.03.2020 um 16:32 hat Eric Blake geschrieben:
> On 3/9/20 10:21 AM, Kevin Wolf wrote:
> > Am 06.03.2020 um 23:51 hat Eric Blake geschrieben:
> > > For qcow2 and qed, we want to encourage the use of -F always, as thes=
e
> > > formats can suffer from data corruption or security holes if backing
> > > format is probed.  But for other formats, the backing format cannot b=
e
> > > recorded.  Making the user decide on a per-format basis whether to
> > > supply a backing format string is awkward, better is to just blindly
> > > accept a backing format argument even if it is ignored by the
> > > contraints of the format at hand.
> > >=20
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> >=20
> > I'm not sure if I agree with this reasoning. Accepting and silently
> > ignoring -F could give users a false sense of security. If I specify a
> > -F raw and QEMU later probes qcow2, that would be very surprising.
>=20
> Do we know what formats qcow, sheepdog, and vmdk expect to probe?  I'm
> wondering if we can compromise by checking that the requested backing ima=
ge
> has the specified format, and error if it is not, rather than completely
> ignoring it - but at the same time, the image formats have no where to
> record a backing format.

The important distinction (and in fact the only one that qed makes) is
raw and non-raw. Problems only arise if a guest can write an image
header to a raw file and get it probed as non-raw when opening the
image the next time. If you start with a non-raw format, at least the
first 512 bytes (which are used for probing) are used for metadata and
not accessible for the guest.

> I'm guessing that qcow works with either raw or qcow as backing format (a=
nd
> anything else is odd - a qcow2 backing to a qcow is unusual, and would be
> better to reject).  I'm not sure if sheepdog can be backed by anything bu=
t
> another sheepdog, similarly, I'm not sure if a vmdk can be backed by
> anything but another vmdk.

I think vmdk only expects vmdk as backing files, even though QEMU
supports everything else, too. However, this is a format for
compatibility with another hypervisor and you're unlikely to find
QEMU-only VMDK images, so requiring non-raw unconditionally might make
sense.

I have no idea about how backing files in Sheepdog are used in practice.
However, QEMU is a primary target for Sheepdog. It wouldn't surprise me
if it's used for both raw and non-raw.

qcow is definitely used for both, as you already said. Allowing only raw
and qcow and forbidding other formats doesn't improve the situation
because the problem is with supporting raw and non-raw at the same time
and you would still have this.
>
> If so, it should be simple enough to do a v4 of
> this patch which requires -F to be a known-acceptable probe type for thes=
e
> images.
>=20
> Still, the point of this patch is that I want to add -F into all the
> iotests, and without something along the lines of this patch, all of thos=
e
> iotests are broken for these image formats.  Patch 2 is a lot harder to
> write if we have to make our use of -F conditional on the image format in
> question.

Hm... Maybe _make_test_img can insert/filter out -F depending on $IMGFMT?

Kevin


